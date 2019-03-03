/// @description Give turn to enemies
// You can write your code in this editor

if(your_turn == 1){
	your_turn = 0
	// give the enemies their turn
	
	with(obj_battle_enemy){
		enemy_movement = 3;
	}
	
	event_user(0);
	
	with(obj_battle_monster){
		monster_endurance = monster_movement;
	}
}


