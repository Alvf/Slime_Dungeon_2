/// @description Handle build/destroy
// You can write your code in this editor

if(obj_mouse_controller.mouse_in_valid_pos){
	
	// what tile is the mouse over?
	var m_cell = obj_mouse_controller.tile
	
	var mx_cell = obj_mouse_controller.x_cell
	var my_cell = obj_mouse_controller.y_cell
	
	// get ready to update a tile
	obj_grid.cell_x = mx_cell
	obj_grid.cell_y = my_cell
	
	if(current_tool == tool_wall && rock > 0 && m_cell == ds_floor){
		obj_grid.cell_type = ds_wall
		update_grids
		rock--;
		audio_play_sound(choose(snd_build1, snd_build2), 10, false)
	}else if (current_tool == tool_break) {
		if(m_cell == ds_wall){
			rock++;
			obj_grid.cell_type = ds_floor
			update_grids
			audio_play_sound(choose(snd_break1, snd_break2), 10, false)
		}else if(m_cell == ds_gold){
			gold++;
			obj_grid.cell_type = ds_floor
			update_grids
			gold_placed = false;
		}
	}else if (current_tool == tool_gold) {
		if(gold > 0 && m_cell == ds_floor){
			gold--;
			obj_grid.cell_type = ds_gold
			update_grids
			gold_placed = true;
		}	
	}
}