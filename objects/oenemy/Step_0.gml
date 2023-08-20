	
if (EnemyState == Enemy_state.NORMAL){
	vsp = vsp + grv;
	

	if (place_meeting (x+hsp,y,oWALL)){
		var onePixel = sign(hsp);
		while (!place_meeting(x+onePixel,y,oWALL)) x += onePixel;
		if (place_meeting (x+hsp,y,oSides)){
			hsp = -hsp;
		}
	}
	x += hsp;

	if (place_meeting(x,y+vsp,oWALL)){
		var onePixel = sign(vsp);
		while (!place_meeting(x,y+onePixel,oWALL)) y += onePixel;
		vsp = 0;
	}
	y += vsp;


	if(!place_meeting(x, y+1, oWALL)){
	
		if (hsp < 0) image_xscale = sign(hsp) - 1;
		if (hsp > 0) image_xscale = sign(hsp) + 1;
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
			if(hsp < 0) image_xscale = sign(hsp)-1;
			if(hsp > 0) image_xscale = sign(hsp)+1;
			if (sprite_index != sEnemyRun) sprite_index = sEnemyRun;
			sprite_index = sEnemyRun;
		}
		else{
			sprite_index = sENEMYidle;
		}	
	}
	
	if (oKARISHMA.Dir == 0) && (place_meeting(x, y, HitBox)) || (place_meeting(x, y, HitBoxCombo))  EnemyState = Enemy_state.ATTACKED;
	if (oKARISHMA.Dir == 1) && (place_meeting(x, y, HitBox)) || (place_meeting(x, y, HitBoxCombo))  EnemyState = Enemy_state.ATTACKEDLEFT;
}



if (EnemyState = Enemy_state.ATTACKED){
	hp --;
	if (hp > 0){
		image_xscale = -2;
		sprite_index = EnemyAttacked;
	}
	flash = 1;		
	if (animation_end(EnemyAttacked)){
		EnemyState = Enemy_state.NORMAL;
	}
}

if (EnemyState = Enemy_state.ATTACKEDLEFT){
	hp --;
	if (hp > 0){
		image_xscale = 2;
		sprite_index = EnemyAttacked
	}
	flash = 1;		
	if (animation_end(EnemyAttacked)){
		EnemyState = Enemy_state.NORMAL;
	}
}


	









