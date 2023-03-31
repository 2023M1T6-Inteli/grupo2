extends Node

var gameBaseSpeed := 5 # Rapidez base utilizada nos minigames
var points := 0 # Variável utilizada para a pontuação do jogo
var choices := [] # Array que recebe os dados de cada escolha. 1 = ruim, 0 = boa
var energy := 4 # Valor da barra de energia, usada na HUD
var pausedGame = false # Variável de parada para o minigame do tinhoso
var selectedMusic := 0 # O = forró, 1 = sertanejo, 2 = rock e 3 = samba
var selectedLanguage := 0 # 0 = português, 1 = inglês e 2 = espanhol
var playerDir = "res://Scenes/Player01.tscn" # Caminho da cena do personagem selecionado
var playerPosition : Vector2 # Posição de Spawn do personagem em cada cena
var level : int # Variável para identificar a fase atual
var insideHouseDialog := false # Variável de controle para não repetir o diálogo inicial na casa
var interactedFreezer := false # Variável de controle para não repetir a interação da geladeira
var interactedTable := false # Variável de controle para não repetir a interação da mesa
var interactedPhone := false # Variável de controle para não repetir a interação do celular
var interactedBed := false # Variável de controle para não repetir a interação da cama
var visibleTruck := false # Variável para exibir ou não o caminhão fora da casa
var checklistTutorial := false # Variável de controle para não repetir o diálogo do checklist

# Variáveis para controlar debuffs
var alcohol : bool # caso true, sofrerá debuff de álcool
var slept : bool # caso false, sofrerá debuff de sono
var mutedPhone : bool = false # caso false, sofrerá debuff de notificação na tela
var healthyFood : bool # caso false, sofrerá debuff de energia reduzindo mais rapidamente
var achievements : int # quantidade de medalhas do jogador

var timer = Timer.new() # tempo para controlar a barra de energia
var waitTime = 120 # Tempo de espera entre cada timeout


# Cria e conecta o timer quando inicia o jogo
func _ready():
	timer.connect("timeout", self, "on_timer_timeout")
	create_timer()


# Diminui a barra de energia e recria o timer
func on_timer_timeout():
	energy -= 1
	remove_child(timer)
	create_timer()
	
	if energy == 0:
		pause_scene()


# Função para chamar a cena de pause
func pause_scene():
	PauseScene.show_pause(true)
	get_tree().paused = true


# Função para criar e adicionar o timer como filho
func create_timer():
	timer.wait_time = waitTime
	add_child(timer)
	timer.start()
