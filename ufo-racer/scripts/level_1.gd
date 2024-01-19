extends Node2D


func _on_maze_body_exited(body):
	#print("UFO salio del laberinto")
	get_tree().reload_current_scene()
