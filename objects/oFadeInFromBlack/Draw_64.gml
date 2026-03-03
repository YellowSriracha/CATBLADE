draw_set_color(c_black);
draw_set_alpha(alpha);
draw_rectangle(0,0,display_get_gui_width(), display_get_gui_height(),0);
draw_set_alpha(1);
draw_set_color(c_white);

alpha -= 0.01;
if alpha <= 0 instance_destroy();