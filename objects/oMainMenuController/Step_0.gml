
if t == 30 {
	scrMusicStart(CatBlade_start_screen_with_purr_loop);
}

//inputs 
if !transitioning and t > 30{
	if global.input.downKeyPressed {
		if selection < (numOptions - 1) selection += 1;	
	} else if global.input.upKeyPressed {
		if selection > 0 selection -= 1;	
	}
	if global.input.selectKey {
		if selection == 1{
			scrPlaySound(sfxDenyBeep);	
		} else {
			transitioning = true;
			global.musicVolume = 0;
			scrMusicSetVolume(600);
		}
	}
}

//pointer left and right
if t%50 < 25 {
	layer_sprite_x(pointerAsset, x+2);
} else if t%100 > 25{
	layer_sprite_x(pointerAsset, x-2);
}

y = yPositions[selection];
layer_sprite_y(pointerAsset, y);

//Flashing text
if t%100 < 20{
	layer_sprite_index(selectionAsset,selection+1);
} else if t%100 > 20 {
	layer_sprite_index(selectionAsset,0);
}

t+=1;
if transitioning {
	t += 5;
	transitionDelay -= 1;
	if transitionDelay <= 0 {
		if selection == 0{
			global.mapController.lookup = true;
			room_goto(RoomIntro)			
		} else {
			
			
		}
		
	}
}