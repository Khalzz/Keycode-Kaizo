extends Node

"""
The state machine will be checked based on the player state, this will let us
activate code for one or the other state, and based on that, handle movement 
from the player.

This contains 2 different "state checkers":
	1. General State: this is a value that can be divided by "moving, attacking and hitted"
	there we will set all the logic of the elements who make that state, so for example:
	in "MOVING" we have all the logic for movement of the player and activations of states for it
	
	2. Actions: these are the action itself being executed, so for example if the player does a jab
	this action will be selected and the animation for that especific action will be setted
	
The main reason of the setting of actions in here instead on the specific nodes is because there are
elements who can generally affect others, for example the BodyCollider, since some actions change the 
size and position of it, we will have all here so we can then there change the value manually.
"""

@onready var player = $".."
@onready var state_machine_nodes: Dictionary

var actual_state: State = null

func _ready() -> void:
	# loading states
	for state in player.States.keys():
		state_machine_nodes[state] = get_node(state)
		
	if state_machine_nodes.size() != player.States.size():
		push_error("There was an error on the setting of states, there might be missing an state node on the state machine")
	
func _process(delta: float) -> void:
	if state_machine_nodes.has(player.States.find_key(player.state)):
		actual_state = state_machine_nodes[player.States.find_key(player.state)]
	else:
		push_error("The character: " + str(player.name) + " dont contains the node: " + str(player.States.keys()[player.state]) + " in the state machine")
		
	if actual_state != null:
		actual_state.Update(delta)

func _physics_process(delta: float) -> void:
	if actual_state != null:
		actual_state.PhysicsUpdate(delta);
	
	
