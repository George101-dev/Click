extends Node2D

func _ready() -> void:
	$Fade_transition.show()
	$Fade_transition/AnimationPlayer.play("fade_out")
	await get_tree().create_timer(1).timeout
	$Fade_transition.queue_free()
