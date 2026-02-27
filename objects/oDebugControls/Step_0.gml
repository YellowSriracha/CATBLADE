if keyboard_check_pressed(ord("R")){
	room_goto(RoomIntro);
	global.unlockSystem.resetUnlocks();
}

if keyboard_check_pressed(ord("U")){
	with (global.unlockables){
		if fastclimb == 1 {
			oCat.slashesReady = 2;
			doubleslash = 1;	
		}
		
		if climb ==1 {
			fastclimb = 1;
		}
		
		climb = 1;
		//jump = 1;
		slash = 1;
		slowmo= 1;
	}
}

if keyboard_check_pressed(ord("N")){
	oMapController.lookup = true;
	if room == RoomChallenge2 {
		room_goto(RoomIntro)	
	} else {
		room_goto_next();
	}
	
}

if keyboard_check_pressed(ord("Q")){
	game_end();
}

 