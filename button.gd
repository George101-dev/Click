extends Area2D

var coins = 0
var upgradeCost = 50
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
			
			coins += n
			clicks += 1
			spawn_popup(n)
			#print('Score: ', score)
			$"../Label2".text = str(coins)
			update_upgrade_label()
			
			# score multiplier
			if clicks >= 100 and n == 1:
				pass
				print('Multiplier has doubled!!')
			elif clicks >= 500 and n == 2:
				pass
				print('Multiplier has doubled!!')
			elif clicks >= 1000 and n == 4:
				pass
				print('Multiplier has doubled!!')
			await get_tree().create_timer(0.5).timeout
			$AnimatedSprite2D.play("Idle") 
			can_Click = true
				
			


func _on_upgrade_coins_on_click_upgrade_pressed() -> void:
	try_upgrade()


func try_upgrade():
	if coins < upgradeCost:
		print('You can not afford this upgrade!')
	elif coins > upgradeCost or coins == upgradeCost:
		coins -= upgradeCost
		$"../Label2".text = str(coins)
		n *= 2
		upgradeCost += 50
		$"../Label3".text = "Price: " + str(upgradeCost) + " coins"
		update_upgrade_label()
		print('Coin gain upgraded!');
		
				
func update_upgrade_label():
	$"../Label3".text = "Price: " + str(upgradeCost) + " coins"
	
	if coins >= upgradeCost:
		$"../Label3".modulate = Color.GREEN
	else:
		$"../Label3".modulate = Color.RED
func _ready() -> void:
	update_upgrade_label()
