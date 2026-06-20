extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


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
	get_tree().change_scene_to_file("res://main_menu.tscn");
