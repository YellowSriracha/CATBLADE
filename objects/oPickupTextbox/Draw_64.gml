draw_set_color(c_white)
draw_rectangle((display_get_gui_width()/2)-textboxWidth/2,
		display_get_gui_height()/2-textboxHeight/2,
		display_get_gui_width()/2+textboxWidth/2,
		display_get_gui_height()/2+textboxHeight/2,0);
draw_set_halign(fa_center)
draw_set_color(c_black)
draw_set_font(fontPickup)
draw_text_ext(display_get_gui_width()/2,display_get_gui_height()/2-textboxHeight/2+vPadding,innerText,60,textboxWidth-(hPadding*2))
draw_set_halign(fa_left)
draw_set_color(c_white)
draw_set_font(-1)

