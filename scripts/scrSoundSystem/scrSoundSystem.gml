function scrGetSlowmoPitch(){
	if global.slowmoActive{
		return 0.5;
	}	
	return 1;

}

function scrSfxFootstep(){
	var _pitch = 1;
	if global.slowmoActive{
		_pitch = 0.5;
	}
	scrPlaySound(sfxFootstep,,,scrGetSlowmoPitch());
}

function scrSfxLanding(){
	scrPlaySound(sfxLanding2,,,scrGetSlowmoPitch());
}

function scrSfxExplosion(){

	scrPlaySound(sfxMiniExplosion,,,scrGetSlowmoPitch());
}

function scrSfxEnergyPulse(){
	
	scrPlaySound(sfxEnergy,0.8,,1);
}

