

if !global.paused {
	if global.slowmoActive {
		t+= 0.033;	
	} else {
		t+=0.1;
	}
}



if instance_exists(oFinalBossHead){
	if !oFinalBossHead.alive and oFinalBossHead.image_alpha <=0{
		image_alpha += 0.01;	
	}
}

if image_alpha >= 1  {
	if !audio_is_playing(sfxPurring){
		scrPlaySound(sfxPurring);	
	}
	
	if y < 312 and !collected{
		y += 1;	
	} else {
		framesSinceCollected++;	
	}
}