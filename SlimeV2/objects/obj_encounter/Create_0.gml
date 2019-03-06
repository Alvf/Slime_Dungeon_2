/// @description Setup variables 

monster = noone
enemy = noone

screen_width = camera_get_view_width(view_camera[0])
screen_height = camera_get_view_height(view_camera[0])

scale = 2

monster_x = screen_width / 2 - 2 * grid_size
monster_y = (screen_height - scale * grid_size) / 2

enemy_x = screen_width / 2 + 2 * grid_size
enemy_y = (screen_height - scale * grid_size) / 2
