extends Node2D

const SHELVE = preload("res://scenes/shelve.tscn")
var shelve_amount : int =  1
var shelve_offset : int = 25

@onready var fridge_sprite = $FridgeSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	create_shelve()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT :
			shelve_amount += 1
			create_shelve()
			
func create_shelve():
	var fridge_sprite_height = fridge_sprite.texture.get_height()
	var fridge_sprite_bottom = (fridge_sprite.position.y + fridge_sprite_height / 2)
	
	for i in range(shelve_amount):
		var shelve = SHELVE.instantiate()
		remove_child(shelve)
		shelve.position = Vector2(fridge_sprite.position.x, fridge_sprite_bottom - shelve_offset * i)
		add_child(shelve)
