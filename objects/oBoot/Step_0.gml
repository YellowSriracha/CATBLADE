//room_goto(Room1)

//global.mapController.lookup = true;
if global.htmlMode {
	room_goto(rmClickToStart);
} else {
	oMapController.lookup = true;
	room_goto_next();
}