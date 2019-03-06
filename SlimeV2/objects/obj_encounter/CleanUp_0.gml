/// @description Insert description here
// You can write your code in this editor

instance_destroy(enemy_obj)
instance_destroy(monster_obj)

layer_set_visible(layer_get_id("Instances"), true)

if(instance_number(obj_battle_enemy) == 0){
		room_goto(rm_build);
}

if(instance_number(obj_battle_monster) == 0){
		room_goto(rm_build);
}

if(not obj_TurnController.your_turn){
	
	// have the monsters continue taking their turn
	with(obj_TurnController){
		event_user(1);
	}

} 
/*else {
	if(instance_number(obj_battle_enemy) == 0){
		room_goto(rm_build);
	} else {
		show_debug_message("Nope, there are still " + string(instance_number(obj_battle_enemy)) + " monsters")
	}
}*/