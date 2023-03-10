extends Area2D

var carSpeed = Global.gameBaseSpeed # Rapidez do movimento


func _physics_process(delta):
	# Responsável por mover o carro verticalmente
	position.y += carSpeed


func _on_EnemyCar_body_entered(body):
	# Emite "sinal" de pause quando colide com o caminhão
	Global.pausedGame = true
