/// @description Start enemy turn

// its still your turn...
if(your_turn) {
	return 
}	

for(var i = 0; i < instance_number(obj_battle_enemy); i++){
	ds_queue_enqueue(turn_queue, instance_find(obj_battle_enemy, i))
	//var obj = instance_id_get(i)
	//if(obj.object_index == obj_battle_enemy){
	//	ds_queue_enqueue(turn_queue, obj)
		/*
		if(obj.active == 1){
			show_debug_message("Found an enemy")
			active_enemy = obj;
			break;
		}*/
	//}
}

if(ds_queue_size(turn_queue) == 0){
	// hooray, you killed everyone!
	
	// short delay to avoid bugs
	// TODO FIXME
	alarm[0] = room_speed * .5
	return 
} else {

	// add every enemy again so that if they get stuck
	// they get another chance.
	// TODO fix this better
	for(var i = 0; i < instance_number(obj_battle_enemy); i++){
		ds_queue_enqueue(turn_queue, instance_find(obj_battle_enemy, i))
		//var obj = instance_id_get(i)
		//if(obj.object_index == obj_battle_enemy){
		//	ds_queue_enqueue(turn_queue, obj)
		//}
	}
	for(var i = 0; i < instance_number(obj_battle_enemy); i++){
		ds_queue_enqueue(turn_queue, instance_find(obj_battle_enemy, i))
		//var obj = instance_id_get(i)
		//if(obj.object_index == obj_battle_enemy){
		//	ds_queue_enqueue(turn_queue, obj)
		//}
	}
	
	// start running turns
	event_user(1);

}

	