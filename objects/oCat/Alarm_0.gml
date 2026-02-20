///@description Ends slash animation

slashing = false;
if onWall{
	state = PlayerState.WALL;
} else {
	state = PlayerState.GROUND;
}