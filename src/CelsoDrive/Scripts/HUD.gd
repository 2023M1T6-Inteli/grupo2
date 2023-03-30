extends CanvasLayer

func _process(_delta):
	# Verifica, a cada frame, o nível de energia
	update_energy_bar(Global.energy)
	# Mostra a pontuação na label
	$CoinLabel.text = String(Global.points)


# Altera a animação da barra de energia de acordo com o valor passado -> entre 0 e 4
func update_energy_bar(value: int):
	match value:
		4:
			$EnergySprite.play("4");
		3:
			$EnergySprite.play("3")
		2:
			$EnergySprite.play("2")
		1:
			$EnergySprite.play("1")
		0:
			$EnergySprite.play("0")
		-1:
			$EnergySprite.play("0")
