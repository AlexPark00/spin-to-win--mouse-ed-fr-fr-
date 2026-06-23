extends Node2D

@onready var sprite = $Sprite2D;
var damage:float = 1.0;
var player:Node2D;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_tree().get_first_node_in_group("player");
	var direction = global_position.direction_to(player.global_position);
	var target = global_position + (direction * 300);
	var tween = get_tree().create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO);
	tween.tween_property(sprite, "rotation", deg_to_rad(1800.0), 2.0);
	tween.parallel().tween_property(self, "global_position", target, 2.0);
	await tween.finished;
	queue_free();


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player:
		player.deal_damage(damage);
		queue_free();
	if body is TileMapLayer:
		queue_free()
