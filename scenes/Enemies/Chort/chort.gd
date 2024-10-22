extends Unit

@export var HurtBoxComponent : _HurtBoxComponent
@export var HitBoxComponent : _HitBoxComponent

@export var damage : int
@export var push_power : int

func _ready() -> void:
	HurtBoxComponent.take_damage.connect(Take_Damage)
	HitBoxComponent.damage = damage
	HitBoxComponent.push_power = push_power

func _physics_process(delta: float) -> void:
	if health <= 0:
		destroy_object.emit(self)
		
	move_and_slide()

func Take_Damage(new_health : int,vector_punch : Vector2,push_power : int):
	health = new_health
	
	var knockback_direction = vector_punch.direction_to(self.global_position)
	var knockback = knockback_direction*push_power
	
	global_position += knockback
	
