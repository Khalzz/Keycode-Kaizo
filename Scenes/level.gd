extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Camera2D.add_target($Player2)
	$Camera2D.add_target($Player)
	
	var r = get_

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
