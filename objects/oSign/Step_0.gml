drawArrow = false;	
if !instance_exists(oPickupTextbox){
	global.pauseDisabled = false;
	if delay > 0 {
		delay -=1;
	} else if distance_to_object(oCat) < 40{
			drawArrow = true;
			if global.input.upKeyPressed or global.input.selectKey {
				global.pauseDisabled = true;
				with oCat{
					pause();	
				}
				with instance_create_layer(x,y,layer,oPickupTextbox){
					innerText = other.text;
				}
				delay = 30;
			
			}
	} 
}

t+= 0.1;