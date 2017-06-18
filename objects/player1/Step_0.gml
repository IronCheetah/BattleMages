/ Get the player's input
key_right = keyboard_check(ord("D")) || (gamepad_axis_value(0,gp_axislh) > 0);
key_left = keyboard_check(ord("A"))  || (gamepad_axis_value(0,gp_axislh) < 0);
key_down = keyboard_check(ord("S")) || (gamepad_axis_value(0,gp_axislv) > 0);
key_up = keyboard_check(ord("W"))  || (gamepad_axis_value(0,gp_axislv) < 0);
key_jump = (keyboard_check_pressed(vk_space)) || (gamepad_button_check_pressed(0, gp_face1));
key_jump_held = keyboard_check(vk_space) || (gamepad_button_check(0, gp_face1));
key_guard = mouse_check_button(mb_right) || gamepad_button_check(0, gp_face2);
key_special = mouse_check_button(mb_left) || gamepad_button_check(0, gp_face4);
key_melee = keyboard_check(ord("E")) || gamepad_button_check(0, gp_face3);

//Testing Commands
key_switch_lightning_mage = keyboard_check(ord("2"));
key_switch_ice_mage = keyboard_check(ord("3"));

//=========== Checks ==========================

//React to inputs
move = key_right - key_left;
hsp = move * movespeed;


//Airborne Check
if place_meeting(x,y+1,obj_wall) grounded = 1;
else grounded = 0;

//Direction Check

var haxis = gamepad_axis_value(0, gp_axislh);
var vaxis = gamepad_axis_value(0, gp_axislv);


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


// Melee Check


//Max Falling Speed
if (vsp < 100) vsp += grav;

//Jump
if (grounded)jumps = 1;

//Fire Mage Double Jump
if ((grounded) && global.player1_class == 0)
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
		
		if (global.player1_class = 1)
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
if (global.player1_class = 0) 
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
	fireball.speed =20;
	fireball.direction = player_direction;
	fireball.image_angle = fireball.direction;
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
if (global.player1_class = 1) 
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

}
//=========== Lightning Mage  =================
if (global.player1_class = 2)
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
	discharge.direction = player_direction;
	discharge.image_angle = discharge.direction;
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
if (vsp < 0)&& (!key_jump_held) && ((!key_guard = 1) && global.player1_class == 0) vsp = max(vsp,-jumpspeed/4)




x += hsp;
y += vsp;

//=========== Animation =======================

//Melee
if (melee > 0) || (ice_melee > 0)
{
	if (global.player1_class = 1)
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
		sprite_index = red_mage;
		image_index = 7;
		}
		else 
		{
			if (hsp = 0)
			{
			sprite_index = red_mage_idle;
			}
			else
			{
			if (sprite_index!= red_mage_run)image_index = 0;
			 sprite_index = red_mage_run;
			}
	}
	}
	//Special
	else if (wall_climbing)
	{
		sprite_index = red_mage;
		image_index = 1;
	}
	//Air
	else
	{
	sprite_index =  red_mage;
	image_index = 6;
	}
}

//Horizontal Flipping	
if (hsp > 0) image_xscale = -1;
if (hsp < 0) image_xscale = 1;
