life -= 1;
if life <= 200 then image_alpha -= 0.005;
if image_alpha <= 0 then instance_destroy();

soundDelay -= 1;
if soundDelay <= 0 then {
	audio_play_sound(burgerscry,0,0);
	soundDelay = random_range(30,120);
}

//Movement system
if rangeleft > 0 then {
	y -= 1;
	rangeleft -= 1;
}

if movement < maxmove then movement += (maxmove / 100);
image_angle = -movement * 4;

x += movement;

if place_meeting(x+movement,y,wall) {
	x -= movement;
	movement = movement - movement * 2;
	maxmove = maxmove - maxmove * 2;
}