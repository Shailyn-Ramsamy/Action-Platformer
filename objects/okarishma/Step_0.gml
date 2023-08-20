//Get player movement
if (hascontrol){
	key_left = keyboard_check(ord("A"));
	key_right = keyboard_check(ord("D"));
	key_jump = keyboard_check(ord("W"));
	key_attack = keyboard_check(ord("H"));
	Key_teabag = keyboard_check(ord("S"));
	Key_dash = keyboard_check_pressed(vk_space);
}
else {
	key_left = 0;
	key_right = 0;
	key_jump = 0;
	key_attack = 0;
	Key_teabag = 0;
}

if (Key_dash) state = states.dash;

instance_deactivate_object(HitBox);
instance_deactivate_object(HitBoxCombo);


if (state == states.idle){
	#region idle
var move  = key_right - key_left;



if (move != 0){
	if (last_h != move){
		last_h = move;
		acc_final = 0;
	}
	
	if (acc_final <= acc_max){
		acc_final += acc;
	}
}
else{
	if (acc_final > 0){
		acc_final -= acc*1.1;
	}
}

if (acc_final < acc){
	acc_final = 0;
	last_h = 0;
}
hsp = acc_final *last_h

vsp = vsp + grv;

	if (place_meeting(x,y+1,oWALL)) && (key_jump){
		vsp = -8;	
	}
	

	if (place_meeting (x+hsp,y,oWALL)){
		var onePixel = sign(hsp);
		while (!place_meeting(x+onePixel,y,oWALL)) x += onePixel;
		hsp = 0;
	}
	x += hsp;

	if (place_meeting(x,y+vsp,oWALL)){
		var onePixel = sign(vsp);
		while (!place_meeting(x,y+onePixel,oWALL)) y += onePixel;
		vsp = 0;
	}
	y += vsp;
	


	if(!place_meeting(x, y+1, oWALL)){
	
		if (hsp < 0){
			image_xscale = sign(hsp) - 1;
			Dir = 1;
		}
		if (hsp > 0){
			image_xscale = sign(hsp) + 1;
			Dir = 0;
		}
		if (vsp < 0){
			if (sprite_index != sKarishmaJumpRight) sprite_index = sKarishmaJumpLeft;
			sprite_index = sKarishmaJumpRight;
		}
	
		if (vsp == 0){
			if (sprite_index != sKArishmaMidRight) sprite_index = sKArishmaMidLeft;
			sprite_index = sKArishmaMidRight;
		}
	
		if (vsp > 0){
			if (sprite_index != sKarishmaFallRight) sprite_index = sKarishmaFallLeft;
			sprite_index = sKarishmaFallRight;
		}
	}
	else{
		if (hsp != 0){
			if(hsp < 0){ 
				image_xscale = sign(hsp)-1;
				Dir = 1;
			}
			if(hsp > 0){
				image_xscale = sign(hsp)+1;
				Dir = 0;
			}
			if (sprite_index != sKarishmaWalkRight) sprite_index = sKarishmaWalkRight;
			sprite_index = sKarishmaWalkRight;
		}
		else{
			sprite_index = sKarishmaSTILL;
		}	
	}
	
	if (Key_teabag){
		sprite_index = sKarishmaLandRight;
	}
	
	
	
	if (key_attack) && (place_meeting(x,y+1,oWALL))  state = states.attack;
	#endregion
}

if (state == states.attack){
	#region attack
	if (sprite_index != sAttack){		
	sprite_index = sAttack;
	ScreenShake(2, 10);
	audio_play_sound(AttackSound, 8, false);
	playedSound = true;
	image_index = 0;
	ds_list_clear(hitByAttack);
	}
	
	instance_activate_object(HitBox);

	if (key_attack) && (image_index > 3) state = states.attackCombo;

	
	if (animation_end(sAttack)){
		sprite_index = sKarishmaSTILL;
		state = states.idle;
		instance_deactivate_object(HitBox)
	}
	#endregion
}

if (state == states.attackCombo){
	#region attackCombo
	if (sprite_index != sAttack_combo){		
	sprite_index = sAttack_combo;
	ScreenShake(4, 10);
	audio_play_sound(AttackSound, 8, false);
	image_index = 0;
	ds_list_clear(hitByAttack);
	}

	instance_activate_object(HitBoxCombo);
	
	if (key_attack) && (image_index > 3) state = states.attack;
	
	if (animation_end(sAttack_combo)){
		sprite_index = sKarishmaSTILL;
		playedSound = false;
		state = states.idle;
		instance_deactivate_object(HitBoxCombo)
	}
	#endregion
}
	
if (state == states.dash){
	
	if (sprite_index != Dash){
	sprite_index =  Dash;
	audio_play_sound(Dashwhoosh, 8, false);
	}
	
	dash = true
	
	if (dash = true){
		if (Dir == 0){
			x += dash_spd;
			fade_timer--;
		}
		if (Dir == 1){
			x -= dash_spd;
			fade_timer--;
		}
	}
	
	
	if (Dir == 0){
		fade_timer--;
	
		if (fade_timer <= 0){
		
			fade_timer = fade_time;
		
			part_particles_create(o_partticle_setup.particleSys, x,y, o_partticle_setup.particle_ghost, 1);
		
		}
	}
	if (Dir == 1){
		fade_timer--;
		
		if (fade_timer <= 0){
		
			fade_timer = fade_time;
		
			part_particles_create(o_partticle_setupLeft.particleSys, x,y, o_partticle_setupLeft.particle_ghost, 1);
		
		}
	}

	if (key_attack) && (image_index > 3) state = states.DashAttack;
	
	else if(place_meeting(x, y, oWALL))
{
    state = states.idle;
}
		
	if (animation_end(Dash)){
		vsp = -2;
		dash = false;
		playedSound = false;
		if (key_attack) && (image_index > 3) state = states.DashAttack;
		state = states.idle;
	}

}

if (state == states.DashAttack){
	#region attackCombo
	if (sprite_index != sDashattack){		
	sprite_index = sDashattack;
	ScreenShake(4, 10);
	audio_play_sound(AttackSound, 8, false);
	image_index = 0;
	ds_list_clear(hitByAttack);
	}

	
	if (key_attack) && (image_index > 3) state = states.attackCombo;
	
	if (animation_end(sDashattack)){
		sprite_index = sKarishmaSTILL;
		playedSound = false;
		state = states.idle;
	}

	#endregion
}


