if !collided{
	collided = true;
	if !oCat.slashing {
		with oCat{
			//die(scrVectorAngle(other.velocity.x,other.velocity.y));
			die();
		}
	}
}