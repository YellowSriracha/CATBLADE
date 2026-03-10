gpu_set_blendmode(bm_add);
draw_sprite_ext(sGlow,0,x+1,y+1,1.3+(0.1*sin(t)),1.3+(0.1*sin(t)),0,glowColor,0.01+0.1*cos(t))
draw_sprite_ext(sGlow,0,x+1,y+1,1+(0.1*sin(t)),1+(0.1*sin(t)),0,glowColor,0.2+0.1*cos(t))
gpu_set_blendmode(bm_normal);
draw_self();