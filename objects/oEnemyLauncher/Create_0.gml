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

aggroCheck = function(){
	if aggroCondition() {
		scrPlaySound(sfxAlert);
		return true;
	}
}

die = function(){
	dieDefault();
	for(var i = 0; i < 4;i++){
		with instance_create_layer(x,y,layer,oEnemyPiece){
			image_index = i;
			xsp = ((i % 2)*-1) * -1;
			ysp = i < 2 ? -1 : 0;
		}
	}
}
