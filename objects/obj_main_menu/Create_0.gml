menu [0] = "Start";
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
   

//Pause Menu
global.paused = 0;

//Character Selection

if (global.gp[0])
{
global.pclass[0] = 0;
}

if (global.gp[1])
{
global.player2_class = 0;
global.pclass[1] = 0;
}

if (global.gp[2])
{
global.player3_class = 0;
global.pclass[2] = 0;
}

if (global.gp[3])
{
global.player4_class = 0;
global.pclass[3] = 0;
}
