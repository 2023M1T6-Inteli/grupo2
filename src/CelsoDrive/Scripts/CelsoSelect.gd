extends Control

# Carrega cenas das variantes do Celso
onready var celso1 = "res://Scenes/Player01.tscn"
onready var celso2 = "res://Scenes/Player02.tscn"
onready var celso3 = "res://Scenes/Player03.tscn"
onready var celso4 = "res://Scenes/Player04.tscn"
onready var celso5 = "res://Scenes/Player05.tscn"
onready var celso6 = "res://Scenes/Player06.tscn"
onready var celso7 = "res://Scenes/Player07.tscn"
onready var celso8 = "res://Scenes/Player08.tscn"
onready var celso9 = "res://Scenes/Player09.tscn"
onready var celso10 = "res://Scenes/Player10.tscn"
onready var celso11 = "res://Scenes/Player11.tscn"
onready var celso12 = "res://Scenes/Player12.tscn"
onready var celso13 = "res://Scenes/Player13.tscn"
onready var celso14 = "res://Scenes/Player14.tscn"
onready var celso15 = "res://Scenes/Player15.tscn"
onready var celso16 = "res://Scenes/Player16.tscn"
onready var celso17 = "res://Scenes/Player17.tscn"
var currentCelso := 1 # "Index" para o aparecimento dos personagens na tela


