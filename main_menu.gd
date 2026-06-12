extends Node2D

var button_type = null

func _ready() -> void:
	$Fade_transition.show()
	$Fade_transition/AnimationPlayer.play()
	$Fade_transition/Fade_Timer.start()
	$Fade_transition/AnimationPlayer.play("fade_out")
	await get_tree().create_timer(1).timeout
	$Fade_transition.hide()

func _on_start_pressed() -> void:
	button_type = "start"
	$Fade_transition.show()
	$Fade_transition/Fade_Timer.start()
	$Fade_transition/AnimationPlayer.play("fade_in")

func _on_options_pressed() -> void:
	$OptionsMenu.show()



func _on_quit_pressed() -> void:
	$Fade_transition.show()
	$Fade_transition/Fade_Timer.start()
	$Fade_transition/AnimationPlayer.play("fade_in")
	await get_tree().create_timer(1).timeout
	get_tree().quit()
	




func _on_fade_timer_timeout() -> void:
	if button_type == "start":
		get_tree().change_scene_to_file("res://main.tscn")
	
