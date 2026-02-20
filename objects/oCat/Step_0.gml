//check all inputs

inputR = global.input.rightKey;
inputL = global.input.leftKey;
inputU = global.input.upKey;
inputD = global.input.downKey;

inputA = global.input.attackKey;


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
			state = PlayerState.AIR;
		}
		
		move();
		if onWall {
			state = PlayerState.WALL;
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
			state = PlayerState.WALL;
		} else if onGround(){
			state = PlayerState.GROUND;
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
		dir = sign(xsp);
		xsp = lerp(xsp,0,0.03);	
		ysp = lerp(ysp,0,0.03);	
	break;
}

ysp = clamp(ysp,-8,8);
if  inputXdir != 0{
	dir = inputXdir;
	if !onWall image_xscale = inputXdir;
}



if global.unlockables.slash == 1 and !slashing{
	targetEnemy = collision_circle(x,y,100,oEnemy,0,1);
	if inputA and instance_exists(targetEnemy){
		scrPlaySound(sfxCatAngry);
		scrPlaySound(sfxSlice);
		slashing = true;
		onWall = false;
		var _angle = point_direction(x,y,targetEnemy.x,targetEnemy.y);
		xsp = lengthdir_x(slashspeed,_angle);
		ysp = lengthdir_y(slashspeed,_angle);
		alarm[0] = 30;
		
		state = PlayerState.SLASH;
	}
}