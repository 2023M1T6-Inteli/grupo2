extends Node2D


onready var dialog


func _ready():
	# Inicia diálogo introdutório e adiciona-o como nó filho
	dialog = Dialogic.start("intro")
	dialog.connect("dialogic_signal", self, "dialog_listener")
	add_child(dialog)


func _process(delta):
	# Verifica, a cada frame, as teclas pressionadas
	key_pressed()


# Recebe e trata os sinais do nó de diálogo
func dialog_listener(string):
	match string:
		# Adiciona na lista de escolhas a decisão ruim de aceitar a corrida do tinhoso
		"acepted":
			Global.choices.append(1);
	
		# Adiciona na lista de escolhas a decisão boa de recusar a corrida do tinhoso
		"refused":
			Global.choices.append(0);


# Aciona diálogo com tinhoso quando o personagem entra na Area2D
func _on_NextSceneArea_body_entered(body):
	Global.energy -= 2
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
