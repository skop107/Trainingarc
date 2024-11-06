extends Node2D
#Direction of player
var PLAYER_DIRECTION
#Death/Disables character movement when dead.
func death(BODY):
	print("You died")
	BODY.SPEED = 0
