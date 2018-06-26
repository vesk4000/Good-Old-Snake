ini_open("save.ini");
ini_write_real("stats", "highscore", highscr);
ini_write_real("settings", "background", selectedBackground);
ini_close();