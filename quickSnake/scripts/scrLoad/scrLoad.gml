if(file_exists("save.ini"))
{
	ini_open("save.ini");
	highscr = ini_read_real("stats", "highscore", 0);
	selectedBackground = ini_read_real("settings", "background", 2);
	
	ini_close();
}