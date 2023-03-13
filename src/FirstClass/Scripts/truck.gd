extends KinematicBody2D

var velocity = Vector2.ZERO  # Vetor responsável pela movimentação do caminhão
var inputDirection = Vector2(0, 0)  # Vetor atualizado de acordo com as teclas pressionadas
var moveSpeed = 300 # Velocidade com que o caminhão se move lateralmente

func _ready():
	pass

func _physics_process(delta):	
	# Bloqueia o movimento para cima / baixo
	if inputDirection.y == 0:
		inputDirection.x = (
				int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
		)
	
	# Se o vetor inputDirection for != ZERO, siginifica que há movimentação
	if inputDirection != Vector2.ZERO:
		velocity = inputDirection
	else:
		velocity = Vector2.ZERO
		
	velocity = move_and_slide(velocity * moveSpeed)

func _on_area_truck_body_entered(body):
	print("bateu")
