event_inherited();
aggro = true;
image_index = 3;
alarm[2] = 30;

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