extends RigidBody2D

var minSpeed = 150
var maxSpeed = 300


# Called when the node enters the scene tree for the first time.
func _ready():
	var truckTypes = $TruckSprite.frames.get_animation_names()
	$TruckSprite.animation = truckTypes[randi() % truckTypes.size()]	


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
