extends VBoxContainer

var transition:Node;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	transition = get_tree().get_first_node_in_group("transition");

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	transition.toggle_transition();
	await transition.done_transitioning;
	get_tree().change_scene_to_file("res://main.tscn");

func _on_settings_pressed() -> void:
	$"../../Settings".visible = !$"../../Settings".visible;

func _on_tutorial_pressed() -> void:
	$"../../Tutorial".visible = !$"../../Tutorial".visible;
