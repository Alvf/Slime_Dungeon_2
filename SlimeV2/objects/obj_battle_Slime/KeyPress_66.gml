/// @description Change to build room (temporary)
// You can write your code in this editor

audio_pause_sound(snd_battle_music);
audio_pause_sound(snd_encounter_music);
obj_Control.slime_cell_x = floor(x/grid_size);
obj_Control.slime_cell_y = floor(y/grid_size);
room_goto(rm_build);
