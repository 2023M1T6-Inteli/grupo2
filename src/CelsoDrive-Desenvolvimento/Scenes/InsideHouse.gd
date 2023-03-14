extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if(Input.is_action_pressed("interagir") && $FreezerArea/FreezerE.visible == true):
		$Freezer.visible = true;

func _on_FreezerArea_body_entered(body):
	$FreezerArea/FreezerE.visible = true


func _on_FreezerArea_body_exited(body):
	$FreezerArea/FreezerE.visible = false
	$Freezer.visible = false
