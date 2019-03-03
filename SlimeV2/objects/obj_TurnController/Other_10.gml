/// @description Have enemies take turns
// You can write your code in this editor

active_enemy = noone

var numberOfEnemies = 0

for(var i = 0; i < instance_count; i++){
	var obj = instance_id_get(i)
	if(obj.object_index == obj_battle_enemy){
		numberOfEnemies++
		if(obj.active == 1){
			show_debug_message("Found an enemy")
			active_enemy = obj;
			break;
		}
	}
}

if(numberOfEnemies == 0){
	// hooray, you killed everyone!
	
	// short delay to avoid bugs
	alarm[0] = room_speed * .5
}
	
if(your_turn == 1) {
	return 
}	
	
if(active_enemy != noone){
	with(active_enemy){
		event_user(0);
	}
} else {
	show_debug_message("gave up")
	your_turn = 1
	with(obj_battle_enemy){
		active = 1
	}
}