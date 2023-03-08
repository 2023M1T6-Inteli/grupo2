extends Node2D


onready var forroAudio = $ForroAudio
onready var sertanejoAudio = $SertanejoAudio
onready var rockAudio = $RockAudio
onready var sambaAudio = $SambaAudio


func play_music():
	if Global.selectedMusic == 0:
		sertanejoAudio.stop()
		rockAudio.stop()
		sambaAudio.stop()
		forroAudio.play()
	if Global.selectedMusic == 1:
		forroAudio.stop()
		rockAudio.stop()
		sambaAudio.stop()
		sertanejoAudio.play()
	if Global.selectedMusic == 2:
		forroAudio.stop()
		sertanejoAudio.stop()
		sambaAudio.stop()
		rockAudio.play()
	if Global.selectedMusic == 3:
		forroAudio.stop()
		sertanejoAudio.stop()
		rockAudio.stop()
		sambaAudio.play()
		

func stop_music():
	forroAudio.stop()
	sertanejoAudio.stop()
	rockAudio.stop()
	sambaAudio.stop()
