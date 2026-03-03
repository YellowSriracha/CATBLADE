function scrWindowResize(){
	var _fullscreen = window_get_fullscreen();


	var _dwidth = display_get_width();
	var _dheight = display_get_height();


	var base_w = 640;
	var base_h = 360;
	var aspect = 640 / 360;

	
	
	var _windowX = global.htmlMode ? 0: 100;
	var _windowY = global.htmlMode ? 0: 100;
	var _xpos = global.htmlMode ?0: (_dwidth *.1);
	var _ypos = global.htmlMode ? 0: (100);
	
	//window_set_fullscreen(1)
	display_set_gui_size(1920,1080)

	var _windowW = _dwidth*.8;
	
	var _windowH = _windowW / aspect;
	var max_w = display_get_width();
	var max_h = display_get_height();
	if global.htmlMode {
		max_w -= 20;
	}
	var VIEW_HEIGHT = 0;
	var VIEW_WIDTH = 0;
	if (max_w < max_h)
		{
		// portait
		VIEW_WIDTH = max_w;
		VIEW_HEIGHT = VIEW_WIDTH / aspect;
		}
	else
		{
		// landscape
		VIEW_HEIGHT = max_h;
		VIEW_WIDTH = VIEW_HEIGHT * aspect;
		}
		
	window_set_rectangle(_xpos, _ypos, VIEW_WIDTH,VIEW_HEIGHT);
	camera_set_view_size(view_camera[0], base_w, base_h)
	view_wport[0] = VIEW_WIDTH;
	view_hport[0] = VIEW_HEIGHT;
	surface_resize(application_surface, view_wport[0], view_hport[0]);
}