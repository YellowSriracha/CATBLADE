if keyboard_check_pressed(vk_anykey){
	if keyboard_key = vk_escape {
		room_goto(rmMainMenu)	
	} else if keyboard_key = vk_enter {
		checkPassword();
	} else if keyboard_key = vk_backspace {
		text = string_delete(text,string_length(text),1);
	}else if keyboard_key >= 48 and keyboard_key <= 57{
		text += chr(keyboard_key);
	}else if keyboard_key >= 65 and keyboard_key <= 122 {
		text += chr(keyboard_key);
	}
}

t+=1;