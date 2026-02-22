global.roomTransition = false;

roomSpawnX = 0;
roomSpawnY = 0;
roomSpawnYsp = 0;

roomSide = 0;

roomTransitionOnWall = false;

global.mapIndex = [0, 1];

mapData = [	[noone, RoomIntro, noone, noone, noone, noone],
			[noone, RoomChallengeNoClimb, RoomEnd, Room4, noone, noone],
			[RoomClimb, Room1,	Room2, Room3, noone, noone],
			[noone,noone,noone,noone,noone]
		  ]
