/// @description Building/Destroying

// Only let the player place things in the 8 tiles around them
if(mouse_in_valid_pos){
	 
	// Depending on the tool, and the tile already present, 
	// decide what should be placed and how resources should be changed.
	if(current_tool == 2 && obj_resources.rock > 0){
		if(m_cell == 1){
			// Placing obj_resources.rock
			ds_grid_set(obj_Control.map_grid, mx_cell, my_cell, ds_wall);
			
			var tile_below = ds_grid_get(obj_Control.map_grid, mx_cell, my_cell + 1);
			
			if(tile_below == ds_wall){
				tilemap_set(obj_Control.tile_id, tile_wall_top, mx_cell, my_cell);
			} else {
				tilemap_set(obj_Control.tile_id, tile_wall_front, mx_cell, my_cell);
			}

			// tile above
			if(ds_grid_get(obj_Control.map_grid, mx_cell, my_cell-1) == ds_wall){
				tilemap_set(obj_Control.tile_id, tile_wall_top, mx_cell, my_cell-1);
			}
			obj_resources.rock--;
			audio_play_sound(choose(snd_build1, snd_build2), 10, false)
		} 
	}else if (current_tool == 1) {
		if(m_cell == 4){
			obj_resources.rock++;
			ds_grid_set(obj_Control.map_grid, mx_cell, my_cell, 1);
			tilemap_set(obj_Control.tile_id, 1, mx_cell, my_cell);
			if(tilemap_get(obj_Control.tile_id, mx_cell, my_cell-1) == 2){
				tilemap_set(obj_Control.tile_id, 4, mx_cell, my_cell-1);
			}
			audio_play_sound(choose(snd_break1, snd_break2), 10, false)
		}else if(m_cell == 3){
			obj_resources.gold++;
			ds_grid_set(obj_Control.map_grid, mx_cell, my_cell, 1);
	
			tilemap_set(obj_Control.tile_id, 1, mx_cell, my_cell);
		}
	}else if (current_tool == 3) {
		if(obj_resources.gold > 0 && m_cell == 1){
			obj_resources.gold--;
			ds_grid_set(obj_Control.map_grid, mx_cell, my_cell, 3);
			tilemap_set(obj_Control.tile_id, 3, mx_cell, my_cell);
		}	
	}
	
}