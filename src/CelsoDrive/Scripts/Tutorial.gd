extends Node2D

onready var dialog # Variável utilizada para carregar os diálogos
onready var language = Global.selectedLanguage # Carrega informações da variável global de idioma
var finishedDialog = false # Variável que contém valor do sinal ao finalizar dialogo
onready var playerDir = Global.playerDir # Verifica o caminho do personagem selecionado


func _ready():
	# Define o Celso que aparecerá nos diálogos de acordo com a escolha na seleção de personagem
	if playerDir == "res://Scenes/Player05.tscn" or playerDir == "res://Scenes/Player13.tscn":
		Dialogic.set_variable("selectedCharacter", "Celsa Branca")
	elif playerDir == "res://Scenes/Player06.tscn" or playerDir == "res://Scenes/Player14.tscn":
		Dialogic.set_variable("selectedCharacter", "Celsa Negra")
	elif playerDir == "res://Scenes/Player03.tscn":
		Dialogic.set_variable("selectedCharacter", "Celso Negro")
	elif playerDir == "res://Scenes/Player04.tscn":
		Dialogic.set_variable("selectedCharacter", "Celso Sério Negro")
	elif playerDir == "res://Scenes/Player07.tscn":
		Dialogic.set_variable("selectedCharacter", "Celso Unipar")
	elif playerDir == "res://Scenes/Player08.tscn":
		Dialogic.set_variable("selectedCharacter", "Celso Cientista")
	elif playerDir == "res://Scenes/Player09.tscn":
		Dialogic.set_variable("selectedCharacter", "Celso Elegante")
	elif playerDir == "res://Scenes/Player10.tscn":
		Dialogic.set_variable("selectedCharacter", "Celso Amarelão")
	elif playerDir == "res://Scenes/Player15.tscn":
		Dialogic.set_variable("selectedCharacter", "Celso Encanador")
	elif playerDir == "res://Scenes/Player01.tscn":
		Dialogic.set_variable("selectedCharacter", "Celso Regatinha")
	else:
		Dialogic.set_variable("selectedCharacter", "Defalut")
	
	# Define posição do personagem
	Global.playerPosition = Vector2(79, 304)
	# Instancia cena para mostrar o personagem
	var spawnPlayer = load("res://Scenes/SpawnPlayer.tscn").instance()
	add_child(spawnPlayer)
	
	# Traduz elementos da tela atual para inglês
	if language == 1:
		$InteractLabel.text = "Interact"
		# Inicia diálogo introdutório (em inglês) e adiciona-o como nó filho
		dialog = Dialogic.start("intro-en")
		dialog.connect("dialogic_signal", self, "dialog_listener")
		add_child(dialog)
	# Traduz elementos da tela atual para espanhol
	elif language == 2:
		$InteractLabel.text = "Interact"
		# Inicia diálogo introdutório (em espanhol) e adiciona-o como nó filho
		dialog = Dialogic.start("intro-es")
		dialog.connect("dialogic_signal", self, "dialog_listener")
		add_child(dialog)
	else:
		# Inicia diálogo introdutório (em port.) e adiciona-o como nó filho
		dialog = Dialogic.start("intro")
		dialog.connect("dialogic_signal", self, "dialog_listener")
		add_child(dialog)


func _process(_delta):
	# Verifica, a cada frame, as teclas pressionadas
	key_pressed()
	
	# Chama a função que movimenta os npcs
	move_npc()
	
	# Inicia interação com a casa
	if $Houses/Area2D/EInteract.visible == true && Input.is_action_just_pressed("interagir"):
		if Global.selectedLanguage == 1:
			dialog = Dialogic.start("tutorial-house-en")
			dialog.connect("dialogic_signal", self, "dialog_listener")
			add_child(dialog)
		elif Global.selectedLanguage == 2:
			dialog = Dialogic.start("tutorial-house-es")
			dialog.connect("dialogic_signal", self, "dialog_listener")
			add_child(dialog)
		else:
			dialog = Dialogic.start("tutorial-house")
			dialog.connect("dialogic_signal", self, "dialog_listener")
			add_child(dialog)
		
		
	if $TinhosoSceneArea/EInteract.visible == true and Input.is_action_just_pressed("interagir"):
		# Seleciona o diálogo com o tinhoso de acordo com o idioma do jogo
		if language == 1:
			dialog = Dialogic.start("tinhoso-1-en")
			dialog.connect("dialogic_signal", self, "dialog_listener")
			add_child(dialog)
		elif language == 2:
			dialog = Dialogic.start("tinhoso-1-es")
			dialog.connect("dialogic_signal", self, "dialog_listener")
			add_child(dialog)	
		else:
			dialog = Dialogic.start("tinhoso-1")
			dialog.connect("dialogic_signal", self, "dialog_listener")
			add_child(dialog)


