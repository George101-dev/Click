extends Area2D

func _input_event(iewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.is_action_pressed('Click'):
			$AnimatedSprite2D.play("Press");
