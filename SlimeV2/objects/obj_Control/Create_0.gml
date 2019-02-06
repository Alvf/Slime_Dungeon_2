/// @description Load and create tilemap
// You can write your code in this editor

// Fix VSYNC issues
display_reset(0, true);

global.game_width = 1280
global.game_height = 896
display_set_gui_size(global.game_width, global.game_height)

// Set this to true to load from the tilemap in the gamemaker editor.
// If it's false, this will just create a box around the edge.

//Slime cell positions
slime_cell_x = 1;
slime_cell_y = 1;

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
path_grid = mp_grid_create(-grid_size/2,-grid_size/2,grid_width,grid_height,grid_size,grid_size);
for(i = 0;i<grid_width;i++){
	for(j=0;j<grid_height;j++){
		if(ds_grid_get(map_grid,i,j)!=ds_floor){
			mp_grid_add_cell(path_grid,i,j);
		}
	}
}