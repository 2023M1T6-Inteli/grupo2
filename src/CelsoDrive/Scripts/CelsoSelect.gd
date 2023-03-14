extends Control

# Carrega cenas das variantes do Celso
onready var celso1 = preload("res://Scenes/Player01.tscn")
onready var celso2 = preload("res://Scenes/Player02.tscn")
onready var celso3 = preload("res://Scenes/Player03.tscn")
onready var celso4 = preload("res://Scenes/Player04.tscn")
var currentCelso := 1 # "Index" para o aparecimento dos personagens na tela


func _process(delta):
	# Verifica, constantemente, qual Celso exibir
	show_current_celso()


# Função usada para direcionar ao tutorial
func go_to_tutorial():
	return get_tree().change_scene("res://Scenes/Tutorial.tscn")


# Carrega sprite dinamicamente de acordo com o index
func show_current_celso():
	if currentCelso == 1:
		$Celso01.visible = true
		$Celso02.visible = false
		$Celso03.visible = false
		$Celso04.visible = false
	elif currentCelso == 2:
		$Celso01.visible = false
		$Celso02.visible = true
		$Celso03.visible = false
		$Celso04.visible = false
	elif currentCelso == 3:
		$Celso01.visible = false
		$Celso02.visible = false
		$Celso03.visible = true
		$Celso04.visible = false
	elif currentCelso == 4:
		$Celso01.visible = false
		$Celso02.visible = false
		$Celso03.visible = false
		$Celso04.visible = true


# Incrementa o index do personagem selecionado
func increase():
	if currentCelso < 4:
		currentCelso += 1
		

# Diminui o index do personagem selecionado 
func decrease():
	if currentCelso > 1:
		currentCelso -= 1


func _on_Next_pressed():
	# Some com o botão de próximo quando chega no último celso, com uma color rect por cima
	if currentCelso == 3:
		$NextColorRect.visible = true
	
	# Exibe, caso necessário, o botão de voltar, o qual
	# pode estar coberto pela color rect por ter chegado no 1º celso
	if $PreviousColorRect.visible == true:
		$PreviousColorRect.visible = false
	increase()


func _on_Previous_pressed():
	# Some com o botão de voltar quando chega no 1º celso, com uma color rect por cima
	if currentCelso == 2:
		$PreviousColorRect.visible = true
		
	# Exibe, caso necessário, o botão de próximo, o qual
	# pode estar coberto pela color rect por ter chegado no último celso
	if $NextColorRect.visible == true:
		$NextColorRect.visible = false
	decrease()


# Seleciona versão 1 do Celso
func _on_Celso01_pressed():
	Global.playerDir = celso1
	go_to_tutorial()


# Seleciona versão 2 do Celso
func _on_Celso02_pressed():
	Global.playerDir = celso2
	go_to_tutorial()


# Seleciona versão 3 do Celso
func _on_Celso03_pressed():
	Global.playerDir = celso3
	go_to_tutorial()


# Seleciona versão 4 do Celso
func _on_Celso04_pressed():
	Global.playerDir = celso4
	go_to_tutorial()
