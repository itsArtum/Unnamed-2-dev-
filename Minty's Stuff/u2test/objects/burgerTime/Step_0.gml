if place_meeting(x,y,char3) and keyboard_check_pressed(ord("E")) {
	interacted = 1;
	image_index = 1;
}

if interacted = 1 {
	burgDelay -= 1;
	if burgDelay <= 0 and burgLeft > 0 then {
	burgDelay = 20;
	burgLeft -= 1;
	instance_create_layer(x-16,y+8,"Burgertime",burger);
	}
}

if burgLeft <= 0 then image_index = 0;