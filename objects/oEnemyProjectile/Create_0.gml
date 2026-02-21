angle = 0;
spd = 6;
position = new Vector(x,y); 
collided = false;

function setVelocity(){
	velocity = new Vector(lengthdir_x(spd,angle),lengthdir_y(spd,angle));
	
}
setVelocity();