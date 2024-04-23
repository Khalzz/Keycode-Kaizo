extends CollisionShape2D

@onready var player = $".."

func _ready():
	pass # Replace with function body.

func _process(delta):
	var States = get_parent().States
	var state = get_parent().state
	var direction = get_parent().last_direction
	
	if state != States.PUNCHED:
		shape.radius = 10
		shape.height = 84
	else:
		shape.radius = 27
		shape.height = 55
