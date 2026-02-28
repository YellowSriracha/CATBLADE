///@description Ends slash animation
grav = defaultgrav;
slashing = false;
if onWall{
	stateChange(PlayerState.WALL);
} else if onCeiling{
	stateChange(PlayerState.CEILING);
} else if onGround() {
	stateChange(PlayerState.GROUND);
} else {
	stateChange(PlayerState.AIR);	
}