# Recebe e trata os sinais do nó de diálogo
func dialog_listener(string):
	match string:
		# Adiciona na lista de escolhas a decisão ruim de aceitar a corrida do tinhoso
		"acepted":
			Global.choices.append(1);
	
		# Adiciona na lista de escolhas a decisão boa de recusar a corrida do tinhoso
		"refused":
			Global.choices.append(0);
		
		# Quando o sinal for emitido, a variável finishedDialog recebe true
		"finishedDialog":
			finishedDialog = true
			$HUD/Coin.visible = true
			$HUD/CoinLabel.visible = true
			$HUD/ColorRectEnergy.visible = false
		
		# Exibe tela com mensagem no celular após o diálogo de interação com a casa
		"interacted":
			if Global.selectedLanguage == 1:
				$Message/MessageBox/Label.text = "Take care on this journey."
				$Message/MessageBox2/Label.text = "Drunk driving?only if it's on love"
				$Message.visible = true
			elif Global.selectedLanguage == 2:
				$Message/MessageBox/Label.text = "Cuídate en este viaje"
				$Message/MessageBox2/Label.text = "¿Conducir ebrio?solo si es en amor"
				$Message.visible = true	
			else:
				$Message.visible = true;
		
		# Diminui a cor da tela para mostrar a moeda
		"coin-intro":
			$HUD/ColorRectCoin.visible = true
		
		# Diminui a cor da tela para mostrar a barra de energia
		"energy-intro":
			$HUD/ColorRectCoin.visible = false
			$HUD/ColorRectEnergy.visible = true
			$HUD/Coin.visible = false
			$HUD/CoinLabel.visible = false

# Altera animação das setas de acordo com a tecla pressionada
func key_pressed():
	if Input.is_action_pressed("ui_up"):
		$UpSprite.play("pressed")
	else:
		$UpSprite.play("default")
	if Input.is_action_pressed("ui_down"):
		$DownSprite	.play("pressed")
	else:
		$DownSprite.play("default")
	if Input.is_action_pressed("ui_left"):
		$LeftSprite.play("pressed")
	else:
		$LeftSprite.play("default")
	if Input.is_action_pressed("ui_right"):
		$RigthSprite.play("pressed")
	else:
		$RigthSprite.play("default")
	if Input.is_action_pressed("interagir"):
		$InteractKeySprite.play("pressed")
	else:
		$InteractKeySprite.play("default")


# Move NPCs horizontalmente
func move_npc():
	# Condições para ativar animação -> impede que continue se movendo após sair da tela
	if finishedDialog and $TutorialNpc.position.x < 700:
		$TutorialNpc.position.x += 2
		$TutorialNpc/AnimatedSprite.play("RunRight")
		$TutorialNpcCat.position.x += 2
		$TutorialNpcCat/AnimatedSprite.play("RunRight")


# Mostra a tecla E quando chega próximo da casa
func _on_Area2D_body_entered(_body):
	$Houses/Area2D/EInteract.visible = true


# Esconde a tecla E quando sai para longe da casa
func _on_Area2D_body_exited(_body):
	$Houses/Area2D/EInteract.visible = false


# Fecha tela de mensagem
func _on_CloseMessageButton_pressed():
	$Message.visible = false;


# Mostra a tecla E quando chega próximo do tinhoso
func _on_TinhosoSceneArea_body_entered(_body):
	$TinhosoSceneArea/EInteract.visible = true


# Esconde a tecla E quando sai para longe do tinhoso
func _on_TinhosoSceneArea_body_exited(_body):
	$TinhosoSceneArea/EInteract.visible = false
