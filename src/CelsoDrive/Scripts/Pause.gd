extends CanvasLayer


var isMainMenu = false


func _ready():
	if isMainMenu == false:
		show_pause(false) # Não exibe a tela logo no início


func _input(event):
	if isMainMenu == false:
		# Pausa o jogo quando a tecla esc é pressionada
		if event.is_action_pressed("ui_cancel"):
			show_pause(!get_tree().paused)
			get_tree().paused = not get_tree().paused


# Mostra tela de pause
func show_pause(isVisible):
	for node in get_children():
		node.visible = isVisible


# Retorna a execução do jogo
func _on_ContinueButton_pressed():
	show_pause(false)
	get_tree().paused = false


# Direciona para a casa
func _on_Home_pressed():
	show_pause(false)
	get_tree().paused = false
	$VBoxContainer/BreakButton.hide()
	return get_tree().change_scene("res://Scenes/OutsideHouse.tscn")


# Direciona para o menu
func _on_MainMenuButton_pressed():
	show_pause(false)
	get_tree().paused = false
	$VBoxContainer/BreakButton.hide()
	return get_tree().change_scene("res://Scenes/MainMenu.tscn")


# Direciona para a cutscene de pausa. Somente aparece no RunGame
func _on_BreakButton_pressed():
	show_pause(false)
	get_tree().paused = false
	$VBoxContainer/BreakButton.hide()
