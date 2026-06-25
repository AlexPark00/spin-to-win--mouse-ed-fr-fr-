extends CharacterBody2D

@onready var dps_label: Label = $Label
var full_white_shader_material = preload("res://shaders/full_white.tres");

var window_duration: float = 2.0
var damage_history: Array = [] 
var total_damage_in_window: float = 0.0

func _process(delta: float) -> void:
	var current_time = Time.get_ticks_msec() / 1000.0
	while damage_history.size() > 0 and (current_time - damage_history[0]["time"]) > window_duration:
		total_damage_in_window -= damage_history[0]["damage"]
		damage_history.remove_at(0)
	var current_dps = total_damage_in_window / window_duration
	dps_label.text = str("DPS: ", int(round(current_dps)));

func deal_damage(damage: float) -> void:
	var current_time = Time.get_ticks_msec() / 1000.0
	_damaged_effect();
	damage_history.append({"time": current_time, "damage": damage})
	total_damage_in_window += damage

func _damaged_effect() -> void:
	$Sprite2D.material = full_white_shader_material;
	await get_tree().create_timer(0.05).timeout;
	$Sprite2D.material = null;
