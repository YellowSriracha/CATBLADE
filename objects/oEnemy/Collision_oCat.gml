if oCat.slashing{
	alive = false;
	image_alpha = 0;
	alarm[0]=120;
} else {
	if image_alpha >= 1 and alive{
		with oCat{
			die();
		}
	}
}