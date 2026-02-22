event_inherited();

target.set(oCat.x,oCat.y);

if alive{
	if aggro{
		image_index = 1;
		steer();
		x += velocity.x;
		y += velocity.y;
		position.set(x,y)
		image_angle = -scrVectorAngle(velocity.x,velocity.y) +90
		if image_angle > 360 image_angle -= 360;
	} else {
		image_index = 0;	
	}

	if place_meeting(x,y,oCat.collidables) {
		instance_create_layer(x,y,layer,oExplosion);
		alive = false;
		image_alpha = 0;
	}
}