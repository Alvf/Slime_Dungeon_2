/// @description Insert description here
// You can write your code in this editor

enemy.hp -= monster.attack 
	
if(enemy.hp <= 0){
	instance_destroy(enemy)
} else {
	monster.hp -= enemy.attack 
		
	if(monster.hp <= 0){
		instance_destroy(monster)
	}
}
	
alarm[1] = room_speed 
