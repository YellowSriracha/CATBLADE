goto = noone;


side = 0

if x >= room_width{
	side = 0;	
}if y < 0 {
	side = 1;	
} else if x < 0 {
	side = 2;
}else if y >= room_height {
	side = 3;	
} 

if (!instance_exists(oPostProcess)) {
    instance_create_layer(0, 0, "Instances", oPostProcess);
}
