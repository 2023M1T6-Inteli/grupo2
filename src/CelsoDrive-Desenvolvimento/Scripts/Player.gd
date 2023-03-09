extends KinematicBody2D

export var walkSpeed = 50  # Rapidez do movimento
var velocity = Vector2.ZERO  # Vetor responsável pela movimentação do personagem
var inputDirection = Vector2(0, 0)  # Vetor atualizado de acordo com as teclas pressionadas
onready var screenSize = get_viewport_rect().size  # Tamanho da tela


onready var animationPlayer = $AnimationPlayer  
onready var animationTree = $AnimationTree 
# Ter acesso e definir animation state de acordo com animationTree
onready var animationState= animationTree.get("parameters/playback") 

func _ready():
	pass
func _physics_process(delta):
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
		# Envia dados do -inputDirection os quais tornam-se animações de acordo com animationTree
		animationTree.set("parameters/Idle/blend_position", inputDirection)
		animationTree.set("parameters/Run/blend_position", inputDirection)
		# Define o "playback"(do Animation Tree) de acordo com -inputDirection e roda animação
		animationState.travel("Run")
		velocity = inputDirection
	else:
		# Se o vetor inputDirection for 0, siginifica que não há movimentação
		# Caso o personagem não esteja em movimento, a animação Idle deve ser acionada
		# No endereço setado pela variável animationState
		animationState.travel("idle")
		velocity = Vector2.ZERO

	# Restringe a movimentação do personagem de acordo com o tamanho da tela
	position.x = clamp(position.x, -110, screenSize.x - 16)
	position.y = clamp(position.y, 0, screenSize.y - 16)
	
	# Movimenta o personagem de acordo com o vetor velocity vezes a rapidez do movimento
	velocity = move_and_slide(velocity * walkSpeed)


func _on_Exit_body_entered(body):
	get_tree().change_scene("res://Scenes/OutsideHouse.tscn")
