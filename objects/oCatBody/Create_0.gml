ysp = -2;
xsp = random_range(-2,2);
angle = random_range(-90,90)


t = 0;

setDirection = function(_angle, _speed = random_range(2,3)){
	xsp = lengthdir_x(_speed,_angle);
	ysp = lengthdir_y(_speed,_angle);

}