extends Area2D

var carVelocity = Global.gameBaseSpeed


func _ready():
	pass


func _physics_process(delta):
	position.y += carVelocity


func _on_EnemyCar_body_entered(body):
	Global.pausedGame = true
