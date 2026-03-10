///@description Check Pause input

if !global.pauseDisabled and oInput.pausePressed {
	
	if !global.paused {
		scrPasswordCreate()
		scrOnPause();
		global.paused = true;
	} else {
		global.paused = false;
		scrOnUnpause();
	}
	
}