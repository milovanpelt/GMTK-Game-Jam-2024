extends Node

var current_score : int = 0
var score_addition : int  = 100

var max_time : int = 15
var current_time : int = 0
var time_addition = 10

@onready var score_text = $ScoreText
@onready var time_left_text = $TimeLeftText
@onready var time_left = $TimeLeft

const FALLING_FOOD = preload("res://scenes/falling_food.tscn")

func _ready():
	reset_timer_display()
	time_left.start()

func add_score():
	current_score += score_addition
	score_text.text = "Score: " + str(current_score)

func add_time():
	max_time += time_addition
	reset_timer_display()
	
func reset_timer_display():
	current_time = max_time
	time_left_text.text = "Time Left: " + str(current_time)

func _on_time_left_timeout():
	current_time -= 1
	time_left_text.text = "Time Left: " + str(current_time)
	
	if current_time <= 0:
		time_left.stop()
		reset_level()
		
func _on_falling_food_timer_timeout():
	var falling_food_instance = FALLING_FOOD.instantiate()
	var falling_food_position = Vector2(0, -100)
	falling_food_instance.create_falling_food(falling_food_position)
	add_child(falling_food_instance)

func reset_level():
	var fridge = get_node("/root/World/Fridge")	
	if (fridge):
		fridge.expand_fridge()
		fridge.create_shelve()
	add_time()
	time_left.start()

func _on_world_end_body_entered(body):
	body.queue_free()
