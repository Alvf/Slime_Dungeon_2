/// @description Spawn peasants
// You can write your code in this editor
if(room == rm_build){
	rand_x = floor(random_range(0,512)/grid_size);
	rand_y = floor(random_range(0,512)/grid_size);
	while(ds_grid_get(obj_grid.map_grid,rand_x,rand_y)!=ds_floor){
		rand_x = floor(random_range(0,512)/grid_size);
	rand_y = floor(random_range(0,512)/grid_size);
	}
	var inst = instance_create_layer(grid_size*rand_x,grid_size*rand_y, 
		"Instances", obj_build_monster);
	inst.sprite_index = AwfulRock;
}