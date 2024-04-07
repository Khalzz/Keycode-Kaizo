extends Label

func _ready():
	pass

func _process(delta):
	pass

func _input(event):
	if GlobalController.players.size() > 0:
		text = str(GlobalController.players[0])
