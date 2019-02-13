/// @description Build overlay


x = obj_mouse_controller.x_cell * 64;
y = obj_mouse_controller.y_cell * 64;

// This part determines whether to show a red, blue, or green 
// overlay, and how bright it should be.

if(obj_mouse_controller.mouse_in_valid_pos){
	image_alpha = 0.9;
} else {
	image_alpha = 0.3;
}

if(obj_loadout.current_tool == tool_wall){
	if (obj_mouse_controller.tile == ds_floor && obj_loadout.rock > 0){
		image_index = overlay_green;
	} else {
		image_index = overlay_red;
	}
} else if(obj_loadout.current_tool == 3){
	if (obj_mouse_controller.tile == ds_floor && obj_loadout.gold > 0){
		image_index = overlay_green;
	} else {
		image_index = overlay_red;
	}
} else if (obj_loadout.current_tool == 1){
	image_index = overlay_blue;
} 