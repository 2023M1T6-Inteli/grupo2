extends CanvasLayer


# Carrega texto do botão de acordo com o valor da variável mutedPhone e do idioma do jogo
func _process(_delta):
	if Global.selectedLanguage == 1:
		if Global.mutedPhone:
			$OptionButton.text = "Disable Silent"
		else:
			$OptionButton.text = "Enable Silent"
	elif Global.selectedLanguage == 2:
		if Global.mutedPhone:
			$OptionButton.text = "Desactivar Silencio"
		else:
			$OptionButton.text = "Habilitar Silencio"
	else:
		if Global.mutedPhone:
			$OptionButton.text = "Desativar Silencioso"
		else:
			$OptionButton.text = "Ativar Silencioso"


# Botão para fechar a interação
func _on_CloseScene_pressed():
	visible = false


# Altera valor da variável mutedPhone e da animação pelo botão de texto
func _on_OptionButton_pressed():
	Global.mutedPhone = !Global.mutedPhone
	$Sprite.play(String(!Global.mutedPhone).to_lower())
	$Vibrate.play()
	Global.interactedPhone = true


# Altera valor da variável mutedPhone e da animação pelo clique no celular
func _on_OptionsButtonUI_pressed():
	Global.mutedPhone = !Global.mutedPhone
	$Sprite.play(String(!Global.mutedPhone).to_lower())
	$Vibrate.play()
	Global.interactedPhone = true
