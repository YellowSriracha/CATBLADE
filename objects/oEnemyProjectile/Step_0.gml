if !collided{
	x += velocity.x;
	y += velocity.y;
	position.set(x,y);
	image_angle = angle;
	image_index = 0;
	if place_meeting(x,y,oCat.collidables) {
		collided = true;
		image_angle = 0;
		image_index = 1;
	}
} else {
	if image_index >= 5 {
		instance_destroy();	
	}
}
