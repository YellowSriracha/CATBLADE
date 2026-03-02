///@description Check Pause input

if !global.pauseDisabled and oInput.pausePressed {
	
	if !global.paused {
		password = scrPackSaveDataToHexadecimalPassword(global.saveData);
		scrOnPause();
		global.paused = true;
	} else {
		global.paused = false;
		scrOnUnpause();
	}
	
}