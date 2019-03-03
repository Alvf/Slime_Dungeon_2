/// @description Enemy AI (one step at a time)


// This event has the enemy take 
// a single step at a time.
// If there is a monster blocking 
// the enemies path, it will attack 
// that enemy



// goal
// have the enemies first check for monsters in a certain range.
// if they can't find any, then path along the path grid.

//ask the mp_grid where the gold is
// TODO optimize this into the grid object
for(var i=0;i<grid_width;i++){
		for(var j=0;j<grid_height;j++){
			if(ds_grid_get(obj_grid.map_grid,i,j)==ds_gold){
				gold_x = i;
				gold_y = j;
			}
		}
	}

obj_grid.cell_x = floor(x/grid_size)
obj_grid.cell_y = floor(y/grid_size)
obj_grid.cell_type = ds_floor
update_grids

//make path to gold
if(mp_grid_path(obj_grid.path_grid,
	enemy_path,
	floor(x/grid_size)*grid_size,
	floor(y/grid_size)*grid_size,
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
		floor(x/grid_size)*grid_size,
		floor(y/grid_size)*grid_size,
		goal_x,
		goal_y,
		false);
	
	if(goal_x == gold_x && goal_y == gold_y){
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
		
		monster.in_battle = 1;
		active = 0
		in_battle = 1;
		room_goto(rm_encounter);
	} else if(next_cell == ds_enemy){
		
		// so if another enemy is in the way, we have 
		// the enemy just give up...
		
		// we should probably fix this in the future
		// but 
		
		show_debug_message("an enemy ceded its turn")
		
		active = 0
		
		with(obj_TurnController){
			event_user(0);
		}
		
	} else {
		obj_grid.cell_x = floor(goal_x/grid_size)
		obj_grid.cell_y = floor(goal_y/grid_size)
		obj_grid.cell_type = ds_enemy
		update_grids
		
		enemy_movement -= 1
		
		path_start(enemy_path, 16, path_action_stop, true)
	}

} else {
	show_debug_message("monster gave up...")
	obj_grid.cell_x = floor(x/grid_size)
	obj_grid.cell_y = floor(y/grid_size)
	obj_grid.cell_type = ds_enemy
	update_grids
}


	
