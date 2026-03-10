event_inherited();
text = "Gravity Claws unlocked!\n\n Hold up to cling to ceilings.";

if global.unlockables.ceilingclimb {
	instance_destroy();	
}

glowColor = #CEB2FC;