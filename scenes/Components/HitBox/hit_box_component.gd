extends Node2D
class_name _HitBoxComponent

var damage : int
var push_power : int

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is _HurtBoxComponent:
		area.get_parent().get_damage(damage,self.global_position,push_power)
