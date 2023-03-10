extends Node2D

var velocity = Vector2.ZERO  # Vetor responsável pela movimentação do caminhão
var inputDirection = Vector2(0, 0)  # Vetor atualizado de acordo com as teclas pressionadas
var backgroundSpeed = Global.gameBaseSpeed * 0.9 # Velocidade com que o background se move (90% da velocidade dos carros)
const enemy = preload("res://Scenes/EnemyCar.tscn") # Carrega cena dos carros inimigos
var spawnPositions # Variável que carregará as posições de spawn
var finishedDialog = false # Indica o status do diálogo. true = finalizado e false = em andamento
onready var dialog = Global.selectedLanguage
onready var language = Global.selectedLanguage # Carrega informações da variável global de idioma


func _ready():
	# Carrega os diálogos de acordo com o idioma do jogo
	if language == 1:
		dialog = Dialogic.start("minigame-tinhoso-tutorial-en")
		dialog.connect("dialogic_signal", self, "dialog_listener")
		add_child(dialog)
	else:
		dialog = Dialogic.start("minigame-tinhoso-tutorial")
		dialog.connect("dialogic_signal", self, "dialog_listener")
		add_child(dialog)
	
	# Posições de spawn dos carros
	spawnPositions = $SpawnCarros/SpawnPositions.get_children()


# Após o tempo de adaptação do jogador, habilita timer de spawn
func _on_ReadyTimer_timeout():
	$SpawnCarros/SpawnCarTimer.start()


func dialog_listener(string):
	match string:
		# Verifica se os diálogos acabaram
		"finishedDialog":
			finishedDialog = true;
		"finishedMoral":
			$GameOver.visible = true


func _process(delta):
	# Move background
	if Global.pausedGame == false:
		if($Road.position.y + backgroundSpeed > 360): 
			$Road.position.y = -8
		else:
			$Road.position.y += backgroundSpeed


func cars_timer():
	# Cria timer para spawn dos carros
	yield(get_tree().create_timer(1.0), "timeout")
	queue_free()


func _on_SpawnCarTimer_timeout():
	# Carrega os carros se o diálogo tiver acabado e o jogo não estiver pausado
	if finishedDialog and Global.pausedGame == false:
		car_spawn()
		car_spawn()
		car_spawn()
		# Incrementa pontuação
		Global.points += 1
	
	# Diálogos de gameover de acordo com o idioma
	if Global.pausedGame == true:
		$SpawnCarros/SpawnCarTimer.stop()
		if language == 1:
			dialog = Dialogic.start("moral-minigame-en")
			dialog.connect("dialogic_signal", self, "dialog_listener")
			add_child(dialog)
		else:
			dialog = Dialogic.start("moral-minigame")
			dialog.connect("dialogic_signal", self, "dialog_listener")
			add_child(dialog)
		Global.energy -= 1 # Diminui energia


# Randomiza aparecimento dos carros
func car_spawn():
	var randomIndex = randi() % spawnPositions.size()
	var enemyCar = enemy.instance()	
	enemyCar.global_position = spawnPositions[randomIndex].global_position
	add_child(enemyCar)
