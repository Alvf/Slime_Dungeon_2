var cell_x = argument0
var cell_y = argument1

scr_update_grids(cell_x - 1, cell_y, ds_grid_get(obj_grid.map_grid, cell_x - 1, cell_y))
scr_update_grids(cell_x + 1, cell_y, ds_grid_get(obj_grid.map_grid, cell_x + 1, cell_y))
scr_update_grids(cell_x, cell_y + 1, ds_grid_get(obj_grid.map_grid, cell_x, cell_y + 1))
scr_update_grids(cell_x, cell_y - 1, ds_grid_get(obj_grid.map_grid, cell_x, cell_y - 1))