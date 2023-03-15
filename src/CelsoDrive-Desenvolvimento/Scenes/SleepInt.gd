extends CanvasLayer

func _ready():
	pass # Replace with function body.


# Caso o jogador escolha dormir -> sleep = true e esconde a cena
func _on_Yes_pressed():
	Global.sleep = true
	visible = false

# Caso o jogador escolha não dormir -> sleep = false e esconde a cena
func _on_No_pressed():
	Global.sleep = false
	visible = false
