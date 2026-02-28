event_inherited();

if hitstunFrames > 0 {
	draw_sprite_ext(sprite_index,image_index,x,y,1,1,1,c_red,((hitstunFrames%10)/10)*image_alpha);
	
}