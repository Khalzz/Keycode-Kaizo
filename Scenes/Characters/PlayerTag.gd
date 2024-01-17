extends Sprite2D

var player1Str = "res://Assets/Sprites/Others/InGame/Player1.svg"
var player2Str = "res://Assets/Sprites/Others/InGame/Player2.svg"
var playerId

func _ready():
	var player_id = get_parent().player_id
	var string_player
	
	if player_id == 1:
		string_player = player1Str
	elif player_id == 2:
		string_player = player2Str
	texture = load(string_player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
