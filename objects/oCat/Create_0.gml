#macro catwalkspeed 3
#macro defaultgrav 0.1
#macro slashspeed 10
#macro tilewidth 16
climbSpeed = 2;
//Player Inputs
inputR = 0;
inputL = 0;
inputU = 0;
inputD = 0;
inputA = 0;
inputXdir = 0;
inputYdir = 0;

//Direction and buffers
dir = 1;
onWall = false;
jumpBuffer = false;

//Targeting and Attacking flags
targetEnemy = noone;
slashing = false;

//Pause flag
paused = false;

//State
enum PlayerState {
	GROUND,
	AIR,
	WALL,
	SLASH
}
state = PlayerState.GROUND;

//Physics and Velocity
grav = defaultgrav;
spd = 0;
xsp = 0;
ysp = 0;

//Animation Frame Indexes
frameData = {
	idle: {
		first: 0,
		last: 14,
	},
	run:{
		first: 14,
		last:22,
	},
	air: {	
		hold: 22,
	},
	wall: {
		hold: 23	
	},
	wallrun:{	
		first: 24,
		last: 29
	}
}

//Spawn in in a room transition is occurring
if global.roomTransition {
	SetSpawnPoint();
}
respawnPointX = x;
respawnPointY = y;


//Collision object pointers
collisionMapID= layer_tilemap_get_id(layer_get_id("CollisionMap"));
collidables = [collisionMapID, oGround];


//CURSED MOVE FUNCTION NEEDS WORK
function move(){
	if !onWall {
		if !onGround(){
			ysp += grav;
		}
		//X Collision
		if place_meeting(x+xsp,y,collidables) {
			snapToWall()
			xsp = 0;

			if global.unlockables.climb{
				ysp = 0
				onWall = true;
			}
		}
		x += xsp;
		//Y collision
		if place_meeting(x,y+ysp,collidables){
			if ysp > 0 and !onGround(){
				snapToGround();
			}
			ysp = 0;
		}
		y+=ysp;
	} else if onWall {
		xsp = 0;	
		
		//Y Collision
		if place_meeting(x,y+ysp,collidables) {
			ysp = 0;	
			if ysp > 0 {
				onWall = false;
				if ysp >0 {
					snapToGround();
				}
			}
		}
		//If not facing wall, let go
		if !place_meeting(x+dir,y+ysp,collidables){
			onWall = false;	
		}
		y+=ysp;
	}
}

function stateChange(_state){
	switch(state){
		case PlayerState.AIR:
			//dir = inputXdir;
			image_index = frameData.air.hold;
			image_xscale = inputXdir
		break;
		case PlayerState.WALL:
			dir = inputXdir;
			image_index = frameData.wall.hold;
		break;
	}
	state = _state;	
}
function jumpCheck(){
	if jumpBuffer {
		if onWall {
			xsp = -catwalkspeed*dir;	
		}
		onWall = false;
		ysp = -4;
	}
}

function takeInput(){
	inputXdir = inputR - inputL;
	inputYdir = inputD - inputU;
	dir = (inputXdir == 0) ? dir: inputXdir;
}

function applyXInput(){
	if inputXdir == 1 {
		xsp = catwalkspeed;
	} else if inputXdir == -1 {
		xsp = -catwalkspeed;
	} else {
		xsp =0;	
	}
}


function applyYInput(){
	if inputYdir == 1 {
		ysp = climbSpeed;
	} else if inputYdir == -1 {
		ysp = -climbSpeed;
	} 
}

function snapToGround(){
	var _startY = floor(y);
	for (var i = 0; i<tilewidth;i++){
		if place_meeting(x, _startY+i,collidables){
			y = _startY+i-1;
			return 1;
		}
	}
	y = _startY;
	return 0;
}

function snapToWall(_dir = dir){
	if _dir == 1{
		var _startX = floor(x);
	} else if _dir == -1{
		var _startX = ceil(x);
	}
	
	for (var i = 0; i<tilewidth;i++){
		if place_meeting(_startX+(_dir*i),y,collidables){
			x = _startX+(_dir*(i-1));
			return 1;
		}
	}
	x = _startX;
	return 0;
}

//Returns if player is touching ground
function onGround(){
	if place_meeting(x,y+1,collidables){
		return true;	
	}
	return false;
}

//Spawns the player in the correct position by referencing the Map Controller
function SetSpawnPoint(){
	if global.mapController.roomSide % 2 == 0 {
		if global.mapController.roomSide == 2 {
			x = 20;
		} else {
			x = room_width - 20;	
		}
		y = global.mapController.roomSpawnY;
	} else {
		if global.mapController.roomSide == 1 {
			y = 20;
		} else {
			y = room_height - 20;	
		}
		x = global.mapController.roomSpawnX;	
	}
	ysp = global.mapController.roomSpawnYsp;
	global.roomTransition = false;

Wall = global.mapController.roomTransitionOnWall;
}

function die(){
	scrPlaySound(sfxDeathMeow)
	x = respawnPointX;
	y = respawnPointY;
}

function updateGlobalPlayerPosition(){
	global.globalPlayerPositionX = x;
	global.globalPlayerPositionY = y;
}
