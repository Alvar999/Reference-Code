#include <YSI\y_hooks>

#define MAX_MAPICON	100


new PlayerMapIcon[MAX_PLAYERS][MAX_MAPICON];

static playerUsingDirection[MAX_PLAYERS char];

hook OnPlayerConnect(playerid) {
	playerUsingDirection{playerid}=false;
}

hook OnPlayerUpdate(playerid) {
	CreateDirection(playerid);
	return 1;
}
Float:GetAngleZFromPoints(Float:x1, Float:y1, Float:x2, Float:y2) { 
    return (180.0 - atan2(x1-x2, y1-y2)); 
}
// Test code
/* 
CMD:updatemap(playerid) {
	CreateDirection(playerid);
	return 1;
}

CMD:gotowhite(playerid) {
	new matchingid = PlayerJoined[playerid];
	if(matchingid != -1 && MatchingInfo[matchingid][m_WRad]) {
		new Float:pX, Float:pY, Float:pZ, Float:fZ;
		GetPlayerPos(playerid, pX, pY, pZ);
		
		new Float:dir_ang = GetAngleZFromPoints(MatchingInfo[matchingid][m_WX], MatchingInfo[matchingid][m_WY], pX, pY);

		new Float:targetX = MatchingInfo[matchingid][m_WX] + (MatchingInfo[matchingid][m_WRad] * floatsin(-dir_ang, degrees));
		new Float:targetY = MatchingInfo[matchingid][m_WY] + (MatchingInfo[matchingid][m_WRad] * floatcos(-dir_ang, degrees));

		MapAndreas_FindZ_For2DCoord(targetX, targetY, fZ);
		SetPlayerPos(playerid, targetX, targetY, fZ + 0.5);
	}
	return 1;
}

CMD:gotoblue(playerid) {
	new matchingid = PlayerJoined[playerid];
	if(matchingid != -1 && MatchingInfo[matchingid][m_BRad]) {
		new Float:pX, Float:pY, Float:pZ, Float:fZ;
		GetPlayerPos(playerid, pX, pY, pZ);
		
		new Float:dir_ang = GetAngleZFromPoints(MatchingInfo[matchingid][m_BX], MatchingInfo[matchingid][m_BY], pX, pY);

		new Float:targetX = MatchingInfo[matchingid][m_BX] + (MatchingInfo[matchingid][m_BRad] * floatsin(-dir_ang, degrees));
		new Float:targetY = MatchingInfo[matchingid][m_BY] + (MatchingInfo[matchingid][m_BRad] * floatcos(-dir_ang, degrees));

		MapAndreas_FindZ_For2DCoord(targetX, targetY, fZ);
		SetPlayerPos(playerid, targetX, targetY, fZ + 0.5);
	}
	return 1;
}
*/

CreateDirection(playerid) {

	if(playerUsingDirection{playerid}) {
		for(new i=0; i!=MAX_MAPICON; i++) {
			DestroyDynamicMapIcon(PlayerMapIcon[playerid][i]);
		}
		playerUsingDirection{playerid}=false;
	}
	
	new matchingid = PlayerJoined[playerid];
	if(matchingid != -1 && MatchingInfo[matchingid][m_WRad]) {
	
		new Float:PPz;
		MapAndreas_FindZ_For2DCoord(MatchingInfo[matchingid][m_WX], MatchingInfo[matchingid][m_WY], PPz);
		new Float: tempWDistance = GetPlayerDistanceFromPoint(playerid, MatchingInfo[matchingid][m_WX], MatchingInfo[matchingid][m_WY], PPz);

		if(tempWDistance > MatchingInfo[matchingid][m_WRad]) {

			new Float:pX, Float:pY, Float:pZ;
			GetPlayerPos(playerid, pX, pY, pZ);
			
			new Float:dir_ang = GetAngleZFromPoints(MatchingInfo[matchingid][m_WX], MatchingInfo[matchingid][m_WY], pX, pY);
			
			new Float:targetX = MatchingInfo[matchingid][m_WX] + (MatchingInfo[matchingid][m_WRad] * floatsin(-dir_ang, degrees));
			new Float:targetY = MatchingInfo[matchingid][m_WY] + (MatchingInfo[matchingid][m_WRad] * floatcos(-dir_ang, degrees));

			//dir_ang = 180.0 - dir_ang;
			
			//MapAndreas_FindZ_For2DCoord(targetX, targetY, targetZ);
			new Float:playertoWhite = tempWDistance - MatchingInfo[matchingid][m_WRad];
			new Float:diff = 20.0 + (playertoWhite / 20.0);

			for(new i=0; i!=MAX_MAPICON; i++) {
			
				pX += (diff * floatsin(-dir_ang + 180, degrees));
				pY += (diff * floatcos(-dir_ang + 180, degrees));

				if(GetDistance(pX, pY, 0.0, MatchingInfo[matchingid][m_WX], MatchingInfo[matchingid][m_WY], 0.0) - MatchingInfo[matchingid][m_WRad] <= diff) {
					pX = targetX;
					pY = targetY;
					PlayerMapIcon[playerid][i] = CreateDynamicMapIcon(pX, pY, pZ, 56, 0xFFFFFFFF, -1, -1, playerid, 4000.0, MAPICON_GLOBAL);
					break;
				}
				
				PlayerMapIcon[playerid][i] = CreateDynamicMapIcon(pX, pY, pZ, 56, 0xFFFFFFFF, -1, -1, playerid, 4000.0, MAPICON_GLOBAL);
			}
			playerUsingDirection{playerid}=true;
			Streamer_Update(playerid, STREAMER_TYPE_MAP_ICON);
		}
	}
}