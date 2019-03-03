/// @description Load/spawn enemies
// You can write your code in this editor
if(room == rm_battle){
	if(file_exists("battle.ini")){
		// then we're coming from encounter
		ini_open("battle.ini");
		var numEnemies = ini_read_real("meta", "numEnemies", 0)
	
		for(var i = 0; i < numEnemies; i++){
			var section = "enemy" + string(i)
			if(ini_read_real(section, "hp", 20) <= 0){
				// dont load dead enemies
				continue;
			}
			var enemy_x = ini_read_real(section, "x", 0)
			var enemy_y = ini_read_real(section, "y", 0)
			var inst = instance_create_layer(enemy_x, enemy_y, "Instances", obj_battle_enemy)
			with(inst){
				inst.sprite_index = ini_read_real(section, "spr", Peasant);
				inst.active = ini_read_real(section, "active", 0)
				inst.hp = ini_read_real(section, "hp", 20)
				inst.attack = ini_read_real(section, "attack", 7)
			}
			
			show_debug_message("loading object at " + string(x) + ", " + string(y))
		}
		ini_close();
	
		show_debug_message("starting turns");
		with(obj_TurnController){
			event_user(0);
		}
	
	} else {
		// coming from build
		// spawn some enemies!
		var num_enemies = floor(random_range(1,4));
		for(var i = 0; i < num_enemies; i++){
			var inst = instance_create_layer(19 * grid_size, (5+i) * grid_size , "Instances", obj_battle_enemy);
			with(inst){
				inst.sprite_index = choose(spr_Hero, Peasant, spr_Hammer);
			}
		}
	}
}