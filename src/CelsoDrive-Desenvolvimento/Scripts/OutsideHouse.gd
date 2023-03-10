extends Node2D


# Move o personagem para dentro de casa
func _on_CelsoHouse_body_entered(body):
	return get_tree().change_scene("res://Scenes/InsideHouse.tscn")
