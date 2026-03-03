if oCat.slashing and hitstunFrames <= 0{
	hitstunFrames = 60;
	scrSfxBossHit();
	hp -= 1;
	if hp <= 0 {
		alive = false;
		oFinalBossPaw1.state = BossPhase.DYING;	
		oFinalBossPaw2.state = BossPhase.DYING;	
		global.musicVolume = 0;
		scrMusicSetVolume(2000);
		if instance_exists(oEnemyLauncher){
			with instance_find(oEnemyLauncher,0){
				die()
				instance_destroy()
			}
		}
		if instance_exists(oEnemyLauncher){
			with instance_find(oEnemyLauncher,0){
				die()
				instance_destroy()
			}
		}

		
	} else if hp == 6{
		with instance_create_layer(100,80,layer,oEnemyLauncher){
			aggroCondition = function(){return image_alpha >= 1;}	
			image_alpha = 0;
		}
		with instance_create_layer(room_width-100,80,layer,oEnemyLauncher){
			aggroCondition = function(){return image_alpha >= 1;}	
			image_alpha = 0;
		}
	}
} 