extends Node2D

@export var powerOfHpRestoration: float = 10;
var player;

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player");

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player:
		player.heal_hp(powerOfHpRestoration);
		queue_free();
