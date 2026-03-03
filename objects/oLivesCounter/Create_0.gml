image_speed = 0;
catLives = 9

function loseLife(){
	if oFinalBossHead.alive = true {
		catLives -=1;
		if catLives < 0 {
			scrPlaySound(sfxRecordScratch);
			room_restart();	
		}
	}
}