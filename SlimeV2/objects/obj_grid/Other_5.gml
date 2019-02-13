/// @description Save the grid
// You can write your code in this editor
ini_open("grid.ini")
ini_write_string("map", "grid", ds_grid_write(map_grid))
ini_close()
ds_grid_destroy(map_grid)
mp_grid_destroy(path_grid)