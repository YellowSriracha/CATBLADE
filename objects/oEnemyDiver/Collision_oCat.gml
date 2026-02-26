if alive {
	with instance_create_layer(x,y,layer,oExplosion){
		canKill = false;	
	}
	alive = false;
	image_alpha = 0;
	scrSfxExplosion();
	with oCat{
		if !slashing die();
	}

	
}