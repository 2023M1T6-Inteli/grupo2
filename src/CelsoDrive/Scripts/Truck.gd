extends KinematicBody2D

var maxSpeed := 150 # Define velocidade máxima do caminhão
var acceleration := 80  # Define aceleração do caminhão
var friction := 500 # Valor de parada, responsável pela tração do caminhão 
var velocity := Vector2.ZERO  # Vetor responsável pela movimentação do caminhão
var inputDirection := Vector2(0, 0)  # Vetor atualizado de acordo com as teclas pressionadas


func _physics_process(delta):
	# Processa e salva inputs na horizontal
	if Global.alcohol:
		inputDirection.x = Input.get_action_strength("ui_left") - Input.get_action_strength("ui_right")
	else:
		inputDirection.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if inputDirection != Vector2.ZERO:
		# Calula o vetor velocidade considerando a velocidade máxima e a aceleração
		velocity = velocity.move_toward(inputDirection * maxSpeed, acceleration * delta)
	else: 
		# Responsável por desacelerar o caminhão de forma gradativa e pela movimentação fluída
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	# Movimenta o caminhão de acordo com o vetor velocity
	velocity = move_and_slide(velocity)
