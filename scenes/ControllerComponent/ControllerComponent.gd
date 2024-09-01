extends Node
class_name _ControllerComponent

signal dir_wasd

var Direction : Vector2

func _physics_process(delta):
	Direction = Input.get_vector("A","D","W","S")
	dir_wasd.emit(Direction)