func _process(_delta):
	$BG.visible = true
	$TitleLabel.visible = true
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
		$Celso05.visible = false
		$Celso06.visible = false
		$Celso07.visible = false
		$Celso08.visible = false
		$Celso09.visible = false
		$Celso10.visible = false
		$Celso11.visible = false
		$Celso12.visible = false
		$Celso13.visible = false
		$Celso14.visible = false
		$Celso15.visible = false
		$Celso16.visible = false
		$Celso17.visible = false
	elif currentCelso == 2:
		$Celso01.visible = false
		$Celso02.visible = true
		$Celso03.visible = false
		$Celso04.visible = false
		$Celso05.visible = false
		$Celso06.visible = false
		$Celso07.visible = false
		$Celso08.visible = false
		$Celso09.visible = false
		$Celso10.visible = false
		$Celso11.visible = false
		$Celso12.visible = false
		$Celso13.visible = false
		$Celso14.visible = false
		$Celso15.visible = false
		$Celso16.visible = false
		$Celso17.visible = false
	elif currentCelso == 3:
		$Celso01.visible = false
		$Celso02.visible = false
		$Celso03.visible = true
		$Celso04.visible = false
		$Celso05.visible = false
		$Celso06.visible = false
		$Celso07.visible = false
		$Celso08.visible = false
		$Celso09.visible = false
		$Celso10.visible = false
		$Celso11.visible = false
		$Celso12.visible = false
		$Celso13.visible = false
		$Celso14.visible = false
		$Celso15.visible = false
		$Celso16.visible = false
		$Celso17.visible = false
	elif currentCelso == 4:
		$Celso01.visible = false
		$Celso02.visible = false
		$Celso03.visible = false
		$Celso04.visible = true
		$Celso05.visible = false
		$Celso06.visible = false
		$Celso07.visible = false
		$Celso08.visible = false
		$Celso09.visible = false
		$Celso10.visible = false
		$Celso11.visible = false
		$Celso12.visible = false
		$Celso13.visible = false
		$Celso14.visible = false
		$Celso15.visible = false
		$Celso16.visible = false
		$Celso17.visible = false
	elif currentCelso == 5:
		$Celso01.visible = false
		$Celso02.visible = false
		$Celso03.visible = false
		$Celso04.visible = false
		$Celso05.visible = true
		$Celso06.visible = false
		$Celso07.visible = false
		$Celso08.visible = false
		$Celso09.visible = false
		$Celso10.visible = false
		$Celso11.visible = false
		$Celso12.visible = false
		$Celso13.visible = false
		$Celso14.visible = false
		$Celso15.visible = false
		$Celso16.visible = false
		$Celso17.visible = false
	elif currentCelso == 6:
		$Celso01.visible = false
		$Celso02.visible = false
		$Celso03.visible = false
		$Celso04.visible = false
		$Celso05.visible = false
		$Celso06.visible = true
		$Celso07.visible = false
		$Celso08.visible = false
		$Celso09.visible = false
		$Celso10.visible = false
		$Celso11.visible = false
		$Celso12.visible = false
		$Celso13.visible = false
		$Celso14.visible = false
		$Celso15.visible = false
		$Celso16.visible = false
		$Celso17.visible = false
	elif currentCelso == 7:
		$Celso01.visible = false
		$Celso02.visible = false
		$Celso03.visible = false
		$Celso04.visible = false
		$Celso05.visible = false
		$Celso06.visible = false
		$Celso07.visible = true
		$Celso08.visible = false
		$Celso09.visible = false
		$Celso10.visible = false
		$Celso11.visible = false
		$Celso12.visible = false
		$Celso13.visible = false
		$Celso14.visible = false
		$Celso15.visible = false
		$Celso16.visible = false
		$Celso17.visible = false
	elif currentCelso == 8:
		$Celso01.visible = false
		$Celso02.visible = false
		$Celso03.visible = false
		$Celso04.visible = false
		$Celso05.visible = false
		$Celso06.visible = false
		$Celso07.visible = false
		$Celso08.visible = true
		$Celso09.visible = false
		$Celso10.visible = false
		$Celso11.visible = false
		$Celso12.visible = false
		$Celso13.visible = false
		$Celso14.visible = false
		$Celso15.visible = false
		$Celso16.visible = false
		$Celso17.visible = false
	elif currentCelso == 9:
		$Celso01.visible = false
		$Celso02.visible = false
		$Celso03.visible = false
		$Celso04.visible = false
		$Celso05.visible = false
		$Celso06.visible = false
		$Celso07.visible = false
		$Celso08.visible = false
		$Celso09.visible = true
		$Celso10.visible = false
		$Celso11.visible = false
		$Celso12.visible = false
		$Celso13.visible = false
		$Celso14.visible = false
		$Celso15.visible = false
		$Celso16.visible = false
		$Celso17.visible = false
	elif currentCelso == 10:
		$Celso01.visible = false
		$Celso02.visible = false
		$Celso03.visible = false
		$Celso04.visible = false
		$Celso05.visible = false
		$Celso06.visible = false
		$Celso07.visible = false
		$Celso08.visible = false
		$Celso09.visible = false
		$Celso10.visible = true
		$Celso11.visible = false
		$Celso12.visible = false
		$Celso13.visible = false
		$Celso14.visible = false
		$Celso15.visible = false
		$Celso16.visible = false
		$Celso17.visible = false
	elif currentCelso == 11:
		$Celso01.visible = false
		$Celso02.visible = false
		$Celso03.visible = false
		$Celso04.visible = false
		$Celso05.visible = false
		$Celso06.visible = false
		$Celso07.visible = false
		$Celso08.visible = false
		$Celso09.visible = false
		$Celso10.visible = false
		$Celso11.visible = true
		$Celso12.visible = false
		$Celso13.visible = false
		$Celso14.visible = false
		$Celso15.visible = false
		$Celso16.visible = false
		$Celso17.visible = false
	elif currentCelso == 12:
		$Celso01.visible = false
		$Celso02.visible = false
		$Celso03.visible = false
		$Celso04.visible = false
		$Celso05.visible = false
		$Celso06.visible = false
		$Celso07.visible = false
		$Celso08.visible = false
		$Celso09.visible = false
		$Celso10.visible = false
		$Celso11.visible = false
		$Celso12.visible = true
		$Celso13.visible = false
		$Celso14.visible = false
		$Celso15.visible = false
		$Celso16.visible = false
		$Celso17.visible = false
	elif currentCelso == 13:
		$Celso01.visible = false
		$Celso02.visible = false
		$Celso03.visible = false
		$Celso04.visible = false
		$Celso05.visible = false
		$Celso06.visible = false
		$Celso07.visible = false
		$Celso08.visible = false
		$Celso09.visible = false
		$Celso10.visible = false
		$Celso11.visible = false
		$Celso12.visible = false
		$Celso13.visible = true
		$Celso14.visible = false
		$Celso15.visible = false
		$Celso16.visible = false
		$Celso17.visible = false
	elif currentCelso == 14:
		$Celso01.visible = false
		$Celso02.visible = false
		$Celso03.visible = false
		$Celso04.visible = false
		$Celso05.visible = false
		$Celso06.visible = false
		$Celso07.visible = false
		$Celso08.visible = false
		$Celso09.visible = false
		$Celso10.visible = false
		$Celso11.visible = false
		$Celso12.visible = false
		$Celso13.visible = false
		$Celso14.visible = true
		$Celso15.visible = false
		$Celso16.visible = false
		$Celso17.visible = false
	elif currentCelso == 15:
		$Celso01.visible = false
		$Celso02.visible = false
		$Celso03.visible = false
		$Celso04.visible = false
		$Celso05.visible = false
		$Celso06.visible = false
		$Celso07.visible = false
		$Celso08.visible = false
		$Celso09.visible = false
		$Celso10.visible = false
		$Celso11.visible = false
		$Celso12.visible = false
		$Celso13.visible = false
		$Celso14.visible = false
		$Celso15.visible = true
		$Celso16.visible = false
		$Celso17.visible = false
	elif currentCelso == 16:
		$Celso01.visible = false
		$Celso02.visible = false
		$Celso03.visible = false
		$Celso04.visible = false
		$Celso05.visible = false
		$Celso06.visible = false
		$Celso07.visible = false
		$Celso08.visible = false
		$Celso09.visible = false
		$Celso10.visible = false
		$Celso11.visible = false
		$Celso12.visible = false
		$Celso13.visible = false
		$Celso14.visible = false
		$Celso15.visible = false
		$Celso16.visible = true
		$Celso17.visible = false
	elif currentCelso == 17:
		$Celso01.visible = false
		$Celso02.visible = false
		$Celso03.visible = false
		$Celso04.visible = false
		$Celso05.visible = false
		$Celso06.visible = false
		$Celso07.visible = false
		$Celso08.visible = false
		$Celso09.visible = false
		$Celso10.visible = false
		$Celso11.visible = false
		$Celso12.visible = false
		$Celso13.visible = false
		$Celso14.visible = false
		$Celso15.visible = false
		$Celso16.visible = false
		$Celso17.visible = true
		
	


