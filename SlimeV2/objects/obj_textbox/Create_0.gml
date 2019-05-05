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

text[0] = "It’s a beautiful day to be you!"
text[1] = "You’ve been having weird dreams--what’s your name?"
text[2] = "Good morning, Blue! Today’s your birthday."
text[3] = "You are five wiggles old!"
text[4] = "The fifth wiggling day of a slime is a very important day!"
text[5] = "It’s the day you’re kicked out of your home dungeon."
text[6] = "Don’t be sad! This means you’ll be able to strike out on your own and found your own dungeon!"
text[7] = "I know it sounds scary, but you won’t be alone. I promise. I’m just a figment of your imagination, but I promise, real monsters can be just as nice. Everyone is not your parents."
text[8] = "Now, it’s time to wake up!"

page = 0
name = "Slimer"


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
