extends CanvasLayer


# Carrega texto do botão de acordo com o valor da variável mutedPhone
func _process(_delta):
	if Global.selectedLanguage == 1:
		if Global.mutedPhone:
			$OptionButton.text = "Disable Silent"
		else:
			$OptionButton.text = "Enable Silent"
	else:
		if Global.mutedPhone:
			$OptionButton.text = "Desativar Silencioso"
		else:
			$OptionButton.text = "Ativar Silencioso"


# Botão para fechar a interação
func _on_CloseScene_pressed():
	visible = false


# Altera valor da variável mutedPhone e da animação pelos dois botões
func _on_OptionButton_pressed():
	Global.mutedPhone = !Global.mutedPhone
	$Sprite.play(String(!Global.mutedPhone).to_lower())
	$Vibrate.play()
	Global.interactedPhone = true

func _on_OptionsButtonUI_pressed():
	Global.mutedPhone = !Global.mutedPhone
	$Sprite.play(String(!Global.mutedPhone).to_lower())
	$Vibrate.play()
	Global.interactedPhone = true
