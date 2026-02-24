
if onWall or onCeiling{
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

if slowmoActive {
	draw_sprite(sManabar,26*(slowmoDuration/120),x,y-20);	
}