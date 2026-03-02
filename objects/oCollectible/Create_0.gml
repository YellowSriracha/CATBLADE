image_speed = 0;


t = 0;


switch(image_index){
	case 0:	
		variableName = "red";
	break;
	case 1:	
		variableName = "green";
	break;
	case 2:	
		variableName = "blue";
	break;
	case 3:	
		variableName = "yellow";
	break;
	case 4:	
		variableName = "magenta";
	break;
	case 5:	
		variableName = "cyan";
	break;
	case 6:	
		variableName = "white";
	break;
	case 7:	
		variableName = "black";
	break;
}
index = variable_struct_get(global.collectibles,variableName);
if index == 1 {
	instance_destroy()	
}
