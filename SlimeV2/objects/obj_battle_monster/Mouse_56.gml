/// @description Move monster


if(not obj_TurnController.your_turn or not is_clicked){
	// dont let them move out of turn!!!!!!!
	// and dont do anything for monsters that arent active
	return;
}

//What tile is the mouse on?
mouse_tile_x = floor(mouse_x/grid_size);
mouse_tile_y = floor(mouse_y/grid_size);

x_cell = floor(x/grid_size)
y_cell = floor(y/grid_size)

if(mouse_tile_x != x_cell || mouse_tile_y != y_cell){
	is_clicked = false
}

//check if anothermonster has been clicked on
var clicked_on_monster = ds_grid_get(obj_grid.map_grid, mouse_tile_x, mouse_tile_y) == ds_monster
//position_meeting(grid_size * (mouse_tile_x + 0.5),grid_size * (mouse_tile_y + 0.5),obj_battle_monster);


var enemy = instance_position((mouse_tile_x + 0.5) * grid_size, (mouse_tile_y + 0.5) * grid_size, obj_battle_enemy);
//go into battle with enemies
if(enemy != noone){
	if((abs(x_cell-floor(enemy.x/grid_size))
			+ abs(y_cell-floor(enemy.y/grid_size))) == 1){
		
		//in_battle =1;
		//set the enemy's in_battle to 1:
	
		//enemy.in_battle = 1
		is_clicked = false
		script_execute(scr_encounter, id, enemy)
		enemy.active = false
		
		show_debug_message("Monster entered encounter obj_battle_monster Global Left Released")
		//room_goto(rm_encounter);
	}
	return;
}


// remove the monster 
// from its current cell
// for pathfinding
script_execute(scr_update_grids, x_cell, y_cell, ds_floor)

//make a path
if(mp_grid_path(obj_grid.entity_grid,
	monster_path,
	x_cell*grid_size,
	y_cell*grid_size,
	mouse_tile_x*grid_size,
	mouse_tile_y*grid_size,
	false)){
	
	//Can the slime actually path to the point with the given speed?
	var path_length = ceil(path_get_length(monster_path)/grid_size)
	can_path = (path_length<=endurance);


	//if the slime's been clicked on before and we're not clicking a wall, move the slime.
	if(ds_grid_get(obj_grid.map_grid, mouse_tile_x, mouse_tile_y) == ds_floor
			// don't let the slime run into other monsters
		&& !clicked_on_monster){
		if(can_path){
			path_start(monster_path,16,path_action_stop,true);
			endurance -= path_length
			// put the monster in the grid, in the new place!
			script_execute(scr_update_grids, mouse_tile_x, mouse_tile_y, ds_monster)
		} else {
			// put the monster back in the grid
			script_execute(scr_update_grids, x_cell, y_cell, ds_monster)
		}
		is_clicked = false;
	} else {
		// put the monster back in the grid
		script_execute(scr_update_grids, x_cell, y_cell, ds_monster)
		
	
		/*if(mouse_tile_x == floor(x/grid_size)
			&& mouse_tile_y == floor(y/grid_size)) {
			//If we're just clicking on the slime, mark it as clicked
			is_clicked = true;
		} else if (ds_grid_get(obj_grid.map_grid, mouse_tile_x, mouse_tile_y) != ds_floor){
			//If we're clicking on a wall, nothing deserves to get clicked; reset!
			is_clicked = false;
		} else {
			// Alex: I added this last clause to fix things
			is_clicked = false;
		}*/
	} 
} else {
	show_debug_message("couldn't find a path")
	
	// couldn't find a path, put the monster back
	script_execute(scr_update_grids, x_cell, y_cell, ds_monster)
}


