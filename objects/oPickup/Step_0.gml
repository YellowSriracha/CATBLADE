y = startingY + sin(t);

if !global.paused {
	if global.slowmoActive {
		t+= 0.033;	
	} else {
		t+=0.1;
	}
}

if !audio_is_playing(sfxEnergy){
	scrSfxEnergyPulse();
}