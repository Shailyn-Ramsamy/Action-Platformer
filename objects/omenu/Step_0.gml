/// @description Insert description here
// You can write your code in this editor

menu_x += (menu_x_target - (menu_x)) / menu_speed -5;

if (menu_control){
	if (keyboard_check_pressed(vk_up)){
		menu_curser++;
		if (menu_curser >= menu_items) menu_curser = 0;
	}
	if (keyboard_check_pressed(vk_down)){
		menu_curser--;
		if (menu_curser < 0) menu_curser = menu_items-1;
	}
	
	if (keyboard_check_pressed(vk_enter)){
		menu_x_target = gui_width+1000;
		menu_comitted = menu_curser;
		ScreenShake(10, 30);
		menu_control = false;
	}
}

if(menu_x > gui_width+700) && (menu_comitted != -1){
	switch(menu_comitted){
		case 2: default:SlideTransition(Trans_Mode.GOTO, Room1);break;
		case 0: game_end(); break;
	}
}



