/// @description Teleport Slime


//What tile is the mouse on?
mouse_tile_x = floor(mouse_x/grid_size);
mouse_tile_y = floor(mouse_y/grid_size);

//go into battle with enemniees
if(position_meeting(mouse_x,mouse_y,obj_battle_Hero)
&&(abs(floor(x/grid_size)-floor(obj_battle_Hero.x/grid_size))==1^^abs(floor(y/grid_size)-floor(obj_battle_Hero.y/grid_size))==1) 
)
{
	obj_Control.slime_cell_x = floor(x/grid_size);
	obj_Control.slime_cell_y = floor(y/grid_size);
	room_goto(rm_encounter);
	audio_pause_sound(snd_battle_music)
	audio_play_sound(snd_encounter_music, 2, 1);
	return;
}


//make a path
mp_grid_path(obj_Control.path_grid,slime_path,floor(x/grid_size)*grid_size,floor(y/grid_size)*grid_size,mouse_tile_x*grid_size,mouse_tile_y*grid_size,false);


//Can the slime actually path to the point with the given speed?
can_path = (floor(path_get_length(slime_path)/grid_size)<=slime_movement);





//if the slime's been clicked on before and we're not clicking a wall, move the slime.
if(is_clicked==true
&& ds_grid_get(obj_Control.map_grid, mouse_tile_x, mouse_tile_y) == 1
){
	if(can_path){
path_start(slime_path,16,path_action_stop,true);
obj_Control.slime_cell_x = mouse_tile_x;
obj_Control.slime_cell_y = mouse_tile_y;
	}
is_clicked = false;
}
//If we're just clicking on the slime, mark it as clicked
else if(mouse_tile_x== floor(x/grid_size)
&& floor(mouse_tile_y== floor(y/grid_size) ) )
{
	is_clicked = true;
}
//If we're clicking on a wall, nothing deserves to get clicked; reset!
else if (ds_grid_get(obj_Control.map_grid, mouse_tile_x, mouse_tile_y) != 1){
is_clicked = false;
}