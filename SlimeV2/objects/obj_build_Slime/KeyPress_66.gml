/// @description Switch to battle (temporary control)
// You can write your code in this editor
if (room = rm_build) {
	room_goto(rm_battle);
	audio_pause_sound(snd_bg_music);
	audio_play_sound(snd_battle_music, 1, 2);
}
else if (room = rm_battle) {
	room_goto(rm_encounter);
	audio_pause_sound(snd_battle_music);
}
else if (room = rm_encounter) {
	audio_play_sound(snd_bg_music, 1, 2);
}