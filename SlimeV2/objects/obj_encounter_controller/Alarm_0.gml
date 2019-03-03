/// @description Deal the damage

obj_encounter_enemy.hp -= obj_encounter_monster.attack 

if(obj_encounter_enemy.hp > 0){
	obj_encounter_monster.hp -= obj_encounter_enemy.attack
}

alarm[1] = 1 * room_speed;