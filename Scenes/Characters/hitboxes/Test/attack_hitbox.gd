extends Area2D

@export var shieldKnockBack = 0 # 1000 for jab
@export var multiplier = 0 # 10 for jab
@export var scale_multiplier_x = 0 # 7 for jab
@export var scale_y = 0 # -7 for jab
@export var damage = 0 # 2.3 for jab
@export var tilt = false

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
								$"..".shieldKnockBack(-$"..".last_direction, shieldKnockBack)
								element.shieldKnockBack($"..".last_direction, shieldKnockBack)
						else:
							var direccion = get_parent().global_position - element.global_position
							element.recieve_damage(multiplier, Vector2(scale.x * 7, -7), 2.3)
							element.timer = 0.0
							if tilt:
								element.attackable = false
	else:
		monitoring = false
