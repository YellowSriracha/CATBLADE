event_inherited();
scrPlaySound(sfxHoly);
scrPlaySound(sfxChoir);

global.musicVolume = 0;
scrMusicSetVolume()
global.unlockables.slash = true;
oCat.sprite_index = sCatHoldingSword;
//global.musicVolume = global.options.musicVolume;
//scrMusicSetVolume()
instance_destroy();
