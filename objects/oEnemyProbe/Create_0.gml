event_inherited();

path = Path1;

defaultPathSpeed = 2;
path_speed = defaultPathSpeed;
storedPathSpeed = path_speed;

path_start(path,path_speed,path_action_continue,0);

aggroCheck = function (){
	return false;
}

startSlowmo = function(){
	path_speed = defaultPathSpeed/3;
}
	
endSlowmo = function(){
	path_speed = defaultPathSpeed;
}

onPause = function(){
	storedPathSpeed = path_speed;
	path_speed = 0;	
	paused = true;
}

onUnpause = function(){
	path_speed = storedPathSpeed;	
	paused = false;
}