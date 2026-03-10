text = "";
glowColor = c_white;
startingY = y;
t = 0;

function whenDone(){
	with global.saveSystem{
		updateSave();	
		writeToConsole();
	}	
	
	instance_destroy();
}