extends Camera2D

@export var move_speed = 0.5  # camera position lerp speed
@export var zoom_speed = 0.25  # camera zoom lerp speed
@export var min_zoom = 0.5  # camera won't zoom closer than this
@export var max_zoom = 10  # camera won't zoom farther than this
@export var margin = Vector2(400, 200)  # include some buffer area around targets

var targets = []  # Array of targets to be tracked.

@onready var screen_size = get_viewport_rect().size
func _process(delta):
	if !targets:
		return

	var flagPosition = Vector2.ZERO
	
	for target in targets:
		flagPosition += target.position
	flagPosition /= targets.size()
	position = lerp(position, flagPosition, move_speed)
	# Keep the camera centered between the targets
	
	# Find the zoom that will contain all targets
	var r = Rect2(position, Vector2.ONE)
	for target in targets:
		r = r.expand(target.position)
	
	r = r.grow_individual(margin.x, margin.y, margin.x, margin.y)
	var d = r.size.length()
	
	var z = clamp(screen_size.length() / d, min_zoom, max_zoom)
	
	zoom = lerp(zoom, Vector2.ONE * z, zoom_speed)

func add_target(t):
	if not t in targets:
		targets.append(t)

func remove_target(t):
	if t in targets:
		targets.erase(t)

func zoom_change(value):
	max_zoom = value
