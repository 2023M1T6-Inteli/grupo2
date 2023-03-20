extends Node2D


func _ready():
	# Define posição do personagem
	Global.playerPosition = Vector2(64, 208)
	
	# Instancia cena para mostrar o personagem
	var spawnPlayer = load("res://Scenes/SpawnPlayer.tscn").instance()
	add_child(spawnPlayer)

# Move o personagem para dentro de casa
func _on_CelsoHouse_body_entered(_body):
	return get_tree().change_scene("res://Scenes/InsideHouse.tscn")
