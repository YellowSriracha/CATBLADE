function scrPhysicsMove(){
	for (var i = 0; i < abs(xsp); i++){
		if place_meeting(x+sign(xsp)*i,y,oCat.collidables){
			xsp = -xsp *0.8;
			i = xsp+1;
		}
	}
	if place_meeting(x+xsp,y,oCat.collidables){
		xsp = 0;
	}

	x+=xsp;

	for (var i = 0; i < ysp; i++){
		if place_meeting(x,y+ysp,oCat.collidables){
			ysp = -ysp *0.4;
			i = ysp +1;
		}
	}
	y+= ysp;


	if place_meeting(x,y+1,oCat.collidables){
		xsp -= sign(xsp) * 0.1;
		if abs(ysp) < 0.2 ysp = 0
	} else {
		ysp += 0.1;
	}

	if abs(xsp) < 0.2 xsp = 0;
}