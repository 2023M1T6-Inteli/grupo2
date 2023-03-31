extends Node2D

var arrowCrosshair = load("res://Assets/items/crosshair.png") # Imagem da mira
const CHECK_ITEM = preload("res://Scenes/CheckItem.tscn") # Cena do check item
var clipboardElement = 0 # Index para adicionar elementos na prancheta
onready var cont = 0 # Variável para controle do spawn dos itens
onready var spawnPositions = $SpawnItems/SpawnPositions.get_children()
onready var dialog # Variável utilizada para carregar os diálogos

# Conteúdos dos itens
var itemsList = ["Dormir bem", "Beber água", "Usar cinto", "Fazer \npausas", "Mexer no\ncelular",
				"Comer bem", "Não dormir", "Beber \nálcool", "Conferir \nfreios",
				"Dirigir\nsem comer", "Não conferir\nos pneus", "Não conferir\nos freios", 
				"Entender a \ncarga", "Desconhecer\na carga", "Verificar \nfaróis",
				"Verificar \nóleo", "Conferir \ncarga max.", "Verificar \nas setas",
				"Usar \nchinelo", "Não usar \ncinto", "Usar calçado\nfirme",
				"Levar \nextintor", "Conferir \nfiltro de ar"]

# Associação entre os itens e seus valores - true é um item bom e false um item ruim
var itemsdictValues = {"Dormir bem": true, "Beber água": true, "Usar cinto": true,
				"Fazer \npausas": true, "Mexer no\ncelular": false,
				"Comer bem": true, "Não dormir": false, "Beber \nálcool": false,
				"Conferir \nfreios": true, "Dirigir\nsem comer": false,
				"Não conferir\nos pneus": false, "Não conferir\nos freios": false,
				"Entender a \ncarga": true, "Desconhecer\na carga": false,
				"Verificar \nfaróis": true, "Verificar \nóleo": true,
				"Conferir \ncarga max.": true, "Verificar \nas setas": true,
				"Usar \nchinelo": false, "Não usar \ncinto": false,
				"Usar calçado\nfirme": true, "Levar \nextintor": true,
				"Conferir \nfiltro de ar": true}


func _ready():
	randomize()
	Input.set_custom_mouse_cursor(arrowCrosshair, 1) # Altera cursor do mouse
	# Traduz textos para inglês	
	if Global.selectedLanguage == 1:
		$CheckItemTutorial/Content.text = "good night's \nsleep"
		
		if Global.checklistTutorial == false:
			$ColorRect.visible = true
			dialog = Dialogic.start("tutorial-checklist-en")
			dialog.connect("dialogic_signal", self, "dialog_listener")
			add_child(dialog)
		else:
			$ColorRect.visible = false
			$ItemsTimer.start()
		
		itemsList = ["Be well\nrested", "Drink water", "Wear Seat\nbelts", "Take\nbreaks",
					"Use your\ncellphone","Be well\nfed", "Be sleep\ndeprived", "Drink \nalcohol",
					"Check \nbrakes","Drive without\nnourishment", "Forget to\ncheck tires",
					"Forget to\ncheck brakes", "Undestand\ncargo", "Overlook\ncargo",
					"Check \nheadlights", "Check \noil", "check \nmax. cargo", "Check tail\n lights",
					"Wear \nslippers", "Don't wear \nseat belts", "Wear steady\nfootwear",
					"Carry fire\nextinguisher", "Check air\nfilter"]
					
		itemsdictValues = {"Be well\nrested": true, "Drink water": true, "Wear Seat\nbelts": true,
				"Take\nbreaks": true, "Use your\ncellphone": false,
				"Be well\nfed": true, "Be sleep\ndeprived": false, "Drink \nalcohol": false,
				"Check \nbrakes": true, "Drive without\nnourishment": false,
				"Forget to\ncheck tires": false, "Forget to\ncheck brakes": false,
				"Undestand\ncargo": true, "Overlook\ncargo": false,
				"Check \nheadlights": true, "Check \noil": true,
				"check \nmax. cargo": true, "Check tail\n lights": true,
				"Wear \nslippers": false, "Don't wear \nseat belts": false,
				"Wear steady\nfootwear": true, "Carry fire\nextinguisher": true,
				"Check air\nfilter": true}
	else:
		if Global.checklistTutorial == false:
			$ColorRect.visible = true
			dialog = Dialogic.start("tutorial-checklist")
			dialog.connect("dialogic_signal", self, "dialog_listener")
			add_child(dialog)
		else:
			$ColorRect.visible = false
			$ItemsTimer.start()


