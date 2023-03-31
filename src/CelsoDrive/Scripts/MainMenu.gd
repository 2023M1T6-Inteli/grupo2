extends Node2D

const TRUCK = preload("res://Scenes/MainTruck.tscn") # Carrega cena dos caminhões
var language = Global.selectedLanguage # Carrega informações da variável global de idioma


func _ready():
	PauseScene.isMainMenu = true
	# Traduz elementos da tela atual para inglês
	if language == 1:
		$TitleLabel.text = "Celso Drive"
		$PlayButton.text = "Play"
		$ConfigButton.text = "Settings"
		$CreditsButton.text = "Credits"
	# Traduz elementos da tela atual para espanhol
	if language == 2:
		$TitleLabel.text = "Celso Camiones"
		$PlayButton.text = "Jugar"
		$ConfigButton.text = "Ajustes"
		$CreditsButton.text = "Créditos"	
	randomize()


# Direciona para a visão exterior da casa
func _on_PlayButton_pressed():
	PauseScene.isMainMenu = false
	return get_tree().change_scene("res://Scenes/CelsoSelect.tscn")


# Direciona para o menu de opções
func _on_ConfigButton_pressed():
	return get_tree().change_scene("res://Scenes/SettingsMenu.tscn")


# Randomiza local de aparecimento e velocidade dos caminhões do background da tela
func _on_TruckTimer_timeout():
	$PathLeft/PathFollow2D.offset = randi()
	$PathRight/PathFollow2D.offset = randi()
	var newTruckLeft = TRUCK.instance()
	var newTruckRight = TRUCK.instance()
	add_child(newTruckLeft)
	add_child(newTruckRight)
	newTruckLeft.position = $PathLeft/PathFollow2D.position
	newTruckRight.position = $PathRight/PathFollow2D.position
	newTruckLeft.linear_velocity = Vector2(0, rand_range(newTruckLeft.minSpeed, newTruckLeft.maxSpeed))
	newTruckRight.linear_velocity = Vector2(0, rand_range(newTruckRight.minSpeed, newTruckRight.maxSpeed))


func _on_CreditsButton_pressed():
	return get_tree().change_scene("res://Scenes/Credits.tscn")
