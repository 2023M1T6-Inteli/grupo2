extends Node2D


onready var dialog # Variável utilizada para carregar os diálogos
onready var language = Global.selectedLanguage # Carrega informações da variável global de idioma
var finisheDialogue = false # Variável contém valor da emissão sinal ao finalizar dialogo

func _ready():
	# Traduz elementos da tela atual para inglês
	if language == 1:
		$InteractLabel.text = "Interact"
		# Inicia diálogo introdutório (em inglês) e adiciona-o como nó filho
		dialog = Dialogic.start("intro-en")
		dialog.connect("dialogic_signal", self, "dialog_listener")
		add_child(dialog)
	else:
		# Inicia diálogo introdutório (em port.) e adiciona-o como nó filho
		dialog = Dialogic.start("intro")
		dialog.connect("dialogic_signal", self, "dialog_listener")
		add_child(dialog)


func _process(delta):
	# Verifica, a cada frame, as teclas pressionadas
	key_pressed()
	tutorial_npc()
# Recebe e trata os sinais do nó de diálogo
func dialog_listener(string):
	match string:
		# Adiciona na lista de escolhas a decisão ruim de aceitar a corrida do tinhoso
		"acepted":
			Global.choices.append(1);
	
		# Adiciona na lista de escolhas a decisão boa de recusar a corrida do tinhoso
		"refused":
			Global.choices.append(0);
		# Quando diálogo é finalizado 
		"finishedDialogue":
			finisheDialogue = true


# Aciona diálogo com tinhoso quando o personagem entra na Area2D
func _on_NextSceneArea_body_entered(body):
	# Seleciona o diálogo de acordo com o idioma do jogo
	if language == 1:
		dialog = Dialogic.start("tinhoso-1-en")
		dialog.connect("dialogic_signal", self, "dialog_listener")
		add_child(dialog)
	else:
		dialog = Dialogic.start("tinhoso-1")
		dialog.connect("dialogic_signal", self, "dialog_listener")
		add_child(dialog)


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
		
func tutorial_npc():
	# Condições para ativar animação
	if finisheDialogue == true and $TutorialNpc.position.x < 700:
		# Captura signal emitidido no fim do dialogo 
		# impede que se mova eternamente, de acordo com position
		$TutorialNpc.position.x += 1 
		$TutorialNpc/AnimatedSprite.play("RunRight")
		$TutorialNpcCat.position.x += 1
		$TutorialNpcCat/AnimatedSprite.play("RunRight")
		
		

		
		
		
		#ativa movimentação do npc em direção ao tinhoso
		
