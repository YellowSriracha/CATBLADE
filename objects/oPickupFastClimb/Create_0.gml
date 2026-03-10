event_inherited();
text = "Fast Climb unlocked!\n\n You can now scale walls at a much quicker pace.";

if global.unlockables.fastclimb {
	instance_destroy();	
}

glowColor = #92E7FF;