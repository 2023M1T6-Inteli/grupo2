extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Caso o jogador coloque o telefone no mudo -> mutedPhone = true e esconde a cena
func _on_Yes_pressed():
	Global.mutedPhone = true
	visible = false

# Caso o jogador não coloque o telefone no mudo -> mutedPhone = false e esconde a cena
func _on_No_pressed():
	Global.mutedPhone = true
	visible = false
