hsp = 0;
acc = 0.4;
acc_final = 0;
acc_max = 5;
last_h = 0;
vsp = 0;
grv = 0.3;
dash_dist = 96
dash = false;
dash_time = 12
dash_spd = 15;
hascontrol = true;
playedSound = false;
Dir = 0;
fade_time = 10;
fade_timer = fade_time;


state = states.idle
hitByAttack = ds_list_create();

enum states{
	idle,
	dash,
	attack,
	attackCombo,
	DashAttack
}