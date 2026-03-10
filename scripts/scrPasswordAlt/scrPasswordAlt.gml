global.currentPassword = "";

function scrPasswordCreate(){
		
	var _string ="";
	
	_string += string(global.collectibles.red+8);
	_string += string(global.collectibles.blue+7);
	_string += string(global.collectibles.green+6);
	_string += string(global.collectibles.yellow+5);
	_string += string(global.collectibles.magenta+4);
	_string += string(global.collectibles.cyan+3);
	_string += string(global.collectibles.black+2);
	_string += string(global.collectibles.white+1);
	
	_string += string(global.mapEvents[0]+8);
	_string += string(global.mapEvents[1]+6);
	_string += string(global.mapEvents[2]+4);
	
	var _room = 0;
	if global.unlockables.ceilingclimb and global.unlockables.doubleslash {
		_room = scrRoomToInt(RoomBlueFinalDoor);
	} else if global.unlockables.slash{
		_room = scrRoomToInt(RoomCatblade);
	} else if global.unlockables.slowmo and global.unlockables.fastclimb{
		_room = scrRoomToInt(RoomUpgradePurpleSlowmo);
	} else if global.unlockables.fastclimb{
		_room = scrRoomToInt(RoomPurpleFastClimb);
	} else if global.unlockables.climb{
		_room = scrRoomToInt(RoomClimb);
	}
	
	switch(_room){
		case 0:
			_string += "BO"
		break;
		
		case 1:
			_string += "RIDLEY"
		break;
		
		case 2:
			_string += "JASMINE"
		break;
		
		case 3:
			_string += "JULIO"
		break;
		
		case 4:
			_string += "PIP"
		break;
		
		case 5:
			_string += "BANDIT"
		break;
	}
	
	global.currentPassword = "";
	global.currentPassword = _string;
}


function scrPasswordEnter(_pw){
	try	{
		global.collectibles.red = real(string_copy(_pw,1,1))-8;
		if global.collectibles.red > 1 or global.collectibles.red < 0 {
			return 0;
		}
		global.collectibles.blue = real(string_copy(_pw,2,1))-7;
		if global.collectibles.blue > 1 or global.collectibles.blue < 0 {
			return 0;
		}
	
		global.collectibles.green = real(string_copy(_pw,3,1))-6;
		if global.collectibles.green > 1 or global.collectibles.green < 0 {
			return 0;
		}
		global.collectibles.yellow = real(string_copy(_pw,4,1))-5;
		if global.collectibles.yellow > 1 or global.collectibles.yellow < 0 {
			return 0;
		}
	
		global.collectibles.magenta = real(string_copy(_pw,5,1))-4;
		if global.collectibles.magenta > 1 or global.collectibles.magenta < 0 {
			return 0;
		}
	
		global.collectibles.cyan = real(string_copy(_pw,6,1))-3;
		if global.collectibles.cyan > 1 or global.collectibles.cyan < 0 {
			return 0;
		}
	
		global.collectibles.black = real(string_copy(_pw,7,1))-2;
		if global.collectibles.black > 1 or global.collectibles.black < 0 {
			return 0;
		}
	
		global.collectibles.white = real(string_copy(_pw,8,1))-1;
		if global.collectibles.white > 1 or global.collectibles.white < 0 {
			return 0;
		}
	
		global.mapEvents[0] = real(string_copy(_pw,9,1))-8;
		if global.mapEvents[0] > 1 or global.mapEvents[0] < 0 {
			return 0;
		}
	
	
		global.mapEvents[1] = real(string_copy(_pw,10,1))-6;
		if global.mapEvents[1] > 1 or global.mapEvents[1] < 0 {
			return 0;
		}
	
		global.mapEvents[2] = real(string_copy(_pw,11,1))-4;
		if global.mapEvents[2] > 1 or global.mapEvents[2] < 0 {
			return 0;
		}

	
		var _roomString  = string_copy(_pw,12,string_length(_pw)-11);
		switch(_roomString){
			case "BO":
				global.saveData.roomID = scrIntToRoom(0);
			break;
		
			case "RIDLEY":
				global.saveData.roomID = scrIntToRoom(1);
				global.unlockables.climb = 1;
			break;
		
			case "JASMINE":
				global.saveData.roomID = scrIntToRoom(2);
				global.unlockables.climb = 1;
				global.unlockables.fastclimb = 1;
			break;
		
			case "JULIO":
				global.saveData.roomID = scrIntToRoom(3);
				global.unlockables.climb = 1;
				global.unlockables.fastclimb = 1;
			break;
		
			case "PIP":
				global.saveData.roomID = scrIntToRoom(4);
				global.unlockables.climb = 1;
				global.unlockables.fastclimb = 1;
				global.unlockables.slowmo = 1;
			break;
		
			case "BANDIT":
				global.saveData.roomID = scrIntToRoom(5);
				global.unlockables.climb = 1;
				global.unlockables.fastclimb = 1;
				global.unlockables.slowmo = 1;
				global.unlockables.doubleslash = 1;
				global.unlockables.ceilingclimb = 1;
				global.unlockables.slash = 1;
			break;
		
			default:
				return 0;
		}
		
		return 1;
		
	} catch(__) {
		return 0;
	}
}

function scrIntToRoom(_room){
	switch(_room){
		case 0:
		return RoomIntro;
		
		case 1:
		return RoomClimb;
		
		case 2:
		return RoomPurpleFastClimb;
		
		case 3:
		return RoomUpgradePurpleSlowmo;
		
		case 4:
		return RoomCatblade;
		
		case 5:
		return RoomBlueFinalDoor;
			
	}
	return RoomIntro;
	
}

function scrRoomToInt(_room){
	switch(_room){
		case RoomIntro:
		return 0;
		
		case RoomClimb:
		return 1;
		
		case RoomPurpleFastClimb:
		return 2;
		
		case RoomUpgradePurpleSlowmo:
		return 3;
		
		case RoomCatblade:
		return 4;
		
		case RoomBlueFinalDoor:
		return 5;
			
	}
	return 0;
	
}


