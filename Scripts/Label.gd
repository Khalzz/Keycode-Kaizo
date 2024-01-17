extends Label

func _ready():
	pass

func _process(delta):
	var States = get_parent().States
	var state = get_parent().state
	var debugging = get_parent().debugging
	
	if !debugging:
		text = str("")
		return
	
	match state:
		States.IDLE:
			text = str("IDLE")
		States.WALKING:
			text = str("WALKING")
		States.RUNNING:
			text = str("RUNNING")
		States.JUMPING:
			text = str("JUMPING")
		States.FALLING:
			text = str("FALLING")
		States.JAB:
			text = str("JAB")
		States.DASH_ATTACK:
			text = str("DASH ATTACK")
		States.NEUTRAL_AIR:
			text = str("NEUTRAL AIR")
		States.CROUCHING:
			text = str("CROUCHING")
		States.DOWNTILT:
			text = str("DOWNTILT")
		States.UPTILT:
			text = str("UPTILT")
		States.DOWN_AIR:
			text = str("DOWN_AIR")
		States.UP_AIR:
			text = str("UP_AIR")
		States.SIDETILT:
			text = str("SIDETILT")
		States.SHIELDING:
			text = str("SHIELDING")
		States.PUNCHED:
			text = str("PUNCHED")
