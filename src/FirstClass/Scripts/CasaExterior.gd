extends Node2D


func _ready():
	pass


func _on_CasaCelso_body_entered(body):
	get_tree().change_scene("res://Scenes/CasaInterior.tscn")
