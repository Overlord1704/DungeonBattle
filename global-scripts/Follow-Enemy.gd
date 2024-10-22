extends State
class_name Follow_Enemy

var current_player : Unit
@export var follow_zone_lenght : float

func Init():
	current_player = get_tree().get_first_node_in_group("Players")

func RunToPlayer(delta : float):
	var direction = current_player.global_position - player.global_position
	
	### В IDLE И FOLLOW ЭТО ЗНАЧЕНИЕ ДОЛЖНО БЫТЬ ОДИНАКОВЫМ!
	if direction.length() <= follow_zone_lenght:
		player.velocity = direction.normalized() * player.speed_unit
	
	if direction.length() > follow_zone_lenght:
		transit.emit(self,"Idle")
