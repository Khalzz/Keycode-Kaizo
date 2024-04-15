extends CollisionShape2D

func _ready():
	pass # Replace with function body.

func _process(delta):
	var States = get_parent().States
	var state = get_parent().state
	var direction = get_parent().last_direction
	
	if state == States.PUNCHED:
		self.shape.radius = 27
		self.shape.height = 55
	else:
		shape.radius = 10
		shape.height = 84
