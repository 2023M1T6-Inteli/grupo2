extends Node2D


func _ready():
	pass


func _on_CelsoHouse_body_entered(body):
	get_tree().change_scene("res://Scenes/InsideHouse.tscn")
