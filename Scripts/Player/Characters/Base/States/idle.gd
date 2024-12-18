extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if visible:
		if $"../..".isActive:
			if $"../..".basic_attack_input:
				$"../..".state = $"../..".States.JAB
				get_parent().animation_player.play("JAB")
			if ($"../..".tilt.x < -0.6 or $"../..".tilt.x > 0.6) and $"../..".canTilt:
				$"../..".state = $"../..".States.SIDE_TILT
				$"../..".last_direction = $"../..".tilt.x
				
