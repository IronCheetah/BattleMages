var move = 0;
move -= max(keyboard_check(ord("W")),(gamepad_button_check_pressed(0, gp_padu)));
move += max(keyboard_check(ord("S")), (gamepad_button_check_pressed(0, gp_padd)));

if (move != 0)
{
	mpos += move;
	if (mpos < 0) mpos = array_length_1d(menu) -1;
	if (mpos > array_length_1d(menu) -1) mpos = 0;
}

var push;
push = max(keyboard_check(vk_space),(gamepad_button_check(0, gp_face1)),0);
if (push ==1) scr_main_menu();

for (var i = 0; i < global.gp_number; i++)
{
	selec_fire = gamepad_button_check(i,gp_face2);
	selec_ice = gamepad_button_check(i,gp_face3);
	selec_lightning = gamepad_button_check(i,gp_face4);
	
	if (selec_fire) global.pclass[i] = 0;
	if (selec_ice) global.pclass[i] = 1;
	if (selec_lightning) global.pclass[i] = 2;
	
	show_debug_message(i);
}