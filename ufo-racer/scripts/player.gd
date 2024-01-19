extends RigidBody2D

const force = 150

func _ready():
	print("dentro de ready")
	#Speed decreased with time
	#apply_force(Vector2(200,0))
	#apply_impulse(Vector2(0,-100))
	
func _process(delta):
	pass

func _physics_process(delta):
	#apply_force(Vector2(500,0))
	if(Input.is_action_pressed("move-rigth")):
		apply_force(Vector2(force,0))
	elif(Input.is_action_pressed("move-left")):
		apply_force(Vector2(-force,0))
	elif(Input.is_action_pressed("move-up")):
		apply_force(Vector2(0,-force))
	elif(Input.is_action_pressed("move-down")):
		apply_force(Vector2(0,force))
	
	

