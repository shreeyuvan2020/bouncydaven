extends Area2D
const win_scene_stuff = preload("res://win.tscn")

func _on_body_entered(body: CharacterBody2D) -> void:
	if body.name == "Daven":
		get_tree().change_scene_to_file("res://win.tscn")
		print("fdsfdsa")
	 # Replace with function body.
