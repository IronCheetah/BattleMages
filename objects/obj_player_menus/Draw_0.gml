draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
draw_set_font(fnt_main_menu);
draw_set_color(c_white);


if (global.gp[0])draw_text(x + 160, y - 28, string("Player 1"));

if (global.gp[1])draw_text(x + 160, y + 28, string("Player 2"));

if (global.gp[2])draw_text(x + 160, y + 84, string("Player 3"));

if (global.gp[3])draw_text(x + 160, y + 140, string("Player 4"));