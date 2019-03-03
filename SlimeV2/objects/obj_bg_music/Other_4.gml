/// @description Start music
// You can write your code in this editor


switch(room){
	case rm_build:
		audio_play_sound(snd_bg_music, 10000, 1)
		break;
	case rm_battle:
		audio_play_sound(snd_battle_music, 10000, 1)
		break;
	case rm_encounter:
		audio_play_sound(snd_encounter_music, 10000, 1)
		break;
	case rm_lose:
		audio_play_sound(snd_lose_music,10000,1)
		break;
}

