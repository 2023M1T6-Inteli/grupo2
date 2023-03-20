extends CanvasLayer


# Caso o usuário escolha o suco -> muda alcohol para false e esconde a cena
func _on_ButtonJuice_pressed():
	Global.alcohol = false
	visible = false

# Caso o usuário escolha a bebida alcoolica -> muda alcohol para true e esconde a cena
func _on_Button51_pressed():
	Global.alcohol = true
	visible = false

# Botão para fechar interação
func _on_CloseScene_pressed():
	visible = false
