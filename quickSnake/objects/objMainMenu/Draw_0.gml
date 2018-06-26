 /// @description Insert description here
// You can write your code in this editor
draw_set_font(fntMain);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
for(i = 0;i < array_length_1d(menuItems); i++ )
{
	if(i == selected)
		draw_sprite(sprMainMenu, 0, x, y + (i * 20));
	draw_text(x, y + (i * 20), " " + menuItems[i]);
}
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(300, 580, "Made by Vesk");