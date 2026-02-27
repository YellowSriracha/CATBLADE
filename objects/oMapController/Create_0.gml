global.roomTransition = false;

roomSpawnX = 0;
roomSpawnY = 0;
roomSpawnYsp = 0;

roomSide = 0;

roomTransitionOnWall = false;

lookup = true;

global.mapIndex = [0, 1];

mapData = [	[noone, RoomIntro, noone, noone, noone, noone, noone, noone],
			[noone, RoomIntro2, RoomEnd, Room4, noone, noone, noone, noone],
			[RoomClimb, Room1,	Room2, RoomCatblade, RoomCatbladeNeck, RoomCatbladeNeck2, RoomCatbladeNeck3, noone],
			[noone, noone, RoomSplitRedLeft, RoomSplitRed, RoomSplitRedRight, RoomSlowMoGate, RoomCatbladeNeck4, noone],
			[noone, noone, noone, noone, RoomTransitionRedPurple, noone, noone, RoomPurpleDoubleSlash],
			[noone,noone,RoomPurpleSlowChallenge1,RoomPurpleLeft1,RoomSplit,RoomPurpleRight1, RoomPurpleRight3, RoomPurpleRight4],
			[noone,RoomPurpleFastClimb,RoomPurpleSlowChallenge2,RoomPurpleLeft2,RoomSlowMoGateBottom,RoomPurpleRight2, RoomzUpgradePurpleSlowmo, RoomPurpleRightBottomCorner]
		  ]
