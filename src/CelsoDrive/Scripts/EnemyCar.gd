extends Area2D

var carSpeed = Global.gameBaseSpeed # Rapidez do movimento
signal colide
onready var carTypes = $CarSprite.frames.get_animation_names()


func _ready():
	randomize()
	$CarSprite.animation = carTypes[randi() % 3]


func _physics_process(_delta):
	# Responsável por mover o carro verticalmente
	position.y += carSpeed


func _on_EnemyCar_body_entered(_body):
	# Emite "sinal" de pause quando colide com o caminhão
	Global.pausedGame = true
	emit_signal("colide")
	print(carTypes)
