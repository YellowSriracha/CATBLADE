///@description Determine respawn position
Shader_ChromaticAbberation_Disable();

var _respawnPoint = determineRespawnPoint();
respawnPointX = _respawnPoint.x;
respawnPointY = _respawnPoint.y;