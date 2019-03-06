/// @description Load turn.ini

// obj_save_controller handles the deletion of turn.ini
// when you enter rm_build

your_turn = true
turn_queue = ds_queue_create()

/*if(global.turn_data == -1){
	global.turn_data = ds_map_create();
	ds_map_set(global.turn_data, "your turn", true)
	
	turn_queue = ds_queue_create();
	ds_map_set(global.turn_data, "queue", turn_queue);

	show_debug_message("Created turn data")
} else {
	turn_queue = ds_map_find_value(global.turn_data, "queue")
}*/


/*
if(file_exists("turn.ini")){
	show_debug_message("Created turn controller 1")
	ini_open("turn.ini")
	your_turn = ini_read_real("meta", "your turn", 1)
	turn_queue = ini_read_real("meta", "queue", -1)
	ini_close()
} else {
	show_debug_message("Created turn controller 2")
	ini_open("turn.ini")
	ini_write_real("meta", "your turn", 1)
	your_turn = 1;	
	turn_queue = ds_queue_create();
	ds_queue_enqueue(turn_queue, 3, 4, 6)
	ini_close()
}

if(ds_exists(turn_queue, ds_type_queue)){
	show_debug_message("queue: " + string(ds_queue_size(turn_queue)));
} else {
	show_debug_message("error: queue does not exist");
}*/