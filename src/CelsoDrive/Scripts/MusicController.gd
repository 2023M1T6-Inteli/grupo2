extends Node2D

# Carrega AudioStreamPlayers da tela como variáveis
onready var forroAudio = $ForroAudio
onready var sertanejoAudio = $SertanejoAudio
onready var rockAudio = $RockAudio
onready var sambaAudio = $SambaAudio


func _ready():
	play_music() # Reproduz música

func play_music():
	# Reproduz o áudio do forró
	if Global.selectedMusic == 0:
		sertanejoAudio.stop()
		rockAudio.stop()
		sambaAudio.stop()
		forroAudio.play()
	# Reproduz o áudio do sertanejo
	if Global.selectedMusic == 1:
		forroAudio.stop()
		rockAudio.stop()
		sambaAudio.stop()
		sertanejoAudio.play()
	# Reproduz o áudio do rock
	if Global.selectedMusic == 2:
		forroAudio.stop()
		sertanejoAudio.stop()
		sambaAudio.stop()
		rockAudio.play()
	# Reproduz o áudio do samba
	if Global.selectedMusic == 3:
		forroAudio.stop()
		sertanejoAudio.stop()
		rockAudio.stop()
		sambaAudio.play()
		

# Encerra todas as músicas
func stop_music():
	forroAudio.stop()
	sertanejoAudio.stop()
	rockAudio.stop()
	sambaAudio.stop()
