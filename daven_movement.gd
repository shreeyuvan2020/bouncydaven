extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D

func _physics_process(delta):
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * 400
	
	if velocity.length() > 0:
		sprite.rotation += 10 * delta
		
	move_and_slide()
