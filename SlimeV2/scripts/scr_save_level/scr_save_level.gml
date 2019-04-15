var level_save_file = argument0

ini_open(level_save_file)

map_grid = obj_grid.map_grid

for(var i = 0; i < grid_width; i++){
	for(var j = 0; j < grid_height; j++){
		// remove special player markers
		if(ds_grid_get(map_grid, i, j) == ds_monster 
		|| ds_grid_get(map_grid, i, j) == ds_enemy){
			ds_grid_set(map_grid, i, j, ds_floor)
		}
	}
}

ini_write_string("map","grid",ds_grid_write(map_grid))

save_list = ds_list_create()

// always save levels in build mode
var objType = obj_build_monster;
	
for(var i = 0; i < instance_count; i++){
	var obj = instance_id_get(i)
		
	if(obj.object_index == objType){
		ds_list_add(save_list, obj);
	} 
}

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

ds_list_destroy(save_list);

ini_close()