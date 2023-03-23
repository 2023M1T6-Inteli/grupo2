extends CanvasLayer


var stepsLoading = ["Afivelando os cintos...",
					"Ajustando o rádio...",
					"Escolhendo música...",
					"Vamos lá!"]
var cont = 0


func _on_Timer_timeout():
	if cont < 4:
		$LoadingLabel.text = stepsLoading[cont]
		cont += 1
	else:
		return get_tree().change_scene("res://Scenes/RunGame.tscn")
