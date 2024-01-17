extends CharacterBody2D

var life = 0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var hud = null
enum States {IDLE, PUNCHED, DOWNED}
var state = States.IDLE

var attackable = true
var bouncing = false
var timer = 0.0
var downed_timer = 0.0
var punchedTime = 0.0
var bounceDivisor = 1

func _ready():
	hud = get_node("../HUD")
	
func _process(delta):
	hud.setLive(life, 2)
	
func _physics_process(delta):
	floorLogic(delta)
	bouncingLogic(delta)
	resetDowned(delta)

func bouncingLogic(delta):
	if state == States.PUNCHED and !is_on_floor():
		var collision_info = move_and_collide(velocity * delta)
		if collision_info:
			bounceDivisor += 1
			velocity.x = velocity.x / bounceDivisor
			velocity.y = velocity.y / bounceDivisor
			velocity = velocity.bounce(collision_info.get_normal())
	else:
		move_and_slide()

func floorLogic(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		if timer != 0:
			velocity.x = 0
		collision_mask = 3
	if state == States.PUNCHED:
		timer += delta
		bouncing = true
		collision_mask = 5
		if punchedTime > 2 and velocity.length() < 20 or punchedTime > 2 and timer >= punchedTime/2:
			attackableTrue()
			state = States.DOWNED
			downed_timer = 0.0
		if timer >= punchedTime and timer < 2:
			attackableTrue()
			standPosition()

func resetDowned(delta):
	if state == States.DOWNED:
		downed_timer += delta
		if downed_timer >= 3:
			standPosition()

func attackableTrue():
	attackable = true
	collision_mask = 3

func standPosition():
	state = States.IDLE
	bounceDivisor = 1

func recieve_damage(multiplier, vector, damage):
	bounceDivisor = 1
	life += damage
	var sum_to_damage = ((4.0 / 100.0) * life)
	if damage < 8:
		punchedTime = 0.5
	else:
		if sum_to_damage < 4:
			punchedTime = 1 + sum_to_damage
		else:
			punchedTime = 4
		
	if vector.x > 0.0:
		$AnimatedSprite2D.flip_h = false
		$CollisionShape2D.scale.x = -1
	else:
		$AnimatedSprite2D.flip_h = true
		$CollisionShape2D.scale.x = 1
	velocity.x = vector.x * life
	velocity.y = vector.y * life
	state = States.PUNCHED
	$AnimatedSprite2D.play("PUNCHED")
	
	# this is to pause once the punch hits a player
	if not get_tree().paused:
		get_tree().paused = true
		if damage > 5:
			await get_tree().create_timer(0.1).timeout
		get_tree().paused = false
