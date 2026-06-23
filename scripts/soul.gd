extends Node2D

func _ready() -> void:
	var tween = get_tree().create_tween();
	tween.tween_property(self, "position", Vector2(self.position.x, self.position.y-200.0), 3.0);
	tween.parallel().tween_property(self, "modulate", Color(1.0, 1.0, 1.0, 0.0), 3.0);
	await tween.finished;
	self.queue_free();
