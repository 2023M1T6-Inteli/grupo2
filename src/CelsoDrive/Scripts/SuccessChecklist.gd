extends CanvasLayer


var stepsLoading = ["Afivelando os cintos...",
					"Ajustando o rádio...",
					"Escolhendo música...",
					"Vamos lá!"]
var cont = 1


func _on_Timer_timeout():
	if cont == 1:
		$StartTruck.play()
	if cont < 5:
		$LoadingLabel.text = stepsLoading[cont-1]
		cont += 1
	else:
		$StartTruck.stop()
		return get_tree().change_scene("res://Scenes/RunGame.tscn")
