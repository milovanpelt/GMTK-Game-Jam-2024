extends Area2D

const FRIDGE_FOOD_DATA = {
	"apple": "res://assets/sprites/transparent_food/trans_apple.png",
	"bacon": "res://assets/sprites/transparent_food/trans_bacon.png",
	"beer": "res://assets/sprites/transparent_food/trans_beer.png",
	"honey": "res://assets/sprites/transparent_food/trans_honey.png",
	"jam": "res://assets/sprites/transparent_food/trans_jam.png"
}

func create_fridge_food(position: Vector2):
	var food_name = get_random_food_name()
	var food_texture = load_food_texture(food_name)
	
	# Setting meta, 
	set_meta("name", food_name)
	update_food_texture(food_texture)
	self.position = position
	
func get_random_food_name() -> String:
	return FRIDGE_FOOD_DATA.keys().pick_random()

func load_food_texture(food_name: String) -> Texture2D:
	var food_path = FRIDGE_FOOD_DATA[food_name]
	return load(food_path) as Texture2D
	
func update_food_texture(texture: Texture2D):
	var sprite_node = get_node("Sprite2D")
	sprite_node.set_texture(texture)

func _on_body_entered(body):
	var game_manager = get_node("/root/World/GameManager")	
	print("Collided with:", body.get_meta("name"))
	if body is CharacterBody2D:
		var food_item = body.get_parent()
		if get_meta("name") == body.get_meta("name"):
			if game_manager:
				game_manager.add_point()
			
func _on_body_exited(body):
	if body is CharacterBody2D and body.name == self.name:
		body.queue_free()
