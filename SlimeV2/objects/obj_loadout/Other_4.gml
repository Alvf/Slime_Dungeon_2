/// @description Load saved resources
// You can write your code in this editor

	if(file_exists("resources.ini")){
		ini_open("resources.ini")
		rock = ini_read_real("resources", "rock", 16)
		current_tool = ini_read_real("resources", "tool", tool_break)
		ini_close()
	}else {
		rock = 16
		current_tool = tool_break
	}
