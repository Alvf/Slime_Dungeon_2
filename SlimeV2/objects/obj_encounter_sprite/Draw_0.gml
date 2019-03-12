/// @description Insert description here
// You can write your code in this editor
draw_self();

var c = draw_get_color()

draw_set_color(c_black)
draw_rectangle(x,y-10,x+grid_size*2,y,false)


if(instance_exists(actual)){
	draw_set_color(c_green)
	draw_rectangle(x+1,y-10+1,(x+grid_size*2 * actual.hp / actual.max_hp) - 1, y-1, false)
} 

draw_set_color(c);