/// @description Handle build/destroy
// You can write your code in this editor

if(obj_mouse_controller.mouse_in_valid_pos){
	
	// what tile is the mouse over?
	var m_cell = obj_mouse_controller.tile
	
	var mx_cell = obj_mouse_controller.x_cell
	var my_cell = obj_mouse_controller.y_cell

	if(current_tool == tool_wall && rock > 0 && m_cell == ds_floor){
		script_execute(scr_update_grids, mx_cell, my_cell, ds_wall)
		rock--;
		audio_play_sound(choose(snd_build1, snd_build2), 10, false)
	}else if (current_tool == tool_break) {
		if(m_cell == ds_wall){
			rock++;
			script_execute(scr_update_grids, mx_cell, my_cell, ds_floor)
			audio_play_sound(choose(snd_break1, snd_break2), 10, false)
		}
	}
}