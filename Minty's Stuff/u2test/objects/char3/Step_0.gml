//basic controls
moveUp = keyboard_check(ord("W"));
moveLeft = keyboard_check(ord("A"));
moveRight = keyboard_check(ord("D"));
moveDown = keyboard_check(ord("S"));

//Frame timers
randomAnim -= 1;
if randomAnim < 0 then randomAnim = 0;

//applying current speed
movementX = moveLeft - moveRight;

//Removing knockback
speed = speed / 1.1;

//movement smoothing
if movementX < 0 then smoothX += (1 / 15);
if movementX > 0 and smoothX > 0 then smoothX -= (1 / 5);
if movementX > 0 then smoothX -= (1 / 15);
if movementX < 0 and smoothX < 0 then smoothX += (1 / 5);
if movementX = 0 and smoothX > 0 then smoothX -= (1 / 15);
if movementX = 0 and smoothX < 0 then smoothX += (1 / 15);
if movementX = 0 and smoothX > 0 then smoothX -= (1 / 15);
if movementX = 0 and smoothX < 0 then smoothX += (1 / 15);
if smoothX < -1 then smoothX = -1;
if smoothX > 1 then smoothX = 1;

//Actual gravity shenanigans
speedX = smoothX * agility;

speedY += (1 * 0.4);

//Jump
if (place_meeting(x,y+1,wall)) and (moveUp) {
	speedY = -jump;
	onGround = 0;
}

//preventing the player from leaving (in case they're pussies)
x = clamp(x,0+sprite_width/2,room_width-sprite_width/2);
y = clamp(y,0+sprite_height/2,room_height-sprite_height/2);




//Collision Checks
if (place_meeting(x+speedX,y,wall))
{
	while (!place_meeting(x+sign(speedX),y,wall))
	{
		x = x + sign(speedX);
	}
	speedX = 0;
	smoothX = 0;
}

x += speedX;


//Wall check on Y axis
if (place_meeting(x,y+speedY,wall))
{
	while (!place_meeting(x,y+sign(speedY),wall))
	{
		y = y + sign(speedY);
		
	}
	speedY = 0;
	smoothY = 0;
	onGround = 1;
}

y += speedY;



//Sprite setting
if sign(speedX) < 0 and moveLeft = 1 then image_xscale = -2;
if sign(speedX) > 0 and moveRight = 1 then image_xscale = 2;

if (speedX != 0) and (movementX != 0) and onGround = 1 {
	sprite_index = char3walk;
	if randomAnim < 120 then randomAnim = 120;
	randomBol = 0;
}

if image_index+image_speed >= image_number and speedX == 0 and speedY == 0 and randomAnim <= 0 and randomBol == 0 and onGround = 1 {
  animChance = random_range(1,100);
  if animChance >= 1 and animChance <= 2 and randomAnim <= 0
  {
	  image_index = 0;
	  randomAnim = 480;
	  randomBol = 1;
	  sprite_index = char3idle1;
  }
}
if image_index+image_speed >= image_number and randomBol = 1 or speedX == 0 and speedY == 0 and randomBol == 0 and onGround = 1 {
		  sprite_index = char3idle;
		  randomAnim = 0;
		  randomBol = 0;
}

if (speedY != 0) and (onGround = 0) and (!place_meeting(x,y+speedY,wall)) {
	randomAnim = 120;
	randomBol = 0;
	sprite_index = char3jump;
}