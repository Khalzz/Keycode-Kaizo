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
		States.SIDETILT:
			text = str("SIDETILT")
		States.DOWN_AIR:
			text = str("DOWN AIR")
		States.UP_AIR:
			text = str("UP AIR")
		States.FORWARD_AIR:
			text = str("FORWARD AIR")
		States.BACK_AIR:
			text = str("BACK AIR")
		States.SHIELDING:
			text = str("SHIELDING")
		States.SHIELDKNOCKBACKED:
			text = str("SHIELD KNOCKBACKED")
		States.DOWNED:
			text = str("DOWNED")
		States.STANDING:
			text = str("STANDING")
		States.ROLLING:
			text = str("ROLLING")
		States.AVOID:
			text = str("AVOID")
		States.PUNCHED:
			text = str("PUNCHED")
		States.LEDGE:
			text = str("LEDGE")
		States.GRABING:
			text = str("GRABING")
		States.GRAB:
			text = str("GRAB")
