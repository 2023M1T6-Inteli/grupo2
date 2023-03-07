extends Node2D

var velocity = Vector2.ZERO  # Vetor responsável pela movimentação do caminhão
var inputDirection = Vector2(0, 0)  # Vetor atualizado de acordo com as teclas pressionadas
var backgroundSpeed = Global.gameBaseSpeed * 0.9 # Velocidade com que o background se move (90% da velocidade dos carros)
const enemy = preload("res://Scenes/EnemyCar.tscn")
var spawnPositions
var finishedDialog = false
onready var dialog


func _ready():
	dialog = Dialogic.start("minigame-tinhoso-tutorial")
	dialog.connect("dialogic_signal", self, "dialog_listener")
	add_child(dialog)
	spawnPositions = $spawn_carros/spawn_positions.get_children()


func dialog_listener(string):
	match string:
		# Adiciona na lista de escolhas a decisão ruim de aceitar a corrida do tinhoso
		"finishedDialog":
			finishedDialog = true;
		"finishedMoral":
			$GameOver.visible = true


func _process(delta):
	if Global.pausedGame == false:
		if($Road.position.y + backgroundSpeed > 360): 
			$Road.position.y = -8
		else:
			$Road.position.y += backgroundSpeed


func cars_timer():
	yield(get_tree().create_timer(2.0), "timeout")
	queue_free()


func _on_Timer_timeout():
	if finishedDialog and Global.pausedGame == false:
		car_spawn()
		car_spawn()
		Global.points += 1
	if Global.pausedGame == true:
		dialog = Dialogic.start("moral-minigame")
		dialog.connect("dialogic_signal", self, "dialog_listener")
		add_child(dialog)
		$spawn_carros/Timer.stop()
		Global.energy -= 1


func car_spawn():
	var randomIndex = randi() % spawnPositions.size()
	var enemyCar = enemy.instance()	
	enemyCar.global_position = spawnPositions[randomIndex].global_position
	add_child(enemyCar)
