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
	
	if state == States.FORWARD_AIR:
		for element in get_overlapping_bodies():
			if (element != get_parent()): # I HAVE TO CHECK IF IT HAVES THE FUNCTION RECIEVE DAMAGE
				if element.has_method("recieve_damage"):
					if element.attackable == true:
						var direccion =   get_parent().global_position - element.global_position
						element.recieve_damage(10, Vector2(scale.x * 10, -8.0), 6.1)
						element.timer = 0.0
						element.attackable = false
				
						#if not get_tree().paused:
						#	get_tree().paused = true
						#	await get_tree().create_timer(0.1).timeout
						#	get_tree().paused = false
