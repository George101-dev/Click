extends Area2D

var pressCheck = false
var coins = 0
var upgradeCost = 100
var n = 1

func _input_event(iewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if pressCheck == false:
			$AnimatedSprite2D.play("Idle")
			return;
		if event.is_action_pressed('Click'):
			$AnimatedSprite2D.play("Press")
			
			
			
