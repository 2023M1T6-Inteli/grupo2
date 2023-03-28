extends Area2D

signal exploded(currentContent, currentPosition)
var content: String = "Boa noite\nde sono"
var initialPosition
var value


func _ready():
	initialPosition = global_position
	$Content.text = content


func _on_Check_pressed():
	emit_signal("exploded", String($Content.text), global_position)
	queue_free()
