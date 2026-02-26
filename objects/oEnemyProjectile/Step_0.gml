
if !global.paused{
	if !collided{
		if !global.slowmoActive{
			x += velocity.x;
			y += velocity.y;
		} else {
			x += velocity.x/3;
			y += velocity.y/3;
		}
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
}


if !global.paused {
	image_speed = global.slowmoActive ? 0.33:1;
} else {
	image_speed = 0;
}