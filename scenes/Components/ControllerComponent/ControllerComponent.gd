extends Node
class_name _ControllerComponent

signal dir_wasd
signal attack
signal mouse_move

var Direction : Vector2

func _physics_process(delta):
	Direction = Input.get_vector("A","D","W","S")
	dir_wasd.emit(Direction)
	mouse_move.emit(false)

func _input(event: InputEvent) -> void:
	if event is InputEventMouse:
		if event is InputEventMouseButton:
			if event.button_mask == MOUSE_BUTTON_LEFT or event.button_mask == MOUSE_BUTTON_RIGHT:
				attack.emit(event.button_mask)

				
	if event is InputEventMouseMotion:
		mouse_move.emit(true)
