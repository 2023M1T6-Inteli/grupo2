extends KinematicBody2D

export var walk_speed = 4
const TILE_SIZE = 16

onready var animation_tree = $AnimationTree  # animações criadas
onready var animation_state = animation_tree.get("parameters/playback")  # pode ser idle ou walk

var initial_position = Vector2(0, 0)  # Posição inicial (ou atual) do sprite
var input_direction = Vector2(0, 0)  # Movimento do sprite de acordo com as teclas pressionadas
var is_moving = false  # Serve como checagem da movimentação do sprite
var percent_moved_to_next_tile = 0.0  # Verifica a porcentagem de movimentação do sprite


# Chamada no início do jogo
func _ready():
	initial_position = position
	

func _physics_process(delta):
	if is_moving == false:
		process_player_input()
	elif input_direction != Vector2.ZERO:
		animation_state.travel("Walk")
		move(delta)
	else:
		animation_state.travel("Idle")
		is_moving = false
		

func process_player_input():
	if input_direction.y == 0:
		input_direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	if input_direction.x == 0:
		input_direction.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))

	if input_direction != Vector2.ZERO:
		animation_tree.set("parameters/Idle/blend_position", input_direction)
		animation_tree.set("parameters/Walk/blend_position", input_direction)
		initial_position = position
		is_moving = true
	else:
		animation_state.travel("Idle")


func move(delta):
	percent_moved_to_next_tile += walk_speed * delta
	if percent_moved_to_next_tile >= 1.0:
		position = initial_position + (TILE_SIZE * input_direction)
		percent_moved_to_next_tile = 0.0
		is_moving = false
	else:
		position = initial_position + (TILE_SIZE * input_direction * percent_moved_to_next_tile)
