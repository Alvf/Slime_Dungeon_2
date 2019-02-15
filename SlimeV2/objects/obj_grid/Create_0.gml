/// @description Load the saved grid
// You can write your code in this editor
map_grid = ds_grid_create(grid_width, grid_height)

path_grid = mp_grid_create(-grid_size/2,
	-grid_size/2,
	grid_width,
	grid_height,
	grid_size,
	grid_size);

tilemap_layer_id = layer_get_id("tile_map")
tilemap_id = layer_tilemap_get_id(tilemap_layer_id)

if(file_exists("grid.ini")){
	// load tilemap from save file
	ini_open("grid.ini")
	ds_grid_read(map_grid, ini_read_string("map", "grid", ""))
	ini_close()
	
	// having loaded the grid from a file,
	// we need to update the tilemap
	for (var i = 0; i < grid_width; i++) {
		for (var j = 0; j < grid_height; j++) {
			var tile = ds_grid_get(map_grid, i, j);
			if (tile == ds_wall){
				if (j < grid_height-1){
					var tile_below = ds_grid_get(map_grid, i, j+1);
					if(tile_below == ds_wall){
						tile = tile_wall_top;
					} else {
						tile = tile_wall_front;
					}
				}
			}
			tilemap_set(tilemap_id, tile, i, j);
		}
	}
} else {
	// load tilemap from the one created in gamemaker
	for(var i = 0; i < grid_width; i++){
		for(var j = 0; j < grid_height; j++){
			var tile = tilemap_get(tilemap_id, i, j);
			//if(tile == tile_wall_front || tile_wall_top) {tile = ds_wall};
			switch(tile){
				case tile_wall_front:
				case tile_wall_top:
					tile = ds_wall;
					break;
				case tile_floor:
					tile = ds_floor;
					break;
			}
			ds_grid_set(map_grid, i, j, tile);
		}
	}
}


for(var i = 0;i<grid_width; i++){
	for(var j=0;j<grid_height;j++){
		if(ds_grid_get(map_grid,i,j)==ds_wall){
			mp_grid_add_cell(path_grid,i,j);
		}
		if(position_meeting((i+.5)*grid_size,(j+.5)*grid_size,obj_battle_Hero)){
			mp_grid_add_cell(path_grid,i,j);
		}
	}
}

// for cell by cell updates
cell_x = 0
cell_y = 0
cell_type = ds_wall