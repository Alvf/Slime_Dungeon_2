/// @description Move monster


//What tile is the mouse on?
mouse_tile_x = floor(mouse_x/grid_size);
mouse_tile_y = floor(mouse_y/grid_size);

//go into battle with enemies
if(position_meeting(mouse_x,mouse_y,obj_battle_Hero)
	&& (abs(floor(x/grid_size)-floor(obj_battle_Hero.x/grid_size))==1
		^^ abs(floor(y/grid_size)-floor(obj_battle_Hero.y/grid_size))==1)){

	room_goto(rm_encounter);
	return;
}


//make a path
mp_grid_path(obj_grid.path_grid,
	monster_path,
	floor(x/grid_size)*grid_size,
	floor(y/grid_size)*grid_size,
	mouse_tile_x*grid_size,
	mouse_tile_y*grid_size,
	false);


//Can the slime actually path to the point with the given speed?
can_path = (floor(path_get_length(monster_path)/grid_size)<=monster_movement);





var clicked_on_monster = position_meeting(grid_size * (mouse_tile_x + 0.5),grid_size * (mouse_tile_y + 0.5),obj_battle_monster)

//if the slime's been clicked on before and we're not clicking a wall, move the slime.
if(is_clicked==true
	&& ds_grid_get(obj_grid.map_grid, mouse_tile_x, mouse_tile_y) == ds_floor
		// don't let the slime run into other monsters
	&& !clicked_on_monster){
	if(can_path){
		path_start(monster_path,16,path_action_stop,true);
	}
	is_clicked = false;
} else if(mouse_tile_x== floor(x/grid_size)
	&& floor(mouse_tile_y== floor(y/grid_size))) {
	//If we're just clicking on the slime, mark it as clicked
	is_clicked = true;
} else if (ds_grid_get(obj_grid.map_grid, mouse_tile_x, mouse_tile_y) != ds_floor){
	//If we're clicking on a wall, nothing deserves to get clicked; reset!
	is_clicked = false;
} else {
	// Alex: I added this last clause to fix things
	is_clicked = false;
}