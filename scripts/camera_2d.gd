extends Camera2D

@export var target:Node2D;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


const FOLLOW_SPEED = 200.0

func _process(delta):
	var weight = 1 - exp(-FOLLOW_SPEED * delta);
	position = position.lerp(target.position, weight);

func teleport_to(point:Vector2):
	global_position = point;
