extends Node2D

const SHELVE = preload("res://scenes/shelve.tscn")
var shelve_amount : int =  1
var shelve_offset : int = 25

var shelve_array = []

@onready var fridge_sprite = $FridgeSprite

var fridge_scale_x = 0
var fridge_scale_y = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	fridge_scale_x =  fridge_sprite.scale.x
	fridge_scale_y = fridge_sprite.scale.y
	create_shelve()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT :
			expand_fridge()
			create_shelve()
			
func create_shelve():
	remove_shelves()
	var fridge_height = fridge_sprite.scale.y * fridge_sprite.texture.get_height()
	var fridge_bottom = (fridge_sprite.position.y + fridge_height / 2)
	
	for i in shelve_amount:
		var shelve = SHELVE.instantiate()
		shelve_array.append(shelve)
		shelve.scale.x = fridge_scale_x
		shelve.position = Vector2(fridge_sprite.position.x, fridge_bottom - (shelve_offset * i))
		add_child(shelve)
	
func remove_shelves():
	if shelve_array.size() > 0:
		for i in range(shelve_array.size()):
			shelve_array[i].queue_free()
		shelve_array.clear()
		
func expand_fridge():
	if shelve_amount < 7:
		shelve_amount += 1
	fridge_sprite.scale.x *= 1.05
	fridge_sprite.scale.y *= 1.05
	
	fridge_scale_x = fridge_sprite.scale.x
	fridge_scale_y = fridge_sprite.scale.y
