//Update camera
follow = global.follow;

if (instance_exists(follow)) {
	xTo = follow.x
	yTo = follow.y
}

//Update position
x += (xTo - x) / 40;
y += (yTo - y) / 40;

x = clamp(x,viewXHalf,room_width-viewXHalf);
y = clamp(y,viewYHalf,room_height-viewYHalf);

//Update viewport
camera_set_view_pos(cam,x-viewXHalf,y-viewYHalf)
