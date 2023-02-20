extends Node2D


func _ready():
	pass


# Direciona para a visão exterior da casa
func _on_JogarButton_pressed():
	get_tree().change_scene("res://Scenes/CasaExterior.tscn")


# Direciona para o menu de opções
func _on_ConfigButton_pressed():
	get_tree().change_scene("res://Scenes/MenuOpcoes.tscn")
	
