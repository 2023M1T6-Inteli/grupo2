extends KinematicBody2D

export var walkSpeed = 100  # Rapidez do movimento
var velocity = Vector2.ZERO  # Vetor responsável pela movimentação do personagem
var inputDirection = Vector2(0, 0)  # Vetor atualizado de acordo com as teclas pressionadas
onready var screenSize = get_viewport_rect().size  # Tamanho da tela
onready var animationTree = $AnimationTree # Árvore de animações do personagem
# Define animation state de acordo com animationTree
onready var animationState = animationTree.get("parameters/playback") 


func _ready():
	# Limita a câmera de acordo com o nível 1
	if Global.level == 1:
		$Camera2D.limit_bottom = 368
		$Camera2D.limit_top = 0
		$Camera2D.limit_left = -100
		$Camera2D.limit_right = 640
		$Camera2D.zoom = Vector2(0.8, 0.8)
	# Limita a câmera de acordo com o nível 2
	elif Global.level == 2:
		$Camera2D.limit_bottom = 368
		$Camera2D.limit_top = 0
		$Camera2D.limit_left = 0
		$Camera2D.limit_right = 640
		$Camera2D.zoom = Vector2(0.8, 0.8)


func _physics_process(_delta):
	# Processa e salva inputs na horizontal e na vertical
	if inputDirection.y == 0:
		inputDirection.x = (
				int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
		)
	if inputDirection.x == 0:
		inputDirection.y = (
				int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
		)
	
	# Se o vetor inputDirection não for 0, siginifica que há movimentação
	if inputDirection != Vector2.ZERO:
		# Envia dados do input, os quais tornam-se animações
		animationTree.set("parameters/Idle/blend_position", inputDirection)
		animationTree.set("parameters/Run/blend_position", inputDirection)
		# Roda animação do personagem andando
		animationState.travel("Run")
		velocity = inputDirection
	else:
		# Se o vetor inputDirection for 0, siginifica que não há movimentação -> Idle
		animationState.travel("Idle")
		velocity = Vector2.ZERO

	# Restringe a movimentação do personagem de acordo com o tamanho da tela
	position.x = clamp(position.x, -110, screenSize.x - 16)
	position.y = clamp(position.y, 0, screenSize.y - 16)
	
	# Movimenta o personagem de acordo com o vetor velocity vezes a rapidez do movimento
	velocity = move_and_slide(velocity * walkSpeed)
