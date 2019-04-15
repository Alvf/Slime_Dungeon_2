/// @description Setup variables

// This is the parent object for all 
// monsters. It basically stores their stats

move_sp = 4
hsp = 0
vsp = 0

is_clicked = false

max_endurance = 3
endurance = max_endurance

in_battle = 0

max_hp = 30
hp = max_hp
attack = 10

x_cell = floor(x / grid_size)
y_cell = floor(y / grid_size)

next_x_cell = x_cell
next_y_cell = y_cell

mouse_tile_x = 0
mouse_tile_y = 0

if(room == rm_battle){
	monster_path = path_add()	
} else {
	sprite_index = sprite 
}