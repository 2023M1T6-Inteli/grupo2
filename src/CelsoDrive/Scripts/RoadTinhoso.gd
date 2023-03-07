extends Node2D

var velocity = Vector2.ZERO  # Vetor responsável pela movimentação do caminhão
var inputDirection = Vector2(0, 0)  # Vetor atualizado de acordo com as teclas pressionadas
var backgroundSpeed = Global.gameBaseSpeed * 0.9 # Velocidade com que o background se move (90% da velocidade dos carros)
const enemy = preload("res://Scenes/EnemyCar.tscn")
var spawnPositions
var finishedDialog = false


func _ready():
	var dialog = Dialogic.start("minigame-tinhoso-tutorial")
	dialog.connect("dialogic_signal", self, "dialog_listener")
	add_child(dialog)
	spawnPositions = $spawn_carros/spawn_positions.get_children()


func dialog_listener(string):
	match string:
		# Adiciona na lista de escolhas a decisão ruim de aceitar a corrida do tinhoso
		"finishedDialog":
			finishedDialog = true


func _process(delta):
	if Global.pausedGame == false:
		if($Road.position.y + backgroundSpeed > 360): 
			$Road.position.y = -8
		else:
			$Road.position.y += backgroundSpeed


func cars_timer():
	yield(get_tree().create_timer(1.0), "timeout")
	queue_free()


func _on_Timer_timeout():
	if finishedDialog and Global.pausedGame == false:
		car_spawn()


func car_spawn():
	var randomIndex = randi() % spawnPositions.size()
	var enemyCar = enemy.instance()	
	enemyCar.global_position = spawnPositions[randomIndex].global_position
	add_child(enemyCar)
