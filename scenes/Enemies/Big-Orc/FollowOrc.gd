extends Follow_Enemy


func Enter():
	Init()

func PhisicsUpdate(delta : float):
	RunToPlayer(delta)
