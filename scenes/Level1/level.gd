extends Node2D

@onready var player := $Player

func _ready() -> void:
	### УДАЛЕНИЕ ЮНИТОВ СО СЦЕНЫ
	for child in get_children():
		if child is Unit:
			child.destroy_object.connect(Destroy_Unit)

func Destroy_Unit(obj : Unit):
	obj.queue_free()
