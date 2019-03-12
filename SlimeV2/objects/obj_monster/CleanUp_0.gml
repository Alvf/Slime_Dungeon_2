/// @description Save memory

if(room == rm_battle){
	path_delete(monster_path)
}

script_execute(scr_update_grids, x_cell, y_cell, ds_floor)