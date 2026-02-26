function scrWindowResize(){
	var _dwidth = display_get_width();
	var _dheight = display_get_height();
	var _xpos = (_dwidth / 2);
	var _ypos = (_dheight / 2);

	var base_w = 640;
	var base_h = 360;
	var aspect = 640 / 360;

	var _windowW = display_get_width()*0.75;
	var _windowX = global.htmlMode ? 0: 100;
	var _windowY = global.htmlMode ? 0: 100;
	if global.htmlMode {
		 _windowW = display_get_width();
	}
	var _windowH = _windowW / aspect;

	window_set_rectangle(_windowX, _windowY, _windowW,_windowH);

	display_set_gui_size(1920,1080)


	var max_w = display_get_width();
	var max_h = display_get_height();

	var VIEW_HEIGHT = 0;
	var VIEW_WIDTH = 0;
	if (max_w < max_h)
		{
		// portait
		var VIEW_WIDTH = max_w;
		var VIEW_HEIGHT = VIEW_WIDTH / aspect;
		}
	else
		{
		// landscape
		var VIEW_HEIGHT = min(base_h, max_h);
		var VIEW_WIDTH = VIEW_HEIGHT * aspect;
		}
	
	camera_set_view_size(view_camera[0], floor(VIEW_WIDTH), floor(VIEW_HEIGHT))
	view_wport[0] = VIEW_WIDTH;
	view_hport[0] = VIEW_HEIGHT;
	surface_resize(application_surface, view_wport[0], view_hport[0]);
}