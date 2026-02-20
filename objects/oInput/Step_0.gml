/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
// show_debug_overlay(1)
global.gamepads = [];
if keyboardControlScheme == 0 {
	jumpScheme = vk_space;
	attackScheme = ord("Z");
	castScheme = ord("X");
}
if keyboardControlScheme == 1{
	jumpScheme = ord("X");
	attackScheme = ord("Z");
	castScheme = ord("C");
}
if keyboardControlScheme == 2{
	jumpScheme = ord("Z");
	attackScheme = ord("X");
	castScheme = ord("C");
}

pausePressed = keyboard_check_pressed(vk_escape);
selectKey = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(ord("Z"));
selectKeyHeld = keyboard_check(vk_enter) or keyboard_check(ord("Z"));
restartKey = keyboard_check_pressed(ord("R"));
debugKey = keyboard_check_pressed(ord("D"));
upKey = keyboard_check(vk_up);
upKeyPressed = keyboard_check_pressed(vk_up);
downKey = keyboard_check(vk_down);
downKeyPressed = keyboard_check_pressed(vk_down);
leftKey = keyboard_check(vk_left);
leftKeyPressed = keyboard_check_pressed(vk_left);
rightKey = keyboard_check(vk_right);
rightKeyPressed = keyboard_check_pressed(vk_right);
jumpKeyHeld = keyboard_check(jumpScheme);
jumpKey = keyboard_check_pressed(jumpScheme);
attackKey = keyboard_check_pressed(attackScheme);
castKey = keyboard_check_pressed(castScheme);
castKeyHeld = keyboard_check(castScheme);
blowupkey = keyboard_check(vk_enter);
stompKey = 0;
backKey = keyboard_check_pressed(vk_escape);

var _gp = global.gamepadMain;
if _gp != undefined {
	gamepad_set_colour(_gp, c_green);
	pausePressed += gamepad_button_check_pressed(_gp,gp_start);
	selectKey += gamepad_button_check(_gp,gp_select) or gamepad_button_check_pressed(_gp,gp_face1);
	selectKeyHeld += gamepad_button_check(_gp,gp_select) or gamepad_button_check(_gp,gp_face1);
	upKey += gamepad_button_check(_gp,gp_padu) or (gamepad_axis_value(_gp, gp_axislv) < -0.5);
	upKeyPressed += gamepad_button_check_pressed(_gp,gp_padu);
	downKey += gamepad_button_check(_gp,gp_padd) or  (gamepad_axis_value(_gp, gp_axislv) > 0.5);
	downKeyPressed += gamepad_button_check_pressed(_gp,gp_padd);
	attackKey += gamepad_button_check_pressed(_gp,gp_face3);
	castKey += gamepad_button_check_pressed(_gp,gp_face4);
	castKeyHeld += gamepad_button_check(_gp,gp_face4);
	jumpKey += gamepad_button_check_pressed(_gp,gp_face1);
	jumpKeyHeld += gamepad_button_check(_gp,gp_face1);
	rightKey += gamepad_button_check(_gp,gp_padr) or  (gamepad_axis_value(_gp, gp_axislh) > 0.2);
	rightKeyPressed += gamepad_button_check_pressed(_gp,gp_padr);
	leftKey += gamepad_button_check(_gp,gp_padl) or  (gamepad_axis_value(_gp, gp_axislh) < -0.2);
	leftKeyPressed += gamepad_button_check_pressed(_gp,gp_padl);
	stompKey += gamepad_button_check_pressed(_gp,gp_shoulderl);
	backKey +=  gamepad_button_check_pressed(_gp,gp_face2);
}

pausePressed = clamp(pausePressed,-1,1);
selectKey = clamp(selectKey,-1,1);
leftKey = clamp(leftKey,-1,1);
upKey = clamp(upKey,-1,1);
upKeyPressed = clamp(upKeyPressed,-1,1);
downKey = clamp(downKey,-1,1);
downKeyPressed = clamp(downKeyPressed,-1,1);
attackKey = clamp(attackKey,-1,1);
castKey = clamp(castKey,-1,1);
castKeyHeld = clamp(castKeyHeld,-1,1);
jumpKey = clamp(jumpKey,-1,1);
jumpKeyHeld = clamp(jumpKeyHeld,-1,1);
rightKey = clamp(rightKey,-1,1);
leftKey = clamp(leftKey,-1,1);
stompKey = clamp(stompKey,-1,1);
backKey = clamp(backKey,-1,1);