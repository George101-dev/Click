extends Area2D

var coins = 0
var clicks = 0
var n = 1
var can_Click = true
@export var popup_scene: PackedScene

#shows you how much was added to your score and then fades out, check poppupLable to see the code
func spawn_popup(value: int):
	var popup = popup_scene.instantiate()
	get_tree().current_scene.add_child(popup)

	popup.global_position = get_global_mouse_position()
	popup.start(value)
	


func _input_event(viewport, event, shape_idx):
	#registers if player has clicked on the button or not
	if event is InputEventMouseButton and event.pressed:
		if not can_Click:
			$AnimatedSprite2D.play("Idle") 
			return
		if event.is_action_pressed('Click'):
			can_Click = false
			$AnimatedSprite2D.play("Pressed") 
			$ClickSound.play()
			$AnimatedSprite2D.play("Pressed")
			coins += n
			clicks += 1
			spawn_popup(n)
			#print('Score: ', score)
			$"../Label2".text = str(coins)
			
			# score multiplier
			if clicks >= 100 and n == 1:
				n = 2
				print('Multiplier has doubled!!')
			elif clicks >= 500 and n == 2:
				n = 4
				print('Multiplier has doubled!!')
			elif clicks >= 1000 and n == 4:
				n = 8
				print('Multiplier has doubled!!')
			await get_tree().create_timer(0.5).timeout
			$AnimatedSprite2D.play("Idle") 
			can_Click = true
