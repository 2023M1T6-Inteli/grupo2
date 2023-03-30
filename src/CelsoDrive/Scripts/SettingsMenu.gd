extends Node2D

var language # Variável que será sempre atualizada de acordo com o script global


func _ready():
	# Traduz elementos da tela atual para inglês
	if Global.selectedLanguage == 1:
		$SettingsLabel.text = "Settings"
		$MainContainer/AudioLabel.text = "Audio"
		$MainContainer/LanguageLabel.text = "Language"
		$MainContainer/ControlsLabel.text = "Controls"
		$MainContainer/VideoLabel.text = "Video"
		$SettingsAudioContainer/MusicVolumeLabel.text = "Music Volume"
		$SettingsAudioContainer/MusicalGenreLabel.text = "Favorite Musical Genre"
		$SettingsVideoContainer/HBoxContainer/FullScreenButton.text = "Full Screen"


func _process(_delta):
	# Verifica, a cada frame, qual a linguagem selecionada
	language = Global.selectedLanguage


# Retorna para a tela do menu inicial
func _on_BackButton_pressed():
	return get_tree().change_scene("res://Scenes/MainMenu.tscn")


# Altera volume da música de acordo com a mudança no valor do VolumeSlider
func _on_MusicVolumeSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)


func _on_AudioLabel_pressed():
	# Torna visível o container de áudio e esconde os demais
	$SettingsAudioContainer.visible = true
	$SettingsLanguageContainer.visible = false
	$SettingsControlsContainer.visible = false
	$SettingsVideoContainer.visible = false


func _on_LanguageLabel_pressed():
	# Torna visível o container de idioma e esconde os demais
	$SettingsAudioContainer.visible = false
	$SettingsLanguageContainer.visible = true
	$SettingsControlsContainer.visible = false
	$SettingsVideoContainer.visible = false


func _on_ControlsLabel_pressed():
	# Torna visível o container de controles e esconde os demais
	$SettingsAudioContainer.visible = false
	$SettingsLanguageContainer.visible = false
	$SettingsControlsContainer.visible = true
	$SettingsVideoContainer.visible = false


func _on_VideoLabel_pressed():
	# Torna visível o container de vídeo e esconde os demais
	$SettingsAudioContainer.visible = false
	$SettingsLanguageContainer.visible = false
	$SettingsControlsContainer.visible = false
	$SettingsVideoContainer.visible = true


func _on_FullScreenLabel_pressed():
	# Tela cheia através do botão de texto
	OS.window_fullscreen = not OS.window_fullscreen


func _on_CheckBox_pressed():
	# Tela cheia através do checkbox
	OS.window_fullscreen = not OS.window_fullscreen


func _on_Forro_pressed():
	# Define variável de música global como 0 (forró)
	Global.selectedMusic = 0
	MusicController.play_music()


func _on_CountryMusic_pressed():
	# Define variável de música global como 1 (sertanejo)
	Global.selectedMusic = 1
	MusicController.play_music()


func _on_RockAndRoll_pressed():
	# Define variável de música global como 2 (rock)
	Global.selectedMusic = 2
	MusicController.play_music()


func _on_Samba_pressed():
	# Define variável de música global como 3 (samba)
	Global.selectedMusic = 3
	MusicController.play_music()


func _on_LanguageEnLabel_pressed():
	# Altera linguagem do jogo para inglês (1)
	Global.selectedLanguage = 1
	
	# Traduz elementos da tela atual para inglês
	if language != 1:
		$SettingsLabel.text = "Settings"
		$MainContainer/AudioLabel.text = "Audio"
		$MainContainer/LanguageLabel.text = "Language"
		$MainContainer/ControlsLabel.text = "Controls"
		$MainContainer/VideoLabel.text = "Video"
		$SettingsAudioContainer/MusicVolumeLabel.text = "Music Volume"
		$SettingsAudioContainer/MusicalGenreLabel.text = "Favorite Musical Genre"
		$SettingsVideoContainer/HBoxContainer/FullScreenButton.text = "Full Screen"


func _on_LanguagePortLabel_pressed():
	# Retorna idioma para português
	Global.selectedLanguage = 0
	return get_tree().reload_current_scene()


func _on_LanguageEsLabel_pressed():
	# Altera linguagem do jogo para espanhol (2)
	Global.selectedLanguage = 2
	
	# Traduz elementos da tela atual para espanhol
	if language != 1:
		$SettingsLabel.text = "Settings"
		$MainContainer/AudioLabel.text = "Audio"
		$MainContainer/LanguageLabel.text = "Language"
		$MainContainer/ControlsLabel.text = "Controls"
		$MainContainer/VideoLabel.text = "Video"
		$SettingsAudioContainer/MusicVolumeLabel.text = "Music Volume"
		$SettingsAudioContainer/MusicalGenreLabel.text = "Favorite Musical Genre"
		$SettingsVideoContainer/HBoxContainer/FullScreenButton.text = "Full Screen"
