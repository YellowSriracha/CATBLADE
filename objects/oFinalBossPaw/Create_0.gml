#macro bossfloorlevel 320
#macro bosstoplevel 15
#macro bossrightwall 608
#macro bossleftwall 31
enum BossPhase {
	UPANDDOWN,
	SLAMPATTER,
	SETUP,
	RESET,
	DYING
}
screenshake = layer_get_id("screenShake");
hitstop = 0;

state = BossPhase.UPANDDOWN;
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
}

function checkPlayerCrushed(){
	with oCat{
		if place_meeting(x,y,collidables) and onGround(){
			die();	
		}
	}
	
}
stateChange(BossPhase.UPANDDOWN)