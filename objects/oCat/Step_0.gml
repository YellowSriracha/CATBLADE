//check all inputs
alive = true;
inputR = global.input.rightKey;
inputL = global.input.leftKey;
inputU = global.input.upKey;
inputD = global.input.downKey;

inputA = global.input.attackKey;
inputM = global.input.castKey;

if global.unlockables.fastclimb climbSpeed = 2.2;
if global.roomTransition {
	SetSpawnPoint();
}



switch(state){
	case PlayerState.GROUND:
		if xsp == 0{
			scrAnimationLoop(frameData.idle.first,frameData.idle.last);
		}else {
			footstepTimer -=3;
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
		if onCeiling {
			stateChange(PlayerState.CEILING);
		} else if onWall {
			stateChange(PlayerState.WALL);
		} else if onGround(){
			stateChange(PlayerState.GROUND);
		}
		
	break;
	
	case PlayerState.WALL:
		if ysp == 0{
			scrAnimationLoop(frameData.wall.hold,frameData.wall.hold);
		}else {
			footstepTimer = global.unlockables.fastclimb ? footstepTimer - 3 : footstepTimer - 1;
			scrAnimationLoop(frameData.wallrun.first,frameData.wallrun.last);
		}
		ysp = 0;
		takeInput();
		applyYInput();
		jumpCheck();
		move();
		
		if !onWall{
			image_yscale = 1;
			if onCeiling {
				stateChange(PlayerState.CEILING)
			} else {
				stateChange(PlayerState.AIR);
			}
		} else {
			image_yscale = (ysp > 0)? -1: 1;	
		}
	break;
	
	case PlayerState.CEILING:
		if xsp == 0{
			scrAnimationLoop(frameData.wall.hold,frameData.wall.hold);
		}else {
			scrAnimationLoop(frameData.wallrun.first,frameData.wallrun.last);
		}
		ysp = 0;
		xsp = 0;
		takeInput();
		applyXInput();
		move();
		
		if !onCeiling{
			image_yscale = 1;
			if !onWall {
				stateChange(PlayerState.AIR);
			} else {
				stateChange(PlayerState.WALL)	
			}
		}
	
	break;
	
	case PlayerState.SLASH:
	
		image_index = frameData.air.hold;
		move();
		
		if onWall {
			alarm[0] = 1;
		} else {
			dir = sign(xsp);
			xsp = lerp(xsp,0,0.06);	
			ysp = lerp(ysp,0,0.06);	
		}
		
		instance_create_layer(x,y,layer,oSlashParticle,{
			image_angle: point_direction(x,y,(x-other.xsp),(y -other.ysp))
			});
	break;
}



if !paused {
	ysp = clamp(ysp,-8,8);
	if  inputXdir != 0{
		dir = inputXdir;
		if !onWall image_xscale = inputXdir;
	}
	if footstepTimer <= 0{
		footstepTimer = 50;
			scrSfxFootstep()	
		}

	if global.unlockables.slash == 1 and !slashing and slashesReady > 0{
		targetEnemy = collision_circle(x,y,70,oEnemy,0,1);
		if inputA and instance_exists(targetEnemy){
			if targetEnemy.alive{
				stateChange(PlayerState.SLASH)
			}
		}
	}

	if !global.slowmoActive{
		if slowmoDuration < SLOWMOMAX {
			slowmoDuration += 1;	
		}else if inputM and global.unlockables.slowmo{ 
			scrStartSlowMo();
		}
	} else {
		slowmoDuration -=1;
		if slowmoDuration <= 0{
			global.slowmoActive = false;	
			//slowmoDuration= SLOWMOMAX;
			Shader_ChromaticAbberation_Disable();
			scrEndSlowMo();
		}	
		else
		{
			Shader_ChromaticAbberation_Enable();
		}
	}
		
}

if paused and alarm[0] >= 0 {
	alarm[0] += 1;
	alarm[1] += 1;
}

updateGlobalPlayerPosition();