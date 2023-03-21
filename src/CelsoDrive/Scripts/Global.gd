extends Node

var gameBaseSpeed = 5 # Rapidez base utilizada nos minigames
var points = 0 # Variável utilizada para a pontuação do jogo
var choices := [] # Array que recebe os dados de cada escolha. 1 = ruim, 0 = boa
var energy := 4 # Valor da barra de energia, usada na HUD
var pausedGame = false # Variável de parada para o minigame do tinhoso
var selectedMusic = 0 # O = forró, 1 = sertanejo, 2 = rock e 3 = samba
var selectedLanguage = 0 # 0 = português, 1 = inglês e 2 = espanhol
var playerDir = "res://Scenes/Player01.tscn" # Caminho da cena do personagem selecionado
var playerPosition : Vector2 # Posição de Spawn do personagem em cada cena
var phase : int# Variável para identificar a fase atual

#Variáveis para controlar debuffs
var alcohol = false # caso true, sofrerá debuff de álcool
var sleep = true # caso false, sofrerá debuff de sono
var mutedPhone = true # caso false, sofrerá debuff de notificação na tela
var healthyFood = true # caso false, sofrerá debuff de energia reduzindo mais rapidamente
