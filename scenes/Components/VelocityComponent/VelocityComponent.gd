extends Node
class_name _VelocityComponent

@export var SPEED : int

var Vector : Vector2 # Напрвление WASD
var Velocity : Vector2

func _physics_process(delta):
	if Vector:
		Velocity = Vector * SPEED
	else:
		Velocity = Vector2.ZERO

func Move(player : CharacterBody2D):
	Vector = player.Direction
	player.velocity = Velocity
	player.move_and_slide()

	
