/// @description Insert description here
// You can write your code in this editor

dir = "right";
toBeDir = "right";
length = 4;
internalStepCounter = 0;
currentStep = 0;
normalSpeed = 5;
fastSpeed = 2;
scr = 0;
seconds = 0;
pause = false;
str = "";
pause = false;

bg = layer_background_get_id("Background");
layer_background_index(bg, selectedBackground);

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