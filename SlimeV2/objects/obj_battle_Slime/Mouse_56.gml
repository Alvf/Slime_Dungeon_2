/// @description Teleport Slime

//What tile is the mouse on?
mouse_tile_x = floor(mouse_x/grid_size);
mouse_tile_y = floor(mouse_y/grid_size);
//How far did we click from the slime?
distance_taxicab = abs(mouse_tile_x-obj_Control.slime_cell_x) + abs(mouse_tile_y-obj_Control.slime_cell_y);


//if the slime's been clicked on before and we're not clicking a wall, move the slime.
if(is_clicked==true
&& ds_grid_get(obj_Control.map_grid, mouse_tile_x, mouse_tile_y) == 1
&& distance_taxicab<=slime_movement
){
x = mouse_tile_x*grid_size;
y = mouse_tile_y*grid_size;
obj_Control.slime_cell_x = mouse_tile_x;
obj_Control.slime_cell_y = mouse_tile_y;
is_clicked = false;
}//If we're just clicking on the slime, mark it as clicked
else if(mouse_tile_x== floor(x/grid_size)
&& floor(mouse_tile_y== floor(y/grid_size) ) )
{
	is_clicked = true;
}
//If we're clicking on a wall, nothing deserves to get clicked; reset!
if (ds_grid_get(obj_Control.map_grid, mouse_tile_x, mouse_tile_y) != 1){
is_clicked = false;
}