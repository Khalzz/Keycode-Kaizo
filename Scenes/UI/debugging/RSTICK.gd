extends Label

@export var startString = "-"
@export var controlId = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = str(startString + ": (x: " + str(Input.get_joy_axis(GlobalController.players[controlId], JOY_AXIS_LEFT_X)) + ", Y: " + str(Input.get_joy_axis(GlobalController.players[controlId], JOY_AXIS_LEFT_Y)))
