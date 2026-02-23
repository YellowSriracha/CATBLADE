event_inherited();

if playerXDistance < -40 {
	image_index = 1;
	image_xscale = 1;
} else if playerXDistance > 40 {
	image_index = 1;
	image_xscale = -1;
} else {
	image_index = 0;
}
if alarm[2] != -1 image_index+=2;

if aggro and !launchReady and alarm[2] == -1{
	alarm[2] = oCat.slowmoActive ? 135 : 45;
}

if !alive {
	aggro = false;
	launchReady = false;
	alarm[2] = -1;
}

if global.paused{
	if alarm[2] > 0 {
		alarm[2] +=1;
	}
}