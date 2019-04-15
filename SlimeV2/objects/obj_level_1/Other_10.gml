/// @description Insert description here
// You can write your code in this editor
/// @description Spawn monsters

with(instance_create_layer(64, 64, "Instances", obj_build_monster)){
	max_endurance = 1;
	endurance = max_endurance;
	sprite_index = Sprite_Slime_01;
}

with(instance_create_layer(64, 128, "Instances", obj_build_monster)){
	sprite_index = Sprite_Skeleton;
}
