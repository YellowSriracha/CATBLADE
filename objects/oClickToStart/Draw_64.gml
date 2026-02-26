if transition{
	draw_set_color(c_black)
	draw_rectangle(0,transitionBoxY,display_get_gui_width(),transitionBoxY+transitionBoxH,0)
	draw_set_color(c_white)
	
	transitionBoxY -= 15;
	transitionBoxH += 30;
}

draw_set_color(c_white)