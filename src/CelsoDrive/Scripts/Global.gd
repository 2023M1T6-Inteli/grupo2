extends Node

var gameBaseSpeed = 5
var points = 0
var choices := [] # Array que recebe os dados de cada escolha. 1 = ruim, 0 = boa
var energy := 4 # Valor da barra de energia, usada na HUD
var pausedGame = false # Variável de parada para o minigame do tinhoso
var selectedMusic = 0 # O = forró, 1 = sertanejo, 2 = rock e 3 = samba
var selectedLanguage = 0 # 0 = português, 1 = inglês e 2 = espanhol
