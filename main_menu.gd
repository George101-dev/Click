extends Node2D
var rot = true

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")


func _on_options_pressed() -> void:
	pass # Replace with function body.



func _on_quit_pressed() -> void:
	get_tree().quit()

func _ready() -> void:
	while(rot == true):
		$Sprite2D2.rotate(8)
		
