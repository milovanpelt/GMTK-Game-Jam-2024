extends Node2D
const FRIDGE_FOOD = preload("res://scenes/fridge_food.tscn")
var food_amount : int =  3
var food_offset : int = 25

@onready var shelve_sprite = $ShelveSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	create_food()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func create_food():
	var shelve_sprite_width = shelve_sprite.texture.get_width()
	var shelve_sprite_left = (shelve_sprite.position.x - shelve_sprite_width / 2) + 10

	for i in range(food_amount):
		var food = FRIDGE_FOOD.instantiate()
		var min_food_position = shelve_sprite_left
		var max_food_position = (shelve_sprite_width - food_offset) / 2
		food.position = Vector2(randf_range(min_food_position, max_food_position), shelve_sprite.position.y - 10)
		add_child(food)
