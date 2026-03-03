event_inherited();


die = function(){
	if alive{
		alive = false;
		image_alpha = 0;
		for(var i = 0; i < 4;i++){
			with instance_create_layer(x,y,layer,oEnemyPiece){
				sprite_index = sEnemyEyeballHolderPieces;
				image_index = i;
				xsp = ((i % 2)*-1) * -1;
				ysp = i < 2 ? -1 : 0;
			}
		}
		instance_destroy();
		scrPlaySound(sfxHoly)
	}
}

onPlayerReset = function(){
	alive = true;
	image_alpha = 1;
	return true;	
}