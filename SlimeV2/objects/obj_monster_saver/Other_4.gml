/// @description Load saved monsters

#macro MONSTER_SAVE_FILE "monster.ini"

// if(room == rm_battle){


if(not file_exists(MONSTER_SAVE_FILE)){
	// if no monsters saved yet, spawn the first one
	//instance_create_layer(grid_size, grid_size, "Instances", obj_build_monster)
	with(global.obj_level){
		event_user(0);
	}
	return 
} 

	
ini_open(MONSTER_SAVE_FILE);
	
var numMonsters = ini_read_real("meta", "numMonsters", 0)
var numberOfAliveMonsters = 0
	
var objType = -1;
	
switch(room){
	case global.level:
		objType = obj_build_monster
		break;
	case rm_battle:
		objType = obj_battle_monster
		break;
	default:
		// don't spawn monsters in other rooms
		return;
}
	
for(var i = 0; i < numMonsters; i++){
	var section = "monster" + string(i)
	var monster_x = ini_read_real(section, "x", 0)
	var monster_y = ini_read_real(section, "y", 0)
		
	var hp = ini_read_real(section, "hp", 30)
	if(hp <= 0){
		// don't load dead monsters
		continue;
	} else {
		numberOfAliveMonsters++
	}
		
	var inst = instance_create_layer(monster_x, monster_y, "Instances", objType)
	with(inst){
		inst.sprite_index = ini_read_real(section, "spr", Peasant);
		inst.hp = ini_read_real(section, "hp", 30)
		inst.endurance = ini_read_real(section, "endurance", 5);
		inst.max_endurance = ini_read_real(section, "max endurance", 5);
		inst.attack = ini_read_real(section, "attack", 10)			
	}
	
	show_debug_message("loading object at " + string(x) + ", " + string(y))
}
	
if(numberOfAliveMonsters == 0){
	room_goto(rm_lose)
}
