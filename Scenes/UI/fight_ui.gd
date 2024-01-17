extends CanvasLayer

var labelPlayer = null
	
func setLive(value, playerNumber):
	labelPlayer = get_node('UI/HBoxContainer/Player' + str(playerNumber))
	labelPlayer.text = str(value, "%")
	
func getLive(value):
	return labelPlayer.text
