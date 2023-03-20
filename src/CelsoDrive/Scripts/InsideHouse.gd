extends Node2D


func _ready():
	# Define posição do personagem
	Global.playerPosition = Vector2(304, 336)
	
	# Instancia cena para mostrar o personagem
	var spawnPlayer = load("res://Scenes/SpawnPlayer.tscn").instance()
	add_child(spawnPlayer)


func _on_Exit_body_entered(body):
	return get_tree().change_scene("res://scenes/OutsideHouse.tscn")
