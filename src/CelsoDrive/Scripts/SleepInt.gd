extends CanvasLayer


# Caso o jogador escolha dormir -> sleep = true e esconde a cena
func _on_Yes_pressed():
	Global.slept = true
	visible = false

# Caso o jogador escolha não dormir -> sleep = false e esconde a cena
func _on_No_pressed():
	Global.slept = false
	visible = false

# Botão para fechar interação
func _on_CloseButton_pressed():
	visible = false
