if(point_in_circle(oKARISHMA.x,oKARISHMA.y,x,y,64)) && (!instance_exists(oText)){
	with (instance_create_layer(x,y-64,layer,oText)){
		text = other.text;
		length = string_length(text);
	}
	with(oCamera){
		follow = other.id;
	}
	
	if (keyboard_check(ord("E"))){
		sprite_index = Houseanim;
		image_speed = 1;
		if (animation_end(Houseanim)){
			SlideTransition(Trans_Mode.GOTO, Room1);
		}
	}
	
}
if(!point_in_circle(oKARISHMA.x,oKARISHMA.y,x,y,64)) && (instance_exists(oText)){
	with (oText){
		instance_destroy();
		with(oCamera) follow = oKARISHMA;
	}
}








