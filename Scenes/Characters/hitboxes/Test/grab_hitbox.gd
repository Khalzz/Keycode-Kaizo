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
				if element.has_method("recieve_damage"):
					get_parent().state = States.GRABING
					# get_parent().camera.max_zoom = lerpf(get_parent().camera.max_zoom, 20.0, 0.01)
					# get_parent().camera.margin = Vector2(200, 100)
					element.grabbed_position = $grabbing_pos.global_position
					element.last_direction = -direction
					element.isActive = false
					element.grabbed_flag = true
					element.state = States.GRABBED
	#else:
		# monitoring = false
