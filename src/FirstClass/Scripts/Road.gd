extends Node2D

var velocity = Vector2.ZERO  # Vetor responsável pela movimentação do caminhão
var inputDirection = Vector2(0, 0)  # Vetor atualizado de acordo com as teclas pressionadas
var backgroundSpeed = Global.gameBaseSpeed * 0.9 # Velocidade com que o background se move (90% da velocidade dos carros)
const enemy = preload("res://Scenes/MinigameCar.tscn")
var spawnPositions

func _ready():
	spawnPositions = $spawn_carros/posicoes_spawn.get_children()

func _process(delta):
	if($Road.position.y + backgroundSpeed > 360): 
		$Road.position.y = -8
	else:
		$Road.position.y += backgroundSpeed
		
func cars_timer():
	yield(get_tree().create_timer(1.0), "timeout")
	queue_free()

func _on_Timer_timeout():
	car_spawn()

func car_spawn():
	var randomIndex = randi() % spawnPositions.size()
	var enemyCar = enemy.instance()	
	enemyCar.global_position = spawnPositions[randomIndex].global_position
	add_child(enemyCar)
