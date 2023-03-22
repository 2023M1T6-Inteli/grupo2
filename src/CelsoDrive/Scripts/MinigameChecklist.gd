extends Node2D

var arrowCrosshair = load("res://Assets/items/crosshair.png") # Imagem da mira
const CHECK_ITEM = preload("res://Scenes/CheckItem.tscn") # Cena do check item
var clipboardElement = 0 # Index para adicionar elementos na prancheta
onready var cont = 0 # Variável para controle do spawn dos itens
onready var spawnPositions = $SpawnItems/SpawnPositions.get_children()
var positiveItemsList = ["Dormir bem", "Fazer \nPausas", "Beber água",
						"Desativar\nnotificações", "Comer bem", "Usar Cinto",
						"Conversar", "Escutar forró", "Sambar"]


func _ready():
	randomize()
	Input.set_custom_mouse_cursor(arrowCrosshair) # Altera cursor do mouse


func _on_ItemsTimer_timeout():
	if cont < 5:
		if len(positiveItemsList):
			var indexSpawn = cont
			var newItem = CHECK_ITEM.instance()
			newItem.global_position = spawnPositions[indexSpawn].global_position
			var randomIndex = randi() % positiveItemsList.size()
			newItem.content = positiveItemsList[randomIndex]
			add_child(newItem)
			positiveItemsList.remove(randomIndex)
			newItem.connect("exploded", self, "_on_exploded")
			cont += 1


func _on_exploded(currentContent, currentPosition):	
	if clipboardElement < 5:
		# Atualiza labels da prancheta quando o check item é destruído
		var elements = $Clipboard/VBoxContainer.get_children()
		var element = elements[clipboardElement]
		element.get_children()[1].text = currentContent
		element.visible = true
		clipboardElement += 1
