draw_set_color(boxColor);

if global.paused{
	var _lside = (display_get_gui_width()-textBoxWidth)/2
	var _tside = (display_get_gui_height()-textBoxHeight)/2
	draw_rectangle(_lside, _tside, _lside + textBoxWidth, _tside + textBoxHeight,0 );
	
	draw_set_halign(fa_center);
	draw_set_color(textColor)
	draw_set_font(fontPickup);
	draw_text(_lside+(textBoxWidth/2), _tside + ypadding,"Pause Menu")
	draw_set_font(-1);
	draw_set_halign(fa_left);
}