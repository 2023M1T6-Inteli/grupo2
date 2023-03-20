extends CanvasLayer


# Caso o jogador coloque o telefone no mudo -> mutedPhone = true e esconde a cena
func _on_Yes_pressed():
	Global.mutedPhone = true
	visible = false

# Caso o jogador não coloque o telefone no mudo -> mutedPhone = false e esconde a cena
func _on_No_pressed():
	Global.mutedPhone = true
	visible = false

# Botão para fechar a interação
func _on_CloseScene_pressed():
	visible = false
