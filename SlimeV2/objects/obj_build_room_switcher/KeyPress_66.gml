/// @description Switch to battle


// why can they go to battle if the gold isn't placed?
// probably for testing and whatnot
if(!obj_loadout.gold_placed){
	room_goto(rm_battle);
}else{	
	
	for(var i=0;i<grid_width;i++){
		for(var j=0;j<grid_height;j++){
			if(ds_grid_get(obj_grid.map_grid,i,j)==ds_gold){
				gold_x = i;
				gold_y = j;
			}
		}
	}
	
	if(mp_grid_path(obj_grid.path_grid,
		gold_path,
		gold_x*grid_size,
		gold_y*grid_size,
		19*grid_size,
		6*grid_size,
		false)){
			room_goto(rm_battle);
	}else{
		show_debug_message("no path!");
	}

}