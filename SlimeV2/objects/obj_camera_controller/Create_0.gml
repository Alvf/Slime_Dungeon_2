/// @description Setup positions and dimensions
// You can write your code in this editor
target_x = 0
target_y = 0

vpos_x = camera_get_view_x(view_camera[0])
vpos_y = camera_get_view_y(view_camera[0])

rate = 0.2;
vpos_w = camera_get_view_width(view_camera[0]) * 0.5;
vpos_h = camera_get_view_height(view_camera[0]) * 0.5;