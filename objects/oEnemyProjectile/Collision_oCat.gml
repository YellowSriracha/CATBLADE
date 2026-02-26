if !collided{
	collided = true;
	if !oCat.slashing {
		oCat.die(scrVectorAngle(velocity.x,velocity.y));
	}
}