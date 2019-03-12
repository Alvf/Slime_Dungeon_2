/// @description Insert description here
// You can write your code in this editor

stuck = false

max_endurance = 3
endurance = max_endurance;
enemy_path = path_add();

in_battle = 0;

active = true;

max_hp = 20
hp = max_hp
attack = 7;

cell_x = floor(x/grid_size)
cell_y = floor(y/grid_size)

script_execute(scr_update_grids, floor(x/grid_size), floor(y/grid_size), ds_enemy)

//ask the mp_grid where the gold is
// TODO optimize this into the grid object
for(var i=0;i<grid_width;i++){
		for(var j=0;j<grid_height;j++){
			if(ds_grid_get(obj_grid.map_grid,i,j)==ds_gold){
				gold_x = i;
				gold_y = j;
				show_debug_message("enemy found gold")
			}
		}
	}