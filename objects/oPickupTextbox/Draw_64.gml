draw_set_color(boxColor)

//draw_rectangle((display_get_gui_width()/2)-textboxWidth/2,
//		display_get_gui_height()/2-textboxHeight/2,
//		display_get_gui_width()/2+textboxWidth/2,
//		display_get_gui_height()/2+textboxHeight/2,0);
var _scalex = textboxWidth / sprite_get_width(sNineSlice);
var _scaley = textboxHeight / sprite_get_height(sNineSlice);
draw_sprite_ext(sNineSlice2,0,(display_get_gui_width()/2)-textboxWidth/2,(display_get_gui_height()/2)-textboxHeight/2,_scalex,_scaley,0,c_white,1)
	
	
draw_set_halign(fa_center)
draw_set_color(textColor)
draw_set_font(font)
draw_text_ext(display_get_gui_width()/2,display_get_gui_height()/2-textboxHeight/2+vPadding,innerText,60,textboxWidth-(hPadding*2))
draw_set_halign(fa_left)
draw_set_color(c_white)
draw_set_font(-1)

