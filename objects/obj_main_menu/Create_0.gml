menu[0] = "Start";
menu[1] = "Options";
menu[2] = "Quit";

space = 64;	//Vertical Space
mpos = 0;	//Menu Position

//Gamepad Settings
var gp_num = gamepad_get_device_count();
global.gp_number = 0;

for (var i = 0; i < gp_num; i++;)
   {
   if gamepad_is_connected(i)
   {
	global.gp[i] = true;
	global.gp_number ++;
	gamepad_set_axis_deadzone(i,0.3);
   }
   else global.gp[i] = false;
   }
   

//Anime Music Testing
global.anime = 0;

//Pause Menu
global.paused = 0;

//Defult Character Selection
//Default : Fire
//Max Players : 4

for (i = 0; i < 3; i++)
{
	if (global.gp[i])global.pclass[i] = 0;

}

