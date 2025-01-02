extends State

"""
The state class has something like this where we will 

IMPORTANT: The name of the inner state needs to have an animation with the same name in the animation player
since the animation of that action is setted based on the name of the value in the enum

✅❌

The movement design for the base player is mainly designed for the posibility of:
	1. Moving left or right ✅
	2. Crouching ❌
	3. Jumping: The falling speed will change based on if the player is jumping or falling from a jump ✅
	4. Dashing ❌
"""

@onready var player = $"../.."

# Movement base variables
const JUMP_VELOCITY = -500.0
const SPEED = 800.0

# Jumping Logic
@export var max_jump_count = 2
var jump_count = 1
var jump_direction = 0
var is_jumping = false
var can_jump = false

# Timers for Timed Actions
@onready var jump_timer = $"../../TimedActions/Jump"

func PhysicsUpdate(delta: float):
	movementLogic(delta)
	jumpLogic(delta)

func movementLogic(delta):
	if player.is_on_floor() and player.velocity.x == 0.0 and player.action != player.Actions.CROUCHING:
		player.action = player.Actions.CROUCHING
	
	if player.is_on_floor():
		player.last_direction = player.direction.x
	
	if player.direction.x != 0.0:
		if player.is_on_floor():
			player.action = player.Actions.RUNNING
			player.velocity.x = move_toward(player.velocity.x, player.direction.x * player.max_speed, (player.acceleration * delta))
		else:
			player.velocity.x = move_toward(player.velocity.x, player.direction.x * player.max_speed, (player.acceleration * delta) / 2.0)
	else:
		if player.is_on_floor():
			if player.direction.y < 0.0:
				player.action = player.Actions.CROUCHING
				player.velocity.x = 0.0
			else:
				player.action = player.Actions.IDLE
				player.velocity.x = move_toward(player.velocity.x, 0.0, delta * player.decceleration)
		else:
			player.velocity.x = move_toward(player.velocity.x, 0.0, delta * player.air_decceleration)

func jumpLogic(delta):
	$"../../Debugging/JumpTimer".text = str(jump_timer.time_left)
	
	if player.is_on_floor():
		jump_count = max_jump_count
	
	if (player.jump_input and jump_count > 0 and jump_timer.is_stopped() and can_jump):
		player.last_direction = player.direction.x
		jump_timer.start()
		jump_count -= 1
		can_jump = false
		player.action = player.Actions.JUMPING
		player.gravity_multiplier = 2.0
		
	if !jump_timer.is_stopped():
		player.velocity.y = JUMP_VELOCITY
		
	if !player.jump_input:
		jump_timer.stop()
		can_jump = true
		
	if jump_timer.is_stopped() and !player.is_on_floor():
		player.action = player.Actions.FALLING
		player.gravity_multiplier = 4.0
