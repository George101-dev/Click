extends Area2D

signal upgrade_pressed

func _input_event(iewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		
		if event.button_index == MOUSE_BUTTON_LEFT:
			
			$AnimatedSprite2D.play("Press")
			
			await get_tree().create_timer(0.3).timeout
			$AnimatedSprite2D.play("Idle")
			emit_signal("upgrade_pressed")
