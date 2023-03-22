extends CanvasLayer

onready var time = 0


func _process(delta):
	if time >= 15:
		$Timer.stop()
		return get_tree().change_scene("res://Scenes/MinigameChecklist.tscn")


func _on_Timer_timeout():
	$Loading.visible = not $Loading.visible
	time += 1
