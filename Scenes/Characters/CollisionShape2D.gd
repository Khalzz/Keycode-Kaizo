extends CollisionShape2D

@onready var player = $".."

var crouching_collider = {
	"collider": preload("res://Scenes/Characters/BaseCharacter/Colliders/Body/crouching.tres"),
	"position": Vector2(0.0, 16.0)
}

var standing_collider = {
	"collider": preload("res://Scenes/Characters/BaseCharacter/Colliders/Body/standing.tres"),
	"position": Vector2(0.0, 0.0)
}

func _process(delta):
	match player.action:
		player.Actions.CROUCHING:
			shape = crouching_collider.collider
			position = crouching_collider.position
		_:
			shape = standing_collider.collider
			position = standing_collider.position
