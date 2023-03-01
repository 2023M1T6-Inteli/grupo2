extends KinematicBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _process(delta):
	move_and_slide(Vector2(0, 100))

