/// @description Save monsters 
// You can write your code in this editor

if(room == rm_battle){
	save_list = ds_list_create()

	for(var i = 0; i < instance_count; i++){
		var obj = instance_id_get(i)
		if(variable_instance_exists(obj, "save") && obj.save){
			show_debug_message("ADDING AN OBjeCT");
			ds_list_add(save_list, obj);
		} else {
			show_debug_message("Ignored " + string(i))
		}
	}

	ini_open("save.ini")
	ini_write_real("meta", "numMonsters", ds_list_size(save_list))
	for(var i = 0; i < ds_list_size(save_list); i++){
		var section = "monster" + string(i)
		var monster = ds_list_find_value(save_list, i)
	//	show_debug_message("Monster ID " + (monster))
		ini_write_real(section, "x", floor(monster.x / grid_size) * grid_size)
		ini_write_real(section, "y", floor(monster.y / grid_size) * grid_size)
		ini_write_real(section, "spr", monster.sprite_index);
		ini_write_real(section, "in battle", monster.in_battle);
		ini_write_real(section,"endurance",monster.monster_endurance);
	}
	ini_close()
	

	show_debug_message("SAVE LIST");
	show_debug_message(ds_list_write(save_list));

	ds_list_destroy(save_list);
}
else if(room == rm_build){
	save_list = ds_list_create()

	for(var i = 0; i < instance_count; i++){
		var obj = instance_id_get(i)
		if(variable_instance_exists(obj, "save") && obj.save){
			show_debug_message("ADDING AN OBjeCT");
			ds_list_add(save_list, obj);
		} else {
			show_debug_message("Ignored " + string(i))
		}
	}

	ini_open("save.ini")
	ini_write_real("meta", "numMonsters", ds_list_size(save_list))
	for(var i = 0; i < ds_list_size(save_list); i++){
		var section = "monster" + string(i)
		var monster = ds_list_find_value(save_list, i)
	//	show_debug_message("Monster ID " + (monster))
		ini_write_real(section, "x", floor(monster.x / grid_size) * grid_size)
		ini_write_real(section, "y", floor(monster.y / grid_size) * grid_size)
		ini_write_real(section, "spr", monster.sprite_index);
		ini_write_real(section,"endurance",5);
	}
	ini_close();
	

	show_debug_message("SAVE LIST");
	show_debug_message(ds_list_write(save_list));

	ds_list_destroy(save_list);
}
else if (room = rm_encounter){
	ini_open("save.ini");
	var length = ini_read_real("meta","numMonsters",0);
	for(var i =0;i<length;i++){
		var section= "monster"+string(i);
		ini_write_real(section,"in battle", 0);
	}
	ini_close();
	ini_open("battle.ini");
	var length = ini_read_real("meta", "numEnemies", 0);
	for(var i = 0; i < length; i++){
		ini_write_real("monster"+string(i), "in battle", 0);
	}
	ini_close();
}