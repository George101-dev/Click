extends TextureButton

var buttonType = null



func _on_pressed() -> void:
	$OptionsMenu.show()


func _on_button_2_pressed() -> void:
	buttonType = "toMenu"
	$Fade_transition.show()
	$Fade_transition/Fade_Timer.start()
	$Fade_transition/AnimationPlayer.play("fade_in")


func _on_fade_timer_timeout() -> void:
	if buttonType == "toMenu":
		get_tree().change_scene_to_file("res://main_menu.tscn")
