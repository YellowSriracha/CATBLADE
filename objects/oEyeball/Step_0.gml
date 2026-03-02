if room != RoomBlueFinalDoor {
	if !instance_exists(oEnemyEyeballHolder){
		global.mapEvents[image_index] = 1;	
		currxsp += sign(xsp - currxsp) *0.01;
		currysp += sign(ysp - currysp) *0.01;
		x+=currxsp;
		y+=currysp;
	}
}