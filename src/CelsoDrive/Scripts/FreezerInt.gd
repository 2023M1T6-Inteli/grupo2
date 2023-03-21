extends CanvasLayer


# Caso o usuário escolha o suco -> define alcohol para false e esconde a cena
func _on_ButtonJuice_pressed():
	Global.alcohol = false
	visible = false
	Global.interactedFreezer = true

# Caso o usuário escolha a bebida alcoolica -> define alcohol para true e esconde a cena
func _on_Button51_pressed():
	Global.alcohol = true
	visible = false
	Global.interactedFreezer = true

# Botão para fechar interação
func _on_CloseScene_pressed():
	visible = false
