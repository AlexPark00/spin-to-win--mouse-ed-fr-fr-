extends Node2D

@onready var sprite = $Sprite2D
var player: Node2D
var poison_node = preload("res://poison.tscn")

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	if not player:
		return
		
	var start_pos = global_position
	var target_pos = player.global_position
	var peak_height = 120.0
	var duration = 1.2
	
	var tween = get_tree().create_tween()
	
	tween.tween_property(sprite, "rotation", deg_to_rad(720.0), duration).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tween.parallel().tween_method(
		func(t: float): 
			var current_x = lw_interpolate(start_pos.x, target_pos.x, t)

			var linear_y = lw_interpolate(start_pos.y, target_pos.y, t)
			var arc_y = peak_height * 4.0 * t * (1.0 - t)

			global_position = Vector2(current_x, linear_y - arc_y),
		0.0,1.0,duration
	)
	
	await tween.finished
	spawn_poison()

func lw_interpolate(a: float, b: float, t: float) -> float:
	return a + (b - a) * t

func spawn_poison() -> void:
	var node: Node2D = poison_node.instantiate() as Node2D
	node.global_position = global_position
	get_parent().add_child(node)
	queue_free()
