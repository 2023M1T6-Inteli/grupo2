extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	key_pressed()


# Altera animação das setas de acordo com a tecla pressionada
func key_pressed():
	if Input.is_action_pressed("ui_up"):
		$Cima.play("pressionada")
	else:
		$Cima.play("default")
	if Input.is_action_pressed("ui_down"):
		$Baixo.play("pressionada")
	else:
		$Baixo.play("default")
	if Input.is_action_pressed("ui_left"):
		$Esquerda.play("pressionada")
	else:
		$Esquerda.play("default")
	if Input.is_action_pressed("ui_right"):
		$Direita.play("pressionada")
	else:
		$Direita.play("default")
	if Input.is_action_pressed("interagir"):
		$TeclaE.play("pressionada")
	else:
		$TeclaE.play("default")
