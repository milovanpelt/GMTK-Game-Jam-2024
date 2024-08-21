extends Node

var score : int = 0
var score_addition : int  = 100

var max_time : int = 15
var current_time : int = 0
var time_addition = 10

@onready var score_text = $ScoreText
@onready var time_left_text = $TimeLeftText
@onready var time_left = $TimeLeft

func _ready():
	current_time = max_time
	time_left_text.text = "Time Left: " + str(current_time)
	time_left.start()

func add_point():
	score += score_addition
	score_text.text = "Score: " + str(score)

func add_time():
	max_time += time_addition
	current_time = max_time
	time_left_text.text = "Time Left: " + str(current_time)

func _on_time_left_timeout():
	current_time -= 1
	time_left_text.text = "Time Left: " + str(current_time)
	
	if current_time <= 0:
		time_left.stop()
		reset_level()

func reset_level():
	var fridge = get_node("/root/World/Fridge")	
	if (fridge):
		fridge.expand_fridge()
		fridge.create_shelve()
	add_time()
	time_left.start()
