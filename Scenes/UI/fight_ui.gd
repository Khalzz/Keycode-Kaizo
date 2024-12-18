extends CanvasLayer

@onready var framerate_label = $UI/Framerate

var labelPlayer = null

func _process(delta: float) -> void:
	var fps = Engine.get_frames_per_second()
	framerate_label.text = "fps: " + str(fps)

func setLive(value, playerNumber):
	var labelPlayer = get_node('UI/HBoxContainer/Player{playerNumber}/PlayerLabel'.format({"playerNumber": playerNumber}))
	labelPlayer.text = str(value, "%")
	
func getLive(value): 
	return labelPlayer.text
