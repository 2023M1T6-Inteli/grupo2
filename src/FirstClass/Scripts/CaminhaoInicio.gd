extends RigidBody2D

var minSpeed = 150
var maxSpeed = 300


# Called when the node enters the scene tree for the first time.
func _ready():
	var tipoCaminhoes = $Sprite.frames.get_animation_names()
	$Sprite.animation = tipoCaminhoes[randi() % tipoCaminhoes.size()]	


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
