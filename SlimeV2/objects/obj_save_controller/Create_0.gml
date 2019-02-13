/// @description Create starting monster

// Also for testing and whatnot:
// creates the first monster
// this may cause bugs in the future
var inst = instance_create_layer(grid_size, grid_size, "Instances", obj_build_monster);
	
inst.sprite_index = Sprite_Slime_01