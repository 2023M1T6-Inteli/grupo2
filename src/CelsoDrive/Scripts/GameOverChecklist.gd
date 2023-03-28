extends CanvasLayer


func _ready():
	if Global.selectedLanguage == 1:
		$Button.text = "RESTART"
	else:
		$Button.text = "RECOMEÇAR"


# Recarrega o minigame
func _on_Button_pressed():
	return get_tree().change_scene("res://Scenes/MinigameChecklist.tscn")
