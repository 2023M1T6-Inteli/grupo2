extends CanvasLayer


# Recarrega o minigame
func _on_Button_pressed():
	return get_tree().change_scene("res://Scenes/MinigameChecklist.tscn")
