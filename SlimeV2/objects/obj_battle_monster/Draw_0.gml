/// @description Draw the possible movements
draw_self();
if(is_clicked == true && obj_TurnController.your_turn == 1){
	script_execute(scr_pathfinding,floor(x/grid_size),floor(y/grid_size),endurance,true);
}
//draw_path(slime_path,x,y,true);