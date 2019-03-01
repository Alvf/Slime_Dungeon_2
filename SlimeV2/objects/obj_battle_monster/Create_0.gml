/// @description Setup speeds, tools

// have the monster be saved, and restored in build and battle
save = true

// speeds
move_sp = 4
hsp = 0
vsp = 0

// keeps track if the monster has been clicked on
is_clicked = false;

// Slime's default allowed grid movements
monster_movement = 5;
monster_path = path_add();

//Monster's moves left per turn
monster_endurance = 5;

in_battle = 0;

//future variable for attacking
has_attacked = false;

hp = 30;
attack = 10;

obj_grid.cell_x = floor(x / grid_size)
obj_grid.cell_y = floor(y / grid_size)
obj_grid.cell_type = ds_monster 
update_grids 