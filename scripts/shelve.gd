extends Node2D

const FRIDGE_FOOD_SCENE = preload("res://scenes/fridge_food.tscn")

@onready var shelve_sprite = $ShelveSprite

var fridge_food_amount : int = 3
var fridge_food_offset : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	generate_food()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func generate_food():
	var shelve_sprite_width = shelve_sprite.texture.get_width() * shelve_sprite.scale.x
	var shelve_sprite_left = (shelve_sprite.position.x - shelve_sprite_width / 2) + 8
	var min_food_position = shelve_sprite_left
	var max_food_position = shelve_sprite_width / 2 - 10
	
	for i in range(fridge_food_amount):
		var food_position = Vector2(randf_range(min_food_position, max_food_position), shelve_sprite.position.y - 10)
		var food_instance = FRIDGE_FOOD_SCENE.instantiate()
		food_instance.create_fridge_food(food_position)
		add_child(food_instance)
