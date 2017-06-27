//Pause 

key_start = gamepad_button_check(player_number,gp_start);

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
		if (!image_speed = 0)temp_image_speed = image_speed;
		image_speed = 0;
	
	}
}

if ((key_start == 1) && (pause_cooldown == 10) && (!global.paused))
{
 global.paused = 1;
 pause_cooldown = 0;
}

if (global.paused) exit; //Ends script if paused


// Get the player's input
key_right = keyboard_check(ord("D")) || (gamepad_axis_value(player_number,gp_axislh) > 0);
key_left = keyboard_check(ord("A"))  || (gamepad_axis_value(player_number,gp_axislh) < 0);
key_down = keyboard_check(ord("S")) || (gamepad_axis_value(player_number,gp_axislv) > 0);
key_up = keyboard_check(ord("W"))  || (gamepad_axis_value(player_number,gp_axislv) < 0);
key_jump = (keyboard_check_pressed(vk_space)) || (gamepad_button_check_pressed(player_number, gp_face1));
key_jump_held = keyboard_check(vk_space) || (gamepad_button_check(player_number, gp_face1));
key_guard = mouse_check_button(mb_right) || gamepad_button_check(player_number, gp_face2);
key_special = mouse_check_button(mb_left) || gamepad_button_check(player_number, gp_face4);
key_melee = keyboard_check(ord("E")) || gamepad_button_check(player_number, gp_face3);

//Testing Commands
key_switch_character = gamepad_button_check(player_number,gp_shoulderl);

//Debug character class switch
if (key_switch_character)
{
	if (key_melee) global.pclass[player_number] = 1;	//Ice
	if (key_guard) global.pclass[player_number] = 0;	//Fire	
	if (key_special) global.pclass[player_number] = 2;	//Lightning
}	


//=========== Checks ==========================

//React to inputs
move = key_right - key_left;
hsp = move * movespeed;


//Death Check
if (hp <= 0) dead = 1;
else dead = 0;

//Airborne Check
if place_meeting(x,y+1,obj_wall) grounded = 1;
else grounded = 0;

//Direction Check

var haxis = gamepad_axis_value(player_number, gp_axislh);
var vaxis = gamepad_axis_value(player_number, gp_axislv);


if ((haxis = 0) && (vaxis = 0))
{
}
else
{
	if (haxis < 0) haxis_temp = haxis * -1;
	else
	{
	haxis_temp = haxis;
	}
	
	if (vaxis < 0) vaxis_temp = vaxis * -1;
	else
	{
	vaxis_temp = vaxis;
	}
	
	if (haxis_temp > vaxis_temp)
	{
		if (haxis > 0)
		{
		//Right
		pd_simple = "right";
		player_direction = point_direction(0, 0, 1, 0);
		}
		else
		{
		//Left
		pd_simple = "left";
		player_direction = point_direction(0, 0, -1, 0);	
		}
	}
	
	if (vaxis_temp > haxis_temp)
	{
		if (vaxis > 0)
		{
		//Down 
		pd_simple = "down";
		player_direction = point_direction(0, 0, 0, 1);
		}
		else
		{
		//Up
		pd_simple = "up";
		player_direction = point_direction(0, 0, 0, -1);
		}
	}
	
	else
	{
	//Vertical diretions
	}
}

//Frozen Check

if (frozen)
{
	if (frozen_duration = 60)
	{
	 frozen = 0;
	 frozen_duration = 0;
	}
	else
	{
	frozen_duration ++;
	hsp = 0;
	jumps = 0;
	}
}


// Melee Check


//Max Falling Speed
if (vsp < 100) vsp += grav;

//Jump
if (grounded)jumps = 1;

//Fire Mage Double Jump
if ((grounded) && (global.pclass[player_number] == 0))
{
	jumps = 2;
}

if ((key_jump) && (jumps > 0))
{
	vsp = -jumpspeed;
	jumps -= 1; 
}

//Crouching
if (key_down == 1)
{
crouching = 1;
if (grounded) hsp = 0;
}
else crouching = 0;


//=========== Sword ===========================

//Melee Cooldown
if (melee_cooldown < melee_cooldown_max) melee_cooldown += 1;

//Melee Attack
if (key_melee)
{
	if (melee_cooldown = melee_cooldown_max)
	{
		
		melee_cooldown = 0;
		
		if (global.pclass[player_number] == 1)
		{
		ice_melee = 1;
		}
		
		else
		{
		melee = 1;
		}
	}
}

//Hitbox Creation




//=========== Fire Mage  ======================
if (global.pclass[player_number] == 0) 
{
//Fireball
if fireball_cooldown < 35
{
	fireball_cooldown += 1;
}

if (key_special = 1)
{
	if (fireball_cooldown = 35)
	{
	fireball = instance_create_depth(x,y,0,obj_fireball);
	fireball.speed = 20;
	fireball.direction = player_direction;
	fireball.image_angle = fireball.direction;
	fireball.user = player_number;
	fireball_cooldown = 0;
	}
}


//Jetpack Power
if (key_guard = 1)
{
vsp = key_guard * -jumpspeed;
}
}

