//Menu Script

switch (mpos)
{
	case 0: //Start
	{
		room_goto_next();
		break;
	}
	case 1: //Options
	{
		room_goto(options_menu);
		break;
	}
	
	case 2: //Quit
	{
		game_end();
		break;
	}
	
	default: break;
}