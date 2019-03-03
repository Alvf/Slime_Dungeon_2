/// @description Keep walking
// You can write your code in this editor

if(enemy_movement > 0){
	// if we can still move,
	// call the enemy AI
	event_user(0);
} else {
	// if we can't move,
	// disable this enemy,
	// and have the turn controller move another one
	active = 0
	with(obj_TurnController){
		event_user(0);
	}
}

