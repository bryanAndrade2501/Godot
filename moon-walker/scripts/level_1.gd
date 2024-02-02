extends Node2D

@export var next_level: PackedScene = null
@export var level_time = 7
@export var is_final_level: bool = false

@onready var player = $Player
@onready var start_scenario = $Start
@onready var exit_area = $ExitArea
@onready var deathzone = $Deathzone
@onready var ui_layer = $UILayer

var timer_node = null
var time_left
var winner = false


func _ready():
	#crear el timer
	timer_node = Timer.new()
	timer_node.name = 'Level timer'
	timer_node.wait_time = 1
	timer_node.timeout.connect(_on_level_timeout)
	add_child(timer_node)
	time_left = level_time

	timer_node.start()
	ui_layer.set_time_label(time_left)
	
	player.global_position = start_scenario.get_spawn_position()
	deathzone.body_entered.connect(_on_deathzone_body_entered)
	exit_area.body_entered.connect(_on_exit_body_entered)
	var traps = get_tree().get_nodes_in_group("traps")
	for trap in traps:
		#trap.connect("touch_player", _on_saw_touch_player())
		trap.touch_player.connect(_on_saw_touch_player)

func _on_level_timeout():
	if not winner:
		ui_layer.set_time_label(time_left)
		time_left -= 1
		if time_left < 0:
			reset_player()
			time_left = level_time

func _on_exit_body_entered(body):
		if body is Player:
			winner = true
			exit_area.animate()
			body.set_active(false)
			if is_final_level || next_level == null:
				ui_layer.show_win_screen()
			if next_level != null:
				await get_tree().create_timer(1.5).timeout
				get_tree().change_scene_to_packed(next_level)

func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()

func _on_deathzone_body_entered(body):
	reset_player()

func _on_saw_touch_player():
	reset_player()

func reset_player():
	AudioPlayer.play_sfx("hurt")
	player.velocity = Vector2.ZERO
	#player.global_position = start_position.global_position
	player.global_position = start_scenario.get_spawn_position()
	





