/// @description Setup speeds, tools
// You can write your code in this editor

// This decides what the player places when they click
current_tool = 1;

// Change this one to change how fast the character moves
move_sp = 4; // Movement speed 

// Don't change these ones
hsp = 0; // Horizontal movement speed
vsp = 0; // Vertical movement speed 

// Slime's x and y position in the grid (0,0) (index top-left)
cell_x = 0; 
cell_y = 0;

// Where is this defined?
mouse_in_valid_pos = false;

// What are these?
mx_cell = 0;
my_cell = 0;
m_cell = 0;

// Camera tracking 
rate = 0.2;
vpos_w = camera_get_view_width(view_camera[0]) * 0.5;
vpos_h = camera_get_view_height(view_camera[0]) * 0.5;

gold_placed = false;

gold_path = path_add();
gold_x = -1;
gold_y = -1;