extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Caso o usuário escolha a comida saudável -> healthyFood = true
func _on_HealthyButton_pressed():
	Global.healthyFood = true

# Caso o usuário escolha a comida não saudável -> healthyFood = false
func _on_NotHealthyButton_pressed():
	Global.healthyFood = false