# Incrementa o index do personagem selecionado
func increase():
	if currentCelso < 17:
		currentCelso += 1
		

# Diminui o index do personagem selecionado 
func decrease():
	if currentCelso > 1:
		currentCelso -= 1


func _on_Next_pressed():
	# Some com o botão de próximo quando chega no último celso, com uma color rect por cima
	if currentCelso == 16:
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


# Seleciona versão 5 do Celso
func _on_Celso05_pressed():
	Global.playerDir = celso5
	go_to_tutorial()


# Seleciona versão 6 do Celso
func _on_Celso06_pressed():
	Global.playerDir = celso6
	go_to_tutorial()


# Seleciona versão 7 do Celso
func _on_Celso07_pressed():
	Global.playerDir = celso7
	go_to_tutorial()


# Seleciona versão 8 do Celso
func _on_Celso08_pressed():
	Global.playerDir = celso8
	go_to_tutorial()


# Seleciona versão 9 do Celso
func _on_Celso09_pressed():
	Global.playerDir = celso9
	go_to_tutorial()


# Seleciona versão 10 do Celso
func _on_Celso10_pressed():
	Global.playerDir = celso10
	go_to_tutorial()
	

# Seleciona versão 11 do Celso
func _on_Celso11_pressed():
	Global.playerDir = celso11
	go_to_tutorial()
	

# Seleciona versão 12 do Celso
func _on_Celso12_pressed():
	Global.playerDir = celso12
	go_to_tutorial()


# Seleciona versão 13 do Celso
func _on_Celso13_pressed():
	Global.playerDir = celso13
	go_to_tutorial()


# Seleciona versão 14 do Celso
func _on_Celso14_pressed():
	Global.playerDir = celso14
	go_to_tutorial()


# Seleciona versão 15 do Celso
func _on_Celso15_pressed():
	Global.playerDir = celso15
	go_to_tutorial()


# Seleciona versão 16 do Celso
func _on_Celso16_pressed():
	Global.playerDir = celso16
	go_to_tutorial()


# Seleciona versão 17 do Celso
func _on_Celso17_pressed():
	Global.playerDir = celso17
	go_to_tutorial()
