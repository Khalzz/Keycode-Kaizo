extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(GlobalController.players)

func _input(event):
	if event.is_action_pressed("start"):
		if !GlobalController.players.has(event.device):
			GlobalController.players.append(event.device)