extends Idle_Enemy

func Enter():
	Init()

func Update(delta : float):
	WanderTime(delta)
	
func PhisicsUpdate(delta : float):
	DirectionToPlayer(delta)
