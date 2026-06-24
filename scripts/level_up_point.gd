extends Node2D

var player;
var gameManager;

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player");
	gameManager = get_tree().get_first_node_in_group("game_manager");

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player and !self.is_queued_for_deletion():
		gameManager.collectedPoints += 1;
		queue_free();
