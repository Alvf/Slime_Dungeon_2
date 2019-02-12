/// @description Switch to battle (temporary control)
// You can write your code in this editor


if(!gold_placed){
	room_goto(rm_battle);
	audio_pause_sound(snd_bg_music);
	audio_play_sound(snd_battle_music, 1, 2);
}
else{
	
	if(mp_grid_path(obj_Control.path_grid,gold_path,gold_x*grid_size,gold_y*grid_size,19*grid_size,6*grid_size,false)){
		room_goto(rm_battle);
	audio_pause_sound(snd_bg_music);
	audio_play_sound(snd_battle_music, 1, 2);
	}
	else{
		show_debug_message("no path!");
	}

}