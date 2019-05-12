/// @description Insert description here
// You can write your code in this editor
global.level_map = ds_map_create()

ds_map_add(global.level_map, rm_level_2, obj_level_2);
ds_map_add(global.level_map, rm_level_1, obj_level_1);

if(not file_exists("level_save.ini")){
	ini_open("level_save.ini")
	won_level_1 = ini_read_real("levels", "1", 0) == 1
	won_level_2 = ini_read_real("levels", "2", 0) == 1
}

//instance_destroy();