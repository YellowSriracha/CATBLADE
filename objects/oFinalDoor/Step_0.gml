if image_index == 1 {
	if distance_to_object(oCat) < 40{
		drawArrow = true;
		if global.input.upKeyPressed or global.input.selectKey {
			room_goto(RoomFinalBoss);
		}
	}
}

t+= 0.1;