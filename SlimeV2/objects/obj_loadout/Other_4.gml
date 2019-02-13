/// @description Load saved resources
// You can write your code in this editor
if(room == rm_build){
	if(file_exists("resources.ini")){
		ini_open("resources.ini")
		rock = ini_read_real("resources", "rock", 16)
		gold = ini_read_real("resources", "gold", 1)
		current_tool = ini_read_real("resources", "tool", tool_break)
		gold_placed = ini_read_real("resources", "gold_placed", 0)
		if(gold_placed == 1){
			gold_placed = true
		} else {
			gold_placed = false
		}
		ini_close()
	}else {
		rock = 16
		gold = 1
		current_tool = tool_break
	}
}