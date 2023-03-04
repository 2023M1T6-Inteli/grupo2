extends Node2D


# Retorna para a tela do menu inicial
func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")


# Altera volume da música de acordo com a mudança no valor do VolumeSlider
func _on_MusicVolumeSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
