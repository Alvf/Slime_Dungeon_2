path_grid = mp_grid_create(-grid_size/2,-grid_size/2,grid_width,grid_height,grid_size,grid_size);
for(var i = 0;i<grid_width; i++){
	for(var j=0;j<grid_height;j++){
		if(ds_grid_get(obj_Control.map_grid,i,j)==ds_wall){
			mp_grid_add_cell(path_grid,i,j);
		}
		if(position_meeting((i+.5)*grid_size,(j+.5)*grid_size,obj_battle_Hero)){
			mp_grid_add_cell(path_grid,i,j);
			//show_debug_message("found hero!")
		}
	}
}