if !paused{

	t+=0.1;
	playerDir = sign(x-oCat.x);
	playerXDistance = (x-oCat.x);


	if alive and image_alpha < 1 {
		image_alpha += 0.02;	
	}

	if !aggro and alive and image_alpha >= 1{
		aggro = aggroCheck();
		if aggro {
			alertAlpha = 1;
			alarm[1] = 30;
		}
	}
	

	if alertFading {
		alertAlpha -= 0.05;
		if alertAlpha == 0 {
			alertFading = false;	
		}
	}
	
}

if paused {
	alarm[0]++;
	alarm[1]++;
}	

