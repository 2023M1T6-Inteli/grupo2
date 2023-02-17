extends Node2D

var velocity = Vector2.ZERO  # Vetor responsável pela movimentação do caminhão
var inputDirection = Vector2(0, 0)  # Vetor atualizado de acordo com as teclas pressionadas
var backgroundSpeed = 3 # Velocidade com que o background se move

func _ready():
	pass

func _process(delta):
	if($Road.position.y + backgroundSpeed > 360): 
		$Road.position.y = -8
	else:
		$Road.position.y += backgroundSpeed
