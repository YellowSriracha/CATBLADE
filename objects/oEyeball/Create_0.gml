image_speed = 0;
xsp = 0;
ysp = -2;
currxsp = 0;
currysp = 0;



if room = RoomBlueFinalDoor {
	if global.mapEvents[image_index] != 1 {
		instance_destroy();	
	}
} else {
	with instance_find(oEnemyEyeballHolder,0){
		instance_destroy();	
	}
	if global.mapEvents[image_index] = 1 {
		instance_destroy();	
	}	
}