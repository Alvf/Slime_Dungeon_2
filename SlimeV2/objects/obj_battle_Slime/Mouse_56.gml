/// @description Move slime
// You can write your code in this editor

//What tile is the mouse on?

if(is_clicked==true){
x = floor(mouse_x/grid_size)*grid_size;
y = floor(mouse_y/grid_size)*grid_size;
obj_Control.slime_cell_x = floor(mouse_x/grid_size);
obj_Control.slime_cell_y = floor(mouse_y/grid_size);
is_clicked = false;
}
else if(floor(mouse_x/grid_size)*grid_size == floor(x/grid_size)*grid_size
&& floor(mouse_y/grid_size)*grid_size == floor(y/grid_size)*grid_size
){
	is_clicked = true;
	show_debug_message("slime has been clicked!");
}
