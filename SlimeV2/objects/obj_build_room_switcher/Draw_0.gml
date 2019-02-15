/// @description Debug drawing (disable)
// You can write your code in this editor

// debug drawing 
/*
if(obj_loadout.gold_placed){
	for(var i=0;i<grid_width;i++){
		for(var j=0;j<grid_height;j++){
			if(ds_grid_get(obj_grid.map_grid,i,j)==ds_gold){
				gold_x = i;
				gold_y = j;
			}
		}
	}
	
	var found_path = mp_grid_path(obj_grid.path_grid,gold_path,gold_x*grid_size,gold_y*grid_size,19*grid_size,6*grid_size,false)	
	draw_set_alpha(0.5);
	mp_grid_draw(obj_grid.path_grid);
	draw_set_alpha(1);
	if(found_path){
		draw_path(gold_path,(gold_x)*grid_size,(gold_y)*grid_size,false);
	}
}
*/