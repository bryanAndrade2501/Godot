extends Node2D

@export var next_level: PackedScene = null

@onready var start_position = $StartPosition
@onready var player = $Player
@onready var start_scenario = $Start

@onready var exit_area = $ExitArea
@onready var deathzone = $Deathzone
func _ready():
	player.global_position = start_scenario.get_spawn_position()
	deathzone.body_entered.connect(_on_deathzone_body_entered)
	exit_area.body_entered.connect(_on_exit_body_entered)
	var traps = get_tree().get_nodes_in_group("traps")
	for trap in traps:
		#trap.connect("touch_player", _on_saw_touch_player())
		trap.touch_player.connect(_on_saw_touch_player)

func _on_exit_body_entered(body):
		if body is Player:
			exit_area.animate()
			body.set_active(false)
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
	player.velocity = Vector2.ZERO
	#player.global_position = start_position.global_position
	player.global_position = start_scenario.get_spawn_position()
	





