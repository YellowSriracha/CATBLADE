
if state == PlayerState.WALL {
	draw_sprite_ext(sprite_index,image_index,x+dir*4,y,-dir,image_yscale,0,c_white,1);
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