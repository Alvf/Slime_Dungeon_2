/// @description Switch to battle


// why can they go to battle if the gold isn't placed?
if(!obj_loadout.gold_placed){
	room_goto(rm_battle);
	audio_pause_sound(snd_bg_music);
	audio_play_sound(snd_battle_music, 1, 2);
}else{	
	
	for(var i=0;i<grid_width;i++){
		for(var j=0;j<grid_height;j++){
			if(ds_grid_get(obj_Control.map_grid,i,j)==ds_gold){
				gold_x = i;
				gold_y = j;
			}
		}
	}
	
	if(mp_grid_path(obj_Control.path_grid,
		gold_path,
		gold_x*grid_size,
		gold_y*grid_size,
		19*grid_size,
		6*grid_size,
		false)){
			room_goto(rm_battle);
			audio_pause_sound(snd_bg_music);
			audio_play_sound(snd_battle_music, 1, 2);
	}else{
		show_debug_message("no path!");
	}

}