/// @description Insert description here
// You can write your code in this editor

box = spr_textbox;
box_width = sprite_get_width(box);

frame = spr_portrait_frame;

portrait = spr_SkellyD;
port_width = sprite_get_width(frame);
port_height = sprite_get_height(frame);

namebox = spr_namebox;
name_width = sprite_get_width(namebox);
name_height = sprite_get_height(namebox);

port_x = (game_width - box_width - port_width) * 0.5
port_y = (game_height*0.98 - port_height);

box_x = port_x + port_width;
box_y = port_y;

name_x = port_x;
name_y = box_y - name_height;

portrait_index = 0;

text[0] = "Good morning."
text[1] = "Your name is Numerus Humerus Bludsucka and you are a vampire."
text[2] = "You are a creature of the night, mysterious and powerful,"
text[3] = "but you are also quite broke."
text[4] = "Blood is expensive, and that sun-screen you use to make sure you don’t die in the bright light sure isn’t cheap either!"
text[5] = "To make a bit of cash on the side, today you’ve decided to become a Dungeon Boss."
text[6] = "Humans keep trying to vanquish you anyway; might as well make a profit from it!"
page = 0
name = "Vamp"


text_col = c_black;
name_col = c_black;


x_buffer = 12;
y_buffer = 8;

text_x = box_x + x_buffer;
text_y = box_y + y_buffer;

name_text_x = name_x + (name_width * 0.5);
name_text_y = name_y + 0.5 * name_height;



text_max_width = box_width - (2 * x_buffer)

text_height = string_height("M")
