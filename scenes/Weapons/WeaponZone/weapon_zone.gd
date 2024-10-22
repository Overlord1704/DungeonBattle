extends Area2D
class_name Take_Zone

@export var sword : PackedScene

func _ready() -> void:
	$Sprite2D.texture = sword.instantiate().get_node("Path2D/PathFollow2D/Sprite2D").texture


func _on_body_entered(body: Node2D) -> void:
	if body is Unit:
		body.Add_weapon(sword)
		queue_free()
