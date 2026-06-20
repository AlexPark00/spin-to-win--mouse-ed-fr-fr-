extends Control

@onready var viewport = $SubViewportContainer/SubViewport;
@onready var minimapCamera = $SubViewportContainer/SubViewport/Camera2D;
var player;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	viewport.world_2d = get_tree().root.world_2d;
	player = get_tree().get_first_node_in_group("player");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	minimapCamera.position = player.global_position;
