extends CanvasLayer


func _process(_delta):
	if Global.mutedPhone:
		$OptionButton.text = "Desativar Silencioso"
	else:
		$OptionButton.text = "Ativar Silencioso"


# Botão para fechar a interação
func _on_CloseScene_pressed():
	visible = false


# Altera valor da variável mutedPhone
func _on_OptionButton_pressed():
	Global.mutedPhone = !Global.mutedPhone
