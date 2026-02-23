event_inherited();

target.set(oCat.x,oCat.y);
image_index = aggro ? 1 : 0;

if alive and !paused{
	if aggro{
		steer();
		x += velocity.x;
		y += velocity.y;
		position.set(x,y)
		image_angle = -scrVectorAngle(velocity.x,velocity.y) +90
		if image_angle > 360 image_angle -= 360;
	}
	
	if place_meeting(x,y,oCat.collidables) {
		instance_create_layer(x,y,layer,oExplosion);
		alive = false;
		image_alpha = 0;
	}
}