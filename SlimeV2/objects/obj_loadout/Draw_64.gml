/// @description Insert description here
// You can write your code in this editor
var c = c_black;

draw_set_colour(c);

items[0] = ""
items[1] = string(obj_resources.rock);
items[2] = string(obj_resources.gold);

var i;
for (i = 0; i < num_tiles; i+=1){
	draw_sprite(spr_loadout, i, i * 128, 0);
	draw_text(i * 128 + 95, 95, items[i]);
}

draw_sprite_ext(Sprite_Highlight, 1, (obj_build_Slime.current_tool-1) * 128, 0, 2, 2, 0, c_white, 1);