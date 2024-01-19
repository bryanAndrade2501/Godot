extends Node2D


@onready var enemy_scene = preload("res://scenes/enemy.tscn")
@onready var spawn_positions = $SpawnPossitions

func _on_timer_timeout():
	spawn()

func spawn():
	
	var spawn_pos_array = spawn_positions.get_children()
	var spawn_pos_item = spawn_pos_array.pick_random()
	
	
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = spawn_pos_item.global_position
	add_child(enemy_instance)
	
