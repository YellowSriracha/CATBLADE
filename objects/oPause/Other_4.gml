///@description Turn on viewports and resize window
view_visible[0] = true;
view_enabled = true;
//scrWindowResize();
alarm[0] = 60;
view_wport[0] = 640
view_hport[0] = 360;
camera_set_view_size(view_camera[0], 640, 360)
if global.paused {
	global.paused = false;
	scrOnUnpause();
}

