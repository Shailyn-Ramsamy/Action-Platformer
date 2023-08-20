/// @description Insert description here
// You can write your code in this editor

particleSys = part_system_create();

particle_ghost = part_type_create();

part_type_sprite(particle_ghost, Dash, 0, 0 ,1);
part_type_size(particle_ghost, 2, 2, 0, 0);

part_type_life(particle_ghost, 30, 30);
part_type_alpha3(particle_ghost, 0.5, 0.3, .1);

part_type_color1(particle_ghost, c_green);








