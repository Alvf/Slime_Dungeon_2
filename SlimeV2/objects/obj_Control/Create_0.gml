/// @description Load and create tilemap
// You can write your code in this editor

// Fix VSYNC issues
display_reset(0, true);

//global.game_width = 1280
//global.game_height = 896
//display_set_gui_size(global.game_width, global.game_height)


map_grid = ds_grid_create(grid_width,grid_height);

tile_layer_id = layer_get_id("tile_map");
tile_id = layer_tilemap_get_id(tile_layer_id);

for(var i = 0; i < grid_width; i++){
		for(var j = 0; j < grid_height; j++){
			var tile = tilemap_get(tile_id, i, j);
			if(tile == tile_wall_front || tile == tile_wall_top) { tile = ds_wall };
			ds_grid_set(map_grid, i, j, tile);
	}
}

//create a mp_grid for pathfinding based on sprite grid
script_execute(scr_ds_grid_to_mp_grid);