extends RigidBody2D

# Valores da rapidez dos carros
var minSpeed = 150
var maxSpeed = 300


# Randomiza a cor dos caminhões que aparecem na tela de início
func _ready():
	randomize()
	var truckTypes = $TruckSprite.frames.get_animation_names()
	$TruckSprite.animation = truckTypes[randi() % truckTypes.size()]	


# Apaga os carros da memória do jogo quando saem da tela
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
