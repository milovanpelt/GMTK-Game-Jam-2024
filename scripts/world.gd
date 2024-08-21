extends Node2D
const FALLING_FOOD = preload("res://scenes/falling_food.tscn")

func _on_timer_timeout():
	var falling_food_instance = FALLING_FOOD.instantiate()
	var falling_food_position = Vector2(0, -100)
	falling_food_instance.create_falling_food(falling_food_position)
	add_child(falling_food_instance)
