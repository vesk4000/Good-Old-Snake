/// @description Insert description here
// You can write your code in this editor
draw_set_font(fntMain);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(0, 0, " Time: " + string(seconds) +  " Score: " + string(scr) + " Highscore: " + string(highscr));
draw_set_halign(fa_center);
draw_text(300, 580, "Made by Vesk");
if(pause)
{
draw_set_color(c_dkgray);
	draw_set_alpha(0.5);
	draw_rectangle(0, 0, 600, 600, false);
	draw_set_color(c_white);
	draw_set_alpha(1);
}