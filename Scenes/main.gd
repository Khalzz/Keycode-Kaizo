extends TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	var player = get_node("Player")
	var player2 = get_node("Player2")
	
	if player:
		$Camera2D.add_target($Player)
	if player2:
		$Camera2D.add_target($Player2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
