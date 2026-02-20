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