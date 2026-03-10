/// @description Insert description here
// You can write your code in this editor
var _gamepad = async_load[? "pad_index"];

switch (async_load[? "event_type"])
{
	case "gamepad discovered":
		array_push(global.gamepads, _gamepad);
		show_debug_message("gamepad connected")
		gamepad_set_axis_deadzone(_gamepad, 0.3);
	break;
		
	case "gamepad lost":
		var _arrayIndex = array_get_index(global.gamepads, _gamepad);
		if (_arrayIndex >= 0)
		{
			array_delete(global.gamepads,_arrayIndex,1);	
		}
	break;		
}

if array_length(global.gamepads) > 0{
	global.gamepadMain = global.gamepads[0];
} else {
	global.gamepadMain = undefined;
}