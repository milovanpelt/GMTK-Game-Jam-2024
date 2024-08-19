extends CharacterBody2D
@onready var move_sound = $MoveSound

const SPEED = 80.0
#const JUMP_VELOCITY = -400.0

var gravity = 20.0

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		move_sound.play()
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
