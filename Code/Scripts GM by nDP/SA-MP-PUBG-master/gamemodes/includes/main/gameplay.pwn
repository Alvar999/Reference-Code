/* MatchingInfo GAMEPLAY.PWN*/

#include <YSI\y_hooks>


new PlayerDeath[MAX_PLAYERS char];
new PlayerKill[MAX_PLAYERS];
new PlayerSurvivalTime[MAX_PLAYERS];
new Float:PlayerMakeDamage[MAX_PLAYERS];

new 
	Float:LastPlayerPosX[MAX_PLAYERS],
	Float:LastPlayerPosY[MAX_PLAYERS],
	Float:LastPlayerPosZ[MAX_PLAYERS],
	Float:LastPlayerPosA[MAX_PLAYERS]
;

//************************* UI Variables *************************//

// CircleTextDraw
/*
new bool:whiteCircleCreated[MAX_PLAYERS char];
new bool:blueCircleCreated[MAX_PLAYERS char];
new PlayerText:whiteCircleTextDraw[MAX_PLAYERS];
new PlayerText:blueCircleTextDraw[MAX_PLAYERS];
		*/
// TextDrawMap
#define MAX_MAP_TEXTDRAWS			9
#define MAX_MAP_PARTY_TEXTDRAWS		8

new Text:mapTextDraw[MAX_MAP_TEXTDRAWS];
new mapTextDrawCount;

new PlayerText:mapPlayerTextDraw[MAX_PLAYERS][MAX_MAP_PARTY_TEXTDRAWS];
new mapPlayerTextDrawCount[MAX_PLAYERS];

new bool:playerUsingMap[MAX_PLAYERS char];

// TextDrawPartyBox

#define MAX_PARTY_BOX_TEXTDRAWS		16
#define MAX_PARTY_BOX_BG_TEXTDRAWS	8

enum E_PARTY_BOX_TEXTDRAW
{
	E_PARTYBOX_TEXTDRAW_NAME[MAX_PARTY_MEMBER],
	E_PARTYBOX_TEXTDRAW_HEALTH[MAX_PARTY_MEMBER]
};

new Text:partyBoxTextDraw[MAX_PARTY_BOX_BG_TEXTDRAWS];
new partyBoxTextDrawID[E_PARTY_BOX_TEXTDRAW];
new partyBoxTextDrawCount;

new PlayerText:partyBoxPlayerTextDraw[MAX_PLAYERS][MAX_PARTY_BOX_TEXTDRAWS];
new partyBoxPlayerTextDrawCount[MAX_PLAYERS];

new bool:playerUsingPartyBox[MAX_PLAYERS char];

// TextDrawEndScreen

#define MAX_ENDSCREEN_TEXTDRAWS		4
#define MAX_PLAYER_ENDSCREEN_TEXTDRAWS	9

enum E_ENDSCREEN_TEXTDRAW
{
	E_ENDSCREEN_EXIT
};

new Text:EndscreenTextDraw[MAX_ENDSCREEN_TEXTDRAWS];
new EndscreenTextDrawID[E_ENDSCREEN_TEXTDRAW];
new EndscreenTextDrawCount;

new PlayerText:EndscreenPlayerTextDraw[MAX_PLAYERS][MAX_PLAYER_ENDSCREEN_TEXTDRAWS];
new EndscreenPlayerTextDrawCount[MAX_PLAYERS];

new bool:playerUsingEndscreen[MAX_PLAYERS char];

/*// TextDrawKill
new PlayerText:playerKillTextDraw[MAX_PLAYERS];
new PlayerText:playerCountKillTextDraw[MAX_PLAYERS];
*/

// TextDrawGameplay

#define MAX_GAMEPLAY_TEXTDRAWS			50
#define MAX_PLAYER_GAMEPLAY_TEXTDRAWS	50

enum E_GAMEPLAY_TEXTDRAW
{
	E_GAMEPLAY_JUMP_TEXT,
	E_GAMEPLAY_MATCH_COUNTDOWN,
	E_GAMEPLAY_PLAYER_KILL,
	E_GAMEPLAY_PLAYER_KILL_COUNT,
	
	E_GAMEPLAY_RIGHTKILL_TEXT,
	E_GAMEPLAY_RIGHTKILL_COUNT,
	E_GAMEPLAY_RIGHTUPPER_TEXT[MAX_MATCHINGINFO],
	E_GAMEPLAY_RIGHTUPPER_COUNT[MAX_MATCHINGINFO],
};

