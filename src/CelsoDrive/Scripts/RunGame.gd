extends Node2D

var velocity = Vector2.ZERO  # Vetor responsável pela movimentação do caminhão
var inputDirection = Vector2(0, 0)  # Vetor atualizado de acordo com as teclas pressionadas
var backgroundSpeed = Global.gameBaseSpeed * 0.9 # Velocidade com que o background se move (90% da velocidade dos carros)
const ENEMY = preload("res://Scenes/EnemyCar.tscn") # Carrega cena dos carros inimigos
const CONE = preload("res://Scenes/ConeObstacle.tscn") # Carrega cena dos cones
const TIRE = preload("res://Scenes/TireObstacle.tscn") # Carrega cena dos pneus
const TRUNK = preload("res://Scenes/TrunkObstacle.tscn") # Carrega cena dos troncos
var spawnPositions # Variável que carregará as posições de spawn
var spawnPositionsObstacles # Variável que carregará as posições de spawn dos obstáculos
var finishedDialog = false # Indica o status do diálogo. true = finalizado e false = em andamento
onready var dialog # Variável utilizada para carregar os diálogos
onready var language = Global.selectedLanguage # Carrega informações da variável global de idioma
var time = 5 # Variável para o cronômetro
var phoneDebuffTime = 0 # Variável de controle para o tempo de exibição do debuff


func _ready():
	Global.pausedGame = false
	if Global.alcohol:
		# Diálogo explicativo do debuff de álcool
		dialog = Dialogic.start("debuff-alcool")
		dialog.connect("dialogic_signal", self, "dialog_listener")
		add_child(dialog)
	else:
		$ReadyTimer.start()
	
	if Global.mutedPhone == false:
		$PhoneDebuff/PhoneTimer.start()

	$truck.maxSpeed = 300
	$truck.acceleration = 280
	$truck.friction = 150
	# Posições de spawn dos carros
	spawnPositions = $SpawnCarros/SpawnPositions.get_children()
	spawnPositionsObstacles = $SpawnObstacles/SpawnPositions.get_children()
	randomize()


func dialog_listener(string):
	match string:
		# Quando o sinal for emitido, a variável finishedDialog recebe true
		"finishedDialog":
			finishedDialog = true
			$ReadyTimer.start()


# Cronômetro do jogo. Após finalizar, inicia o spawn dos carros
func _on_ReadyTimer_timeout():
	if time >= 0:
		$Label.text = String(time)
		$Label.visible = true
		$Label2.visible = not $Label2.visible
		time -= 1
	else:
		$ReadyTimer.stop()
		$Label.visible = false
		$Label2.visible = false
		$SpawnTimer.start()


func _process(_delta):
	# Move background
	if Global.pausedGame == false:
		if($Road.position.y + backgroundSpeed > 360): 
			$Road.position.y = -8
		else:
			$Road.position.y += backgroundSpeed
	
	# Muda animação das setas de acordo com as teclas pressionadas
	if Input.is_action_pressed("ui_left"):
		$LeftSprite.play("pressed")
	else:
		$LeftSprite.play("default")
	if Input.is_action_pressed("ui_right"):
		$RigthSprite.play("pressed")
	else:
		$RigthSprite.play("default")


func cars_timer():
	# Cria timer para spawn dos carros
	yield(get_tree().create_timer(1.0), "timeout")
	queue_free()


func _on_SpawnTimer_timeout():
	# Carrega os carros e os obstáculos se o diálogo tiver acabado e o jogo não estiver pausado
	if Global.pausedGame == false:
		car_spawn()
		obstacle_spawn()
		car_spawn()
		# Incrementa pontuação
		Global.points += 1
	
	# Gameover
	if Global.pausedGame == true:
		$SpawnTimer.stop()
		Global.energy -= 1 # Diminui energia
		$GameOver.visible = true


# Randomiza aparecimento dos carros
func car_spawn():
	var randomIndex = randi() % spawnPositions.size()
	var enemyCar = ENEMY.instance()	
	enemyCar.global_position = spawnPositions[randomIndex].global_position
	add_child(enemyCar)
	enemyCar.connect("colide", self, "on_colide")


# Randomiza aparecimento dos obstáculos
func obstacle_spawn():
	# Carrega tipo de obstáculo aleatoriamente
	var obstacles = [TRUNK, CONE, TIRE]
	var randomObstacle = randi() % 3
	
	var randomIndex = randi() % spawnPositionsObstacles.size()
	var newObstacle = obstacles[randomObstacle].instance()	
	newObstacle.global_position = spawnPositionsObstacles[randomIndex].global_position
	add_child(newObstacle)
	newObstacle.connect("colide", self, "on_colide_obstacle")


# Se o caminhão bater em algum carro, significa que estava na faixa errada
func on_colide():
	$GameOver/ObsLabel.text = "Você colidiu pois \nestava na faixa \nerrada"
	if $PhoneDebuff.visible:
		$GameOver/ObsLabel.text = "Você colidiu pois \nse distraiu com\no celular"


# Função executada caso o caminhão bata em algum obstáculo
func on_colide_obstacle():
	$GameOver/ObsLabel.text = "Você colidiu com um \nobjeto na sua pista.\nPara casos assim,\ntente executar um\ndesvio emergencial\nmais rápido"
	if $PhoneDebuff.visible:
		$GameOver/ObsLabel.text = "Você colidiu pois \nse distraiu com\no celular"


# Exibe debuff da notificação do celular
func _on_PhoneTimer_timeout():
	if Global.pausedGame == false:
		$PhoneDebuff/Controller.start()
		$PhoneDebuff.visible = true
		$PhoneDebuff/AnimatedSprite.play("default")
		$PhoneDebuff/Vibrate.play()


# Após 5 segundos, esconde debuff da notificação do celular
func _on_Controller_timeout():
	$PhoneDebuff.visible = false
	$PhoneDebuff/Vibrate.stop()
