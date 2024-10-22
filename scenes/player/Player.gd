extends Unit

@export var VelocityComponent : _VelocityComponent
@export var ControllerComponent : _ControllerComponent
@export var HurtBoxComponent : _HurtBoxComponent
@export var WeaponOne : PackedScene
@export var WeaponTwo : PackedScene

var Direction : Vector2
var Weapons : Array[PackedScene]
var Mouse_move : bool

var current_weapon : Weapon
var new_weapon : Weapon

func _ready():
	ControllerComponent.dir_wasd.connect(get_direction)
	ControllerComponent.mouse_move.connect(is_move)
	ControllerComponent.attack.connect(Weapon_Attack)
	HurtBoxComponent.take_damage.connect(Take_Damage)
	
	init_weapon()
	
func init_weapon():
	Weapons.append(WeaponOne)
	Weapons.append(WeaponTwo)
	current_weapon = Weapons[0].instantiate()
	add_child(current_weapon)

func _physics_process(delta):
	VelocityComponent.Move(self)
	if current_weapon and Mouse_move:
		current_weapon.look_at(get_global_mouse_position())
	
func get_direction(dir : Vector2):
	Direction = dir
	
func is_move(n : bool):
	Mouse_move = n

### ВЫЗЫВАЕТСЯ ИЗ ЗОН ПОДНЯТИЯ ОРУЖИЯ
func Add_weapon(weapon: PackedScene) -> void: 
	if Weapons.size() < 2:
		Weapons.append(weapon)
		if Weapons.size() == 1:
			current_weapon = weapon.instantiate()
			add_child(current_weapon)
	

func Weapon_Attack(button : int):
	### Если нет второго оружия - крашится игра
	if Weapons.size() == 2:
		new_weapon = Weapons[button-1].instantiate()
	
		if current_weapon.name != new_weapon.name: # Если текущее оружие не соответствует кнопке мыши
			current_weapon.queue_free()
			current_weapon = new_weapon
			add_child(current_weapon)
			current_weapon.look_at(get_global_mouse_position()) # Пришлось добавить костыль,чтобы новое оружие не появлялось  за спиной
			current_weapon.Attack()
		else:
			current_weapon.Attack()

func Take_Damage(new_health : int,vector_punch : Vector2,push_power : int):
	health = new_health
	
	var knockback_direction = vector_punch.direction_to(self.global_position)
	var knockback = knockback_direction*push_power
	
	global_position += knockback
