if oCat.targetEnemy == id and alive and oCat.slashesReady > 0{
	SetBorderOutlineShader(sprite_index, image_index, 0.5, c_red, 1, 1);		
}
draw_sprite_ext(sprite_index,image_index,x,y+sin(t),image_xscale,image_yscale,image_angle,c_white,image_alpha);
shader_reset();

if alertAlpha > 0 {
	draw_sprite_ext(sEnemyAlert,0,x,y-15,1,1,0,c_white,alertAlpha);
}