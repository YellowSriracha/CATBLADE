var _this = instance_create_layer(x,y,layer,oEnemyProjectile,{depth:other.depth-1});

with _this {
	
	angle = other.image_angle;
	if other.image_xscale = -1 {
		angle += 180;	
	}
	x += lengthdir_x(10,angle);
	y += lengthdir_y(10,angle);
	setVelocity();
	
	if !audio_is_playing(sfxLaser){
		var _pitch = global.slowmoActive ? 0.5:1;
		scrPlaySound(sfxLaser,,,_pitch);
	}
}

image_index = 0;
alarm[2] = global.slowmoActive ? 135 : 45