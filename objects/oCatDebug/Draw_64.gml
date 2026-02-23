draw_text(01,10,"onWall:" + string(oCat.onWall))
draw_text(01,40,"Y Input:" + string(oCat.inputYdir))

draw_text(01,70,"X:" + string(oCat.x))
draw_text(01,100,"Y:" + string(oCat.y))

draw_text(01,130,"Spawn Side:" + string(oMapController.roomSide))
draw_text(01,160,"Spawn X:" + string(oMapController.roomSpawnX))
draw_text(01,190,"Spawn Y:" + string(oMapController.roomSpawnY))

draw_text(01,230,"State:" + scrPlayerStateToString(oCat.state));
draw_text(01,260,"XSP:" + string(oCat.xsp));
draw_text(01,290,"YSP:" + string(oCat.ysp));
draw_text(01,310,"Xinput:" + string(oCat.inputXdir));
draw_text(01,340,"Yinput:" + string(oCat.inputYdir));

draw_text(01,390,"Slashes Ready:" + string(oCat.slashesReady));

draw_text(01,420,"Map Location: [" + string(global.mapIndex[0]) + "] [" + string(global.mapIndex[1]) + "]");

draw_text(01,450,"onCeiling:" + string(oCat.onCeiling));
