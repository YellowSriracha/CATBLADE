
if image_index >= 7 instance_destroy();

if global.paused {
	image_speed = 0;	
} else {
	if image_index < 1 image_index += 0.1;
	image_speed = 1;
}