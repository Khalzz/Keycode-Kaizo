extends AnimatedSprite2D

func _ready():
	pass

func _process(delta):
	var States = get_parent().States
	var state = get_parent().state
	
	match state:
		States.IDLE:
			play("IDLE")
		States.PUNCHED:
			play("PUNCHED")
		States.DOWNED:
			play("DOWNED")
