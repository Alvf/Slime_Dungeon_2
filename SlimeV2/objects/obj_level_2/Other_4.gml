/// @description Start wave
// You can write your code in this editor
if(room == rm_battle){
	wave_number += 1

	switch(wave_number){
		case 1:
		
			var inst = instance_create_layer(20 * grid_size, 7 * grid_size , "Instances", obj_battle_enemy);
			with(inst){
				inst.sprite_index = Peasant
				inst.max_endurance = 3;
				inst.endurance = inst.max_endurance;
			
				inst.attack = 5;
			
				inst.max_hp = 10;
				inst.hp = 10;
			}
			var inst = instance_create_layer(20 * grid_size, 6 * grid_size , "Instances", obj_battle_enemy);
			with(inst){
				inst.sprite_index = spr_Hammer
				inst.max_endurance = 7;
				inst.endurance = inst.max_endurance;
			
				inst.attack = 3;
			
				inst.max_hp = 15;
				inst.hp = 15;
			}
			break;
		
		case 2:
			var inst = instance_create_layer(20 * grid_size, 6 * grid_size, "Instances", obj_battle_enemy);
			with(inst){
				inst.sprite_index = spr_Hammer;
			
				inst.max_endurance = 4;
				inst.endurance = 4;
			
				inst.attack = 5;
			
				inst.max_hp = 20;
				inst.hp = 20;
			}
			break;
		
	}
} else if (room == rm_level_select) {
	// save level here
	instance_destroy();
	
} else if (room == rm_level_2){
	if(wave_number >= 2){
		alarm[0] = room_speed * 0.5;
		//instance_destroy();
	}
}
