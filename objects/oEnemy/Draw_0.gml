draw_sprite_ext(sprite_index,image_index,x,y+sin(t),image_xscale,image_yscale,0,c_white,image_alpha);

if alertAlpha > 0 {
	draw_sprite_ext(sEnemyAlert,0,x,y-15,1,1,0,c_white,alertAlpha);
}