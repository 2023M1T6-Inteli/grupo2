extends KinematicBody2D

var Speed := 100   # Define velocidade normal do caminhão
var maxSpeed := 150   # Define velocidade máxima do caminhão
var acceleration := 80  # Define aceleração do caminhão
var friction := 500  # Valor de parada, responsável pela tração do caminhão 
var velocity := Vector2.ZERO  # Vetor responsável pela movimentação do caminhão
var inputDirection := Vector2(0, 0)  # Vetor atualizado de acordo com as teclas pressionadas


func _physics_process(delta):
	# Movimentação com debuff de álcool
	if Global.alcohol:
		inputDirection.x = Input.get_action_strength("ui_left") - Input.get_action_strength("ui_right")
		
		if inputDirection != Vector2.ZERO:
		# Calula o vetor velocidade considerando a velocidade máxima e a aceleração
			velocity = velocity.move_toward(inputDirection * maxSpeed, acceleration * delta)
		else: 
			# Responsável por desacelerar o caminhão de forma gradativa e pela movimentação fluída
			velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		
		velocity = move_and_slide(velocity)
		
	elif Global.roadTinhoso:
		inputDirection.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		
		if inputDirection != Vector2.ZERO:
		# Calula o vetor velocidade considerando a velocidade máxima e a aceleração
			velocity = velocity.move_toward(inputDirection * maxSpeed, acceleration * delta)
		else: 
			# Responsável por desacelerar o caminhão de forma gradativa e pela movimentação fluída
			velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		
		velocity = move_and_slide(velocity)
	
	# Movimentação padrão - sem debuff
	else:
		inputDirection.x = int(Input.get_action_strength("ui_right")) - int(Input.get_action_strength("ui_left"))
	
		if inputDirection != Vector2.ZERO:
			# Calula o vetor velocidade considerando a velocidade máxima e a aceleração
			velocity = inputDirection
		else: 
			# Responsável por desacelerar o caminhão de forma gradativa e pela movimentação fluída
			velocity = Vector2.ZERO
	
		# Movimenta o caminhão de acordo com o vetor velocity
		velocity = move_and_slide(velocity * Speed)
