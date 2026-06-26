extends Node2D

var player:Node2D;
var isPlayerInside:bool = false;
func _ready() -> void:
	await $Sprite2D.animation_finished
	$Sprite2D.play("Sizzle");
	$PoisonSizzlingSFXPlayer.pitch_scale = randf_range(0.9, 1.1);
	player = get_tree().get_first_node_in_group("player");
	var tween = get_tree().create_tween();
	tween.tween_property(self, "modulate", Color(1.0, 1.0, 1.0, 0.5), 6.0);
	tween.tween_property(self, "modulate", Color(1.0, 1.0, 1.0, 0.0), 0.5);
	await tween.finished;
	queue_free();

func _process(delta: float) -> void:
	if isPlayerInside:
		player.make_poisoned();

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player:
		isPlayerInside = true;

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == player:
		isPlayerInside = false
