/// @description Save resources
// You can write your code in this editor
if(room == rm_build){
	ini_open("resources.ini")
	ini_write_real("resources", "gold", gold)
	ini_write_real("resources", "rock", rock)
	ini_write_real("resources", "tool", current_tool)
	ini_write_real("resources", "gold_placed", gold_placed ? 1 : 0)
	ini_close()
}