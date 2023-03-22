extends CanvasLayer


# Atualiza score
func _process(_delta):
	$ScoreLabel.text = String(Global.points)


# Sai da tela do run game
func _on_TextureButton_pressed():
	return get_tree().change_scene("res://Scenes/OutsideHouse.tscn")
