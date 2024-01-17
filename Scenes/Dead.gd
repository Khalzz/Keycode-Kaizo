extends Area2D

func _ready():
	pass

func _process(delta):
	for element in get_overlapping_bodies():
		get_tree().reload_current_scene()
