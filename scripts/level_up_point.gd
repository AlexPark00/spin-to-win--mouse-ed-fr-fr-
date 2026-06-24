extends Node2D

var player;
var levelUpMenu;

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player");
	levelUpMenu = get_tree().get_first_node_in_group("level_up_menu");

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player:
		levelUpMenu.add_points(1);
		queue_free();
