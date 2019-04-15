/// @description Insert description here
// You can write your code in this editor
file_delete(MONSTER_SAVE_FILE)
file_delete("grid.ini")
file_delete("turn.ini")
file_delete("battle.ini")
file_delete("resources.ini")


global.turn_data = -1

// Fix VSYNC
display_reset(0, true);