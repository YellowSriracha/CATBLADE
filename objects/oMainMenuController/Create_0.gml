selection = 0;
numOptions = 2;
t = 0;
yPositions = [172, 221];
x = 71;

transitioning = false;
transitionDelay = 120;

spriteLayer = layer_get_id("Assets");
selectionAsset = layer_sprite_get_id(spriteLayer, "selections");
pointerAsset = layer_sprite_get_id(spriteLayer, "pointer");

global.unlockSystem.resetCollectibles();
global.unlockSystem.resetUnlocks();
global.gameTime = 0;



