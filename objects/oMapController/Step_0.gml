var _savedIndex = [global.mapIndex[0], global.mapIndex[1]];
if instance_exists(oCat) {
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

	//index out of range
	if global.mapIndex[0] < 0 or global.mapIndex[0] > (array_length(mapData)-1)
		or global.mapIndex[1] < 0 or global.mapIndex[1]  > (array_length(mapData[0])-1)
	{
		global.mapIndex[0] = _savedIndex[0];
		global.mapIndex[1] = _savedIndex[1];
		global.roomTransition = false;
		oCat.die()	
	}

	if global.roomTransition {
		if roomSide % 2 != 0 {
			roomSpawnX = oCat.x;	
		} else {
			roomSpawnY = oCat.y;
		}
	
		roomSpawnYsp = oCat.ysp;
		global.roomTransition = true;
		roomTransitionOnWall = oCat.onWall;
		roomTransitionOnCeiling = oCat.onCeiling;
		roomTransitionDir = oCat.dir;
	
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
}