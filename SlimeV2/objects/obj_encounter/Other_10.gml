/// @description Show encounter

// This is run after the encounter has been set up
// with the monster and enemy
		

enemy_obj = instance_create_layer(enemy_x, enemy_y, "EncounterMonsters", obj_encounter_sprite);
show_debug_message("enemy spr " + string(enemy.sprite_index))
enemy_obj.sprite_index = enemy.sprite_index
enemy_obj.image_xscale = 2;
enemy_obj.image_yscale = 2;

enemy_obj.actual = enemy

monster_obj = instance_create_layer(monster_x, monster_y, "EncounterMonsters", obj_encounter_sprite);
monster_obj.sprite_index = monster.sprite_index
monster_obj.image_xscale = 2;
monster_obj.image_yscale = 2;

monster_obj.actual = monster

show_debug_message("Created enemy_obj and monster_obj")

visible = true

layer_set_visible(layer_get_id("Instances"), false)

alarm[0] = room_speed
