if player1 == 0 and keyboard_check_pressed(ord("3")) = 1 {
	player1 = 3;
	with instance_create_layer(x,y,"Instances",char3) {
		global.follow = self;
	}
}