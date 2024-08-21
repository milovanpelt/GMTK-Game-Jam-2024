extends Area2D

const fridge_food_data = {
	"apple": "res://assets/sprites/transparent_food/trans_apple.png",
	"bacon": "res://assets/sprites/transparent_food/trans_bacon.png",
	"beer": "res://assets/sprites/transparent_food/trans_beer.png",
	"honey": "res://assets/sprites/transparent_food/trans_honey.png",
	"jam": "res://assets/sprites/transparent_food/trans_jam.png"
}

func create_fridge_food(pos: Vector2):
	var random_key = fridge_food_data.keys().pick_random()
	var random_food_item = fridge_food_data[random_key]
	set_meta("name", random_key)
	var random_food_texture = load(random_food_item) as Texture2D
	get_node("Sprite2D").set_texture(random_food_texture)
	position = pos

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
