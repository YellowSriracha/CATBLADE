#macro bossfloorlevel 320
#macro bosstoplevel 15
#macro bossrightwall 608
#macro bossleftwall 31
enum BossPhase {
	INTRO,
	UPANDDOWN,
	SLAMPATTER,
	SETUP,
	RESET,
	DYING
}

screenshake = layer_get_id("screenShake");
layer_set_visible(screenshake,false);
hitstop = 0;
image_alpha = 0;
t=0;
state = BossPhase.INTRO;
xsp = 0;
ysp = 0;
yDir = 1;
xDir = 0;


function stateChange(_state){
	switch(_state){
		case BossPhase.UPANDDOWN:
			xsp = 0;
			ysp = 4;
			yDir = 1;
		break;
	}
	state = _state;
}

function checkPlayerCrushed(){
	with oCat{
		if place_meeting(x,y,collidables) and onGround(){
			//die();	
		}
		if collision_point(x,bbox_top-1,oFinalBossPaw,1,1){
			die();	
		}
		if collision_point(x,bbox_bottom+1,oFinalBossPaw,1,1){
			die();	
		}
	}
	
}
stateChange(BossPhase.INTRO)