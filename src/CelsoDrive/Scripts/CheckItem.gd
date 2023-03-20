extends Area2D

signal exploded


func _on_AnimatedSprite_pressed():
	emit_signal("exploded")
