extends Follow_Enemy

func Enter():
	Init()
	playback.travel("run")
	
func PhisicsUpdate(delta : float):
	RunToPlayer(delta)
