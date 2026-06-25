extends Sprite2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		var damage:int = get_parent().get_parent().get_parent().get_damage();
		body.deal_damage(damage);
