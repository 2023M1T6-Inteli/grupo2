extends Area2D

signal exploded(currentContent, currentPosition)
var content: String


func _ready():
	$Content.text = content


func _on_Check_pressed():
	emit_signal("exploded", String($Content.text), global_position)
	queue_free()
