/// @description Save monsters 
// You can write your code in this editor

//if(room == rm_battle){
save_list = ds_list_create()

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

for(var i = 0; i < instance_count; i++){
	var obj = instance_id_get(i)
		
	if(obj.object_index == objType){
		show_debug_message("ADDING AN muenster");
		ds_list_add(save_list, obj);
	} 
}

ini_open(MONSTER_SAVE_FILE)
ini_write_real("meta", "numMonsters", ds_list_size(save_list))
for(var i = 0; i < ds_list_size(save_list); i++){
	var section = "monster" + string(i)
	var monster = ds_list_find_value(save_list, i)
	ini_write_real(section, "x", floor(monster.x / grid_size) * grid_size)
	ini_write_real(section, "y", floor(monster.y / grid_size) * grid_size)
	ini_write_real(section, "spr", monster.sprite_index);
	ini_write_real(section, "endurance",monster.endurance);
	ini_write_real(section, "max endurance", monster.max_endurance);
	ini_write_real(section, "hp", monster.hp)
	ini_write_real(section, "attack", monster.attack)
}
ini_close()

ds_list_destroy(save_list);
