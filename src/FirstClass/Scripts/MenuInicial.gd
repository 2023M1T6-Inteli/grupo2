extends Node2D


func _ready():
	pass


func _on_Button_pressed():
	# Vai para a cena da visão exterior da casa
	get_tree().change_scene("res://Scenes/CasaExterior.tscn")
