extends KinematicBody2D

export var walkSpeed = 100  # Rapidez do movimento
var velocity = Vector2.ZERO  # Vetor responsável pela movimentação do personagem
var inputDirection = Vector2(0, 0)  # Vetor atualizado de acordo com as teclas pressionadas
onready var screenSize = get_viewport_rect().size  # Tamanho da tela
onready var animationTree = $AnimationTree # Árvore de animações do personagem
# Define animation state de acordo com animationTree
onready var animationState = animationTree.get("parameters/playback") 


func _physics_process(delta):
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


# Move o personagem para fora de casa
func _on_Exit_body_entered(body):
	return get_tree().change_scene("res://Scenes/OutsideHouse.tscn")
