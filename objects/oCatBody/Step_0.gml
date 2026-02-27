//Nobody ask me how this works

image_index = 0;

t+=1;
if t > 200 {
	image_alpha -=0.01;
	if image_alpha <=0 instance_destroy();
}

scrPhysicsMove();
angle += xsp;