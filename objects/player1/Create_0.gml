///Initialize Variable
event_inherited();
player_number = 0;


//Audio
if (global.anime)
{
audio_play_sound(boku_no_hero,0,false)
}

//Gamepad Settings
gamepad_set_axis_deadzone(player_number,0.4);

//Animations
ani_base = red_mage;
ani_idle = red_mage_idle;
ani_jump = red_mage_jump;
ani_run = red_mage_run;
ani_death = red_mage_death;