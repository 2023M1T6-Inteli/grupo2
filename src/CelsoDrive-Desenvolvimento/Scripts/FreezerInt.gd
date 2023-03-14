extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Caso o usuário escolha o suco -> muda alcohol para false
func _on_ButtonJuice_pressed():
	Global.alcohol = false;

# Caso o usuário escolha a bebida alcoolica -> muda alcohol para true
func _on_Button51_pressed():
	Global.alcohol = true;
