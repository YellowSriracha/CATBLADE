event_inherited();

if hitstunFrames > 0 hitstunFrames -=1;

if !alive {
	deathFrames ++;
	if hitstunFrames = 0 hitstunFrames = 60;
	if deathFrames % 30 == 0 and image_alpha > 0 {
		var _this = instance_create_layer(random_range(bbox_left, bbox_right), random_range(bbox_top,bbox_bottom),layer,oExplosion,{depth:other.depth-1});
		with _this {
			canKill = false;
		}
		scrSfxBossHit();
		image_alpha -= 0.1;
		oFinalBossPaw1.image_alpha -= 0.1;
		oFinalBossPaw2.image_alpha -= 0.1;
	}
	
}