extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	# Verifica se o jogador apertou a tecla E (interação) dentro da área da geladeira, caso positivo, mostra a cena da geladeira
	if(Input.is_action_pressed("interagir") && $FreezerArea/FreezerE.visible == true):
		$FreezerArea/Freezer.visible = true;

func _on_FreezerArea_body_entered(body):
	# Ao entrar na área da geladeira exibe o comando para interagir
	$FreezerArea/FreezerE.visible = true


func _on_FreezerArea_body_exited(body):
	# Ao sair da área da geladeira esconde o comando para interagir e a cena da geladeira (caso esteja aberta)
	$FreezerArea/FreezerE.visible = false
	$FreezerArea/Freezer.visible = false
