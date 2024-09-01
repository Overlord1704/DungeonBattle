extends State

func Enter():
	playback.travel("idle")

func PhisicsUpdate(delta):
	if player.Direction != Vector2.ZERO:
		transit.emit(self,"Run")
