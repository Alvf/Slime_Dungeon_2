/// @description Insert description here
// You can write your code in this editor

instance_destroy(enemy_obj)
instance_destroy(monster_obj)

layer_set_visible(layer_get_id("Instances"), true)

if(instance_number(obj_battle_enemy) == 0){
		room_goto(global.level);
}

if(instance_number(obj_battle_monster) == 0){
		room_goto(global.level);
}

if(not obj_TurnController.your_turn){
	
	// have the monsters continue taking their turn
	with(obj_TurnController){
		event_user(1);
	}

} 
