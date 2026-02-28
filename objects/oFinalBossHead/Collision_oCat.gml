if oCat.slashing and hitstunFrames <= 0{
	hitstunFrames = 60;
	scrSfxBossHit();
	hp -= 1;
	if hp <= 0 {
		alive = false;
		oFinalBossPaw1.state = BossPhase.DYING;	
		oFinalBossPaw2.state = BossPhase.DYING;	
	}
} 