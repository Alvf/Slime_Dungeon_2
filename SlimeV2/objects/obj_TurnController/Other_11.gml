/// @description Progress enemy turn

if(ds_queue_size(turn_queue) == 0){
	your_turn = true
	show_debug_message("Its your turn now")
	
	if(instance_number(obj_battle_enemy) == 0){
		room_goto(rm_build);
	}
	
	for(var i = 0; i < instance_number(obj_battle_monster); i++){
		var monster = instance_find(obj_battle_monster, i);
		monster.endurance = monster.max_endurance
	}
	
} else {
	// get an enemy, have them take their turn 
	var enemy = ds_queue_dequeue(turn_queue)
	if(instance_exists(enemy) and enemy.object_index == obj_battle_enemy){
		with(enemy){
			event_user(0);
		}
	} else {
		event_user(1);
	}
}
