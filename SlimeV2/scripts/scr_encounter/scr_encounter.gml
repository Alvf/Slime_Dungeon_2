var encounter = instance_create_layer(0,0,"Encounter", obj_encounter);

obj_encounter.monster = argument0
obj_encounter.enemy = argument1

with(encounter){
	event_user(0);
}