gpu_set_blendmode(bm_add);
draw_sprite_ext(sGlow,0,x+.5,y+1,0.5+(0.02*sin(t)),1+(0.1*sin(t)),0,glowColor,0.01+0.1*cos(t))
draw_sprite_ext(sGlow,0,x+.5,y+1,0.4+(0.02*sin(t)),0.7+(0.1*sin(t)),0,glowColor,0.2+0.1*cos(t))
gpu_set_blendmode(bm_normal);
draw_self();