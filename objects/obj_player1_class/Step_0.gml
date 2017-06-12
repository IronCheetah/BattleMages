//Fire
if (gamepad_button_check(0, gp_face2) == 1)
{
	image_index = 0;
	global.player1_class = 0;
}

//Ice
if (gamepad_button_check(0, gp_face3) == 1)
{
	image_index = 1;
	global.player1_class = 1;
}

//Lightning
if (gamepad_button_check(0, gp_face4) == 1)
{
	image_index = 2;
	global.player1_class = 2;
}


