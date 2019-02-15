/// @description Update a single tile

#macro update_grids with(obj_grid){ event_user(0) }

// How this works

// In a different object, do this:
//    obj_grid.cell_x = 3
//    obj_grid.cell_y = 5
//    obj_grid.cell_type = ds_wall
//    update_grids
// This will set cell (3,5) to a wall
// and automagically update pathfinding, tilemap, and ds_grid 
// all at once!

// THIS IS A VERY LIMITED FUNCTION
// It doesn't check if you have enough resources,
// or if you're setting a wall to more wall.
// All it does it set the tile, and fix the mp_grid and tile_map.

ds_grid_set(map_grid, cell_x, cell_y, cell_type);
// show_debug_message("Setting " + string(cell_x) + ", " + string(cell_y) + " to tile " + string(cell_type));

if(cell_type == ds_wall){
	mp_grid_add_cell(path_grid, cell_x, cell_y)
} else {
	mp_grid_clear_cell(path_grid, cell_x, cell_y)
}

if(cell_type == ds_wall){	
	// check tile below
	if(cell_y + 1 < grid_height && ds_grid_get(map_grid, cell_x, cell_y + 1) == ds_wall){
		tilemap_set(tilemap_id, tile_wall_top, cell_x, cell_y)
	} else {
		tilemap_set(tilemap_id, tile_wall_front, cell_x, cell_y)
	}
	
	// check tile above
	if(cell_y - 1 >= 0 && ds_grid_get(map_grid, cell_x, cell_y - 1) == ds_wall){
		tilemap_set(tilemap_id, tile_wall_top, cell_x, cell_y - 1)
	}
	
} else if(cell_type == ds_floor) {
	tilemap_set(tilemap_id, tile_floor, cell_x, cell_y);
	if(cell_y - 1 >= 0 && ds_grid_get(map_grid, cell_x, cell_y - 1) == ds_wall){
		tilemap_set(tilemap_id, tile_wall_front, cell_x, cell_y - 1);
	}
} else if (cell_type == ds_gold){
	tilemap_set(tilemap_id, tile_gold, cell_x, cell_y);
} else if (cell_type == ds_monster){
	// for debug reasons
	//tilemap_set(tilemap_id, tile_gold, cell_x, cell_y);
}