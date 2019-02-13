/// @description Recalculate variables
// You can write your code in this editor
x_cell = floor(mouse_x / grid_size)
y_cell = floor(mouse_y / grid_size)

var player = obj_build_monster_controller.current_monster

if(abs(x_cell - player.x_cell) <= 1 
 && abs(y_cell - player.y_cell) <= 1 
 && (y_cell != player.y_cell 
 || x_cell != player.x_cell) 
 && ((x_cell != 0) && (x_cell != grid_width - 1) 
 && (y_cell != 0) && (y_cell != grid_height - 1))){
	 mouse_in_valid_pos = true;
 } else {
	 mouse_in_valid_pos = false;
 }
 
tile = ds_grid_get(obj_Control.map_grid, x_cell, y_cell)