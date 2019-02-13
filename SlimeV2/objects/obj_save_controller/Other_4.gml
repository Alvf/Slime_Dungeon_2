/// @description Load saved monsters
// You can write your code in this editor

if(room == rm_build || room == rm_battle){
	var objType;
	if(room == rm_build){
		objType = obj_build_monster;
	} else if (room == rm_battle){
		objType = obj_battle_monster;
	}
	
	ini_open("save.ini");
	var numMonsters = ini_read_real("meta", "numMonsters", 0)
	
	for(var i = 0; i < numMonsters; i++){
		var section = "monster" + string(i)
		var monster_x = ini_read_real(section, "x", 0)
		var monster_y = ini_read_real(section, "y", 0)
		var inst = instance_create_layer(monster_x, monster_y, "Instances", objType)
		with(inst){
			inst.sprite_index = ini_read_real(section, "spr", Peasant);
		}
	
		show_debug_message("loading object at " + string(x) + ", " + string(y))
	}
	
} 