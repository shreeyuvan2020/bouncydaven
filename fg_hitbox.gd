extends Area2D

@onready var player: CharacterBody2D = $"../Daven"

func _physics_process(delta) -> void:
	var speed: float = 0.01 # put wanted speed here
	look_at(player.global_position)
	self.position = lerp(self.position,player.global_position,speed)
