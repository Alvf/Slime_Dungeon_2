/// @description Handles Grid-Based Movement

// Check if player is aligned to the grid.
// If so, process input to decide on movement
if (floor(x mod grid_size) <= move_sp) and (floor(y mod grid_size) <= move_sp) // Check for grid alignment
{
	// What tile is the player on?	
	x_cell = x / grid_size;
	y_cell = y / grid_size;
	
	// Which way should we move?
    var move_x = keyboard_check(ord("D")) - keyboard_check(ord("A")), // Obtain the direction of the horizontal movement
        move_y = keyboard_check(ord("S")) - keyboard_check(ord("W")); // Same as above, but for vertical movement

    hsp = 0; // Reset speed values
    vsp = 0;

	
	// Collision detection 
	if ((move_x > 0 && ds_grid_get(obj_grid.map_grid, x_cell + 1, y_cell) != 1)
		|| (move_x < 0 && ds_grid_get(obj_grid.map_grid, x_cell - 1, y_cell) != 1)) {
		move_x = 0;
	}
	
	if ((move_y > 0 && ds_grid_get(obj_grid.map_grid, x_cell, y_cell + 1) != 1)
		|| (move_y < 0 && ds_grid_get(obj_grid.map_grid, x_cell, y_cell - 1) != 1)) {
		move_y = 0;
	}
	
	
	if (move_x != 0) and (move_y != 0)
    {
        move_y = 0; // Quick and dirty check to prevent diagonal movement
    }
	
    hsp = move_x * move_sp; // Set the movement speeds based on movement direction
    vsp = move_y * move_sp;
}




x += hsp; // Move the instance if appllcable
y += vsp;
