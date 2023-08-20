if (hp < 0)&& (EnemyState = Enemy_state.ATTACKED){
		instance_create_layer(x,y,layer,oDead);
		instance_destroy();
}

if (hp < 0)&& (EnemyState = Enemy_state.ATTACKEDLEFT){
		instance_create_layer(x,y,layer,oDeadleft);
		instance_destroy();
}


