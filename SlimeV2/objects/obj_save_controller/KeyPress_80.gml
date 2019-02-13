/// @description Spawn peasants
// You can write your code in this editor
if(room == rm_build){
	var inst = instance_create_layer(grid_size*floor(random_range(0,512)/grid_size), 
		grid_size*floor(random_range(0,512)/grid_size), 
		"Instances", obj_build_monster)
	inst.sprite_index = Peasant
}