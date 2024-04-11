extends Sprite2D

@export var playerIndex = 0
var starting = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalController.players.size() == 1 and starting == false:
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
		starting = true
