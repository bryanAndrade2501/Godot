extends StaticBody2D

@onready var starting_point = $StartingPosition

func get_spawn_position():
	return starting_point.global_position
