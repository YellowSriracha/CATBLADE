function scrGetSlowmoPitch(){
	if global.slowmoActive{
		return 0.5;
	}	
	return 1;

}

function scrSfxFootstep(){
	var _pitch = random_range(0.8,1.2);
	if global.slowmoActive{
		_pitch = 0.5;
	}
	scrPlaySound(sfxFootstep,,,_pitch);
}

function scrSfxLanding(){
	var _pitch = random_range(0.8,1.2);
	if global.slowmoActive{
		_pitch = 0.5;
	}
	scrPlaySound(sfxLanding2,,,_pitch);
}

function scrSfxExplosion(){

	scrPlaySound(sfxMiniExplosion,,,scrGetSlowmoPitch());
}

function scrSfxEnergyPulse(){
	
	scrPlaySound(sfxEnergy,1.3,,1);
}

