if framesSinceCollected > 210 {
	draw_set_color(c_white);
	draw_set_alpha(alpha);
	draw_rectangle(0,0,display_get_gui_width(), display_get_gui_height(),0);
	draw_set_alpha(1);
	alpha += 0.01;
	
	if framesSinceCollected > 600{
		room_goto(RoomCredits)	
	}
}