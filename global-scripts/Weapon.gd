extends Node
class_name Weapon

@export var damage : int = 10
@export var speed_attack : int
@export var push_power : int # Отталкивание
@export var bleeding : int

@export var HitBox : _HitBoxComponent
@export var Trajectory : PathFollow2D
@export var HitBoxCollision : CollisionShape2D

@onready var Sprite = $Path2D/PathFollow2D/Sprite2D.region_rect

var Attacking : bool
var dir : int

func _ready() -> void:
	HitBox.damage = damage
	HitBox.push_power = push_power
	HitBoxCollision.disabled = true

func _physics_process(delta: float) -> void:
	if Attacking:
		Trajectory.progress += speed_attack*dir
		HitBoxCollision.disabled = false
	if Trajectory.progress_ratio==1 or Trajectory.progress_ratio==0:
		HitBoxCollision.disabled = true

func Attack():
	Attacking = true
	if Trajectory.progress_ratio == 0:
		dir = 1
	elif Trajectory.progress_ratio == 1:
		dir = -1
