extends Area2D

func _ready():
	pass
	
func _process(delta):
	var States = get_parent().States
	var state = get_parent().state
	var direction = get_parent().last_direction
	
	if direction > 0:
		scale.x = 1
	else:
		scale.x = -1
	if state == States.JAB:
		for element in get_overlapping_bodies():
			if (element != get_parent()): # I HAVE TO CHECK IF IT HAVES THE FUNCTION RECIEVE DAMAGE
				if element.has_method("recieve_damage"):
					if element.attackable == true:
						if element.state == States.SHIELDING:
							if element.dash_timer <= 0.5:
								$"..".shieldKnockBack(-$"..".last_direction, 1000)
								element.shieldKnockBack($"..".last_direction, 1000)
						else:
							var direccion = get_parent().global_position - element.global_position
							element.recieve_damage(10, Vector2(scale.x * 7, -7), 2.3, false)
							element.timer = 0.0
	else:
		monitoring = false
