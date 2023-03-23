extends CanvasLayer

onready var time = 0 # Variável para controle de tempo


func _process(_delta):
	# Espera 12 segundos para mudar de cena
	if time >= 12:
		$Timer.stop()
		return get_tree().change_scene("res://Scenes/MinigameChecklist.tscn")


func _on_Timer_timeout():
	# Efeito de piscar a label de carregamento
	$Loading.visible = not $Loading.visible
	time += 1
