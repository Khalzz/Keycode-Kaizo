extends CharacterBody2D

# General Data
var gravity_multiplier: float = 1.0

# Player especific info:
var player_id: int = 1
var device_id: int = 0

# States and Actions management
enum States { 
	Moving, 
	Attacking, 
	Hitted 
}
	
enum Actions {
	IDLE,
	WALKING,
	RUNNING,
	JUMPING,
	FALLING,
	CROUCHING,
}

@export var state: States = States.Moving
@export var action: Actions = Actions.IDLE

# Inputs
@export var dead_zone: float = 0.1
var direction: Vector2
var jump_input: bool = false
var shield_input: bool = false
var basic_attack_input: bool = false
var grab_input: bool = false

# Movement
@export var acceleration: float = 8000
@export var decceleration: float = 3000
@export var air_decceleration: float = 300

var last_direction = 1

var max_speed: float = 600.0

func _ready() -> void:
	if GlobalController.players.size() == 1:
		if player_id == 1:
			device_id = GlobalController.players[0]
		else:
			device_id = -2
	else:
		device_id = GlobalController.players[player_id - 1]

func _physics_process(delta: float) -> void:
	inputControllers()
	
	if not is_on_floor():
		velocity.y += get_gravity().y * gravity_multiplier * delta
	move_and_slide()

func inputControllers():
	if device_id == -1:
		direction = check_dead_zone(Input.get_vector("left", "right", "down", "up"))
		jump_input = Input.is_action_pressed("jump")
		shield_input = Input.is_action_pressed("shield")
		basic_attack_input = Input.is_action_just_pressed("basic_attack")
		grab_input = Input.is_action_pressed("grab")
	else:
		direction =  check_dead_zone(Vector2(Input.get_joy_axis(device_id, JOY_AXIS_LEFT_X), -Input.get_joy_axis(device_id, JOY_AXIS_LEFT_Y)))
		jump_input = Input.is_joy_button_pressed(device_id, JOY_BUTTON_Y) or Input.is_joy_button_pressed(device_id, JOY_BUTTON_X)
		shield_input = (Input.get_joy_axis(device_id, JOY_AXIS_TRIGGER_LEFT) > 0.8 or Input.get_joy_axis(device_id, JOY_AXIS_TRIGGER_RIGHT) > 0.8)
		basic_attack_input = Input.is_joy_button_pressed(device_id, JOY_BUTTON_A) or (!is_on_floor() and Input.is_joy_button_pressed(device_id, JOY_BUTTON_RIGHT_SHOULDER))
		grab_input = Input.is_joy_button_pressed(device_id, JOY_BUTTON_RIGHT_SHOULDER)
		
	# combo_breaker_input = shield_input and !is_on_floor()

# I do this so instead of checking the deadzone on the placewhere i need it, i check it in the input
func check_dead_zone(stick_input: Vector2):
	var x = 0.0
	var y = 0.0
	
	if abs(stick_input.x) > dead_zone:
		x = stick_input.x
		
	if abs(stick_input.y) > dead_zone:
		y = stick_input.y
		
	return Vector2(x, y)
