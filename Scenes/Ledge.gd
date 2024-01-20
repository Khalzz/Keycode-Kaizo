extends Area2D

@export var direction_val = 0.0
var isUsed = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for element in get_overlapping_bodies():
		if element.has_method("GrabLedge") and element == get_overlapping_bodies()[0]:
			element.GrabLedge(direction_val, global_position, get_overlapping_bodies(), delta)
