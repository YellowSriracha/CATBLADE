y = startingY + sin(t);

if !global.paused {
	if oCat.slowmoActive {
		t+= 0.033;	
	} else {
		t+=0.1;
	}
}