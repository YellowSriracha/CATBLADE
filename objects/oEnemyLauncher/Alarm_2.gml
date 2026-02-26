launchReady = false;
var _this = instance_create_layer(x,y,layer,oEnemyProjectile,{depth:other.depth-1});
with _this {
	
	var _yOffset = 0;
	if oCat.ysp > 0 {
		_yOffset = 20;	
	} else if oCat.ysp < 0 {
		_yOffset = -20;
	}
	
	var _xOffset = 0;
	if oCat.xsp > 0 {
		_xOffset = 30;	
	} else if oCat.xsp < 0 {
		_xOffset = -30;
	}
	
	angle = point_direction(x,y,(oCat.x+_xOffset),(oCat.y + _yOffset));
	
	x += lengthdir_x(5,angle);
	y += lengthdir_y(5,angle);
	setVelocity();
	var _pitch =global.slowmoActive ? 0.5:1;
	scrPlaySound(sfxLaser,,,_pitch);
}