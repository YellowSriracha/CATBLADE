global.input = instance_create_layer(0,0,layer,oInput);
global.unlockSystem = instance_create_layer(0,0,layer,oUnlocks);
global.mapController = instance_create_layer(0,0,layer,oMapController);
global.soundSystem = instance_create_layer(0,0,layer,oSoundSystem);
global.pauseSystem = instance_create_layer(0,0,layer,oPause)
global.postFX = instance_create_layer(0,0,layer,oPostFX);

global.debugOverlay = instance_create_layer(0,0,layer,oCatDebug);
global.debugControls = instance_create_layer(0,0,layer,oDebugControls);

global.gamespeed = 60;


//SET WINDOW AND
var _dwidth = display_get_width();
var _dheight = display_get_height();
var _xpos = (_dwidth / 2) - 800;
var _ypos = (_dheight / 2) - 450;
window_set_rectangle(100, 100, display_get_width()*0.75,display_get_height()*0.75);
display_set_gui_size(1920,1080)

var base_w = 640;
var base_h = 360;
var max_w = display_get_width();
var max_h = display_get_height();
var aspect = display_get_width() / display_get_height();
if (max_w < max_h)
    {
    // portait
    var VIEW_WIDTH = min(base_w, max_w);
    var VIEW_HEIGHT = VIEW_WIDTH / aspect;
    }
else
    {
    // landscape
    var VIEW_HEIGHT = min(base_h, max_h);
    var VIEW_WIDTH = VIEW_HEIGHT * aspect;
    }
camera_set_view_size(view_camera[0], floor(VIEW_WIDTH), floor(VIEW_HEIGHT))
view_wport[0] = max_w;
view_hport[0] = max_h;
surface_resize(application_surface, view_wport[0], view_hport[0]);