/// @description Change rooms when collision is detected
// You can write your code in this editor
obj_Control.slime_cell_x = cell_x;
obj_Control.slime_cell_y = cell_y;

room_goto(rm_encounter);
audio_pause_sound(snd_battle_music)
audio_play_sound(snd_encounter_music, 2, 1);