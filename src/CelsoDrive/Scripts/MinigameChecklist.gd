extends Node2D

var arrowCrosshair = load("res://Assets/items/crosshair.png") # Imagem da mira
const CHECK_ITEM = preload("res://Scenes/CheckItem.tscn") # Cena do check item
var clipboardElement = 0 # Index para adicionar elementos na prancheta
onready var cont = 0 # Variável para controle do spawn dos itens
onready var spawnPositions = $SpawnItems/SpawnPositions.get_children()
onready var dialog # Variável utilizada para carregar os diálogos

# Conteúdos dos itens
var itemsList = ["Dormir Bem", "Beber água", "Usar Cinto", "Fazer \nPausas", "Mexer no\nCelular",
				"Comer bem", "Não dormir", "Beber \nálcool"]

# Associação entre os itens e seus valores - true é um item bom e false um item ruim
var itemsdictValues = {"Dormir Bem": true, "Beber água": true, "Usar Cinto": true,
				"Fazer \nPausas": true, "Mexer no\nCelular": false,
				"Comer bem": true, "Não dormir": false, "Beber \nálcool": false}


func _ready():
	randomize()
	Input.set_custom_mouse_cursor(arrowCrosshair) # Altera cursor do mouse


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


func _on_ConfirmButton_pressed():
	var values = []
	for item in $Clipboard/VBoxContainer.get_children():
		values.append(itemsdictValues[String(item.get_children()[1].text)])
		
	if false in values:
		dialog = Dialogic.start("gameover-check")
		add_child(dialog)
		$GameOver.visible = true
	
	else:
		return get_tree().change_scene("res://Scenes/RunGame.tscn")
	
