//Pause 

if (pause_cooldown < 10)pause_cooldown += 1;

if (global.paused)
{

	
	if ((key_start == 1) && (pause_cooldown == 10) && (global.paused))
	{
	global.paused = 0;
	pause_cooldown = 0;
	image_speed = temp_image_speed;
	}
	else
	{
		show_debug_message("pause");
		hsp = 0;
		vsp = 0;
		temp_image_speed = image_speed;
		image_speed = 0;
		exit;
	}
}

if ((key_start == 1) && (pause_cooldown == 10) && (!global.paused))
{
 global.paused = 1;
 pause_cooldown = 0;
}
