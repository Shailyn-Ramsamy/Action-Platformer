//Get player movement
if(point_in_circle(oKARISHMA.x,oKARISHMA.y,x,y,64)) && (!instance_exists(oText)){
	with (instance_create_layer(x,y-64,layer,oText)){
		text = other.text;
		length = string_length(text);
	}
	with(oCamera){
		follow = other.id;
	}
}
if(!point_in_circle(oKARISHMA.x,oKARISHMA.y,x,y,64)) && (instance_exists(oText)){
	with (oText){
		instance_destroy();
		with(oCamera) follow = oKARISHMA;
	}
}

if (hascontrol){
	key_left = keyboard_check(vk_left);
	key_right = keyboard_check(vk_right);
	key_jump = keyboard_check_pressed(vk_up);
	key_attack = keyboard_check(ord("O"));
	Key_teabag = keyboard_check(vk_down);
	Key_cast = keyboard_check_pressed(ord("P"));
}
else {
	key_left = 0;
	key_right = 0;
	key_jump = 0;
	key_attack = 0;
	Key_teabag = 0;
}


if (state == shelenstates.idle){
	#region idle
	var move  = key_right - key_left;

	hsp = move * walksp

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
			image_xscale = sign(hsp) - 2;
			Dir = 1;
		}
		if (hsp > 0){
			image_xscale = sign(hsp) + 2;
			Dir = 0;
		}
		
		if (vsp < 0){
			if (sprite_index != sShayJump) sprite_index = sShayJump;
			sprite_index = sShayJump;
		}
		
		if (vsp == 0){
			if (sprite_index != sShayFall) sprite_index = sShayFall;
			sprite_index =sShayFall;
		}
	
	
		if (vsp > 0){
			if (sprite_index != sShayFall) sprite_index = sShayFall;
			sprite_index = sShayFall;
		}
	}
	else{
		if (hsp != 0){
			if(hsp < 0){ 
				image_xscale = sign(hsp)-2;
				Dir = 1;
			}
			if(hsp > 0){
				image_xscale = sign(hsp)+2;
				Dir = 0;
			}
			if (sprite_index != sShayRun) sprite_index = sShayRun;
			sprite_index =sShayRun;
		}
		else{
			sprite_index = sShayIdle;
		}	
	}
	
	if (Key_teabag){
		sprite_index = sTeabag;
	}
	
	
	if (key_attack) && (place_meeting(x,y+1,oWALL))  state = shelenstates.attack;
	if (key_attack) && (!place_meeting(x,y+1,oWALL)) state = shelenstates.AirAttack_1; 
	if (Key_cast)  state = shelenstates.Cast;
	#endregion
}

if (state == shelenstates.attack){
	#region attack
	if (sprite_index != sShayAttack_1){		
	sprite_index = sShayAttack_1;
	ScreenShake(2, 10);
	audio_play_sound(AttackSound, 8, false);
	playedSound = true;
	image_index = 0;
	ds_list_clear(hitByAttack);
	}
	
	if (Dir = 0){
		//instance_activate_object(HitBox);
	}
	if (Dir = 1){
		//instance_activate_object(HitBoxLeft);
	}
	
	if (key_attack) && (image_index > 3) state = shelenstates.attackCombo2;

	
	if (animation_end(sShayAttack_1)){
		sprite_index = sShayIdle;
		state = shelenstates.idle;
	}
	#endregion
}

if (state == shelenstates.attackCombo2){
	#region attackCombo2
	if (sprite_index != sShayAttack_2){		
	sprite_index = sShayAttack_2;
	ScreenShake(4, 10);
	audio_play_sound(AttackSound, 8, false);
	image_index = 0;
	ds_list_clear(hitByAttack);
	}
	
	
	if (Dir = 0){
		//instance_activate_object(HitBoxCombo);
	}
	if (Dir = 1){
		//instance_activate_object(HitBoxComboLeft);
	}
	
	if (key_attack) && (image_index > 3) state = shelenstates.attackCombo3;
	
	if (animation_end(sShayAttack_2)){
		sprite_index = sShayIdle;
		state = shelenstates.idle;
	}
	#endregion
}

