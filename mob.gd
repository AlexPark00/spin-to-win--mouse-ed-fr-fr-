extends CharacterBody2D

var isActive:bool = false;
@export var speed:float = 300;
@export var maxHP:float = 1;
@export var dps:float = 1;
@export var powerOfHpRestoration:float = 10;
var player:RigidBody2D;
var hp:float;
var is_player_inside:bool = false;
var heal_node = preload("res://heal.tscn");
var soul_node = preload("res://soul.tscn");

func _ready():
	player = get_tree().get_first_node_in_group("player")
	hp = maxHP

func _physics_process(delta):
	var playerPos = player.global_position;
	if abs(rad_to_deg(get_angle_to(playerPos))) > 90:
		$Sprite2D.flip_h = false;
	else:
		$Sprite2D.flip_h = true;
	velocity = global_position.direction_to(playerPos) * speed
	if global_position.distance_to(playerPos) > 10 and isActive:
		move_and_slide()
	
func get_hp() -> float:
	return hp

func get_max_hp() -> float:
	return maxHP

func deal_damage(damage:int):
	hp -= damage;
	if hp <= 0:
		_kms();

func is_active() -> bool:
	return isActive;

func _kms():
	if randi()%100+1 <= 10:
		_spawn_heal();
	_spawn_soul();
	self.queue_free();

func _spawn_heal():
	var node:Node2D = heal_node.instantiate() as Node2D;
	node.global_position = global_position;
	node.powerOfHpRestoration = powerOfHpRestoration;
	get_parent().get_parent().add_child(node);

func _spawn_soul():
	var node:Node2D = soul_node.instantiate() as Node2D;
	node.global_position = global_position;
	get_parent().get_parent().add_child(node);

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player:
		is_player_inside = true;

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == player:
		is_player_inside = false;

func _on_timer_timeout() -> void:
	if is_player_inside:
		player.deal_damage(dps);

func _on_wake_up_area_body_entered(body: Node2D) -> void:
	if body == player:
		isActive = true;
