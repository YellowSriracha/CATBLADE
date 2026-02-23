draw_set_font(fontPickup)
draw_set_color(c_orange)
draw_set_halign(fa_center);
draw_set_alpha(image_alpha);
draw_text(display_get_gui_width()/2,display_get_gui_height()/4,text)
draw_set_halign(fa_left);
draw_set_font(-1)
draw_set_color(c_white);
draw_set_alpha(1);

if fading{
	image_alpha -= 0.01;	
}