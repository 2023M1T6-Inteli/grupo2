extends Node2D

onready var dialog # Variável utilizada para carregar os diálogos


func _ready():
	Global.level = 2
	# Define posição do personagem - se vier do pause (energy == 0), spawna na cama
	if Global.energy <= 0:
		$Energy0Area.collision_mask = 1
		$Energy0Area.collision_layer = 3
		Global.playerPosition = Vector2(36.75, 181)
	else:
		$Energy0Area.collision_layer = 2
		$Energy0Area.collision_mask = 2
		Global.playerPosition = Vector2(304, 336)
	
	# Instancia cena para mostrar o personagem
	var spawnPlayer = load("res://Scenes/SpawnPlayer.tscn").instance()
	add_child(spawnPlayer)
	
	# Diálogo inicial da cena
	if Global.insideHouseDialog == false:
		if Global.selectedLanguage == 1:
			dialog = Dialogic.start("level-2-en")
			add_child(dialog)
		elif Global.selectedLanguage == 2:
			dialog = Dialogic.start("level-2-es")
			add_child(dialog)	
		else:
			dialog = Dialogic.start("level-2")
			add_child(dialog)
		
		# Muda estado da variável global, informando que o usuário já entrou na casa
		Global.insideHouseDialog = true
		
	# Diálogo da energia esgotada
	if Global.energy == 0:
		dialog = Dialogic.start("energy-0")
		add_child(dialog)


func _on_Exit_body_entered(_body):
	# Direciona o personagem para fora de casa
	Global.level = 1
	Global.visibleTruck = true
	return get_tree().change_scene("res://Scenes/OutsideHouse.tscn")


func _process(_delta):
	# Mostra a geladeira se o jogador apertar a tecla "E" dentro da área
	if Input.is_action_pressed("interagir") and $FreezerArea/FreezerE.visible == true:
		# Só mostra a tela se o usuário nunca tiver interagido, de acordo com a variável de controle
		if Global.interactedFreezer == false:
			$FreezerArea/Freezer.visible = true
			if Global.selectedLanguage == 1:
				dialog = Dialogic.start("freezer-en")
			elif Global.selectedLanguage == 2:
				dialog = Dialogic.start("freezer-es")	
			else:
				dialog = Dialogic.start("freezer")
			add_child(dialog)

	# Mostra a mesa se o jogador apertar a tecla "E" dentro da área
	if Input.is_action_pressed("interagir") and $TableArea/TableE.visible == true:
		if Global.interactedTable == false:
			$TableArea/Table.visible = true
			if Global.selectedLanguage == 1:
				dialog = Dialogic.start("table-en")
			if Global.selectedLanguage == 2:
				dialog = Dialogic.start("table-es")	
			else:
				dialog = Dialogic.start("table")
			add_child(dialog)

	# Mostra o celular se o jogador apertar a tecla "E" dentro da área
	if Input.is_action_pressed("interagir") and $PhoneArea/PhoneE.visible == true:
		$PhoneArea/Phone.visible = true
		if Global.interactedPhone == false:
			if Global.selectedLanguage == 1:
				dialog = Dialogic.start("phone-en")
			elif Global.selectedLanguage == 2:
				dialog = Dialogic.start("phone-es")	
			else:
				dialog = Dialogic.start("phone")
			add_child(dialog)

	# Mostra a cama se o jogador apertar a tecla "E" dentro da área
	if Input.is_action_pressed("interagir") and $SleepArea/SleepE.visible == true:
		$SleepArea/Sleep.visible = true
		if Global.interactedBed == false:
			if Global.selectedLanguage == 1:
				dialog = Dialogic.start("bed-en")
				$SleepArea/Sleep/SleepAfter.text = "Sleep After"
				$SleepArea/Sleep/SleepNow.text = "Sleep Now"
			if Global.selectedLanguage == 2:
				dialog = Dialogic.start("bed-es")
				$SleepArea/Sleep/SleepAfter.text = "Dormir después"
				$SleepArea/Sleep/SleepNow.text = "Dormir ahora"	
			else:
				dialog = Dialogic.start("bed")
				$SleepArea/Sleep/SleepAfter.text = "Dormir depois"
				$SleepArea/Sleep/SleepNow.text = "Dormir agora"
			add_child(dialog)


func _on_FreezerArea_body_entered(_body):
	# Exibe a tecla para interagir na área da geladeira
	if Global.interactedFreezer == false:
		$FreezerArea/FreezerE.visible = true


func _on_FreezerArea_body_exited(_body):
	# Ao sair da área da geladeira esconde a tecla e a cena
	$FreezerArea/FreezerE.visible = false
	$FreezerArea/Freezer.visible = false


func _on_TableArea_body_entered(_body):
	# Exibe a tecla para interagir na área da mesa
	if Global.interactedTable == false:
		$TableArea/TableE.visible = true


func _on_TableArea_body_exited(_body):
	# Ao sair da área da mesa esconde a tecla e a cena
	$TableArea/TableE.visible = false
	$TableArea/Table.visible = false


func _on_PhoneArea_body_entered(_body):
	# Exibe a tecla para interagir na área do celular
	$PhoneArea/PhoneE.visible = true


func _on_PhoneArea_body_exited(_body):
	# Ao sair da área da área do celular esconde a tecla e a cena
	$PhoneArea/PhoneE.visible = false
	$PhoneArea/Phone.visible = false


func _on_SleepArea_body_entered(_body):
	# Exibe a tecla de interagir na área da cama
	$SleepArea/SleepE.visible = true
	
	if Global.energy > 0:
		$Energy0Area.collision_mask = 2
		$Energy0Area.collision_layer = 2


func _on_SleepArea_body_exited(_body):
	# Ao sair da área da cama esconde a tecla e a cena
	$SleepArea/SleepE.visible = false
	$SleepArea/Sleep.visible = false

	if Global.energy > 0:
		$Energy0Area.collision_mask = 2
		$Energy0Area.collision_layer = 2
