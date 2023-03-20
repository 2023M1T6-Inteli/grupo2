extends Node2D


func _ready():
	# Define posição do personagem
	Global.playerPosition = Vector2(304, 336)
	
	# Instancia cena para mostrar o personagem
	var spawnPlayer = load("res://Scenes/SpawnPlayer.tscn").instance()
	add_child(spawnPlayer)


func _on_Exit_body_entered(_body):
	return get_tree().change_scene("res://Scenes/OutsideHouse.tscn")


func _process(_delta):
	# Verifica se o jogador apertou a tecla E (interação) dentro da área da geladeira, caso positivo, mostra a cena da geladeira
	if(Input.is_action_pressed("interagir") && $FreezerArea/FreezerE.visible == true):
		$FreezerArea/Freezer.visible = true;
		
	# Verifica se o jogador apertou a tecla E (interação) dentro da área da mesa, caso positivo, mostra a cena da mesa
	if(Input.is_action_pressed("interagir") && $TableArea/TableE.visible == true):
		$TableArea/Table.visible = true;
		
	# Verifica se o jogador apertou a tecla E (interação) dentro da área do telefone, caso positivo, mostra a cena do telefone
	if(Input.is_action_pressed("interagir") && $PhoneArea/PhoneE.visible == true):
		$PhoneArea/Phone.visible = true;
	
	# Verifica se o jogador apertou a tecla E (interação) dentro da área da cama, caso positivo, mostra a cena da cama
	if(Input.is_action_pressed("interagir") && $SleepArea/SleepE.visible == true):
		$SleepArea/Sleep.visible = true;


func _on_FreezerArea_body_entered(_body):
	# Ao entrar na área da geladeira exibe o comando para interagir
	$FreezerArea/FreezerE.visible = true


func _on_FreezerArea_body_exited(_body):
	# Ao sair da área da geladeira esconde o comando para interagir e a cena da geladeira (caso esteja aberta)
	$FreezerArea/FreezerE.visible = false
	$FreezerArea/Freezer.visible = false


func _on_TableArea_body_entered(_body):
	# Ao entrar na área da mesa exibe o comando para interagir
	$TableArea/TableE.visible = true


func _on_TableArea_body_exited(_body):
	# Ao sair da área da mesa esconde o comando para interagir e a cena da mesa (caso esteja aberta)
	$TableArea/TableE.visible = false
	$TableArea/Table.visible = false


func _on_PhoneArea_body_entered(_body):
	# Ao entrar na área do telefone exibe o comando para interagir
	$PhoneArea/PhoneE.visible = true


func _on_PhoneArea_body_exited(_body):
	# Ao sair da área do telefone esconde o comando para interagir e a cena do telefone (caso esteja aberta)
	$PhoneArea/PhoneE.visible = false
	$PhoneArea/Phone.visible = false


func _on_SleepArea_body_entered(_body):
	# Ao entrar na área da cama exibe o comando para interagir
	$SleepArea/SleepE.visible = true


func _on_SleepArea_body_exited(_body):
	# Ao sair da área da cama esconde o comando para interagir e a cena da cama (caso esteja aberta)
	$SleepArea/SleepE.visible = false
	$SleepArea/Sleep.visible = false
