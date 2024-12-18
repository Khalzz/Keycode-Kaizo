extends Button

func _ready() -> void:
	pressed.connect(self._button_pressed)

func _button_pressed():
	get_tree().change_scene_to_file("res://Scenes/UI/Controllers/Menu1v1.tscn")
