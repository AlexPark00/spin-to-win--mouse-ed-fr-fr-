extends Sprite2D

@onready var theEndMenu = $"../../../../CanvasLayer/Control/TheEnd";

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		var damage:int = get_parent().get_parent().get_parent().get_damage();
		body.deal_damage(damage);
		theEndMenu.damageDealt += damage;
