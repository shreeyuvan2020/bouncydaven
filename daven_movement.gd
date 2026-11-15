extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D

@export var speed: float = 300.0
var direction: Vector2 = Vector2.ZERO
var speedpwp_inc = 100

var ghoul_dmg = 20
var daven_health = 100

func _process(delta: float) -> void:
	# Update the stored direction whenever an arrow key is pressed
	if Input.is_action_just_pressed("ui_right"):
		direction = Vector2.RIGHT
	elif Input.is_action_just_pressed("ui_left"):
		direction = Vector2.LEFT
	elif Input.is_action_just_pressed("ui_up"):
		direction = Vector2.UP
	elif Input.is_action_just_pressed("ui_down"):
		direction = Vector2.DOWN

	# Continuously move in the stored direction every frame
	position += direction * speed * delta
	
	sprite.rotation += 10 * delta
		
	move_and_slide()
	

func _on_pickup_area_area_entered(area: Area2D) -> void:
	if daven_health == 0:
			get_tree().quit()
			
	if area.is_in_group("SpeedPwp"):
		area.queue_free()
		speed = speed + speedpwp_inc
	
	if area.is_in_group("SpikePwp"):
		area.queue_free()
		
	if area.is_in_group("FlareGhoulHit"):
		daven_health = daven_health - ghoul_dmg
		$CanvasLayer/HealthBar.text = "Health: " + str(daven_health)
		if daven_health == 0:
			get_tree().quit()