//=========== Ice Mage  =======================
if (global.pclass[player_number] = 1) 
{
//Increased Horizontal Speed
hsp = hsp * 1.5;

//Wall Climbing
if ((place_meeting(x+hsp,y,obj_wall)) || (place_meeting(x-hsp,y,obj_wall)))
{
	wall_climbing = 1;	
}
else
{
wall_climbing = 0
}
if (wall_climbing)
{
if place_meeting(x+1,y,obj_wall)
{
/*
image_angle = 90;
if (vsp > 0) image_xscale = 1;
if (vsp < 0) image_xscale = -1;
*/
}

if place_meeting(x-1,y,obj_wall)
{
/*
image_angle = -90;
if (vsp > 0) image_xscale = -1;
if (vsp < 0) image_xscale = 1;
*/
}
}
else
{
/*
image_angle = 0;
image_xscale = 1;
*/

}
//Wall Jumping
if (wall_climbing) jumps = 1;	//Wall Jump

if ((wall_climbing) && (!key_jump_held) && (!key_down))
{
 vsp = vsp *.5;	//Slow Descent
}		

//Freeze Wave
if (freeze_wave_cooldown < 80)
{
	freeze_wave_cooldown += 1;
}

if (key_special = 1)
{
	if (freeze_wave_cooldown = 80)
	{
	freeze_wave = instance_create_depth(x,y,0,obj_freeze);
	freeze_wave.speed = 10;
	freeze_wave.direction = player_direction;
	freeze_wave.image_angle = freeze_wave.direction;
	freeze_wave.user = player_number;
	freeze_wave_cooldown = 0;
	}
}

}
//=========== Lightning Mage  =================
if (global.pclass[player_number] = 2)
{
//Static Electricity
if (hsp == 0)
{
	static_counter += 1;
	if (static_counter = 35)
	{
	static_counter = 0;
	static = 0;
	}
}
else
{
	if (static < static_max)
	{
		static += 1
		static_counter = 0;
	}
}

//Discharge
if discharge_cooldown < 100
{
	discharge_cooldown += 1;
}

if (key_special = 1)
{
	if (discharge_cooldown = 100)
	{
	discharge = instance_create_depth(x,y,0,obj_discharge);
	discharge.speed = static/3.7;
	discharge.max_speed = static/3.7;
	discharge.direction = player_direction;
	discharge.image_angle = discharge.direction;
	discharge.user = player_number;
	discharge.static_power = static;
	
	if (static > 50)
	{
	discharge.image_xscale = -(1 + (static/50));
	discharge.image_yscale = 1 + (static/50);
	}
	if (static < 50)
	{
	discharge.image_xscale = -1
	discharge.image_yscale = 1
	}
	
	discharge_cooldown = 0;
	static = 0;
	}
}


//Horizontal Speed Increase
hsp = hsp * max((static/40),1);

//Vertical Speed Increase
jumpspeed = 12 * (static/100 + 1)






}
//=========== Collision =======================

//Horizontal Collision
if (place_meeting(x+hsp,y,obj_wall))
{
	while!(place_meeting(x+sign(hsp),y,obj_wall))
	{
	x+= sign(hsp);
	}
	hsp = 0;
}

//Vertical Collision
if (place_meeting(x,y+vsp,obj_wall))
{
	while!(place_meeting(x,y+sign(vsp),obj_wall))
	{
	y+= sign(vsp);
	}
	vsp = 0;
}

/*
//Wall Jump
if (key_jump) && (place_meeting(x+1,y,obj_wall) || place_meeting(x-1,y,obj_wall))
{
	vsp = key_jump * -jumpspeed;
}
*/

//Variable Jump Height
if (vsp < 0)&& (!key_jump_held) && !((key_guard = 1) && (global.pclass[player_number] == 0)) 
{
vsp = max(vsp,-jumpspeed/4);
}



x += hsp;
y += vsp;

//=========== Animation =======================

//Death

if ((sprite_index = ani_death) && (image_index = 3))
{
	image_speed = 0;
	
	// Put dying code here

}
if (dead)
{
	if (sprite_index!= ani_death)image_index = 0;
		sprite_index = ani_death;
	hsp = 0;


}


//Melee

else if (melee > 0) || (ice_melee > 0)
{
	if (global.pclass[player_number] = 1)
	{
	if (pd_simple = "up")
	{
	//Up Sword Animation
	sprite_index = red_mage_melee_icelvl2_up;
	image_index = 0;
	}
	
	else if (pd_simple = "down")
	{
	//Down Sword Animation
	sprite_index = red_mage_melee_icelvl2_down;
	image_index = 0;
	}
	
	else if (pd_simple = "right")
	{
	sprite_index = red_mage_melee_icelvl2;
	image_index = 0;
	//Put spawn object code here 

	}
	
	else if (pd_simple = "left")
	{
	sprite_index = red_mage_melee_icelvl2;
	image_index = 0;
	}
	
	if (ice_melee < 5) ice_melee += 1;
	else
	{ 
	ice_melee = 0;
	}
	
	}
	
	else 
	{
	sprite_index = red_mage_melee_normal;
	image_index = 0;
	
	if (melee < 5) melee += 1;
	else
	{ 
	melee = 0;
	}
	
	}

}


else
{
	//Ground
	if (grounded)
	{
		if (crouching)
		{
		sprite_index = ani_base;
		image_index = 7;
		}
		else 
		{
			if (hsp = 0)
			{
			sprite_index = ani_idle;
			}
			else
			{
			if (sprite_index!= ani_run)image_index = 0;
			 sprite_index = ani_run;
			}
	}
	}
	//Special
	else if (wall_climbing)
	{
		sprite_index = ani_base;
		image_index = 1;
	}
	//Air
	else
	{
		sprite_index = ani_jump;
	}
}

//Horizontal Flipping	
if (hsp > 0) image_xscale = -1;
if (hsp < 0) image_xscale = 1;
