extends Idle_Enemy

func Enter():
	Init()
	playback.travel("idle")

func Update(delta : float):
	WanderTime(delta)

func PhisicsUpdate(delta : float):
	DirectionToPlayer(delta)
