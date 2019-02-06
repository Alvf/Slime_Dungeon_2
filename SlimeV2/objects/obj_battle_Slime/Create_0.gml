/// @description Setup speeds, tools
// You can write your code in this editor

// Change this one to change how fast the character moves
move_sp = 4; // Movement speed 

// Don't change these ones
hsp = 0; // Horizontal movement speed
vsp = 0; // Vertical movement speed 

// Camera tracking 
rate = 0.2;
vpos_w = camera_get_view_width(view_camera[0]) * 0.5;
vpos_h = camera_get_view_height(view_camera[0]) * 0.5;

// keeps track of the slime has been clicked on
is_clicked = false;

// Slime's default allowed grid movements
slime_movement = 5;
