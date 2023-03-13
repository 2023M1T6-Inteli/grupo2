extends Node

var gameBaseSpeed = 5 # Rapidez base utilizada nos minigames
var points = 0 # Variável utilizada para a pontuação do jogo
var choices := [] # Array que recebe os dados de cada escolha. 1 = ruim, 0 = boa
var energy := 4 # Valor da barra de energia, usada na HUD
var pausedGame = false # Variável de parada para o minigame do tinhoso
var selectedMusic = 0 # O = forró, 1 = sertanejo, 2 = rock e 3 = samba
var selectedLanguage = 0 # 0 = português, 1 = inglês e 2 = espanhol

#Variáveis para controlar debuffs
var alcohol = false # se ele escolher o álcool na geladeira -> true
var sleep = true # se ele não escolher dormir -> false
var mutedPhone = true # se ele não mutar -> false
var goodFood = true # se ele escolher a comida ruim -> false
