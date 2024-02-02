extends Node

var hurt = preload("res://assets/audio/hurt.wav")
var jump = preload("res://assets/audio/jump.wav")

func play_sfx(sfx: String):
	var sfx_temp = null
	if sfx == "hurt":
		sfx_temp = hurt
	else:
		sfx_temp = jump
	
	if sfx_temp != null:
		var asp = AudioStreamPlayer2D.new()
		asp.stream = sfx_temp
		asp.name = sfx
		asp.volume_db = -15
		add_child(asp)
		asp.play()
		await asp.finished
		asp.queue_free()
