/// @description Draw the possible movements
draw_self();
if(is_clicked == true){
	script_execute(scr_pathfinding,mouse_tile_x,mouse_tile_y,monster_endurance);
}
//draw_path(slime_path,x,y,true);