image_speed = 0;


function sideCheck(){
	return global.mapController.roomSide == image_index;
}

conditional = function(){
	return true;	
}

isActive = function(){
	if !sideCheck() or !conditional() {
		return false;	
	}
	return true;
}

function getPosition(){
	return {x,y};
}

