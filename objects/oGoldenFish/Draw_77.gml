if framesSinceCollected > 500{
	global.roomTransition = false;
	global.mapController.lookup = true;
	room_goto(RoomCredits);	
}