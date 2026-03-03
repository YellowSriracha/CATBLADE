
if image_alpha >= 1 and !collected{
	scrOnPause();
	global.pauseDisabled = true;
	oCat.sprite_index = sCatHoldingSword;
	oCat.dir = 1;
	oCat.image_xscale = 1;
	y = oCat.y - 20;
	x = oCat.x 
	scrPlaySound(track6);
	scrPlaySound(sfxHoly);
	scrPlaySound(sfxChoir);
	collected = true;
}
