event_inherited();

DEFAULTSPD = 5;
maxspd = DEFAULTSPD;

DEFAULTSTEERINGFORCE = 0.2;
steeringforce = DEFAULTSTEERINGFORCE;

velocity = new Vector(0,0);
steering = new Vector(0,0);
target = new Vector(oCat.x,oCat.y);
position = new Vector(x,y);
startingPosition = {x,y};

aggroCheck = function(){
	if aggroCondition(){
		var _angle = point_direction(x,y,oCat.x,oCat.y);
		velocity.set(lengthdir_x(maxspd,_angle),lengthdir_y(maxspd,_angle))
		return true;
	}
	return false;
}

aggroCondition = function(){
	return abs(x-oCat.x) < 150;
}

function steer(){
	var _vec = new Vector(target.x,target.y);
	_vec.subtract(position);
	_vec.setMagnitude(maxspd);
	_vec.subtract(velocity);
	_vec.setMagnitude(steeringforce);
	velocity.add(_vec);
	velocity.setMagnitude(maxspd);
		
}

startSlowmo = function() {
	maxspd = DEFAULTSPD/3;
	steeringforce = DEFAULTSTEERINGFORCE / 9;
}

endSlowmo = function() {
	maxspd = DEFAULTSPD;
	steeringforce = DEFAULTSTEERINGFORCE;
}

onPlayerReset = function(){
	t= 0;
	alertAlpha = 0;
	alertFading = false;
	x = startingPosition.x;
	y = startingPosition.y;
	image_angle = 1;
	image_alpha = 1;
	aggro = false;
	alive = true;
	velocity.set(0,0);
	steering.set(0,0);
	target.set(oCat.x,oCat.y);
	position.set(x,y);
	startingPosition = {x,y};
	
}