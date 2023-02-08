extends KinematicBody2D

export var walkSpeed = 4
const TILE_SIZE = 16

onready var animationTree = $AnimationTree  # animações criadas
onready var animationState = animationTree.get("parameters/playback")  # pode ser idle ou walk


var initialPosition = Vector2(0, 0)  # Posição inicial (ou atual) do sprite
var inputDirection = Vector2(0, 0)  # Movimento do sprite de acordo com as teclas pressionadas
var isMoving = false  # Serve como checagem da movimentação do sprite
var percentMovedToNextTile = 0.0  # Verifica a porcentagem de movimentação do sprite


# Chamada no início do jogo
func _ready():
	initialPosition = position


# Função responsável por verificar, constantemente, o status do personagem
# Além de mudar a animação (walk quando caminha e idle quando para)
func _physics_process(delta):
	if isMoving == false:
		process_player_input()
	elif inputDirection != Vector2.ZERO:
		animationState.travel("Walk")  # muda animação para walk (quando estiver andando)
		move(delta)
	else:
		animationState.travel("Idle")  # muda animação para idle (quando estiver parado)
		isMoving = false 


# Função que processa o input do usuário (direita, esquerda, cima e baixo)
func process_player_input():
	# Processa e salva inputs na horizontal e na vertical
	if inputDirection.y == 0:
		inputDirection.x = (
				int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
		)
	if inputDirection.x == 0:
		inputDirection.y = (
				int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
		)

	# Se o vetor de direção não for 0, significa que houve input do usuário, logo, is_moving = true
	if inputDirection != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", inputDirection)
		animationTree.set("parameters/Walk/blend_position", inputDirection)
		initialPosition = position
		isMoving = true
	else:
		animationState.travel("Idle")


# Responsável pela movimentação do personagem
func move(delta):
	percentMovedToNextTile += walkSpeed * delta
	
	# Incrementa a posição do personagem, de acordo com a posição inicial, com o input do usuário e
	# com o tamanho do tile (16px)
	if percentMovedToNextTile >= 1.0:
		position = initialPosition + (TILE_SIZE * inputDirection)
		percentMovedToNextTile = 0.0
		isMoving = false
	else:
		position = initialPosition + (TILE_SIZE * inputDirection * percentMovedToNextTile)
	
	# Se o personagem chegar no final da tela (lado direito) horizontal, não permite que ele passe
	if position.x >= 650:
		position.x = 650
	
	# Se o personagem chegar no final da tela (lado esquerdo) horizontal, não permite que ele passe
	if position.x <= -530:
		position.x = -530
	
	# Se o personagem chegar no final da tela (cima) vertical, não permite que ele passe
	if position.y <= -390:
		position.y = -390
	
	# Se o personagem chegar no final da tela (baixo) vertical, não permite que ele passe
	if position.y >= 345:
		position.y = 345
