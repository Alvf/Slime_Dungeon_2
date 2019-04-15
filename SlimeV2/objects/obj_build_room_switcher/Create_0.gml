/// @description Setup
// You can write your code in this editor
gold_path = path_add()
gold_x = 0
gold_y = 0
global.level = room 
global.obj_level = ds_map_find_value(global.level_map, room)
global.level_background = layer_background_get_sprite(layer_background_get_id(layer_get_id("Background")))
show_debug_message(string(global.level_background) + " == " + string(spr_awful_level_1))