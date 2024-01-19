extends Area2D

@export var speed = 480
@onready var visible_notifier = $VisibleOnScreenNotifier2D

func ready():
	visible_notifier.connect("screen_exited", _on_screen_exited)

func _physics_process(delta):
	global_position.x += speed*delta


func _on_screen_exited():
	#pass # Replace with function body.
	queue_free()


func _on_area_entered(area):
	queue_free()
	area.die()


