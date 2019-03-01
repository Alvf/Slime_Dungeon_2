/// @description Move monster


//What tile is the mouse on?
mouse_tile_x = floor(mouse_x/grid_size);
mouse_tile_y = floor(mouse_y/grid_size);

//check if anothermonster has been clicked on
var clicked_on_monster = ds_grid_get(obj_grid.map_grid, mouse_tile_x, mouse_tile_y) == ds_monster
//position_meeting(grid_size * (mouse_tile_x + 0.5),grid_size * (mouse_tile_y + 0.5),obj_battle_monster);

var enemy = instance_position((mouse_tile_x + 0.5) * grid_size, (mouse_tile_y + 0.5) * grid_size, obj_battle_enemy);
//go into battle with enemies
if(enemy != noone){
	if((abs(floor(x/grid_size)-floor(enemy.x/grid_size))
			+ abs(floor(y/grid_size)-floor(enemy.y/grid_size))) == 1
		&& is_clicked){
		show_debug_message("delta X " + string(abs(floor(x/grid_size)-floor(enemy.x/grid_size))));
		show_debug_message("delta Y " + string(abs(floor(y/grid_size)-floor(enemy.y/grid_size))));
		in_battle =1;
		//set the enemy's in_battle to 1:
	
		enemy.in_battle = 1
	
		room_goto(rm_encounter);
	}
	return;
}


// remove the monster 
// from its current cell
// for pathfinding
obj_grid.cell_x = floor(x/grid_size)
obj_grid.cell_y = floor(y/grid_size)
obj_grid.cell_type = ds_floor
update_grids 

//make a path
mp_grid_path(obj_grid.entity_grid,
	monster_path,
	floor(x/grid_size)*grid_size,
	floor(y/grid_size)*grid_size,
	mouse_tile_x*grid_size,
	mouse_tile_y*grid_size,
	false);


//Can the slime actually path to the point with the given speed?
var path_length = ceil(path_get_length(monster_path)/grid_size)
can_path = (path_length<=monster_endurance);


//if the slime's been clicked on before and we're not clicking a wall, move the slime.
if(is_clicked==true
	&& ds_grid_get(obj_grid.map_grid, mouse_tile_x, mouse_tile_y) == ds_floor
		// don't let the slime run into other monsters
	&& !clicked_on_monster){
	if(can_path){
		path_start(monster_path,16,path_action_stop,true);
		monster_endurance -= path_length
		// put the monster in the grid, in the new place!
		obj_grid.cell_x = mouse_tile_x
		obj_grid.cell_y = mouse_tile_y
		obj_grid.cell_type = ds_monster 
		update_grids
	} else {
		// put the monster back in the grid
		obj_grid.cell_x = floor(x/grid_size)
		obj_grid.cell_y = floor(y/grid_size)
		obj_grid.cell_type = ds_monster
		update_grids 
	}
	is_clicked = false;
} else {
	// put the monster back in the grid
	obj_grid.cell_x = floor(x/grid_size)
	obj_grid.cell_y = floor(y/grid_size)
	obj_grid.cell_type = ds_monster
	update_grids 
	
	if(mouse_tile_x== floor(x/grid_size)
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
} 