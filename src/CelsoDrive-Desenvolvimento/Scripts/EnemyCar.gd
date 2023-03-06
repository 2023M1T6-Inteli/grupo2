extends KinematicBody2D

var carVelocity = Global.gameBaseSpeed


func _ready():
	pass


func _physics_process(delta):
	position.y += carVelocity


func _process(delta):
	pass

