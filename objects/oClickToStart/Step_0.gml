
if !clicked{
	if position_meeting(mouse_x,mouse_y,id){
		if !clicked image_index = 1;
		if (mouse_button == mb_left) {
			clicked = true;	
			image_index = 2;
		}
	} else{
		image_index = 0;	
	}
}

if clicked and image_index > 8 {
	image_speed = 0;
	transition = true;
}

if transitionBoxY < -10 room_goto(RoomIntro)