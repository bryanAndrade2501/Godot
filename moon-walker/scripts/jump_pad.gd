extends Area2D

@onready var jump_pad_animation= $AnimatedSprite2D

@export var jumpForce = 200
func _on_body_entered(body):
	if body is Player:
		jump_pad_animation.play("jump")
		body.jump(jumpForce)
		
