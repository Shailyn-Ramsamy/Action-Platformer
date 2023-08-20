if(done == 0){
	vsp = vsp + grv;
	

		if (place_meeting (x+hsp,y,oWALL)){
			var onePixel = sign(hsp);
			while (!place_meeting(x+onePixel,y,oWALL)) x += onePixel;
			hsp = 0;
		}
		x += hsp;

		if (place_meeting(x,y+vsp,oWALL)){
			if (vsp > 0) {
				done = 1;
				sprite_index = sEnemyDead;
			}
			var onePixel = sign(vsp);
			while (!place_meeting(x,y+onePixel,oWALL)) y += onePixel;
			vsp = 0;
		}
		y += vsp;
}


