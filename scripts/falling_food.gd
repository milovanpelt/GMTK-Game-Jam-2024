extends CharacterBody2D
@onready var move_sound = $MoveSound

var food_name : String

const falling_food_data = {
	"apple": "res://assets/sprites/normal_food/Apple.png",
	"bacon": "res://assets/sprites/normal_food/Bacon.png",
	"beer": "res://assets/sprites/normal_food/Beer.png",
	"honey": "res://assets/sprites/normal_food/Honey.png",
	"jam": "res://assets/sprites/normal_food/Jam.png"
}

const SPEED = 80.0
#const JUMP_VELOCITY = -400.0

var gravity = 20.0
	
func create_falling_food(pos: Vector2):
	var random_key = falling_food_data.keys().pick_random()
	var random_food_item = falling_food_data[random_key]
	set_meta("name", random_key)
	print("Name set for falling Object: " + str(name))
	var random_food_texture = load(random_food_item) as Texture2D
	get_node("Sprite2D").set_texture(random_food_texture)
	position = pos

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	#if Input.is_action_just_pressed("") and is_on_floor():
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
