global.roomTransition = false;

roomSpawnX = 0;
roomSpawnY = 0;
roomSpawnYsp = 0;

roomSide = 0;

roomTransitionOnWall = false;
roomTransitionOnCeiling = false;
roomTransitionDir = 1;
lookup = true;

global.mapIndex = [1, 1];

mapData = [	[noone, RoomBlueLeft3, RoomBlueLeft2, RoomBlueAbove, RoomBlueAbove2, RoomBlueAbove3, RoomBlueCeilingClimb, noone],
			[noone, RoomIntro, RoomBlueLeft, RoomBlueFinalDoor, RoomBlueRight, RoomBlueRight2, RoomBlueRight3, noone],
			[noone, RoomIntro2, Room3, RoomCatbladeAbove, RoomCatbladeNeckAbove, RoomCatbladeNeck2Above, RoomBlueRedTransition, noone],
			[RoomClimb, Room1,	Room2, RoomCatblade, RoomCatbladeNeck, RoomCatbladeNeck2, RoomCatbladeNeck3, noone],
			[noone, RoomSplitRedLeft2, RoomSplitRedLeft, RoomSplitRed, RoomSplitRedRight, RoomSlowMoGate, RoomCatbladeNeck4, noone],
			[noone, noone, noone, noone, RoomTransitionRedPurple, noone, RoomTransitionRedPurple2, RoomPurpleDoubleSlash],
			[noone,RoomPurpleSecret,RoomPurpleSlowChallenge1,RoomPurpleLeft1,RoomSplit,RoomPurpleRight1, RoomPurpleRight3, RoomPurpleRight4],
			[noone,RoomPurpleFastClimb,RoomPurpleSlowChallenge2,RoomPurpleLeft2,RoomSlowMoGateBottom,RoomPurpleRight2, RoomzUpgradePurpleSlowmo, RoomPurpleRightBottomCorner]
		  ]

global.mapEvents = [0,0,0,0,0,0,0,0];
