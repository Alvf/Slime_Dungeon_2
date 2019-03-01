/// @description Insert description here
// You can write your code in this editor

enemy_movement = 5;
enemy_path = path_add();

in_battle = 0;

active = 1;

hp = 20;
attack = 7;

obj_grid.cell_x = floor(x/grid_size)
obj_grid.cell_y = floor(y/grid_size)
obj_grid.cell_type = ds_enemy
update_grids