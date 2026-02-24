event_inherited();
if image_index > 3 image_index = 3;
t = 0;

if global.paused{
	if alarm[2] > 0 {
		alarm[2] +=1;
	}
	image_speed = 0;
} else {
	image_speed = oCat.slowmoActive ? 0.33 : 1;	
}