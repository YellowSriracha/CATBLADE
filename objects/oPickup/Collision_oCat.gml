//scrEndSlowMo();
scrOnPause();
global.pauseDisabled = true;
with instance_create_layer(0,0,layer,oPickupTextbox){
	innerText = other.text;
}
scrPlaySound(track6);

