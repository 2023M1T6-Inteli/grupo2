extends Node2D

onready var playerPosition = $Position2D


func _ready():
	# Instancia personagem de acordo com o carregado no script Global
	var player = load(Global.playerDir).instance()
	player.global_position = playerPosition.global_position
	add_child(player)
