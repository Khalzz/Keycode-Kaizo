extends Area2D

@onready var this_player = $"../.."

func _ready():
	pass
	
func _process(delta):
	visible = monitoring
	
	var States = this_player.States
	var state = this_player.state
	var direction = this_player.last_direction
	
	if direction > 0:
		scale.x = 1
	else:
		scale.x = -1
	
	for element in get_overlapping_bodies():
		if (element != this_player): # I HAVE TO CHECK IF IT HAVES THE FUNCTION RECIEVE DAMAGE
			if element.has_method("recieve_damage"):
				if element.attackable == true:
					if element.state == States.SHIELDING:
						if element.dash_timer <= 0.5:
							$"..".shieldKnockBack(-$"..".last_direction, 1000)
							element.shieldKnockBack($"..".last_direction, 1000)
					else:
						var direccion = get_parent().get_parent().global_position - element.global_position
						element.recieve_damage(10, Vector2(scale.x * 7, -7), 2.3, false)
						element.timer = 0.0
