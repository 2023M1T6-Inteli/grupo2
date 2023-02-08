extends Node2D


func _ready():
	pass


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Cidade.tscn")  # Vai para a cena da cidade
