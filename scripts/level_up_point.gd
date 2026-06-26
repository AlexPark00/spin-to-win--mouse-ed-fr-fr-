extends Node2D

var player;
var gameManager;
@onready var highlightShaderMaterial = preload("res://shaders/yellow_highlight.tres");

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player");
	gameManager = get_tree().get_first_node_in_group("game_manager");

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player and !self.is_queued_for_deletion():
		player.duckSprite.material = highlightShaderMaterial;
		await get_tree().create_timer(0.1).timeout;
		player.duckSprite.material = null;
		gameManager.collectedPoints += 1;
		queue_free();
