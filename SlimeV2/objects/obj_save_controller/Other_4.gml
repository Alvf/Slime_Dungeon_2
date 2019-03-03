/// @description Load saved monsters
// You can write your code in this editor

if(room == rm_battle){
	var objType;
	if(room == rm_build){
		objType = obj_build_monster;
	} else if (room == rm_battle){
		objType = obj_battle_monster;
	}
	
	ini_open("save.ini");
	var numMonsters = ini_read_real("meta", "numMonsters", 0)
	
	var numberOfAliveMonsters = 0
	
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
			inst.monster_endurance = ini_read_real(section, "endurance", 5);
			inst.attack = ini_read_real(section, "attack", 10)
			inst.in_battle = ini_read_real(section, "in battle", 0)
		}
	
		show_debug_message("loading object at " + string(x) + ", " + string(y))
	}
	if(numberOfAliveMonsters == 0){
		room_goto(rm_lose)
	}
	
} 
else if(room == rm_build){
	file_delete("turn.ini")
	file_delete("battle.ini")
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
			inst.hp = ini_read_real(section, "hp", 30)
			inst.attack = ini_read_real(section, "attack", 10)
			ini_write_real(section,"in battle",inst.in_battle);
		}
	
		show_debug_message("loading object at " + string(x) + ", " + string(y))
	}
	
} 
else if(room == rm_encounter){
	var objType = obj_encounter_monster;
	ini_open("save.ini");
	var numMonsters = ini_read_real("meta","numMonsters",0);
	for(var i=0;i<numMonsters;i++){
		var section = "monster"+string(i);
		var inbattle = ini_read_real(section,"in battle",0);
			if(inbattle ==1){
				show_debug_message("found combatant!");
				var inst = instance_create_layer(190,400,"Instances",objType);
				with(inst){
				inst.sprite_index = ini_read_real(section,"spr",Peasant);
				inst.image_xscale = 2;
				inst.image_yscale = 2;
				inst.hp = ini_read_real(section, "hp", 30)
				inst.attack = ini_read_real(section, "attack", 10)
				}
			}
	}	
	ini_close();
	
	ini_open("battle.ini")
	var numEnemies = ini_read_real("meta", "numEnemies", 0);
	for(var i = 0; i < numEnemies; i++){
		var section = "enemy"+string(i);
		var inbattle = ini_read_real(section, "in battle", 0);
		if(inbattle == 1){
			show_debug_message("Trying");
			var inst = instance_create_layer(390, 400, "Instances", obj_encounter_enemy)
			with(inst){
				inst.sprite_index = ini_read_real(section, "spr", Peasant);
				inst.image_xscale = 2;
				inst.image_yscale = 2;
				inst.hp = ini_read_real(section, "hp", 20)
				inst.attack = ini_read_real(section, "attack", 5)
			}
		}
	}
	ini_close();
			
	// start the battle!
	with(obj_encounter_controller){
		event_user(0);
	}
}