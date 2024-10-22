extends State
class_name Idle_Enemy

@export var follow_zone_lenght : float

var move_direction : Vector2
var wander_time : float  # Время блуждания
var current_player : Unit

func randomize_wander():
	move_direction = Vector2(randf_range(-1,1),randf_range(-1,1)).normalized()
	wander_time = randf_range(1,3)

func Init():
	randomize_wander()
	current_player = get_tree().get_first_node_in_group("Players")
	
func WanderTime(delta : float):
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander()

func DirectionToPlayer(delta : float):
	player.velocity = move_direction*player.speed_unit
	var direction = current_player.global_position - player.global_position

	if direction.length() <= follow_zone_lenght:
		transit.emit(self,"Follow")
