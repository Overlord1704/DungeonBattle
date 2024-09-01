extends State

func Enter():
	playback.travel("run")

func PhisicsUpdate(delta):
	if player.Direction == Vector2.ZERO:
		transit.emit(self,"Idle")
