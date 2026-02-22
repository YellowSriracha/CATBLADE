//check all inputs

inputR = global.input.rightKey;
inputL = global.input.leftKey;
inputU = global.input.upKey;
inputD = global.input.downKey;

inputA = global.input.attackKey;
inputM = global.input.castKey;

if global.unlockables.fastclimb climbSpeed = 2;
switch(state){
	case PlayerState.GROUND:
		if xsp == 0{
			scrAnimationLoop(frameData.idle.first,frameData.idle.last);
		}else {
			scrAnimationLoop(frameData.run.first,frameData.run.last);
		}
		takeInput();
		applyXInput();

		if global.unlockables.jump{
			jumpBuffer = global.input.jumpKey;	
			stateChange(PlayerState.AIR);
		}
		
		move();
		if onWall {
			stateChange(PlayerState.WALL);
		} else if !onGround() {
			stateChange(PlayerState.AIR);
		}
		jumpCheck();
	break;
	
	case PlayerState.AIR:
		image_index = frameData.air.hold;
		takeInput();
		applyXInput();
		move();
		if onWall {
			stateChange(PlayerState.WALL);
		} else if onGround(){
			stateChange(PlayerState.GROUND);
		}
		
	break;
	
	case PlayerState.WALL:
		if ysp == 0{
			scrAnimationLoop(frameData.wall.hold,frameData.wall.hold);
		}else {
			scrAnimationLoop(frameData.wallrun.first,frameData.wallrun.last);
		}
		ysp = 0;
		takeInput();
		applyYInput();
		jumpCheck();
		move();
		
		if !onWall{
			image_yscale = 1;
			stateChange(PlayerState.AIR);
		} else {
			image_yscale = (ysp > 0)? -1: 1;	
		}
	break;
	
	case PlayerState.SLASH:
		image_index = frameData.air.hold;
		move();
		if onWall {
			alarm[0] = 1;
		} else {
			dir = sign(xsp);
			xsp = lerp(xsp,0,0.04);	
			ysp = lerp(ysp,0,0.04);	
		}
	break;
}

ysp = clamp(ysp,-8,8);
if  inputXdir != 0{
	dir = inputXdir;
	if !onWall image_xscale = inputXdir;
}



if global.unlockables.slash == 1 and !slashing and slashesReady > 0{
	targetEnemy = collision_circle(x,y,70,oEnemy,0,1);
	if inputA and instance_exists(targetEnemy){
		if targetEnemy.alive{
			stateChange(PlayerState.SLASH)
		}
	}
}

if !slowmoActive{
	if inputM and global.unlockables.slowmo{
		slowmoActive = true;	
		scrStartSlowMo();
	}
} else {
	slowmoDuration -=1;
	if slowmoDuration <= 0{
		slowmoActive = false;	
		slowmoDuration= 120;
		scrEndSlowMo();
	}
}