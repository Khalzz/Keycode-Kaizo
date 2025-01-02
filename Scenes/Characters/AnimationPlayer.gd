extends AnimationPlayer

"""
Here we will handle the animations to play and if they have or not to be rotated in a certain direction
"""

@onready var state_machine = $"../StateMachine"
@onready var character_sprite = $"../CharacterSprite"
@onready var player = $".."

func _process(delta):
	# from the ACTUAL STATE play the animation with the NAME of the inner state
	if player.last_direction > 0:
		character_sprite.flip_h = false
	elif player.last_direction < 0:
		character_sprite.flip_h = true
		
	
	play(player.Actions.find_key(player.action))
