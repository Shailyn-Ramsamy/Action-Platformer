hsp = 0;
vsp = 0;
grv = 0.3;
walksp = 4;
hascontrol = true;
playedSound = false;
Dir = 0;
castdelay = 0;


state = states.idle
hitByAttack = ds_list_create();

enum shelenstates{
	idle,
	attack,
	attackCombo2,
	attackCombo3, 
	AirAttack_1,
	AirAttack_2,
	AirAttack_3,
	Cast
}