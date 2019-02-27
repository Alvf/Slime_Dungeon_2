/// @description Monster AI
// You can write your code in this editor
//ask the mp_grid where the gold is
for(var i=0;i<grid_width;i++){
		for(var j=0;j<grid_height;j++){
			if(ds_grid_get(obj_grid.map_grid,i,j)==ds_gold){
				gold_x = i;
				gold_y = j;
			}
		}
	}

//make path to gold
mp_grid_path(obj_grid.path_grid,
	enemy_path,
	floor(x/grid_size)*grid_size,
	floor(y/grid_size)*grid_size,
	gold_x*grid_size,
	gold_y*grid_size,
	false);

//define where exactly you want to land (in pixels)
goal_x = path_get_point_x(enemy_path,enemy_movement);
goal_y = path_get_point_y(enemy_path,enemy_movement);

//truncate your path to the gold by going only to goal_x and goal_y
mp_grid_path(obj_grid.path_grid,
	enemy_path,
	floor(x/grid_size)*grid_size,
	floor(y/grid_size)*grid_size,
	goal_x,
	goal_y,
	false);
	
//run the animation to the new position!
path_start(enemy_path, 16, path_action_stop, true)