extends ColorRect

var transition;
func _ready() -> void:
	transition = get_tree().get_first_node_in_group("transition");

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		toggle_pause();

func toggle_pause() -> void:
	if get_tree().paused == true:
		get_tree().paused = false;
		visible = false;
	else:
		get_tree().paused = true;
		visible = true;


func _on_continue_pressed() -> void:
	toggle_pause();

func _on_main_menu_pressed() -> void:
	toggle_pause();
	transition.toggle_transition();
	await transition.done_transitioning;
	get_tree().change_scene_to_file("res://main_menu.tscn");
