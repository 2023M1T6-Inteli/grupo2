extends Node2D


func _ready():
	pass


# Direciona para a visão exterior da casa
func _on_JogarButton_pressed():
	get_tree().change_scene("res://Scenes/CasaExterior.tscn")
