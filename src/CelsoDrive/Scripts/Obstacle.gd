extends Area2D

var obstacleSpeed = Global.gameBaseSpeed # Rapidez do movimento
signal colide


func _physics_process(_delta):
	# Responsável por mover o carro verticalmente
	position.y += obstacleSpeed


func _on_TireObstacle_body_entered(_body):
	# Emite "sinal" de pause quando o pneu colide com o caminhão
	Global.pausedGame = true
	emit_signal("colide")


func _on_TrunkObstacle_body_entered(_body):
	# Emite "sinal" de pause quando o tronco colide com o caminhão
	Global.pausedGame = true
	emit_signal("colide")


func _on_ConeObstacle_body_entered(_body):
	# Emite "sinal" de pause quando o cone colide com o caminhão
	Global.pausedGame = true
	emit_signal("colide")
