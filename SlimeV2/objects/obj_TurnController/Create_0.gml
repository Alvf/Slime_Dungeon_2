/// @description Load turn.ini

// obj_save_controller handles the deletion of turn.ini
// when you enter rm_build

if(file_exists("turn.ini")){
	show_debug_message("Created turn controller 1")
	ini_open("turn.ini")
	your_turn = ini_read_real("meta", "your turn", 1)
	ini_close()
} else {
	show_debug_message("Created turn controller 2")
	ini_open("turn.ini")
	ini_write_real("meta", "your turn", 1)
	your_turn = 1;	
	ini_close()
}