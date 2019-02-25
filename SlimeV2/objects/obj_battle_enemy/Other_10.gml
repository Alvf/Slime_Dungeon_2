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

//calculate distance to gold
gold_path_length = floor(path_get_length(enemy_path)/grid_size);

//walk towards the gold with your movement
if(path_index != -1){
while(path_position*gold_path_length< grid_size*enemy_movement){
	path_position+=16/gold_path_length;
}
path_position = grid_size*enemy_movement/gold_path_length;
}
