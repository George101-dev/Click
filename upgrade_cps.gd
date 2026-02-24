extends Area2D


signal upgrade_cps

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			$AnimatedSprite2D.play("Press")
			await get_tree().create_timer(0.3).timeout
			$AnimatedSprite2D.play("Idle")
			emit_signal("upgrade_cps")
