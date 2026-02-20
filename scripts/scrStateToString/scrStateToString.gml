function scrPlayerStateToString(_state){
	switch(_state) {
		case PlayerState.GROUND:
			return "Ground";
		case PlayerState.AIR:
			return "Air";
		case PlayerState.SLASH:
			return "Slash";
		case PlayerState.WALL:
			return "Wall";
	}
}