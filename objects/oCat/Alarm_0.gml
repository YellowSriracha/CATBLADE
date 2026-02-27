///@description Ends slash animation
grav = defaultgrav;
slashing = false;
if onWall{
	stateChange(PlayerState.WALL);
} else {
	stateChange(PlayerState.CEILING);
}