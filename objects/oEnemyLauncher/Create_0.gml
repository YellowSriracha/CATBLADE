event_inherited();

launchReady = false;

startSlowmo = function(){
	if alarm[2] != -1 {
		alarm[2] *= 3;	
	}
}

endSlowmo = function(){	
	if alarm[2] != -1 {
		alarm[2] = round(alarm[2]/3);	
	}
}