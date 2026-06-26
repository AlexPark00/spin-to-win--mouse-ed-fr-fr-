extends VBoxContainer

var transition:Node;
@onready var musicPlayer = $"../../MusicPlayer"
@onready var sfxPlayer = $"../../SFXPlayer";
var sfxPlay = preload("res://sfx/hud_play.ogg");
var sfxClick = preload("res://sfx/hud_click.ogg");
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	transition = get_tree().get_first_node_in_group("transition");

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	musicPlayer.stop();
	sfxPlayer.stream = sfxPlay;
	sfxPlayer.play();
	transition.toggle_transition();
	await transition.done_transitioning;
	await get_tree().create_timer(3.0).timeout;
	get_tree().change_scene_to_file("res://main.tscn");

func _on_settings_pressed() -> void:
	sfxPlayer.stream = sfxClick;
	sfxPlayer.play();
	$"../../Settings".visible = !$"../../Settings".visible;

func _on_tutorial_pressed() -> void:
	sfxPlayer.stream = sfxClick;
	sfxPlayer.play();
	$"../../Tutorial".visible = !$"../../Tutorial".visible;
