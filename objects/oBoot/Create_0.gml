global.input = instance_create_layer(0,0,layer,oInput);
global.unlockSystem = instance_create_layer(0,0,layer,oUnlocks);
global.mapController = instance_create_layer(0,0,layer,oMapController);
global.soundSystem = instance_create_layer(0,0,layer,oSoundSystem);
global.pauseSystem = instance_create_layer(0,0,layer,oPause)
global.postFX = instance_create_layer(0,0,layer,oPostFX);

global.debugOverlay = instance_create_layer(0,0,layer,oCatDebug);
global.debugControls = instance_create_layer(0,0,layer,oDebugControls);

global.gamespeed = 60;

global.displayW = display_get_width();
global.displayH = display_get_height();
if (os_browser == browser_not_a_browser)
{
    global.htmlMode = 0;
}
else
{
    global.htmlMode = 1;
}



//SET WINDOW AND


view_visible[0] = true;
view_enabled = true;
scrWindowResize();

