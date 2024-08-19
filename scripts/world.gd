extends Node2D
const FALLING_FOOD = preload("res://scenes/falling_food.tscn")

func _on_timer_timeout():
	var food = FALLING_FOOD.instantiate()
	food.position = Vector2(0, -100)
	add_child(food)
