///// @description Insert description here
//// You can write your code in this editor


draw_self();
if(gold_placed){
	mp_grid_path(obj_Control.path_grid,gold_path,gold_x*grid_size,gold_y*grid_size,19*grid_size,6*grid_size,false)	
	draw_set_alpha(0.5);
	mp_grid_draw(obj_Control.path_grid);
	draw_set_alpha(1);
	draw_path(gold_path,(gold_x)*grid_size,(gold_y)*grid_size,false);
}