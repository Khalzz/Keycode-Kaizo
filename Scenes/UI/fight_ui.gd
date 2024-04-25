extends CanvasLayer

var labelPlayer = null
	
func setLive(value, playerNumber):
	var labelPlayer = get_node('UI/HBoxContainer/Player{playerNumber}/PlayerLabel'.format({"playerNumber": playerNumber}))
	labelPlayer.text = str(value, "%")
	
func getLive(value): 
	return labelPlayer.text
