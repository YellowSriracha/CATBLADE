alive = true;
targeted = false;
playerDir = sign(x-oCat.x);
playerXDistance = (x-oCat.x);

anchorX = x;
anchorY = y;

aggro = false;
alertAlpha = 0;
alertFading = false;

t = 0;

paused = false;

aggroCheck= function(){
	return aggroCondition();
}

aggroCondition = function(){
	return distance_to_object(oCat) < 200;
}
startSlowmo = function(){	
	return true;
}

endSlowmo = function(){	
	return true;
}

onPlayerReset = function(){
	alive = true;
	image_alpha = 1;
	return true;	
}

onPause = function(){
	paused = true;
}	

onUnpause = function(){
	paused = false;
}	

dieDefault = function(){
	alive = false;
	image_alpha = 0;
	alarm[0]=120;
}

die = function(){
	dieDefault();	
}