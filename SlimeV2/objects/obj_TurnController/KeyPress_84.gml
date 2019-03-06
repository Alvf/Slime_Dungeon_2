/// @description Give turn to enemies
// You can write your code in this editor

if(your_turn){
	show_debug_message("Giving turn to monsters")
	
	your_turn = false
	// give the enemies their turn
	
	for(var i = 0; i < instance_number(obj_battle_enemy); i++){
		var enemy = instance_find(obj_battle_enemy, i)
		
		enemy.endurance = enemy.max_endurance
		enemy.active = true
	}
	
	with(obj_battle_enemy){
		endurance = max_endurance;
	}
	
	event_user(0);
	
	with(obj_battle_monster){
		endurance = max_endurance;
	}
}


