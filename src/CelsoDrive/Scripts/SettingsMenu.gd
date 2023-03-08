extends Node2D


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
