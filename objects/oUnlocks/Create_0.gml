global.unlockables = {
	climb: 0,
	fastclimb: 0,
	jump: 0,
	slash: 0,
	doubleslash: 0,
	slowmo: 0,
	ceilingclimb: 0
}

global.collectibles = {
	blue: 0,
	red: 0,
	green: 0,
	yellow:0,
	magenta:0,
	cyan:0,
	white:0,
	black:0
}

function resetUnlocks(){
	with global.unlockables{
		climb = 0;
		fastclimb= 0;
		jump= 0;
		slash= 0;
		doubleslash= 0;
		slowmo= 0;
		ceilingclimb= 0;
	}
}

function resetCollectibles(){
	with global.collectibles{
		blue = 0;
		red = 0;
		green = 0;
		yellow = 0;
		magenta = 0;
		cyan = 0;
		white = 0;
		black = 0;
	}	
}

function countCollectibles(){
	var _count = 0;
	with global.collectibles{
		_count += blue;
		_count += red;
		_count += green;
		_count += yellow;
		_count += magenta;
		_count += cyan;
		_count += white;
		_count += black;
	}	
	return _count;
}