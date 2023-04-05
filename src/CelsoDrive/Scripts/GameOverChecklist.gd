extends CanvasLayer


func _ready():
	# Altera label de acordo com o idioma
	if Global.selectedLanguage == 1:
		$Button.text = "RESTART"
	elif Global.selectedLanguage == 2:
		$Button.text = "RECOMENZAR"	
	else:
		$Button.text = "RECOMEÇAR"


# Recarrega o minigame
func _on_Button_pressed():
	return get_tree().change_scene("res://Scenes/MinigameChecklist.tscn")
