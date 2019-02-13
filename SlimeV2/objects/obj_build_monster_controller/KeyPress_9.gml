/// @description Switch active monster

i = (i + 1) mod instance_number(obj_build_monster)
current_monster = instance_find(obj_build_monster, i)