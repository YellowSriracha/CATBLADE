global.roomTransition = false;

roomSpawnX = 0;
roomSpawnY = 0;
roomSpawnYsp = 0;

roomSide = 0;

roomTransitionOnWall = false;
roomTransitionOnCeiling = false;
lookup = true;

global.mapIndex = [1, 1];

mapData = [	[noone, noone, noone, noone, noone, noone, noone, noone],
			[noone, RoomIntro, noone, RoomFinalDoor, noone, noone, noone, noone],
			[noone, RoomIntro2, Room3, RoomCatbladeAbove, RoomCatbladeNeckAbove, RoomCatbladeNeck2Above, RoomBlueRedTransition, noone],
			[RoomClimb, Room1,	Room2, RoomCatblade, RoomCatbladeNeck, RoomCatbladeNeck2, RoomCatbladeNeck3, noone],
			[noone, noone, RoomSplitRedLeft, RoomSplitRed, RoomSplitRedRight, RoomSlowMoGate, RoomCatbladeNeck4, noone],
			[noone, noone, noone, noone, RoomTransitionRedPurple, noone, noone, RoomPurpleDoubleSlash],
			[noone,noone,RoomPurpleSlowChallenge1,RoomPurpleLeft1,RoomSplit,RoomPurpleRight1, RoomPurpleRight3, RoomPurpleRight4],
			[noone,RoomPurpleFastClimb,RoomPurpleSlowChallenge2,RoomPurpleLeft2,RoomSlowMoGateBottom,RoomPurpleRight2, RoomzUpgradePurpleSlowmo, RoomPurpleRightBottomCorner]
		  ]
