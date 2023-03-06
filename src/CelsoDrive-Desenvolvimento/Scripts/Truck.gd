extends KinematicBody2D

const MAX_SPEED = 200 # Define velocidade máxima do caminhão
const acceleration = 300  # Define aceleração do caminhão 
const FRICTION  = 100 # Valor da parada , responsável pela tração do caminhão 
var velocity = Vector2.ZERO

func _ready():
	pass

func _physics_process(delta):	
	# Vetor vazio para receeber inputs 
	var input_vector = Vector2.ZERO 
	# Guarda valor do vetor referente a inputs do usuário e define valor de -input_vector
	# Para movimentação horizontal do caminhão pelo cenário 
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if input_vector != Vector2.ZERO:
		# Calula e define -velocity, através de parâmetros da função, calculo que resulta em um vetor
		# Considerando o framerate e -acceleration, de forma que não ultrapasse o -MAX-SPEED
		velocity = velocity.move_toward(input_vector * MAX_SPEED, acceleration * delta)
	else: 
		# Responsável por desacelerar o caminhão de forma gradativa e pela movimentação fluída
		# Também impede que o caminhão fique se mova infinitavemte  
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	# -velocity os valores do vetor sejão aplicados para que o caminhão se mova pela tela
	velocity = move_and_slide(velocity)


func _on_area_truck_body_entered(body):
	print("bateu")
