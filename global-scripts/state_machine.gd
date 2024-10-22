extends Node
class_name StateMachine

var player : CharacterBody2D
var anim_tree : AnimationTree
var states : Dictionary

@export var init_state : State
var current_state : State

func _ready():
	if get_parent() is Unit:
		player = get_parent()
		
	if player:
		for child_player in player.get_children():
			if child_player is AnimationTree:
				anim_tree = child_player
				
	for child_machine in get_children():
		if child_machine is State:
			states[child_machine.name.to_lower()] = child_machine
			child_machine.transit.connect(transit)
			child_machine.player = player
			if anim_tree:
				child_machine.playback = anim_tree["parameters/playback"]
	
	if init_state:
		init_state.Enter()
		current_state = init_state
	
func _process(delta):
	current_state.Update(delta)
	
	
func _physics_process(delta):
	current_state.PhisicsUpdate(delta)
	
	
func transit(cur_state : State,new_state_name : String):
	if !cur_state:
		return
	
	if current_state != cur_state:
		return
	
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	
	current_state.Exit()
	new_state.Enter()
	current_state = new_state
