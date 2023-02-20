extends Node2D


# Retorna para a tela do menu inicial
func _on_VoltarButton_pressed():
	get_tree().change_scene("res://Scenes/MenuInicial.tscn")
