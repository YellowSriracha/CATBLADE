if keyboard_check_pressed(ord("R")){
	game_restart();	
}

if keyboard_check_pressed(ord("U")){
	with (global.unlockables){
		climb = 1;
		//jump = 1;
		slash = 1;
	}
}

if keyboard_check_pressed(ord("N")){
	room_goto_next();
}

if keyboard_check_pressed(ord("P")){
	room_goto_previous();
}