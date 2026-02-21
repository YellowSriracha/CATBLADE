image_speed = 0;

index = variable_struct_get(global.collectibles,variableName);
t = 0;

if index == 1 {
	instance_destroy()	
}

if variableName == "red" {
		image_index = 0;
} else if variableName == "blue" {
		image_index = 2;
}else if variableName = "green" {
		image_index = 1;
}