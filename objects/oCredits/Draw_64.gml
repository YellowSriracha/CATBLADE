var _creditsY = scrollY;

draw_sprite(sLogo,0,center,_creditsY);
_creditsY += 200;
draw_sprite(sTagline,0,center,_creditsY)
_creditsY += 150;
draw_sprite_ext(sGoldenFish,0,center,_creditsY,4,4,0,c_white,1)

_creditsY += 300;

draw_set_color(c_white)
draw_set_halign(fa_center);

draw_set_font(fontCreditssmall);
draw_text(center,_creditsY,"Design, Art, and Programming by")
_creditsY += 80;
draw_set_font(fontCredits);
draw_set_color(textColor)
draw_text(center,_creditsY,"Daniel O'Connor-D'Amico")

_creditsY += 200;

draw_set_color(c_white)
draw_set_font(fontCreditssmall);
draw_text(center,_creditsY,"Additional Programming by")
_creditsY += 80;
draw_set_font(fontCredits);
draw_set_color(textColor)
draw_text(center,_creditsY,"Matt B")

_creditsY += 200;
draw_set_color(c_white)
draw_set_font(fontCreditssmall);
draw_text(center,_creditsY,"Music by")
_creditsY += 80;
draw_set_font(fontCredits);
draw_set_color(textColor)
draw_text(center,_creditsY,"Ed Varga")

_creditsY += 300;

draw_sprite_ext(sInventorySword,0,center-220,_creditsY,4,4,0,c_white,1)

_creditsY += 200;
draw_set_color(c_white)
draw_set_font(fontCreditssmall);
draw_text(center,_creditsY,"Thanks for playing")
_creditsY += 150;
draw_text(center,_creditsY,"You finished CATBLADE in:")
_creditsY += 80;
draw_set_font(fontPickup);
draw_text(center,_creditsY,string(floor(global.gameTime/3600))+"h" +string(floor(global.gameTime/60))+"m" + string(floor(global.gameTime)%60)+"s");


if _creditsY < 500 and musicFading = false{
	musicFading = true;
	global.musicVolume = 0;
	scrMusicSetVolume(1500);
	global.musicVolume = global.options.musicVolume;
}

if _creditsY < -100{
	room_goto(rmMainMenu);
}
draw_set_halign(fa_left);
draw_set_font(-1);
scrollY -= 1;
