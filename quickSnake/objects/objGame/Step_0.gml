/// @description Insert description here
// You can write your code in this editor

if(!pause){
//Timer
internalStepCounter++;
if(internalStepCounter == 60)
{
	seconds++;
	internalStepCounter = 0;
}



//Input
if(keyboard_check(vk_up))
	toBeDir = "up";
if(keyboard_check(vk_right))
	toBeDir = "right";
if(keyboard_check(vk_down))
	toBeDir = "down";
if(keyboard_check(vk_left))
	toBeDir = "left";
if(keyboard_check_pressed(ord("P")))
{
	pause = true;
}
	
	
//Logic
if(pause)
{
	
}
else
{
currentStep++;
if(currentStep >= normalSpeed || (currentStep >= fastSpeed && keyboard_check(vk_shift)) )
{
	currentStep = 0;


	if( (toBeDir == "up" && dir != "down") || (toBeDir == "right" && dir != "left") || (toBeDir == "down" && dir != "up") || (toBeDir == "left" && dir != "right"))
		dir = toBeDir;
		
	xv = instance_id[2].x;
	yv = instance_id[2].y;
	
	//Handle movement
	if(dir == "up")
		if(yv != 10)
			yv -= 20;
		else
			yv = room_height - 10;
	if(dir == "right")
		if(xv != room_width - 10)
			xv += 20;
		else
			xv = 10;
	if(dir == "down")
		if(yv != room_height - 10)
			yv += 20;
		else
			yv = 10;
	if(dir == "left")
		if(xv != 10)
			xv -= 20;
		else
			xv = room_width - 10;
			
	//if we touch a fruit
	if(position_meeting(xv, yv, objFruit))
	{
		scr++;
		if(scr > highscr)
		{
			highscr = scr;
			scrSave();
		}
		instance_create_depth(instance_id[length + 1].x, instance_id[length + 1].y, 0, objSnake);
		for(var i = length; i > 1; i--)
		{
			instance_id[i + 1].x = instance_id[i - 1 + 1].x;
			instance_id[i + 1].y = instance_id[i - 1 + 1].y;
		}
		length++;
		randomize();
		xr = irandom_range(0, room_width / 20 - 1) * 20 + 10;
		yr = irandom_range(0, room_height / 20 - 1) * 20 + 10;
		while(position_meeting(xr, yr, objSnake))
		{
			randomize();
			xr = irandom_range(0, room_width / 20 - 1) * 20 + 10;
			yr = irandom_range(0, room_height / 20 - 1) * 20 + 10;
		}
		instance_id[0 + 1].x = xr;
		instance_id[0 + 1].y = yr;
	}
	else
	{
		for(var i = length; i > 1; i--)
		{
			instance_id[i + 1].x = instance_id[i - 1 + 1].x;
			instance_id[i + 1].y = instance_id[i - 1 + 1].y;
		}
	}
	
	if(position_meeting(xv, yv, objSnake))
	{
		game_restart();
	}
	else
	{
		instance_id[1 + 1].x = xv;
		instance_id[1 + 1].y = yv;
	}
	
	if(instance_id[3].y == instance_id[2].y)
		instance_id[2].image_index = 1;
	else
		instance_id[2].image_index = 0;
	if(instance_id[1 + length].y == instance_id[length].y)
		instance_id[1 + length].image_index = 1;
	else
		instance_id[1 + length].image_index = 0;
	str = "";
	for(i = 3;i < 1 + length; ++i)
	{
		first = "right";
		second = "left";
		if(instance_id[i].y - 20 == instance_id[i - 1].y || (instance_id[i - 1].y == room_height - 10 && instance_id[i].y == 10) )
			first = "up";
		else if(instance_id[i].y + 20 == instance_id[i - 1].y || (instance_id[i - 1].y == 10 && instance_id[i].y == room_height - 10) )
			first = "down";
		else if(instance_id[i].x - 20 == instance_id[i - 1].x || (instance_id[i - 1].x == room_width - 10 && instance_id[i].x == 10) )
			first = "left";
		else if(instance_id[i].x + 20 == instance_id[i - 1].x || (instance_id[i - 1].x == 10 && instance_id[i].x == room_width - 10) )
			first = "right";
			
		if(instance_id[i].y - 20 == instance_id[i + 1].y || (instance_id[i + 1].y == room_height - 10 && instance_id[i].y == 10) )
			second = "up";
		else if(instance_id[i].y + 20 == instance_id[i + 1].y || (instance_id[i + 1].y == 10 && instance_id[i].y == room_height - 10) )
			second = "down";
		else if(instance_id[i].x - 20 == instance_id[i + 1].x || (instance_id[i + 1].x == room_width - 10 && instance_id[i].x == 10) )
			second = "left";
		else if(instance_id[i].x + 20 == instance_id[i + 1].x || (instance_id[i + 1].x == 10 && instance_id[i].x == room_width - 10) )
			second = "right";
		str += " " + first + " " + second;
		
		if( (first == "up" && second == "down") || (first == "down" && second == "up"))
			instance_id[i].image_index = 0;
		if( (first == "right" && second == "left") || (first == "left" && second == "right"))
			instance_id[i].image_index = 1;
		if( (first == "down" && second == "right") || (first == "right" && second == "down"))
			instance_id[i].image_index = 2;
		if( (first == "left" && second == "down") || (first == "down" && second == "left"))
			instance_id[i].image_index = 3;
		if( (first == "up" && second == "right") || (first == "right" && second == "up"))
			instance_id[i].image_index = 4;
		if( (first == "up" && second == "left") || (first == "left" && second == "up"))
			instance_id[i].image_index = 5;
		
	}
}}
}
else
{
	
if(keyboard_check_pressed(ord("P")))
{
	
	pause = false;
}}