new Text:gameplayTextDraw[MAX_GAMEPLAY_TEXTDRAWS];
new gameplayTextDrawID[E_GAMEPLAY_TEXTDRAW];
new gameplayTextDrawCount;

new PlayerText:gameplayPlayerTextDraw[MAX_PLAYERS][MAX_PLAYER_GAMEPLAY_TEXTDRAWS];
new gameplayPlayerTextDrawID[MAX_PLAYERS][E_GAMEPLAY_TEXTDRAW];
new gameplayPlayerTextDrawCount[MAX_PLAYERS];

// TextDrawCircleShift

#define MAX_PLAYER_CIRCLESHIFT_TEXTDRAWS	6

enum E_CIRCLESHIFT_TEXTDRAW
{
	E_CIRCLESHIFT_BLUE,
	E_CIRCLESHIFT_RUN,
	E_CIRCLESHIFT_TIME,
};

new PlayerText:circleshiftPlayerTextDraw[MAX_PLAYERS][MAX_PLAYER_CIRCLESHIFT_TEXTDRAWS];
new circleshiftPlayerTextDrawID[MAX_PLAYERS][E_CIRCLESHIFT_TEXTDRAW];
new circleshiftPlayerTextDrawCount[MAX_PLAYERS];
new bool:playerUsingcircleshift[MAX_PLAYERS char];

hook OnPlayerUpdate(playerid) {
	UpdatePlayerCircleShift(playerid);
	UpdatePlayerMap(playerid);
	return 1;
}

ptask PlayerMatchingTimer[1000](playerid) {
	if(IsPlayerInGame{playerid}) {
		new matchingid = PlayerJoined[playerid];
		if(matchingid != -1) {
			switch(MatchingInfo[matchingid][m_STATE]) {
				case STATE_JOIN: {
					if(MatchingInfo[matchingid][m_Timer] > 0) {
					
						new str[128], minutes, seconds = MatchingInfo[matchingid][m_Timer];
						ConvertTime(seconds, minutes);
						
						if(minutes) 
							format(str, 16, "%d:%02d", minutes, seconds);
						else 
							format(str, 16, "%d", seconds);
							
						format(str, 128, "MATCH STARTS IN~n~%s", str);
						
						PlayerTextDrawSetString(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawID[playerid][E_GAMEPLAY_MATCH_COUNTDOWN]], str);
						PlayerTextDrawShow(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawID[playerid][E_GAMEPLAY_MATCH_COUNTDOWN]]);
						
					}
					else {
						PlayerTextDrawHide(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawID[playerid][E_GAMEPLAY_MATCH_COUNTDOWN]]);
						UpdateUI_CurrentPlayer(matchingid, MatchingInfo[matchingid][m_Player]);

						if(MatchingInfo[matchingid][m_Timer] == 0) {
							TogglePlayerSpectating(playerid, true);
							PlayerSpectateVehicle(playerid, MatchingInfo[matchingid][m_Plane], SPECTATE_MODE_SIDE);
							PlayerInPlane[playerid] = MatchingInfo[matchingid][m_Plane];
							
							TextDrawShowForPlayer(playerid, gameplayTextDraw[gameplayTextDrawID[E_GAMEPLAY_JUMP_TEXT]]);
							TextDrawShowForPlayer(playerid, gameplayTextDraw[gameplayTextDrawID[E_GAMEPLAY_JUMP_TEXT]+1]);
						}
					}
				}
			}
			
			if(MatchingInfo[matchingid][m_STATE] != STATE_JOIN) {
				PlayerSurvivalTime[playerid]++;
				//CreateDirection(playerid);
				//UpdatePlayerCircleShift(playerid);
			}
			/*
			if(MatchingInfo[matchingid][m_STATE] == STATE_WHITE || MatchingInfo[matchingid][m_STATE] == STATE_BLUE) {
				if(MatchingInfo[matchingid][m_WShrink] != INVALID_GZ_SHAPE_ID) GZ_ShapeShowForPlayer(playerid, MatchingInfo[matchingid][m_WShrink], 0xFFFFFF77);
				if(MatchingInfo[matchingid][m_BShrink] != INVALID_GZ_SHAPE_ID) GZ_ShapeShowForPlayer(playerid, MatchingInfo[matchingid][m_BShrink], 0x2E64FE95);
			}
			*/
			ShowMarkers(playerid);
			//UpdatePlayerMap(playerid);
			//UpdatePlayerPartyBox(playerid);
		}
	}
	return 1;
}

