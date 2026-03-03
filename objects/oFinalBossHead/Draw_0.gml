
if oCat.targetEnemy == id and alive and oCat.slashesReady > 0{
	SetBorderOutlineShader(sprite_index, image_index, 0.5, c_red, 1, 1);		
}
draw_sprite_ext(sprite_index,image_index,x,y+sin(t),image_xscale,image_yscale,image_angle,c_white,image_alpha);
shader_reset();

if hitstunFrames > 0 {
	draw_sprite_ext(sprite_index,image_index,x,y,1,1,1,c_red,((hitstunFrames%10)/10)*image_alpha);
	
} else if hp < 5{
	draw_sprite_ext(sprite_index,image_index,x,y,1,1,1,c_orange,0.5);
}else if hp < 9 {
	
	draw_sprite_ext(sprite_index,image_index,x,y,1,1,1,c_orange,0.3);
	
}