globalvar highscr;
globalvar selectedBackground;
highscr = 0;
selectedBackground = 2;
scrLoad();
layer_background_index(layer_background_get_id("Backgrounds_1"), selectedBackground);