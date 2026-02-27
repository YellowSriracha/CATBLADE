
if global.unlockables.slash and sprite_index != sCatHoldingSword{
	var _rotate = (onWall) ? dir*90 : 0;
	var _xScale = dir;
	if onWall and ysp > 0 {
		_xScale = -dir;
	}
	var _xOffset = 0;
	if onWall _xOffset = dir*2;
	if !onWall and xsp !=0 _xOffset = dir*-1;
	draw_sprite_ext(sCatBlade,0,x+_xOffset,y,_xScale,1,_rotate,c_white,10);
}

if slashing {

	draw_sprite_ext(sCatAttack,0,x,y,1,1,point_direction(x,y,x+xsp,y+ysp),c_white,10);		
} else if onWall or onCeiling{
	var _rotate = onCeiling ? dir*90 : 0;
	var _xOffset = onCeiling ? 0 : dir*3;
	var _yOffset = onCeiling ? -3: 0;
	var _dir = -dir;
	var _yscale =  onCeiling? -image_yscale: image_yscale;
	draw_sprite_ext(sprite_index,image_index,x+_xOffset,y + _yOffset,_dir,_yscale,_rotate,c_white,1);
} else {
	draw_self()
}
if instance_exists(targetEnemy){
	if targetEnemy.alive{
		//draw_sprite(sTarget,0,targetEnemy.x,targetEnemy.y);
	}
}

if slowmoDuration < SLOWMOMAX {
	draw_sprite(sManabar,26*(slowmoDuration/SLOWMOMAX),x,y-20);	
}