hook OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	if(clickedid == EndscreenTextDraw[EndscreenTextDrawID[E_ENDSCREEN_EXIT]]) {
		ResetPlayerToLobby(playerid);
	}
    return 1;
}

hook OnPlayerConnect(playerid) {
	PlayerDeath{playerid}=false;
	PlayerMakeDamage[playerid]=
	LastPlayerPosX[playerid]=
	LastPlayerPosY[playerid]=
	LastPlayerPosZ[playerid]=
	LastPlayerPosA[playerid]=0.0;
	
	PlayerKill[playerid]=
	PlayerSurvivalTime[playerid]=0;
}

hook OnPlayerSpawn(playerid) {
	new matchingid = PlayerJoined[playerid];
	if(matchingid != -1)
	{	
		switch(MatchingInfo[matchingid][m_STATE]) {
			case STATE_JOIN: {
				for (new i; i < playerlobbyTextDrawCount[playerid]; i++) 
					PlayerTextDrawHide(playerid, playerlobbyTextDraw[playerid][i]);
		
				for (new i; i < lobbyTextDrawCount; i++)
					TextDrawHideForPlayer(playerid, lobbyTextDraw[i]);
			
				CancelSelectTextDraw(playerid);
				//
				PlayerDeath{playerid}=false;
				PlayerMakeDamage[playerid]=
				LastPlayerPosX[playerid]=
				LastPlayerPosY[playerid]=
				LastPlayerPosZ[playerid]=
				LastPlayerPosA[playerid]=0.0;
				
				PlayerKill[playerid]=
				PlayerSurvivalTime[playerid]=0;
				//
				PlayerPartyReady{playerid} = false;
				IsPlayerInGame{playerid} = true;
				
				GameTextForPlayer(playerid, "_", 1000, 3);
				
				TogglePlayerControllable(playerid, true);
			
				SetPlayerHealth(playerid, 100);
				SetPlayerVirtualWorld(playerid, PlayerJoined[playerid]+1);	
				SetPlayerPos(playerid, 353.4516, 2501.5515, 16);
				SetCameraBehindPlayer(playerid);
				
				
				ShowMarkers(playerid);
				Party_UpdateUI(PlayerParty[playerid]);
				
				TextDrawShowForPlayer(playerid, gameplayTextDraw[gameplayTextDrawID[E_GAMEPLAY_RIGHTUPPER_COUNT][matchingid]]);
				TextDrawShowForPlayer(playerid, gameplayTextDraw[gameplayTextDrawID[E_GAMEPLAY_RIGHTUPPER_TEXT][matchingid]]);
				
			}
		}
	}
	//printf("gameplay.pwn called OnPlayerSpawn");
	return 1;
}

hook OnPlayerDeath(playerid, killerid, reason) {
/*	GetPlayerPos(playerid, LastPlayerPosX[playerid], LastPlayerPosY[playerid], LastPlayerPosZ[playerid]);
	GetPlayerFacingAngle(playerid, LastPlayerPosA[playerid]);*/
	OnPlayerDeathEx(playerid, killerid, reason);
	return 1;
}

stock OnPlayerDeathEx(playerid, killerid, reason) {

	GetPlayerPos(playerid, LastPlayerPosX[playerid], LastPlayerPosY[playerid], LastPlayerPosZ[playerid]);
	GetPlayerFacingAngle(playerid, LastPlayerPosA[playerid]);
	
	TogglePlayerSpectating(playerid, true);
	defer OnPlayerDeathTimer(playerid, killerid, reason);
	return 1;
}

