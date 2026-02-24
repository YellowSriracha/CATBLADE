global.roomTransition = false;

roomSpawnX = 0;
roomSpawnY = 0;
roomSpawnYsp = 0;

roomSide = 0;

roomTransitionOnWall = false;

lookup = true;

global.mapIndex = [0, 1];

mapData = [	[noone, RoomIntro, noone, noone, noone, noone],
			[noone, RoomChallengeNoClimb, RoomEnd, Room4, noone, noone],
			[RoomClimb, Room1,	Room2, Room3, noone, noone],
			[noone,RoomPurpleSlowChallenge1,RoomPurpleLeft1,RoomSplit,noone],
			[RoomPurpleFastClimb,RoomPurpleSlowChallenge2,noone,noone,noone]
		  ]
