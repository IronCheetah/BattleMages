//Freeze Victim
target = instance_place(x,y,obj_player);
if (user != target.player_number)
{
target.frozen = 1;
}
