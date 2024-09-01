extends CharacterBody2D

@export var VelocityComponent : _VelocityComponent
@export var ControllerComponent : _ControllerComponent

var Direction : Vector2

func _ready():
	ControllerComponent.dir_wasd.connect(get_direction)

func _physics_process(delta):
	VelocityComponent.Move(self)

func get_direction(dir : Vector2):
	Direction = dir
	
