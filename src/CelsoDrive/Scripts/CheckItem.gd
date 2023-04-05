extends Area2D

signal exploded(currentContent, currentPosition) # Sinal para tratar item após ser clicado
var content: String = "Boa noite\nde sono" # Label do item de tutorial
var initialPosition # Variável para a posição inicial do item


func _ready():
	# Define a posição do item e o conteúdo da Label
	initialPosition = global_position
	$Content.text = content


# Emite sinal quando o item recebe um clique.
func _on_Check_pressed():
	emit_signal("exploded", String($Content.text), global_position)
	queue_free()
