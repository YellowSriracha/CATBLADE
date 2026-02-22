function scrGetRoomIndex(_room){
	for (i = 0; i < array_length(global.mapController.mapData); i++){
		for(j = 0; j < array_length(global.mapController.mapData[i]); j++){
			var _this = global.mapController.mapData[i][j];
			if _this = _room {
				return [i,j];	
			}
		}
	}
	return [0,1];
}