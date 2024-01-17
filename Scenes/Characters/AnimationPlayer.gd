extends AnimationPlayer

func _process(delta):
	var States = get_parent().States
	var state = get_parent().state
	var direction = get_parent().last_direction
	var jump_direction = get_parent().jump_direction
	
	if state == States.JUMPING or state == States.FALLING or state == States.BACK_AIR or state == States.FORWARD_AIR:
		if jump_direction > 0.0:
			$"../Sprite2D".flip_h = false
		else:
			$"../Sprite2D".flip_h = true
	else:
		if direction > 0.0:
			$"../Sprite2D".flip_h = false
		else:
			$"../Sprite2D".flip_h = true
	
	match state:
		States.IDLE:
			play("IDLE")
		States.WALKING:
			play('WALKING')
		States.RUNNING:
			play('RUNNING')
		States.JUMPING:
			play("JUMPING")
		States.FALLING:
			play('FALLING')
		States.JAB:
			play('JAB')
		States.DASH_ATTACK:
			play('DASH_ATTACK')
		States.NEUTRAL_AIR:
			play('NEUTRAL_AIR')
		States.CROUCHING:
			play('CROUCHING')
		States.DOWNTILT:
			play('DOWNTILT')
		States.UPTILT:
			play('UPTILT')
		States.UP_AIR:
			play('UPAIR')
		States.DOWN_AIR:
			play('DOWN_AIR')
		States.SIDETILT:
			play('SIDETILT')
		States.FORWARD_AIR:
			play('FAIR')
		States.BACK_AIR:
			play('BAIR')
		States.SHIELDING:
			play('SHIELDING')
		States.DOWNED:
			play('DOWNED')
		States.STANDING:
			play('STANDING')
		States.ROLLING:
			play('ROLLING')
		States.AVOID:
			play('AVOID')
		States.PUNCHED:
			play('PUNCHED')
