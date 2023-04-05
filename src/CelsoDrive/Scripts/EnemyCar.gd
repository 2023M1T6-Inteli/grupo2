extends Area2D

var carSpeed = Global.gameBaseSpeed # Rapidez do movimento
signal colide # sinal para captar a colisão
onready var carTypes = $CarSprite.frames.get_animation_names() # seleciona as animações do carro


func _ready():
	randomize()
	$CarSprite.animation = carTypes[randi() % 3] # randomiza a animação (cor) do carro


func _physics_process(_delta):
	# Responsável por mover o carro verticalmente
	position.y += carSpeed


func _on_EnemyCar_body_entered(_body):
	# Emite "sinal" de pause quando colide com o caminhão
	Global.pausedGame = true
	emit_signal("colide")
	$CarCrash.play() # som de batida


# Exclui nó após sair da tela
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
