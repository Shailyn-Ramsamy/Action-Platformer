var halfw = w * 0.2;
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_roundrect_ext(x-halfw-border,y-h-(border*2),x+halfw+border,y,15,15,false);
draw_sprite(sMARKER,0,x,y);
draw_set_alpha(1);

draw_set_color(c_white);
draw_set_font(fhouse);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_text(x,y-h-border, text_current)






