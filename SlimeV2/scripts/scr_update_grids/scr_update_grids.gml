with(obj_grid)
{
ds_grid_set(map_grid, cell_x, cell_y, cell_type);
// show_debug_message("Setting " + string(cell_x) + ", " + string(cell_y) + " to tile " + string(cell_type));

// add all walls to path_grid and entity_grid
if(cell_type == ds_wall){
	mp_grid_add_cell(path_grid, cell_x, cell_y)
	mp_grid_add_cell(entity_grid, cell_x, cell_y)
// add all not floors to entity_grid, remove from path grid
// i.e. monsters, gold, whatnot
} else if(cell_type != ds_floor && cell_type != ds_gold){
	mp_grid_add_cell(entity_grid, cell_x, cell_y)
	mp_grid_clear_cell(path_grid, cell_x, cell_y)
// floor: remove from both
} else {
	mp_grid_clear_cell(entity_grid, cell_x, cell_y)
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
}