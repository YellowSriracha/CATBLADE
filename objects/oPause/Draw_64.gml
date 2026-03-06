///@description Draw Pause Menu

draw_set_color(boxColor);

if global.paused and !global.pauseDisabled{
	var _lside = (display_get_gui_width()-textBoxWidth)/2
	var _tside = (display_get_gui_height()-textBoxHeight)/2
	draw_rectangle(_lside, _tside, _lside + textBoxWidth, _tside + textBoxHeight,0 );
	
	draw_set_halign(fa_center);
	draw_set_color(textColor)
	draw_set_font(fontPickup);
	draw_text(_lside+(textBoxWidth/2), _tside + ypadding,"Inventory")
	
	
	var _y = _tside + 180;
	var _x = _lside + 100;
	
	for (var i = 0; i < 5; i++){
		var _draw = false;
		switch(i){
			case 0:
				if global.unlockables.climb _draw = true;
			break;
			case 1:
				if global.unlockables.fastclimb _draw = true;
			break;
			case 2:
				if global.unlockables.slowmo _draw = true;
			break;
			case 3:
				if global.unlockables.doubleslash _draw = true;
			break;
			case 4:
				if global.unlockables.ceilingclimb _draw = true;
			break;
		}
		if _draw{
			draw_sprite_ext(upgradeIcons[i],0,_x,_y,4,4,0,c_white,1)
		} else {
			draw_sprite_ext(sUpgradeIconMissing,0,_x,_y,4,4,0,c_white,0.3)
		}
		_x+=150;
	}
	
	_y += 220;
	_x = _lside + 50;
	if global.unlockables.slash == 1 {
		draw_sprite_ext(sInventorySword,0,_x,_y,4,4,0,c_white,1);
	} else {
		draw_sprite_ext(sInventorySwordMissing,0,_x,_y,4,4,0,c_white,0.2);
	}
	
	_y += 160;
	_x = _lside + 50;
	
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
			draw_sprite_ext(sCollectiblesMissing,i,_x,_y,4,4,0,c_white,0.2)
		}
		_x+=110;
	}
	

	
	_y += 180;
	_x = _lside + 50;
	draw_text(_lside+(textBoxWidth/2), _y + ypadding,"Password")
	_y+=80;
	draw_text(_lside+(textBoxWidth/2), _y + ypadding,string(password))
	
	
	
	
	draw_set_font(-1);
	draw_set_halign(fa_left);
	draw_set_color(c_white)
}