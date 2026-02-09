extends Label


#Plays the animation for showing you how much was added to your score after clicking the button and then goes up and fades out
func start(value: int):
	text = "+" + str(value)
	modulate.a = 1.0
	
	var tween = get_tree().create_tween()
	tween.tween_property(self, "global_position", get_global_mouse_position() + Vector2(0, -40), 0.5)
	tween.tween_property(self, "modulate:a", 0.0, 0.5)

	tween.finished.connect(queue_free)
