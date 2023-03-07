extends KinematicBody2D

const MAX_SPEED = 400 # Define velocidade máxima do caminhão
const acceleration = 200  # Define aceleração do caminhão
const FRICTION  = 100 # Valor de parada, responsável pela tração do caminhão 
var velocity = Vector2.ZERO  # Vetor responsável pela movimentação do caminhão
var inputDirection = Vector2(0, 0)  # Vetor atualizado de acordo com as teclas pressionadas


func _ready():
	pass


func _physics_process(delta):
	# Processa e salva inputs na horizontal
	inputDirection.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if inputDirection != Vector2.ZERO:
		# Calula o vetor velocidade considerando a velocidade máxima e a aceleração
		velocity = velocity.move_toward(inputDirection * MAX_SPEED, acceleration * delta)
	else: 
		# Responsável por desacelerar o caminhão de forma gradativa e pela movimentação fluída
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	# Movimenta o caminhão de acordo com o vetor velocity
	velocity = move_and_slide(velocity)
