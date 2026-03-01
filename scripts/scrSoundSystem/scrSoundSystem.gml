#macro track1 CatBlade_A_low_intensity_loop
#macro track2 CatBlade_B_medium_intensity_loop
#macro track3 CatBlade_C_Boss_Battle_loop
#macro track5 CatBlade_start_screen_with_purr_loop
#macro track6 CatBlade_Upgrade_stinger
#macro musicgain 0.6

global.bgm = sfxAlert;
global.volume = 1;
global.musicVolume = 1;



function scrMusicPause(){
	audio_pause_sound(global.bgm)	
}

function scrMusicResume(){
	audio_resume_sound(global.bgm);
}

function scrMusicSetVolume(_time = 0){
	audio_sound_gain(global.bgm,global.musicVolume*musicgain,_time);
}

function scrMusicStart(_id){
	global.musicVolume = global.options.musicVolume;
	if _id != global.bgm{
		audio_stop_sound(global.bgm);
		global.bgm = _id;
		audio_play_sound(global.bgm,1,true,global.musicVolume*musicgain);
	}
	scrMusicSetVolume(600);
}

function ScrMusicSlow(){
	audio_sound_pitch(global.bgm,0.6);
}

function ScrMusicUnslow(){
	audio_sound_pitch(global.bgm,1);
}


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

function scrSfxBossHit(){
	
	scrPlaySound(sfxBossHit,1,,1);
}


