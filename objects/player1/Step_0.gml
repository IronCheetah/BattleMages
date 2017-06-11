// Get the player's input
key_right = keyboard_check(ord("D")) || (gamepad_axis_value(0,gp_axislh) > 0);
key_left = keyboard_check(ord("A"))  || (gamepad_axis_value(0,gp_axislh) < 0);
key_down = keyboard_check(ord("S")) || (gamepad_axis_value(0,gp_axislv) > 0);
key_up = keyboard_check(ord("W"))  || (gamepad_axis_value(0,gp_axislv) < 0);
key_jump = (keyboard_check_pressed(vk_space)) || (gamepad_button_check_pressed(0, gp_face1));
key_jump_held = keyboard_check(vk_space) || (gamepad_button_check(0, gp_face1));
key_jetpack = mouse_check_button(mb_right) || gamepad_button_check(0, gp_face2);
key_fireball = mouse_check_button(mb_left) || gamepad_button_check(0, gp_face4);

//Testing Commands
key_switch_lightning_mage = keyboard_check(ord("2"));
key_switch_ice_mage = keyboard_check(ord("3"));

//React to inputs
move = key_right - key_left;
hsp = move * movespeed;

//Max Falling Speed
if (vsp < 40) vsp += grav;

if (place_meeting(x,y+1,obj_wall))
{
	vsp = key_jump * -jumpspeed; 
}

//Crouching
if (key_down == 1)
{
crouching = 1;
if (grounded) hsp =0;
}
else crouching = 0;


//Airborne Check
if place_meeting(x,y+1,obj_wall) grounded = 1;
else grounded = 0;

//Direction Check




//if (hsp < 0)

//Fireball
if fireball_cooldown < 35
{
	fireball_cooldown += 1;
}

if (key_fireball = 1)
{
	if (fireball_cooldown = 35)
	{
	fireball = instance_create_depth(x,y,0,obj_fireball);
	fireball.speed =10;
	fireball.direction = point_direction(x,y,mouse_x,mouse_y);
	fireball_cooldown = 0;
	}
}

///*
//Jetpack Power
if (key_jetpack = 1)
{
vsp = key_jetpack * -jumpspeed;
}
//*/

/*
//Jetpack Power
if (key_jump = true) && (!vsp = 0) 
{
	while (key_jump_held = 1)
	{
	vsp = key_jetpack * -jumpspeed;
	}
}
*/

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

//Wall Jump
if (key_jump) && (place_meeting(x+1,y,obj_wall) || place_meeting(x-1,y,obj_wall))
{
	vsp = -jumpspeed;
}

//Variable Jump Height
if (vsp < 0)&& (!key_jump_held) && (!key_jetpack = 1) vsp = max(vsp,-jumpspeed/4)




x += hsp;
y += vsp;

//Animation

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
	
	//Air
	else
	{
	sprite_index =  red_mage;
	image_index = 6;
	}
	
if (hsp > 0) image_xscale = -1;
if (hsp < 0) image_xscale = 1;