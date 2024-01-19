extends CharacterBody2D

@export var speed = 400
var rocket_scene
#@onready var rocket_container  = get_node("Rocket Container")
@onready var rocket_container = $"Rocket Container"

signal took_damage

func _ready():
	rocket_scene = preload("res://scenes/rocket.tscn")
	#rocket_container = get_node("Rocket Container")

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()
func _physics_process(delta):
	velocity = Vector2(0,0)
	#move_and_slide()
	
	if Input.is_action_pressed("move-up"):
		velocity=Vector2(0,-speed)
	if Input.is_action_pressed("move-down"):
		velocity = Vector2(0,speed)
	if Input.is_action_pressed("move-right"):
		velocity = Vector2(speed,0)
	if Input.is_action_pressed("move-left"):
		velocity = Vector2(-speed,0)
		
	move_and_slide()
	
	var size = get_viewport_rect().size
	
#	if global_position.x < 0:
#		global_position.x = 0
#	if global_position.x > size.x:
#		global_position.x = size.x
#	if global_position.y < 0:
#		global_position.y = 0
#	if global_position.y > size.y:
#		global_position.y = size.y
	
	#clampf(120,0,-50)
	
#	global_position.x = clampf(global_position.x, 0, size.x)	
#	global_position.y = clampf(global_position.y, 0, size.y)	

	global_position = global_position.clamp(Vector2(0,0), size)

func shoot():
	var rocket_instance = rocket_scene.instantiate()
	
	#add_child(rocket_instance)
	rocket_container.add_child(rocket_instance)
	rocket_instance.global_position = global_position
	rocket_instance.global_position.x += 50
	

func take_damage():
	
	emit_signal("took_damage")
	
	


