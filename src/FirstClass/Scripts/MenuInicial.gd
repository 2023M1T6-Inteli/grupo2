extends Node2D

const truck = preload("res://Scenes/CaminhaoInicio.tscn")


func _ready():
	randomize()


# Direciona para a visão exterior da casa
func _on_PlayButton_pressed():
	get_tree().change_scene("res://Scenes/Tutorial.tscn")


# Direciona para o menu de opções
func _on_ConfigButton_pressed():
	get_tree().change_scene("res://Scenes/SettingsMenu.tscn")


func _on_TruckTimer_timeout():
	$PathLeft/PathFollow2D.offset = randi()
	$PathRight/PathFollow2D.offset = randi()
	var newTruckLeft = truck.instance()
	var newTruckRight = truck.instance()
	add_child(newTruckLeft)
	add_child(newTruckRight)
	newTruckLeft.position = $PathLeft/PathFollow2D.position
	newTruckRight.position = $PathRight/PathFollow2D.position
	newTruckLeft.linear_velocity = Vector2(0, rand_range(newTruckLeft.minSpeed, newTruckLeft.maxSpeed))
	newTruckRight.linear_velocity = Vector2(0, rand_range(newTruckRight.minSpeed, newTruckRight.maxSpeed))
	
