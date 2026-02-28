if !global.paused{
	switch(state){
		case BossPhase.UPANDDOWN:
		
			ysp = yDir * 4;
			if xDir == 0 xsp = 0;
			if hitstop <= 0{
				if bbox_bottom + ysp > bossfloorlevel {
					layer_set_visible(screenshake,true);
					alarm[0] = 30;
					ysp = bossfloorlevel - bbox_bottom;
					yDir = -1;
					xsp = round(random_range(-1,1))*2;
					xDir = sign(xsp);
					hitstop = 20;
				} else if bbox_top + ysp < bosstoplevel {	
					layer_set_visible(screenshake,true);
					alarm[0] = 30;
					ysp = bosstoplevel - bbox_top;
					yDir = 1;
					xsp = round(random_range(-1,1))*2;
					xDir = sign(xsp);
					hitstop = 20;
				}
			}
			
			
			if bbox_right + xsp > bossrightwall {
				xsp = bossrightwall - bbox_right;
				xDir = 0;
			} else if bbox_left + xsp < bossleftwall {
				xsp = bossleftwall - bbox_left;
				xDir = 0;
			}
	
		break;

	}

	if state != BossPhase.DYING{
		var _xsp = xsp;
		var _ysp = ysp;
		if global.slowmoActive {
			_xsp /=2;
			_ysp /=2;
		}
		if hitstop > 0 {
			_xsp  = 0;
			_ysp = 0;
			hitstop --;
		} 

		if place_meeting(x+1,y,oCat) or place_meeting(x-1,y,oCat){
			if oCat.slashing return false;
			if oCat.onWall{
				oCat.x += _xsp;
				oCat.y += _ysp;
				if oCat.bbox_bottom > bossfloorlevel{
					oCat.y = bossfloorlevel-(oCat.bbox_bottom-oCat.y);	
				}
			} else {
				if sign(_xsp) == oCat.dir{
					oCat.x += _xsp*3;
				}
			}
		}

		x += _xsp;
		y += _ysp;

		checkPlayerCrushed()
	}
}else {
	//alarm[0]+=1;	
}