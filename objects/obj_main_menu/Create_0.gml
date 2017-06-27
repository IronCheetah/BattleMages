menu [0] = "Start";
menu[1] = "Options";
menu[2] = "Quit";

space = 64;	//Vertical Space
mpos = 0;	//Menu Position

//Gamepad Settings
gamepad_set_axis_deadzone(0,0.2);

//Pause Menu
global.paused = 0;