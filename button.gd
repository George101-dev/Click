extends Area2D

var coins = 0.00
var upgradeLevelClicks = 1
var upgradeLevelCps = 1
var upgradeCostClicks = 50.00
var upgradeCostCps = 100.00
var clicks = 0
var n = 1.00
var autoGenerates = 0
var can_Click = true
@export var popup_scene: PackedScene



#shows you how much was added to your score and then fades out, check poppupLable to see the code
func spawn_popup(value):
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
			$"../Label2".text = "%.2f" % coins
			update_upgrade_label_clicks()
			update_upgrade_lable_cps()
			
			if clicks >= 100 and n == 1:
				pass
				
			elif clicks >= 500 and n == 2:
				pass
				
			elif clicks >= 1000 and n == 4:
				pass
				
			await get_tree().create_timer(0.5).timeout
			$AnimatedSprite2D.play("Idle") 
			can_Click = true
				
			

# upgrades the coins you get from clicking on the button
func _on_upgrade_coins_on_click_upgrade_pressed() -> void:
	try_upgrade()

func try_upgrade():
	if coins < upgradeCostClicks:
		print('You can not afford this upgrade!')
	elif coins >= upgradeCostClicks:
		coins -= upgradeCostClicks
		$"../Label2".text = "%.2f" % coins
		n += 0.25
		upgradeLevelClicks += 1
		$"../Label4".text = str(upgradeLevelClicks) + " Lv"
		upgradeCostClicks *= 1.15
		$"../Label3".text = "Price: " + "%.2f" % upgradeCostClicks + " coins"
		update_upgrade_label_clicks()
		print('Coin gain upgraded!');
				
#updates the label showing the price for the click and cps upgrade
func update_upgrade_label_clicks():
	$"../Label3".text = "Price: " + "%.2f" % upgradeCostClicks + " coins"
	
	if coins >= upgradeCostClicks:
		$"../Label3".modulate = Color.GREEN
	else:
		$"../Label3".modulate = Color.RED
		
func update_upgrade_lable_cps():
	$"../Label5".text = "Price: " + "%.2f" % upgradeCostCps + " coins"
	if coins >= upgradeCostCps:
		$"../Label5".modulate = Color.GREEN
	else:
		$"../Label5".modulate = Color.RED
		
		
func _ready() -> void:
	update_upgrade_label_clicks()
	update_upgrade_lable_cps()
	
	
# Upgrades the coins per second (CPS)
func _on_cps_timer_timeout() -> void:
	if autoGenerates > 0:
		coins += autoGenerates
		$"../Label2".text = "%.2f" % coins
		update_upgrade_lable_cps()
		
	
func _on_upgrade_cps_upgrade_cps() -> void:
	try_upgrade_cps()
	

func try_upgrade_cps():
	if coins < upgradeCostCps:
		print('You can not afford this upgrade!')
	elif coins >= upgradeCostCps:
		coins -= upgradeCostCps
		upgradeCostCps *= 1.25
		autoGenerates += 0.25
		upgradeLevelCps += 1
		$"../Label6".text = str(upgradeLevelCps) + " Lv"
		$Timer.start()
		update_upgrade_lable_cps()
		print ("CPS upgraded")
		
		
