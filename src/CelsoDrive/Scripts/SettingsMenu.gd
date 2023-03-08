extends Node2D

var language # Variável que será sempre atualizada de acordo com o script global


func _process(delta):
	language = Global.selectedLanguage


# Retorna para a tela do menu inicial
func _on_BackButton_pressed():
	return get_tree().change_scene("res://Scenes/MainMenu.tscn")


# Altera volume da música de acordo com a mudança no valor do VolumeSlider
func _on_MusicVolumeSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)


func _on_AudioLabel_pressed():
	$SettingsAudioContainer.visible = true
	$SettingsLanguageContainer.visible = false
	$SettingsControlsContainer.visible = false
	$SettingsVideoContainer.visible = false


func _on_LanguageLabel_pressed():
	$SettingsAudioContainer.visible = false
	$SettingsLanguageContainer.visible = true
	$SettingsControlsContainer.visible = false
	$SettingsVideoContainer.visible = false
#
#
func _on_ControlsLabel_pressed():
	$SettingsAudioContainer.visible = false
	$SettingsLanguageContainer.visible = false
	$SettingsControlsContainer.visible = true
	$SettingsVideoContainer.visible = false


func _on_VideoLabel_pressed():
	$SettingsAudioContainer.visible = false
	$SettingsLanguageContainer.visible = false
	$SettingsControlsContainer.visible = false
	$SettingsVideoContainer.visible = true


func _on_FullScreenLabel_pressed():
	OS.window_fullscreen = not OS.window_fullscreen


func _on_CheckBox_pressed():
	OS.window_fullscreen = not OS.window_fullscreen


func _on_Forro_pressed():
	Global.selectedMusic = 0
	MusicController.play_music()


func _on_CountryMusic_pressed():
	Global.selectedMusic = 1
	MusicController.play_music()


func _on_RockAndRoll_pressed():
	Global.selectedMusic = 2
	MusicController.play_music()


func _on_Samba_pressed():
	Global.selectedMusic = 3
	MusicController.play_music()


func _on_LanguageEnLabel_pressed():
	Global.selectedLanguage = 1
	if language != 1:
		$SettingsLabel.text = "Settings"
		$MainContainer/AudioLabel.text = "Audio"
		$MainContainer/LanguageLabel.text = "Language"
		$MainContainer/ControlsLabel.text = "Controls"
		$MainContainer/VideoLabel.text = "Video"
		$SettingsAudioContainer/MusicVolumeLabel.text = "Music Volume"
		$SettingsAudioContainer/MusicalGenreLabel.text = "Favorite Musical Genre"
		$SettingsVideoContainer/HBoxContainer/FullScreenButton.text = "Full Screen"
