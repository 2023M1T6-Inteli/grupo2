extends Node2D

const caminhao = preload("res://Scenes/CaminhaoInicio.tscn")


func _ready():
	randomize()


# Direciona para a visão exterior da casa
func _on_JogarButton_pressed():
	get_tree().change_scene("res://Scenes/CasaExterior.tscn")


# Direciona para o menu de opções
func _on_ConfigButton_pressed():
	get_tree().change_scene("res://Scenes/MenuOpcoes.tscn")


func _on_TimerCaminhao_timeout():
	$PathEsquerda/PathFollow2D.offset = randi()
	$PathDireita/PathFollow2D.offset = randi()
	var novoCaminhaoEsquerda = caminhao.instance()
	var novoCaminhaoDireita = caminhao.instance()
	add_child(novoCaminhaoEsquerda)
	add_child(novoCaminhaoDireita)
	novoCaminhaoEsquerda.position = $PathEsquerda/PathFollow2D.position
	novoCaminhaoDireita.position = $PathDireita/PathFollow2D.position
	novoCaminhaoEsquerda.linear_velocity = Vector2(0, rand_range(novoCaminhaoEsquerda.minSpeed, novoCaminhaoEsquerda.maxSpeed))
	novoCaminhaoDireita.linear_velocity = Vector2(0, rand_range(novoCaminhaoDireita.minSpeed, novoCaminhaoDireita.maxSpeed))
	
