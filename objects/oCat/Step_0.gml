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
		
		grav = 0;
		move();
		
		if onWall or onGround() {
			alarm[0] = 1;
		} else {
			dir = sign(xsp);
			var _angle = point_direction(0,0,xsp,ysp);
			var _magnitude = sqrt(sqr(xsp)+sqr(ysp));
			_magnitude = lerp(_magnitude,0,0.08);
			xsp = lengthdir_x(_magnitude,_angle)
			ysp = lengthdir_y(_magnitude,_angle)
		}
		
		instance_create_layer(x,y,layer,oSlashParticle,{
			image_angle: point_direction(x,y,(x-other.xsp),(y -other.ysp))
			});
	break;
}



if !paused {
	if !slashing {
		ysp = clamp(ysp,-8,8);
	}
	
	if  inputXdir != 0{
		dir = inputXdir;
		if !onWall image_xscale = inputXdir;
	}
	if footstepTimer <= 0{
		footstepTimer = 70;
		scrSfxFootstep()	
	}

	//TARGET PICK AND ATTACK INPUT==================================
	if global.unlockables.slash == 1 and slashesReady > 0{
		targetEnemy = collision_circle(x,y,attackrange,oEnemy,0,1);
		if instance_exists(targetEnemy) {
			targetEnemy = instance_nearest(x,y,oEnemy)
			if !checkTargetValid(targetEnemy){
				targetEnemy = noone;
			}else if inputA  {
				if targetEnemy.alive{
					stateChange(PlayerState.SLASH)
				}
			}
		}
	}

	//SLOW MO INPUT ======================================
	if !global.slowmoActive{
		if slowmoDuration < SLOWMOMAX {
			slowmoDuration += 1;	
		}else if inputM and global.unlockables.slowmo{ 
			scrStartSlowMo();
		}
	} else if global.slowmoActive{
		slowmoDuration -=1;
		if slowmoDuration <= 0{
			global.slowmoActive = false;	
			scrEndSlowMo();
		}		
	}
		
}

if paused and alarm[0] >= 0 {
	alarm[0] += 1;
	alarm[1] += 1;
}

updateGlobalPlayerPosition();