timer OnPlayerDeathTimer[500](playerid, killerid, reason)
{
	if(!PlayerDeath{playerid}) {
	
		PlayerDeath{playerid} = true;
		
		new 
			Float:temp_camposX = LastPlayerPosX[playerid],
			Float:temp_camposY = LastPlayerPosY[playerid]
		;
		
		temp_camposX -= (floatsqroot(6.0) * floatsin(-LastPlayerPosA[playerid], degrees));
		temp_camposY -= (floatsqroot(6.0) * floatcos(-LastPlayerPosA[playerid], degrees));
		
		
		SetPlayerCameraPos(playerid, temp_camposX, temp_camposY, LastPlayerPosZ[playerid] + 1.5);
		SetPlayerCameraLookAt(playerid, LastPlayerPosX[playerid], LastPlayerPosY[playerid], LastPlayerPosZ[playerid]);

		CreateDynamicObject(2969, LastPlayerPosX[playerid], LastPlayerPosY[playerid], LastPlayerPosZ[playerid]-0.5, 0.0, 0.0, 0.0);

		Party_UpdateUI(PlayerParty[playerid]);

		new matchid = PlayerJoined[playerid];
		if(matchid != -1) {
		
			if(killerid != INVALID_PLAYER_ID) {
				PlayerKill[killerid]++;
				
				new str[24];
				format(str, 24, "_%d", PlayerKill[killerid]);
				PlayerTextDrawSetString(killerid, gameplayPlayerTextDraw[killerid][gameplayPlayerTextDrawID[killerid][E_GAMEPLAY_RIGHTKILL_COUNT]], str);
			}
			
			new teamsurvival = MatchingWinner(matchid, playerid);
			new player_count = MatchingPlayerCount(matchid);
			if(killerid != INVALID_PLAYER_ID) {

				if(teamsurvival>1) {
					SendMatchMessage(matchid, -1, "%s ถูกสังหารโดย %s - คงเหลือ %d", ReturnName(playerid), ReturnName(killerid), player_count);
				}
				else {
					SendMatchMessage(matchid, -1, "%s ถูกสังหารโดย %s - จบการแข่งขัน", ReturnName(playerid), ReturnName(killerid)); 
				}
			}
			else {

				if(teamsurvival>1) {
					SendMatchMessage(matchid, -1, "%s ถูกสังหารโดย %s - คงเหลือ %d", ReturnName(playerid), ReturnReasonName(reason), player_count);
				}
				else {
					SendMatchMessage(matchid, -1, "%s ถูกสังหารโดย %s - จบการแข่งขัน", ReturnName(playerid), ReturnReasonName(reason)); 
				}
			}
			
			foreach(new x : Player) if(GetPlayerJoinMatch(x) == matchid) {
				SendDeathMessageToPlayer(x, killerid, playerid, reason);
			}
			
			ShowPlayerKDText(killerid, playerid, reason);
			
			UpdateUI_CurrentPlayer(matchid, player_count);
		}
		/*new matchid = PlayerInMatching[playerid];
		if(matchid != -1) {
			MatchMaking[matchid][m_Alive]--;
			if(killerid != INVALID_PLAYER_ID) {
				PlayerData[killerid][pKillScore]++;
				ShowPlayerKillText(killerid, playerid, reason);
			}
			ShowPlayerDeathText(playerid, reason);
			PlayerData[playerid][pDeaths]++;
			UpdateAliveText(matchid);
			CheckWinner(matchid);
			
			foreach(new x : Player) {
				if(PlayerInMatching[x] == matchid) {
					if(MatchMaking[matchid][m_Alive]>1) {
						SendClientMessageEx(x, -1, "%s ถูกสังหารโดย %s - คงเหลือ %d", ReturnName(playerid), ReturnName(killerid), MatchMaking[matchid][m_Alive]);
					}
					else {
						if(killerid != INVALID_PLAYER_ID) {
							SendClientMessageEx(x, -1, "%s ถูกสังหารโดย %s - จบการแข่งขัน", ReturnName(playerid), ReturnName(killerid)); 
						}
					}
				}
			}
		}*/
	}
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys) 
{ 
    if(Pressed(KEY_SECONDARY_ATTACK))
    { 
        cmd_jump(playerid);
    } 
	if(Pressed(KEY_LOOK_BEHIND) || Pressed(KEY_LOOK_LEFT) || Pressed(KEY_SUBMISSION)) {
		cmd_map(playerid);
	}
    return 1; 
}

CMD:jump(playerid) {
	if(IsPlayerInGame{playerid}) {
		new matchingid = PlayerJoined[playerid];
		if(matchingid != -1 && PlayerInPlane[playerid] != INVALID_VEHICLE_ID && MatchingInfo[matchingid][m_STATE] != STATE_JOIN) {
		
			TextDrawHideForPlayer(playerid, gameplayTextDraw[gameplayTextDrawID[E_GAMEPLAY_JUMP_TEXT]]);
			TextDrawHideForPlayer(playerid, gameplayTextDraw[gameplayTextDrawID[E_GAMEPLAY_JUMP_TEXT]+1]);
			TogglePlayerSpectating(playerid, false);
			
			// Weapon Set
			GivePlayerWeapon(playerid, 24, 50);
			GivePlayerWeapon(playerid, 25, 60);
			GivePlayerWeapon(playerid, 29, 300);
			GivePlayerWeapon(playerid, 30, 200);
			SetPlayerArmour(playerid, 100.0);
			
			new Float:x, Float:y, Float:z;
			GetVehiclePos(PlayerInPlane[playerid], x, y, z);
			PlayerInPlane[playerid] = INVALID_VEHICLE_ID;
			GivePlayerWeapon(playerid, 46, 1);
			SetPlayerPos(playerid, x, y, z - 5.0);
			SetPlayerHealth(playerid, 100);

			Party_UpdateUI(PlayerParty[playerid]);
		}
	}
	return 1;
}

