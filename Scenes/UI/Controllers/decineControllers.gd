extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if Input.is_joy_button_pressed(event.device, JOY_BUTTON_START):
		if !GlobalController.players.has(event.device):
			GlobalController.players.append(event.device)
	if event.is_action_pressed("start"):
		if !GlobalController.players.has(-1):
			GlobalController.players.append(-1)
