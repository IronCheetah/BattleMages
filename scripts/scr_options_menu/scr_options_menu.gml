//Options Menu Script

switch (mpos)
{
	case 0: //Sound
	{
		//Toggle Sound on and off
		break;
	}
	case 1: //Music
	{
		//Toggle Music on and off
		break;
	}
	
	case 2: //Anime
	{
		//play anime music
		global.anime = 1;
		break;
	}
	
	case 3: //Back
	{
	room_goto(main_menu);
	break;
	
	}
	
	default: break;
}