/// @description Grid based movement

//(obj_build_monster_controller.current_monster == id) and 


// check for grid alignment
if (floor(x mod grid_size) == 0) and 
	(floor(y mod grid_size) == 0){
	
	// Remove player from last cell
	script_execute(scr_update_grids, x_cell, y_cell, ds_floor)
		
	x_cell = floor(x / grid_size);
	y_cell = floor(y / grid_size);
	
	// Now mark them 
	script_execute(scr_update_grids, x_cell, y_cell, ds_monster)
	
	var move_x = 0, move_y = 0
	
	// check if this is the monster that we are controlling
	if (obj_build_monster_controller.current_monster == id) {
		move_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
		move_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));
	}
		
	hsp = 0;
	vsp = 0;
	
	if ((move_x > 0 && ds_grid_get(obj_grid.map_grid, x_cell + 1, y_cell) != 1)
		|| (move_x < 0 && ds_grid_get(obj_grid.map_grid, x_cell - 1, y_cell) != 1)) {
		move_x = 0;
	}
	
	if ((move_y > 0 && ds_grid_get(obj_grid.map_grid, x_cell, y_cell + 1) != 1)
		|| (move_y < 0 && ds_grid_get(obj_grid.map_grid, x_cell, y_cell - 1) != 1)) {
		move_y = 0;
	}
	
	if (move_x != 0) and (move_y != 0){
		move_y = 0; // stop diagonals
	}
	
	hsp = move_x * move_sp;
	vsp = move_y * move_sp;
}

if(hsp > 0){
	next_x_cell = x_cell+1
} else if(hsp < 0){
	next_x_cell = x_cell-1
} else {
	next_x_cell = x_cell
}

if(vsp > 0){
	next_y_cell = y_cell+1
} else if(vsp < 0){
	next_y_cell = y_cell - 1
} else {
	next_y_cell = y_cell
}

if(hsp != 0 || vsp != 0){
	script_execute(scr_update_grids, next_x_cell, next_y_cell, ds_monster)
}

x += hsp;
y += vsp;

// update camera
if (obj_build_monster_controller.current_monster == id) {
	obj_camera_controller.target_x = x
	obj_camera_controller.target_y = y
}