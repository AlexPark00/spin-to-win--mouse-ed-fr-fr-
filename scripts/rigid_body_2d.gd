extends RigidBody2D

@export var maxHP = 100;
var hp:float;
@export var speed:int = 20;
@export var angularSpeed:int = 200;
@export var maxSpeed:int = 800;
@export var damage:int = 20;
var gameManager;
var canMoveToNextArea:bool = false;

# hold time for transitioning to next area in seconds
@onready var holdTimeLabel = $"../CanvasLayer/Control/HoldTimeLabel";
var holdTime:float = 10;
var elapsedHoldTime:float = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hp = maxHP;
	gameManager = get_tree().get_first_node_in_group("game_manager");
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var input_direction = Input.get_vector("left", "right", "up", "down");
	apply_central_force(input_direction*speed);
	apply_torque(get_angle_to(get_global_mouse_position())*angularSpeed);
	if linear_velocity.length() > maxSpeed:
		linear_velocity = linear_velocity.normalized() * maxSpeed
	
	if Input.is_action_pressed("do") and canMoveToNextArea:
		elapsedHoldTime += delta;
	else:
		elapsedHoldTime = 0;
	
	if elapsedHoldTime > holdTime:
		gameManager._next_area()
	holdTimeLabel.text = str(round(elapsedHoldTime*10)/10);

func deal_damage(damage:int):
	hp -= damage;
	if hp <= 0:
		gameManager.restart_current_area();

func get_damage() -> int:
	return damage;

func get_hp() -> float:
	return hp

func get_max_hp() -> float:
	return maxHP

func teleport_to(point:Vector2):
	position = point;

func reset_hp() -> void:
	hp = maxHP;



func _on_collision_check_area_entered(area: Area2D) -> void:
	if area.is_in_group("next_area_trigger"):
		canMoveToNextArea = true;
		holdTimeLabel.visible = true;

func _on_collision_check_area_exited(area: Area2D) -> void:
	if area.is_in_group("next_area_trigger"):
		canMoveToNextArea = false;
		holdTimeLabel.visible = false;
