extends Node2D


func _ready():
	pass


# Retorna para a tela do menu inicial
func _on_BackButton_pressed():
	return get_tree().change_scene("res://Scenes/MainMenu.tscn")
