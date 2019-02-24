/// @description Insert description here
// You can write your code in this editor
save_list = ds_list_create()

	for(var i = 0; i < instance_count; i++){
		var obj = instance_id_get(i)
		if(obj.object_index == obj_battle_enemy){
			show_debug_message("saving a monster yay!")
			ds_list_add(save_list, obj);
		}
	}

	ini_open("battle.ini")
	ini_write_real("meta", "numEnemies", ds_list_size(save_list));
	for(var i = 0; i < ds_list_size(save_list); i++){
		var section = "enemy" + string(i)
		var monster = ds_list_find_value(save_list, i)
	//	show_debug_message("Monster ID " + (monster))
		ini_write_real(section, "x", floor(monster.x / grid_size) * grid_size)
		ini_write_real(section, "y", floor(monster.y / grid_size) * grid_size)
		ini_write_real(section, "spr", monster.sprite_index);
		ini_write_real(section, "in battle", monster.in_battle);
		show_debug_message("Monster spr " + string(monster.sprite_index));
		ini_write_real(section, "active", monster.active);
	}
	ini_close();
	
ds_list_destroy(save_list);