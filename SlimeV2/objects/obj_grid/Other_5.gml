/// @description Save the grid
// You can write your code in this editor
ini_open("grid.ini")
for(var i = 0; i < grid_width; i++){
	for(var j = 0; j < grid_height; j++){
		// remove special player markers
		if(ds_grid_get(map_grid, i, j) == ds_monster){
			ds_grid_set(map_grid, i, j, ds_floor)
		}
	}
}
ini_write_string("map", "grid", ds_grid_write(map_grid))
ini_close()
ds_grid_destroy(map_grid)
mp_grid_destroy(path_grid)