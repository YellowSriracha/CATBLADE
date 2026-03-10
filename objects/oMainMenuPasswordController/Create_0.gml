text = "";
t= 0;

checkPassword = function(){
	if !scrPasswordEnter(text){
		scrPlaySound(sfxDenyBeep);
	} else {
		room_goto(global.saveData.roomID)	
		
	}
}