CMD:map(playerid) {
	if(IsPlayerInGame{playerid}) {
		new matchingid = PlayerJoined[playerid];
		if(matchingid != -1) {
			if(playerUsingMap{playerid}) {
				playerUsingMap{playerid}=false;
				for (new i; i < mapTextDrawCount; i++)
				{
					TextDrawHideForPlayer(playerid, mapTextDraw[i]);
				}
				for (new i; i < mapPlayerTextDrawCount[playerid]; i++)
				{
					PlayerTextDrawDestroy(playerid, mapPlayerTextDraw[playerid][i]);
				}
				mapPlayerTextDrawCount[playerid] = 0;
				
				if(TD_IsCircleCreated(playerid)) {
					TD_DestroyCircle(playerid);
				}
				
				ShowPlayerCircleShift(playerid);
				
				/*if(whiteCircleCreated{playerid}) {
					PlayerTextDrawDestroy(playerid, whiteCircleTextDraw[playerid]);
					whiteCircleCreated{playerid}=false;
				}
				if(blueCircleCreated{playerid}) {
					PlayerTextDrawDestroy(playerid, blueCircleTextDraw[playerid]);
					blueCircleCreated{playerid}=false;
				}*/
				
				PlayerTextDrawHide(playerid,gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawID[playerid][E_GAMEPLAY_RIGHTKILL_TEXT]]);
				PlayerTextDrawHide(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawID[playerid][E_GAMEPLAY_RIGHTKILL_COUNT]]);
			}
			else {
				HidePlayerCircleShift(playerid);
				
				playerUsingMap{playerid}=true;
				
				for (new i; i < mapTextDrawCount; i++)
				{
					TextDrawShowForPlayer(playerid, mapTextDraw[i]);
				}
				UpdatePlayerMap(playerid);
				
				PlayerTextDrawShow(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawID[playerid][E_GAMEPLAY_RIGHTKILL_TEXT]]);
				PlayerTextDrawShow(playerid,  gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawID[playerid][E_GAMEPLAY_RIGHTKILL_COUNT]]);
			}
		}
	}
	return 1;
}


IsPlayerDeath(playerid) {
	return PlayerDeath{playerid};
}

GetPlayerKill(playerid) {
	return PlayerKill[playerid];
}

GetPlayerSurvivalTime(playerid) {
	return PlayerSurvivalTime[playerid];
}

GetPlayerMakeDamage(playerid) {
	return floatround(PlayerMakeDamage[playerid] / 5.0);
}

IncreasePlayerMakeDamage(playerid, Float:val) {
	PlayerMakeDamage[playerid] += val;
}

ShowMarkers(playerid)
{
	new partyid = PlayerParty[playerid];

	if(partyid != NO_PARTY) {
	
		if(PartyInfo[partyid][pMember][0]!=INVALID_PLAYER_ID&&PartyInfo[partyid][pMember][0]!=playerid)
		{
			SetPlayerMarkerForPlayer(playerid, PartyInfo[partyid][pMember][0], TEAM_RED);
		}
		if(PartyInfo[partyid][pMember][1]!=INVALID_PLAYER_ID&&PartyInfo[partyid][pMember][1]!=playerid)
		{
			SetPlayerMarkerForPlayer(playerid, PartyInfo[partyid][pMember][1], TEAM_GREEN);
		}
		if(PartyInfo[partyid][pMember][2]!=INVALID_PLAYER_ID&&PartyInfo[partyid][pMember][2]!=playerid)
		{
			SetPlayerMarkerForPlayer(playerid, PartyInfo[partyid][pMember][2], TEAM_BLUE);
		}
		if(PartyInfo[partyid][pMember][3]!=INVALID_PLAYER_ID&&PartyInfo[partyid][pMember][3]!=playerid)
		{
			SetPlayerMarkerForPlayer(playerid, PartyInfo[partyid][pMember][3], TEAM_YELLOW);
		}
	}
}

RemoveMarkers(playerid)
{
 	foreach(new i : Player)
   	{
		SetPlayerMarkerForPlayer(playerid, i, TEAM_INVISIBLE);
   	}
}