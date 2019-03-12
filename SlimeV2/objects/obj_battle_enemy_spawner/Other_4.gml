/// @description spawn enemies
// You can write your code in this editor

var num_enemies = floor(random_range(1,4));
for(var i = 0; i < num_enemies; i++){
	var inst = instance_create_layer(19 * grid_size, (5+i) * grid_size , "Instances", obj_battle_enemy);
	with(inst){
		inst.sprite_index = choose(spr_Hero, Peasant, spr_Hammer);
	}
}
