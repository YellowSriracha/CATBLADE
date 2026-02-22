var _savedIndex = [global.mapIndex[0], global.mapIndex[1]];

if oCat.x > room_width {
	global.mapIndex[1] += 1;
	global.roomTransition = true;
	roomSide = 2;

} else if oCat.x < 0 {
	global.mapIndex[1] -= 1;
	global.roomTransition = true;
	roomSide = 0;

} else if oCat.y > room_height {
	global.mapIndex[0] += 1;
	global.roomTransition = true;
	roomSide = 1;

} else if oCat.y < 0 {
	global.mapIndex[0] -= 1;
	global.roomTransition = true;
	roomSide = 3;
}

if global.roomTransition {
	if global.mapController.roomSide % 2 != 0 {
		global.mapController.roomSpawnX = oCat.x;	
	} else {
		global.mapController.roomSpawnY = oCat.y;
	}
	
	global.mapController.roomSpawnYsp = oCat.ysp;
	global.roomTransition = true;
	global.mapController.roomTransitionOnWall = oCat.onWall;
	
	var _room = mapData[global.mapIndex[0]][global.mapIndex[1]];
	if _room == noone {
		global.mapIndex[0] = _savedIndex[0];
		global.mapIndex[1] = _savedIndex[1];
		global.roomTransition = 0;
		oCat.die()	
	} else {
		room_goto(_room)
	}
}
