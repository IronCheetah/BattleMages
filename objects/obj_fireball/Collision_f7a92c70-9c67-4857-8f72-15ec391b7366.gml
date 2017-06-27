//Do 1 damage to victim
target = instance_place(x,y,obj_player);
if (user != target.player_number)
{
target.hp -= 1;
instance_destroy();
}
