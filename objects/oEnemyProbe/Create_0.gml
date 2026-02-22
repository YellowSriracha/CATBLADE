event_inherited();

path = Path1;

defaultPathSpeed = 2;
path_speed = defaultPathSpeed;

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
