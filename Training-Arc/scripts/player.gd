extends CharacterBody2D

var SPEED = 200.0
var JUMP_VELOCITY = -400.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var camera_2d: Camera2D = $Camera2D
# Jump Function
func jump():
	velocity.y = JUMP_VELOCITY
func _physics_process(delta: float) -> void:
	# Add the gravity
	if !is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump()
	# Variable Jump Height
	if Input.is_action_just_released("jump") and !is_on_floor() and velocity.y < 0:
		velocity.y *= 0.2
	# Get the input direction and handle the movement/deceleration
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		if Input.is_action_pressed("move_left"):
			# Flips the character
			animated_sprite_2d.flip_h = true
			# Updates the player direction variable to show that player is facing left
			Game.PLAYER_DIRECTION = "LEFT"
		elif Input.is_action_pressed("move_right"):
			animated_sprite_2d.flip_h = false
			# Updates the player direction variable to show that player is facing right			
			Game.PLAYER_DIRECTION = "RIGHT"
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	
