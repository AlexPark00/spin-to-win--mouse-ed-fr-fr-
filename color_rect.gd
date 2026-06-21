extends ColorRect

var isTransperent = false;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.add_user_signal("done_transitioning");
	toggle_transition();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func toggle_transition() -> void:
	var tween = get_tree().create_tween();
	if isTransperent:
		tween.tween_property(material, "shader_parameter/progress", 2.0, 0.5);
		isTransperent = false;
	else:
		tween.tween_property(material, "shader_parameter/progress", 0.0, 0.5);
		isTransperent = true;
	await tween.finished;
	emit_signal("done_transitioning");
