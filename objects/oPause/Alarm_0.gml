///@description Check window resize (1/2 sec)

if global.displayW != display_get_width() or global.displayH != display_get_height() {
	global.displayW = display_get_width();
	global.displayH = display_get_width();
	scrWindowResize();	
}
alarm[0] = 30;