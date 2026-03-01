persistent = true;

global.gameTime = 0;
alarm[0] = 60;

global.saveData = {
	roomID: RoomIntro,
	gameTime: 0,
	unlocks : variable_clone(global.unlockables),
	collectibles : variable_clone(global.collectibles),
	mapEvents:  []
}
array_copy(global.saveData.mapEvents,0,global.mapEvents,0,array_length(global.mapEvents));


function updateSave(_room = room){
	global.saveData.roomID = _room;
	global.saveData.unlocks = variable_clone(global.unlockables)
	global.saveData.gameTime = global.gameTime;
	global.saveData.collectibles = variable_clone(global.collectibles);
	array_copy(global.saveData.mapEvents,0,global.mapEvents,0,array_length(global.mapEvents));
}

function writeToConsole(){
	show_debug_message("\n\n\nSAVE DATA:\n"+string(global.saveData)+"\n\n");
}

writeToConsole();