# Função responsável por spawnar os itens na tela
func add_item(itemPosition):
	if len(itemsList):
		var newItem = CHECK_ITEM.instance()
		newItem.global_position = itemPosition
		var randomIndex = randi() % itemsList.size()
		newItem.content = itemsList[randomIndex]
		add_child(newItem)
		newItem.connect("exploded", self, "_on_exploded")
		
		# Remove conteúdo que já foi utilizado, para não repetir
		itemsList.remove(randomIndex)


# Adiciona 5 itens na tela
func _on_ItemsTimer_timeout():
	if cont < 5:
		var indexSpawn = cont
		add_item(spawnPositions[indexSpawn].global_position)
		cont += 1
	else:
		$ItemsTimer.stop()


# Recebe e trata o sinal de quando o item foi clicado
func _on_exploded(currentContent, currentPosition):	
	if clipboardElement < 5:
		# Pega o item que será editado do VBoxContainer de acordo com o index clipboardElement
		var elements = $Clipboard/VBoxContainer.get_children()
		var element = elements[clipboardElement]
		
		# Adiciona conteúdo do item na label da prancheta
		element.get_children()[1].text = currentContent 
		element.visible = true
		
		# Incrementa o index dos itens da prancheta
		clipboardElement += 1
	
		add_item(currentPosition) # Adiciona um novo item no mesmo lugar do que foi clicado
		
	if clipboardElement >= 5:
		$ConfirmButton.visible = true
		if Global.selectedLanguage == 1:
			$ConfirmButton.text = "Validate Choices"


func _on_ConfirmButton_pressed():
	var values = []
	for item in $Clipboard/VBoxContainer.get_children():
		values.append(itemsdictValues[String(item.get_children()[1].text)])
	
	# Verifica se há algum item negativo na lista, retornando Game Over em caso positivo
	if false in values:
		if Global.selectedLanguage == 1:
			dialog = Dialogic.start("gameover-check-en")
			add_child(dialog)
		elif Global.selectedLanguage == 2:
			dialog = Dialogic.start("gameover-check-es")
			add_child(dialog)	
		else:
			dialog = Dialogic.start("gameover-check")
			add_child(dialog)
		$GameOver.visible = true
		Global.checklistTutorial = true
	
	# Direciona para tela de feedback caso tudo esteja certo
	else:
		Global.checklistTutorial = true
		return get_tree().change_scene("res://Scenes/SuccessChecklist.tscn")


func dialog_listener(sinal):
	match sinal:
		"check":
			$CheckItemTutorial.visible = true
		"check-finished":
			$ClipboardTutorial.queue_free()
			$ColorRect.visible = false
			$ItemsTimer.start()


func _on_CheckItemTutorial_exploded(_currentContent, _currentPosition):
	$ClipboardTutorial.visible = true
	if Global.selectedLanguage == 1:
		dialog = Dialogic.start("tutorial-checklist-2-en")
		dialog.connect("dialogic_signal", self, "dialog_listener")
		add_child(dialog)
		$ClipboardTutorial/VBoxContainer/HBoxContainer/Label.text = "Good night's\nsleep"
	if Global.selectedLanguage == 2:
		dialog = Dialogic.start("tutorial-checklist-2-es")
		dialog.connect("dialogic_signal", self, "dialog_listener")
		add_child(dialog)
		$ClipboardTutorial/VBoxContainer/HBoxContainer/Label.text = "Good night's\nsleep"	
	else:
		dialog = Dialogic.start("tutorial-checklist-2")
		dialog.connect("dialogic_signal", self, "dialog_listener")
		add_child(dialog)
