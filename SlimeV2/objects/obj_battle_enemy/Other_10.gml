/// @description Enemy AI (one step at a time)


// This event has the enemy take 
// a single step at a time.
// If there is a monster blocking 
// the enemies path, it will attack 
// that enemy

cell_x = floor(x/grid_size)
cell_y = floor(y/grid_size)

show_debug_message("Enemy taking turn")

if(endurance <= 0 or not active){
	endurance = 0
	active = false
	with(obj_TurnController){
		event_user(1);
	}
	return 
}

show_debug_message("Enemy actually taking turn")

// goal
// have the enemies first check for monsters in a certain range.
// if they can't find any, then path along the path grid.

script_execute(scr_update_grids, cell_x, cell_y, ds_floor)

//make path to gold
if(mp_grid_path(obj_grid.path_grid,
	enemy_path,
	cell_x*grid_size,
	cell_y*grid_size,
	gold_x*grid_size,
	gold_y*grid_size,
	false)){
	
	//define where exactly you want to land (in pixels)
	//and only take one step
	goal_x = path_get_point_x(enemy_path,1);
	goal_y = path_get_point_y(enemy_path,1);

	//truncate your path to the gold by going only to goal_x and goal_y
	mp_grid_path(obj_grid.path_grid,
		enemy_path,
		cell_x*grid_size,
		cell_y*grid_size,
		goal_x,
		goal_y,
		false);
	
	// show_debug_message("goal: " + string(goal_x) + ", " + string(goal_y))
	
	if(floor(goal_x/grid_size) == gold_x && floor(goal_y/grid_size) == gold_y){
		show_debug_message("so the player lost...")
		room_goto(rm_lose);
	}
	
	
	// find out what we're trying to walk onto
	var next_cell = ds_grid_get(obj_grid.map_grid, floor(goal_x/grid_size), floor(goal_y/grid_size))
	
	if(next_cell == ds_monster){
		var monster = instance_position(goal_x + 1, goal_y + 1, obj_battle_monster)
		
		if(monster == noone){
			show_debug_message("Couldn't find monster...")
			show_debug_message("goal: " + string(goal_x) + " " + string(goal_y))
			show_debug_message("monster: " + string(monster))
			return 
		}
		
		script_execute(scr_encounter, id, monster)
		active = false
		show_debug_message("ENCOUNTER obj_battle_enemy User Event 0")
		/*monster.in_battle = 1;
		active = 0
		in_battle = 1;
		room_goto(rm_encounter);*/
		
		script_execute(scr_update_grids, cell_x, cell_y, ds_enemy)
		
	} else if(next_cell == ds_enemy){
		
		script_execute(scr_update_grids, cell_x, cell_y, ds_enemy)
		show_debug_message("an enemy ceded its turn")
		
		with(obj_TurnController){
			event_user(1);
		}
		
	} else {
		
		script_execute(scr_update_grids, floor(goal_x/grid_size), floor(goal_y/grid_size), ds_enemy)
		
		endurance -= 1
		
		path_start(enemy_path, 16, path_action_stop, true)
	}

} else {
	show_debug_message("monster gave up...")
	script_execute(scr_update_grids, cell_x, cell_y, ds_enemy)
}


	
