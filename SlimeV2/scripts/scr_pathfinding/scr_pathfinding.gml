//Handling framework for pathfinding:
//recursion: if the tile that we're checking is ground, mark it as walkable
//if the tile that we're checking isn't ground, mark it as unwalkable and stop recursing
//recurse your movement speed

//accepts a coordinate on our grid and a number that we want to expand out to.
//RECURSION REQUIRES var prefixes or else all your recursions get cursed!!
var x_grid = argument0; 
var y_grid = argument1;
var movement = argument2;

//show_debug_message("x_grid = " + string(x_grid));
//show_debug_message(string(x_grid) + " - 1 = " + string(x_grid - 1));

// slight hack to get around the fact 
// that we don't want to pathfind through monsters.
// Basically, the first call to this script forces 
// the script to draw that tile, even though 
// there is a monster there. 
var force = argument3;

//always stop if we're out of bounds
if(x_grid>grid_width-1||x_grid<0||y_grid>grid_height-1||y_grid<0){
	show_debug_message("check ran")
	return;
}
//always stop if you hit not-ground
else if(ds_grid_get(obj_grid.map_grid,x_grid,y_grid) != ds_floor && !force)
{
	//draw a red tint square and escape
	draw_sprite_ext(Sprite_Highlight,2,x_grid*grid_size,y_grid*grid_size,1,1,0,c_white,0.4);
}
//always stop if there's an enemy
else if(place_meeting(x_grid*grid_size,y_grid*grid_size,obj_battle_enemy) ){
	draw_sprite_ext(Sprite_Highlight,3,x_grid*grid_size,y_grid*grid_size,1,1,0,c_white,0.4);
}
//if you don't have any movement left, draw as walkable (already looked for not-floor)
else if(movement <=0)
{
	
	if(place_meeting(x_grid*grid_size,y_grid*grid_size,obj_battle_monster) || ds_grid_get(obj_grid.map_grid,x_grid,y_grid)==ds_gold){
		draw_sprite_ext(Sprite_Highlight,3,x_grid*grid_size,y_grid*grid_size,1,1,0,c_white,0.4);
	}
	else{
	draw_sprite_ext(Sprite_Highlight,0,x_grid*grid_size,y_grid*grid_size,1,1,0,c_white,0.4);
	}
	
}

else //if you're not a wall, keep exploring!
{
	//see which kind of color you need to place:
	if(place_meeting(x_grid*grid_size,y_grid*grid_size,obj_battle_monster)|| ds_grid_get(obj_grid.map_grid,x_grid,y_grid)==ds_gold){
		draw_sprite_ext(Sprite_Highlight,3,x_grid*grid_size,y_grid*grid_size,1,1,0,c_white,0.4);
	}
	else{
	draw_sprite_ext(Sprite_Highlight,0,x_grid*grid_size,y_grid*grid_size,1,1,0,c_white,0.4);
	}
	script_execute(scr_pathfinding,x_grid-1,y_grid,movement-1,false);
	script_execute(scr_pathfinding,x_grid+1,y_grid,movement-1,false);
	script_execute(scr_pathfinding,x_grid,y_grid-1,movement-1,false);
	script_execute(scr_pathfinding,x_grid,y_grid+1,movement-1,false);

}