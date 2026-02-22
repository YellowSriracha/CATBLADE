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
	return true;	
}