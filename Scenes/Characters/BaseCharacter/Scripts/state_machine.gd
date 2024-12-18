extends Node

"""
The state machine will be checked based on the player state, this will let us
activate code for one or the other state, and based on that, handle movement 
from the player.

1. So the player sets his state.
2. This code reads the player state and sets the specific state node visible.
3. The node will check if the element is visible, if it is, it will do what it has to do.
"""

@onready var player = $".."

# This load could be automatic ❌
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
	
	
