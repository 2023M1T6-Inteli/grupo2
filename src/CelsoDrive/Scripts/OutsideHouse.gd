extends Node2D


func _ready():
	if Global.energy <= 0:
		$"/root/Global".pause_scene() # se a energia acabar, exibe tela de pause
		
	Global.level = 1
	# Define posição do personagem
	Global.playerPosition = Vector2(64, 208)
	
	# Instancia cena para mostrar o personagem
	var spawnPlayer = load("res://Scenes/SpawnPlayer.tscn").instance()
	add_child(spawnPlayer)
	
	# Exibe caminhão somente quando  visibleTruck for verdadeiro
	if Global.visibleTruck:
		$Truck.visible = true
	else:
		$Truck.queue_free()


# Move o personagem para dentro de casa
func _on_CelsoHouse_body_entered(_body):
	Global.level = 2
	return get_tree().change_scene("res://Scenes/InsideHouse.tscn")


# Verifica, a cada frame, se a tecla E foi pressionada
func _process(_delta):
	e_pressed()


# Mostra sprite da tecla E ao se aproximar do caminhao 
func _on_Caminhao_body_entered(_body):
	$Truck/Einteract.visible = true


# Esconde sprite da tecla E ao se afastar
func _on_Caminhao_body_exited(_body):
	$Truck/Einteract.visible = false


# Caso a tecla E seja pressionada, há uma troca de cena
func e_pressed():
	if Input.is_action_just_pressed("interagir"):
		return get_tree().change_scene("res://Scenes/CutScene.tscn")
