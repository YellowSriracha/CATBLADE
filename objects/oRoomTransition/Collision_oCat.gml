//Unreachable for now
if goto != noone and false{
	if side % 2 != 0 {
		global.mapController.roomSpawnX = other.x;	
	} else {
		global.mapController.roomSpawnY = other.y;
	}
	
	side+= 2;
	if side >= 4 {
		side %= 4;	
	}
	global.mapController.roomSide = side;
	global.mapController.roomSpawnYsp = other.ysp;
	global.roomTransition = true;
	global.mapController.roomTransitionOnWall = other.onWall;
	room_goto(goto);
}