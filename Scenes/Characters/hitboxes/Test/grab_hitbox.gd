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
	if state == States.GRAB:
		for element in get_overlapping_bodies():
			if (element != get_parent()): # I HAVE TO CHECK IF IT HAVES THE FUNCTION RECIEVE DAMAGE
				if element.has_method("recieve_damage") and element.state != States.ROLLING and element.state != States.AVOID:
					get_parent().canThrow = false
					get_parent().canGrab = false
					get_parent().dash_timer = 0.0
					get_parent().state = States.GRABING
					get_parent().grabbed_player = element
					element.grabbed_position = $grabbing_pos.global_position
					element.last_direction = -direction
					element.isActive = false
					element.grabbed_flag = true
					element.state = States.GRABBED
					element.dash_timer = 0.0					
					element.timer = 0.0
					element.grabbing_player = get_parent()
