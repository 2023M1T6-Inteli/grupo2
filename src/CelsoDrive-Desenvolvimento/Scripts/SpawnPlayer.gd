extends Node2D


func _ready():
	# Instancia personagem de acordo com o carregado no script Global
	var playerPosition = Global.playerPosition
	var player = load(Global.playerDir).instance()
	player.position = playerPosition
	add_child(player)
