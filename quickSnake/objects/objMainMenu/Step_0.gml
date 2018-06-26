/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(vk_up))
{
	if(selected == 0)
		selected = array_length_1d(menuItems);
	selected--;
}
if(keyboard_check_pressed(vk_down))
{
	if(selected == array_length_1d(menuItems) - 1)
		selected = 0;
	else
		selected++;
}
if(keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space))
{
	if(menuItems[selected] == "Play")
	{
		room_goto(rmMain);
	}
	if(menuItems[selected] == "Change Background")
	{
		if(selectedBackground == sprite_get_number(sprBackground) - 1)
			selectedBackground = 0;
		else
			selectedBackground++;
		layer_background_index(layer_background_get_id("Backgrounds_1"), selectedBackground);
		scrSave();
	}
	if(menuItems[selected] == "Exit")
	{
		game_end();
	}
	
}