if (state == shelenstates.attackCombo3){
	#region attackCombo3
	if (sprite_index != sShayAttack_3){		
	sprite_index = sShayAttack_3;
	ScreenShake(4, 10);
	audio_play_sound(AttackSound, 8, false);
	image_index = 0;
	ds_list_clear(hitByAttack);
	}
	
	
	if (Dir = 0){
		//instance_activate_object(HitBoxCombo);
	}
	if (Dir = 1){
		//instance_activate_object(HitBoxComboLeft);
	}
	
	if (key_attack) && (image_index > 3) state = shelenstates.attack;
	
	if (animation_end(sShayAttack_2)){
		sprite_index = sShayIdle;
		playedSound = false;
		state = shelenstates.idle;
	}
	#endregion
}

if (state == shelenstates.AirAttack_1){
	#region AirAttack_1
	if (sprite_index != sShayAirAttack_1){		
	sprite_index = sShayAirAttack_1;
	ScreenShake(2, 10);
	audio_play_sound(AttackSound, 8, false);
	playedSound = true;
	image_index = 0;
	ds_list_clear(hitByAttack);
	}
	
	if (Dir = 0){
		//instance_activate_object(HitBox);
	}
	if (Dir = 1){
		//instance_activate_object(HitBoxLeft);
	}
	
	if (key_attack) && (image_index > 3) state = shelenstates.AirAttack_2;

	
	if (animation_end(sShayAirAttack_1)){
		state = shelenstates.idle;
	}
	#endregion
}

if (state == shelenstates.AirAttack_2){
	#region attackCombo2
	if (sprite_index != sShayAirAttack_2){		
	sprite_index =sShayAirAttack_2;
	ScreenShake(4, 10);
	audio_play_sound(AttackSound, 8, false);
	image_index = 0;
	ds_list_clear(hitByAttack);
	}
	
	
	if (Dir = 0){
		//instance_activate_object(HitBoxCombo);
	}
	if (Dir = 1){
		//instance_activate_object(HitBoxComboLeft);
	}
	
	if (key_attack) && (image_index > 2) state = shelenstates.AirAttack_3;
	
	if (animation_end(sShayAirAttack_2)){
		state = shelenstates.idle;
	}
	#endregion
}

if (state == shelenstates.AirAttack_3){
	#region attackCombo2
	if (sprite_index != sShayAirAttack_3){		
	sprite_index =sShayAirAttack_3;
	ScreenShake(4, 10);
	audio_play_sound(AttackSound, 8, false);
	image_index = 0;
	ds_list_clear(hitByAttack);
	}
	
	
	if (Dir = 0){
		//instance_activate_object(HitBoxCombo);
	}
	if (Dir = 1){
		//instance_activate_object(HitBoxComboLeft);
	}
	
	if (animation_end(sShayAirAttack_3)){
		state = shelenstates.idle;
	}
	#endregion
}

if (state == shelenstates.Cast){
	#region attack
	if (sprite_index != sCastShay){		
		sprite_index = sCastShay;
		ScreenShake(2, 10);
		audio_play_sound(Castsound, 8, false);
		playedSound = true;
		image_index = 0;
		ds_list_clear(hitByAttack);
	}
	
		
	if (animation_end(sCastShay)){
		if (Dir == 0){
			with(instance_create_layer(x+90,y+15,"Cast",oShayCast)){
				speed = 5;
			}
		}
	
		if (Dir == 1){
			with(instance_create_layer(x-70,y+15,"Cast",oShayCast)){
				speed = -5;
			}
		}
		sprite_index = sShayIdle;
		state = shelenstates.idle;
	}
	#endregion
}







