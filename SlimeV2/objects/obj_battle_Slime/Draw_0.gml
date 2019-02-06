/// @description Draw the possible movements
// You can write your code in this editor
draw_self();
if(is_clicked == true){
script_execute(scr_pathfinding,mouse_tile_x,mouse_tile_y,slime_movement);
}
//draw_path(slime_path,x,y,true);