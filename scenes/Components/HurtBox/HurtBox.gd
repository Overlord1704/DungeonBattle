extends Node2D
class_name _HurtBoxComponent

signal take_damage

var health : int 
var object : Unit

func _ready() -> void:
	if get_parent() is Unit:
		health = get_parent().health
		object = get_parent()
	
func get_damage(damage : int,vectorp : Vector2,pushp : int):
	health -= damage
	take_damage.emit(health,vectorp,pushp)
	print(object.name + " health = " + str(health))
