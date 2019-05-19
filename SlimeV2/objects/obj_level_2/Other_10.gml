 /// @description Spawn defenders

with(instance_create_layer(64, 64, "Instances", obj_build_monster)){
	max_endurance = 3;
	endurance = max_endurance;
	sprite_index = spr_VAMPIES;
}

with(instance_create_layer(64, 128, "Instances", obj_build_monster)){
	sprite_index = Sprite_Skeleton;
}
