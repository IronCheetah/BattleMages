///Initialize Variables


//Movement
grav = 0.6;
hsp = 0;
vsp = 0;
jumpspeed = 12;
movespeed = 8;
grounded = 0;
jumps = 1;

player_direction = point_direction(0, 0, -1, 0);

haxis = 1;
vaxis = 1;

//Melee
melee = 0;
melee_cooldown = 15;
melee_cooldown_max = 15;

//Fire Mage
fireball_cooldown = 35;
fireball_size = 1;
fireball_speed = 1;

//Ice Mage
wall_climbing = 0;
ice_melee = 0;

//Lightning Mage
static = 0;
static_max = 100;
static_counter = 0;
discharge_cooldown = 100;

//Gamepad Settings
gamepad_set_axis_deadzone(0,0.4);

