function scrOnPause(){
	oCat.pause();
	var _num = instance_number(oEnemy);
	for (var i = 0; i < instance_number(oEnemy); i++){
		var _this = instance_find(oEnemy,i);
		_this.onPause();
	}
}

function scrOnUnpause(){
	oCat.unpause();
	var _num = instance_number(oEnemy);
	for (var i = 0; i < instance_number(oEnemy); i++){
		var _this = instance_find(oEnemy,i);
		_this.onUnpause();
	}
	
}