if (mode != Trans_Mode.OFF){
	if (mode == Trans_Mode.INTRO){
		percent = max(0, percent - max((percent/10), 0.005));
	}
	else{
		percent = min(1, percent + max(((1-percent)/10),0.005));
	}
	
	if (percent == 1) || (percent == 0){
		switch (mode){
			case Trans_Mode.INTRO:{
				mode = Trans_Mode.OFF;
				break;
			}
			case Trans_Mode.NEXT:{
				mode = Trans_Mode.INTRO;
				room_goto_next()
				break;
			}
			case Trans_Mode.GOTO:{
				mode = Trans_Mode.INTRO;
				room_goto(target);
				break;
			}
			case Trans_Mode.RESTART:{
				game_restart();
				break;
			}
		}
	}
}





