//Handling framework for pathfinding:
//recursion: if the tile that we're checking is ground, mark it as walkable
//if the tile that we're checking isn't ground, mark it as unwalkable and stop recursing
//recurse your movement speed

//accepts a coordinate on our grid and a number that we want to expand out to.
//RECURSION REQUIRES var prefixes or else all your recursions get cursed!!
var x_grid = argument0; 
var y_grid = argument1;
var movement = argument2;

//always stop if we're out of bounds
if(x_grid>grid_width-1||x_grid<0||y_grid>grid_height-1||y_grid<0){
	return;
}
//always stop if you hit not-ground
else if(ds_grid_get(obj_grid.map_grid,x_grid,y_grid) != tile_floor)
{
	//draw a red tint square and escape
	draw_sprite_ext(Sprite_Highlight,2,x_grid*grid_size,y_grid*grid_size,1,1,0,c_white,0.4);
}
//always stop if there's an enemy or monster
else if(place_meeting(x_grid*grid_size,y_grid*grid_size,obj_battle_Hero) || place_meeting(x_grid*grid_size,y_grid*grid_size,obj_battle_monster)){
	draw_sprite_ext(Sprite_Highlight,3,x_grid*grid_size,y_grid*grid_size,1,1,0,c_white,0.4);
}
//if you don't have any movement left, draw as walkable (already looked for not-floor)
else if(movement <=0)
{
	draw_sprite_ext(Sprite_Highlight,0,x_grid*grid_size,y_grid*grid_size,1,1,0,c_white,0.4);
	
}

else //if you're not a wall, keep exploring!
{
	draw_sprite_ext(Sprite_Highlight,0,x_grid*grid_size,y_grid*grid_size,1,1,0,c_white,0.4);
	script_execute(scr_pathfinding(x_grid-1,y_grid,movement-1));
	script_execute(scr_pathfinding(x_grid+1,y_grid,movement-1));
	script_execute(scr_pathfinding(x_grid,y_grid-1,movement-1));
	script_execute(scr_pathfinding(x_grid,y_grid+1,movement-1));

}