extends CanvasLayer


# Muda para a cena da visão exterior da casa
func _on_TextureButton_pressed():
	return get_tree().change_scene("res://Scenes/OutsideHouse.tscn")
