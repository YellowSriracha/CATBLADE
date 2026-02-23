if oInput.pausePressed {
	if !global.paused {
		scrOnPause();
		global.paused = true;
	} else {
		global.paused = false;
		scrOnUnpause();
	}
	
}