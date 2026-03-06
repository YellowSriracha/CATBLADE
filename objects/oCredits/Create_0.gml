scrollY = display_get_gui_height()+20;
center = display_get_gui_width()/2;
textColor =  #d14d19;
musicFading = false;
global.paused = false;
global.pauseDisabled = true;

count = global.unlockSystem.countCollectibles();

function drawYarns(_x,_y){
	for (var i = 0; i < 8; i++){
		var _draw = false;
		switch(i){
			case 0:
				if global.collectibles.red _draw = true;
			break;
			case 1:
				if global.collectibles.green _draw = true;
			break;
			case 2:
				if global.collectibles.blue _draw = true;
			break;
			case 3:
				if global.collectibles.yellow _draw = true;
			break;
			case 4:
				if global.collectibles.magenta _draw = true;
			break;
			case 5:
				if global.collectibles.cyan _draw = true;
			break;
			case 6:
				if global.collectibles.white _draw = true;
			break;
			case 7:
				if global.collectibles.black _draw = true;
			break;
		}
		if _draw{
			draw_sprite_ext(sCollectibles,i,_x,_y,4,4,0,c_white,1)
		} else {
			draw_sprite_ext(sCollectiblesMissing,i,_x,_y,4,4,0,c_white,0.3)
		}
		_x+=110;
	}
	
	
}