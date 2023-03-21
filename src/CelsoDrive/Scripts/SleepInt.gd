extends CanvasLayer


# Caso o jogador escolha dormir -> sleep = true e esconde a cena
func _on_SleepNow_pressed():
	Global.slept = true
	visible = false
	Global.interactedBed = true
	Global.energy = 4
	

# Caso o jogador escolha não dormir -> sleep = false e esconde a cena
func _on_SleepAfter_pressed():
	Global.slept = false
	visible = false
	Global.interactedBed = false

# Botão para fechar interação
func _on_CloseButton_pressed():
	visible = false
