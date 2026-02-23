function scrStartSlowMo(){
	for (var i = 0; i < instance_number(oEnemy); i++){
		var _this = instance_find(oEnemy,i);
		_this.startSlowmo();
	}
}

function scrEndSlowMo(){
	for (var i = 0; i < instance_number(oEnemy); i++){
		var _this = instance_find(oEnemy,i);
		_this.endSlowmo();
	}
}