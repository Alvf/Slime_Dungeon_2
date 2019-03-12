/// @description Start music
// You can write your code in this editor


if(not is_undefined(ds_map_find_value(songs, room))){
	audio_play_sound(ds_map_find_value(songs, room), 10000, 1)
}
