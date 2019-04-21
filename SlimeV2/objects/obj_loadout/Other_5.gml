/// @description Save resources
// You can write your code in this editor

ini_open("resources.ini")
ini_write_real("resources", "rock", rock)
ini_write_real("resources", "tool", current_tool)
ini_close()
