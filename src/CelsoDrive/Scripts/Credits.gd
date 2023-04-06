extends Node2D


func _ready():
	if Global.selectedLanguage == 1:
		$CreditsLabel.text = "CREDITS"
	elif Global.selectedLanguage == 2:
		$CreditsLabel.text = "CREDITOS"


# Retorna para a tela do menu inicial
func _on_BackButton_pressed():
	return get_tree().change_scene("res://Scenes/MainMenu.tscn")

# Aciona visibilidade das diferentes telas de créditos:

func _on_Area2DVictor_body_entered(_body):
	$Area2DVictor/CreditsVictor.visible = true

func _on_Area2DVictor_body_exited(_body):
	$Area2DVictor/CreditsVictor.visible = false

func _on_Area2DDavi_body_entered(_body):
	$Area2DDavi/CreditsDavi.visible = true
	
func _on_Area2DDavi_body_exited(_body):
	$Area2DDavi/CreditsDavi.visible = false
	
func _on_Area2DGabriel_body_entered(_body):
	$Area2DGabriel/CreditsGabriel.visible = true

func _on_Area2DGabriel_body_exited(_body):
	$Area2DGabriel/CreditsGabriel.visible = false

func _on_Area2DJoao_body_entered(_body):
	$Area2DJoao/CreditsJoao.visible = true

func _on_Area2DJoao_body_exited(_body):
	$Area2DJoao/CreditsJoao.visible = false

func _on_Area2DRafael_body_entered(_body):
	$Area2DRafael/CreditsRafael.visible = true

func _on_Area2DRafael_body_exited(_body):
	$Area2DRafael/CreditsRafael.visible = false

func _on_Area2DCaio_body_entered(_body):
	$Area2DCaio/CreditsCaio.visible = true

func _on_Area2DCaio_body_exited(_body):
	$Area2DCaio/CreditsCaio.visible = false
	
func _on_Area2DHenrique_body_entered(_body):
	$Area2DHenrique/CreditsHenrique.visible = true

func _on_Area2DHenrique_body_exited(_body):
	$Area2DHenrique/CreditsHenrique.visible = false

func _on_Area2DFabiana_body_entered(_body):
	$Area2DFabiana/CreditsFabiana.visible = true

func _on_Area2DFabiana_body_exited(_body):
	$Area2DFabiana/CreditsFabiana.visible = false

func _on_Area2DCredits_body_entered(_body):
	$Area2DCredits/CreditsInteli.visible = true
	
func _on_Area2DCredits_body_exited(_body):
	$Area2DCredits/CreditsInteli.visible = false
