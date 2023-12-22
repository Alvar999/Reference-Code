/* MatchingInfo GAMEPLAY_UI.PWN*/

#include <YSI\y_hooks>


hook OnPlayerConnect(playerid) {
	playerUsingMap{playerid}=
	playerUsingPartyBox{playerid}=
	playerUsingEndscreen{playerid}=
	playerUsingcircleshift{playerid}=false;
	
	// TextDrawKill
	gameplayPlayerTextDrawID[playerid][E_GAMEPLAY_PLAYER_KILL] = gameplayPlayerTextDrawCount[playerid];
	gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 317.600036, 291.808929, "_"); // YOU killed Hercrozis with Micro UZI
	PlayerTextDrawLetterSize(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 0.225997, 1.142042);
	PlayerTextDrawAlignment(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 2);
	PlayerTextDrawColor(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], -1);
	PlayerTextDrawSetShadow(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 0);
	PlayerTextDrawSetOutline(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 0);
	PlayerTextDrawBackgroundColor(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 51);
	PlayerTextDrawFont(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawSetProportional(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawSetSelectable(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]++], 0);
	
	gameplayPlayerTextDrawID[playerid][E_GAMEPLAY_PLAYER_KILL_COUNT] = gameplayPlayerTextDrawCount[playerid];
	gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 320.151123, 300.760131, "0 kills");
	PlayerTextDrawLetterSize(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 0.349999, 2.137598);
	PlayerTextDrawAlignment(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 2);
	PlayerTextDrawColor(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], -1069995009);
	PlayerTextDrawSetShadow(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 0);
	PlayerTextDrawSetOutline(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 0);
	PlayerTextDrawBackgroundColor(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 51);
	PlayerTextDrawFont(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawSetProportional(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawSetSelectable(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]++], 0);

	gameplayPlayerTextDrawID[playerid][E_GAMEPLAY_MATCH_COUNTDOWN] = gameplayPlayerTextDrawCount[playerid];
	gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 318.982330, 193.639953, "MATCH STARTS IN~n~1:00");
	PlayerTextDrawLetterSize(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 0.417600, 1.968357);
	PlayerTextDrawTextSize(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 658.178405, 640.142272);
	PlayerTextDrawAlignment(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 2);
	PlayerTextDrawColor(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], -1);
	PlayerTextDrawSetShadow(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 2);
	PlayerTextDrawSetOutline(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawBackgroundColor(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 51);
	PlayerTextDrawFont(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 2);
	PlayerTextDrawSetProportional(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawSetSelectable(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]++], 0);

	gameplayPlayerTextDrawID[playerid][E_GAMEPLAY_RIGHTKILL_COUNT] = gameplayPlayerTextDrawCount[playerid];
	gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 525.601196, 5.973323, "_0");
	PlayerTextDrawLetterSize(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 0.223599, 1.201776);
	PlayerTextDrawTextSize(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 572.800231, -45.297771);
	PlayerTextDrawAlignment(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawColor(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], -1);
	PlayerTextDrawUseBox(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], true);
	PlayerTextDrawBoxColor(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 64);
	PlayerTextDrawSetShadow(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 0);
	PlayerTextDrawSetOutline(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 0);
	PlayerTextDrawBackgroundColor(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 51);
	PlayerTextDrawFont(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawSetProportional(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawSetSelectable(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]++], 0);

	gameplayPlayerTextDrawID[playerid][E_GAMEPLAY_RIGHTKILL_TEXT] = gameplayPlayerTextDrawCount[playerid];
	gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]]= CreatePlayerTextDraw(playerid, 542.801452, 5.973321, "_KILLED");
	PlayerTextDrawLetterSize(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 0.223599, 1.201776);
	PlayerTextDrawTextSize(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 572.399536, -42.808876);
	PlayerTextDrawAlignment(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawColor(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], -1);
	PlayerTextDrawUseBox(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], true);
	PlayerTextDrawBoxColor(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 64);
	PlayerTextDrawSetShadow(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 0);
	PlayerTextDrawSetOutline(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 0);
	PlayerTextDrawBackgroundColor(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 51);
	PlayerTextDrawFont(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawSetProportional(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawSetSelectable(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]++], 0);
	return 1;
}

hook OnGameModeInit() {

	gameplayTextDrawID[E_GAMEPLAY_JUMP_TEXT] = gameplayTextDrawCount;
	gameplayTextDraw[gameplayTextDrawCount] = TextDrawCreate(318.799926, 383.786682, "Press 'F' to jump off the plane");
	TextDrawLetterSize(gameplayTextDraw[gameplayTextDrawCount], 0.449999, 1.600000);
	TextDrawAlignment(gameplayTextDraw[gameplayTextDrawCount], 2);
	TextDrawColor(gameplayTextDraw[gameplayTextDrawCount], -1);
	TextDrawSetShadow(gameplayTextDraw[gameplayTextDrawCount], 0);
	TextDrawSetOutline(gameplayTextDraw[gameplayTextDrawCount], 0);
	TextDrawBackgroundColor(gameplayTextDraw[gameplayTextDrawCount], 51);
	TextDrawFont(gameplayTextDraw[gameplayTextDrawCount], 2);
	TextDrawSetProportional(gameplayTextDraw[gameplayTextDrawCount], 1);
	TextDrawSetSelectable(gameplayTextDraw[gameplayTextDrawCount++], 0);

	gameplayTextDraw[gameplayTextDrawCount] = TextDrawCreate(503.998413, 72.675323, "mdl-2002:map_guide");
	TextDrawLetterSize(gameplayTextDraw[gameplayTextDrawCount], 0.071998, 0.199110);
	TextDrawTextSize(gameplayTextDraw[gameplayTextDrawCount], 100.000122, 40.320041);
	TextDrawAlignment(gameplayTextDraw[gameplayTextDrawCount], 1);
	TextDrawColor(gameplayTextDraw[gameplayTextDrawCount], -50);
	TextDrawFont(gameplayTextDraw[gameplayTextDrawCount], 4);
	TextDrawSetSelectable(gameplayTextDraw[gameplayTextDrawCount++], 0);
	
	// TextDrawEndScreen
	EndscreenTextDraw[EndscreenTextDrawCount] = TextDrawCreate(641.599975, 1.500000, "usebox");
	TextDrawLetterSize(EndscreenTextDraw[EndscreenTextDrawCount], 0.000000, 49.405799);
	TextDrawTextSize(EndscreenTextDraw[EndscreenTextDrawCount], -2.000000, 0.000000);
	TextDrawAlignment(EndscreenTextDraw[EndscreenTextDrawCount], 1);
	TextDrawColor(EndscreenTextDraw[EndscreenTextDrawCount], 0);
	TextDrawUseBox(EndscreenTextDraw[EndscreenTextDrawCount], true);
	TextDrawBoxColor(EndscreenTextDraw[EndscreenTextDrawCount], 128);
	TextDrawSetShadow(EndscreenTextDraw[EndscreenTextDrawCount], 0);
	TextDrawSetOutline(EndscreenTextDraw[EndscreenTextDrawCount], 0);
	TextDrawFont(EndscreenTextDraw[EndscreenTextDrawCount], 0);
	TextDrawSetSelectable(EndscreenTextDraw[EndscreenTextDrawCount++], 0);

	EndscreenTextDraw[EndscreenTextDrawCount] = TextDrawCreate(225.399581, 126.933250, "RANK POINTS~n~KILL POINTS~n~HIT POINTS");
	TextDrawLetterSize(EndscreenTextDraw[EndscreenTextDrawCount], 0.198399, 1.256533);
	TextDrawAlignment(EndscreenTextDraw[EndscreenTextDrawCount], 1);
	TextDrawColor(EndscreenTextDraw[EndscreenTextDrawCount], -1734500097);
	TextDrawSetShadow(EndscreenTextDraw[EndscreenTextDrawCount], 0);
	TextDrawSetOutline(EndscreenTextDraw[EndscreenTextDrawCount], 0);
	TextDrawBackgroundColor(EndscreenTextDraw[EndscreenTextDrawCount], 51);
	TextDrawFont(EndscreenTextDraw[EndscreenTextDrawCount], 2);
	TextDrawSetProportional(EndscreenTextDraw[EndscreenTextDrawCount], 1);
	TextDrawSetSelectable(EndscreenTextDraw[EndscreenTextDrawCount++], 0);

	EndscreenTextDraw[EndscreenTextDrawCount] = TextDrawCreate(191.000106, 104.039901, "players");
	TextDrawLetterSize(EndscreenTextDraw[EndscreenTextDrawCount], 0.201600, 1.226667);
	TextDrawAlignment(EndscreenTextDraw[EndscreenTextDrawCount], 1);
	TextDrawColor(EndscreenTextDraw[EndscreenTextDrawCount], -1734500097);
	TextDrawUseBox(EndscreenTextDraw[EndscreenTextDrawCount], true);
	TextDrawBoxColor(EndscreenTextDraw[EndscreenTextDrawCount], 0);
	TextDrawSetShadow(EndscreenTextDraw[EndscreenTextDrawCount], 0);
	TextDrawSetOutline(EndscreenTextDraw[EndscreenTextDrawCount], 0);
	TextDrawBackgroundColor(EndscreenTextDraw[EndscreenTextDrawCount], 51);
	TextDrawFont(EndscreenTextDraw[EndscreenTextDrawCount], 1);
	TextDrawSetProportional(EndscreenTextDraw[EndscreenTextDrawCount], 1);
	TextDrawSetSelectable(EndscreenTextDraw[EndscreenTextDrawCount++], 0);

	EndscreenTextDrawID[E_ENDSCREEN_EXIT] = EndscreenTextDrawCount;
	EndscreenTextDraw[EndscreenTextDrawCount] = TextDrawCreate(527.600158, 375.324279, "EXIT TO LOBBY");
	TextDrawLetterSize(EndscreenTextDraw[EndscreenTextDrawCount], 0.295998, 2.311820);
	TextDrawTextSize(EndscreenTextDraw[EndscreenTextDrawCount], 21.600000, 109.511199);
	TextDrawAlignment(EndscreenTextDraw[EndscreenTextDrawCount], 2);
	TextDrawColor(EndscreenTextDraw[EndscreenTextDrawCount], -1);
	TextDrawUseBox(EndscreenTextDraw[EndscreenTextDrawCount], true);
	TextDrawBoxColor(EndscreenTextDraw[EndscreenTextDrawCount], 80);
	TextDrawSetShadow(EndscreenTextDraw[EndscreenTextDrawCount], 0);
	TextDrawSetOutline(EndscreenTextDraw[EndscreenTextDrawCount], 0);
	TextDrawBackgroundColor(EndscreenTextDraw[EndscreenTextDrawCount], 80);
	TextDrawFont(EndscreenTextDraw[EndscreenTextDrawCount], 2);
	TextDrawSetProportional(EndscreenTextDraw[EndscreenTextDrawCount], 1);
	TextDrawSetSelectable(EndscreenTextDraw[EndscreenTextDrawCount], true);
	TextDrawSetSelectable(EndscreenTextDraw[EndscreenTextDrawCount++], 1);
	
	// TextDrawPartyBox
	for(new count=0; count != MAX_PARTY_MEMBER; count++) {
		partyBoxTextDrawID[E_PARTYBOX_TEXTDRAW_NAME][count] = partyBoxTextDrawCount;
		partyBoxTextDraw[partyBoxTextDrawCount] = TextDrawCreate(114.000000, 268.308898 - (17.417617 * float(count)), "usebox"); // - 17.417617
		TextDrawLetterSize(partyBoxTextDraw[partyBoxTextDrawCount], 0.000000, 0.955429);
		TextDrawTextSize(partyBoxTextDraw[partyBoxTextDrawCount], 26.799999, 0.000000);
		TextDrawAlignment(partyBoxTextDraw[partyBoxTextDrawCount], 1);
		TextDrawColor(partyBoxTextDraw[partyBoxTextDrawCount], 0);
		TextDrawUseBox(partyBoxTextDraw[partyBoxTextDrawCount], true);
		TextDrawBoxColor(partyBoxTextDraw[partyBoxTextDrawCount], 102);
		TextDrawSetShadow(partyBoxTextDraw[partyBoxTextDrawCount], 0);
		TextDrawSetOutline(partyBoxTextDraw[partyBoxTextDrawCount], 0);
		TextDrawFont(partyBoxTextDraw[partyBoxTextDrawCount], 0);
		TextDrawSetSelectable(partyBoxTextDraw[partyBoxTextDrawCount++], 0);
		
		partyBoxTextDrawID[E_PARTYBOX_TEXTDRAW_HEALTH][count] = partyBoxTextDrawCount;
		partyBoxTextDraw[partyBoxTextDrawCount] = TextDrawCreate(113.200057, 276.273315 - (17.417617 * float(count)), "usebox");
		TextDrawLetterSize(partyBoxTextDraw[partyBoxTextDrawCount], 0.000000, 0.039873);
		TextDrawTextSize(partyBoxTextDraw[partyBoxTextDrawCount], 27.199996, 0.000000);
		TextDrawAlignment(partyBoxTextDraw[partyBoxTextDrawCount], 1);
		TextDrawColor(partyBoxTextDraw[partyBoxTextDrawCount], 0);
		TextDrawUseBox(partyBoxTextDraw[partyBoxTextDrawCount], true);
		TextDrawBoxColor(partyBoxTextDraw[partyBoxTextDrawCount], 102);
		TextDrawSetShadow(partyBoxTextDraw[partyBoxTextDrawCount], 0);
		TextDrawSetOutline(partyBoxTextDraw[partyBoxTextDrawCount], 0);
		TextDrawFont(partyBoxTextDraw[partyBoxTextDrawCount], 0);
		TextDrawSetSelectable(partyBoxTextDraw[partyBoxTextDrawCount++], 0);
	}
	
	// TextDrawMap
	mapTextDraw[mapTextDrawCount] = TextDrawCreate(170.000000, 70.000000, "samaps:map");
	TextDrawLetterSize(mapTextDraw[mapTextDrawCount], 0.000000, 0.000000);
	TextDrawTextSize(mapTextDraw[mapTextDrawCount], 300.000000, 300.000000);
	TextDrawAlignment(mapTextDraw[mapTextDrawCount], 1);
	TextDrawColor(mapTextDraw[mapTextDrawCount], -10);
	TextDrawSetShadow(mapTextDraw[mapTextDrawCount], 0);
	TextDrawSetOutline(mapTextDraw[mapTextDrawCount], 0);
	TextDrawFont(mapTextDraw[mapTextDrawCount], 4);
	TextDrawSetSelectable(mapTextDraw[mapTextDrawCount++], 0);

	mapTextDraw[mapTextDrawCount] = TextDrawCreate(195.599914, 84.622207, "BaySide~n~Marina");
	TextDrawLetterSize(mapTextDraw[mapTextDrawCount], 0.253199, 1.057422);
	TextDrawAlignment(mapTextDraw[mapTextDrawCount], 2);
	TextDrawColor(mapTextDraw[mapTextDrawCount], -437918209);
	TextDrawUseBox(mapTextDraw[mapTextDrawCount], true);
	TextDrawBoxColor(mapTextDraw[mapTextDrawCount], 0);
	TextDrawSetShadow(mapTextDraw[mapTextDrawCount], 0);
	TextDrawSetOutline(mapTextDraw[mapTextDrawCount], 1);
	TextDrawBackgroundColor(mapTextDraw[mapTextDrawCount], 51);
	TextDrawFont(mapTextDraw[mapTextDrawCount], 2);
	TextDrawSetProportional(mapTextDraw[mapTextDrawCount], 1);
	TextDrawSetSelectable(mapTextDraw[mapTextDrawCount++], 0);

	mapTextDraw[mapTextDrawCount] = TextDrawCreate(205.000000, 188.662231, "SAN~n~Fierro");
	TextDrawLetterSize(mapTextDraw[mapTextDrawCount], 0.359598, 1.814043);
	TextDrawTextSize(mapTextDraw[mapTextDrawCount], -0.000003, 0.497774);
	TextDrawAlignment(mapTextDraw[mapTextDrawCount], 2);
	TextDrawColor(mapTextDraw[mapTextDrawCount], -437918209);
	TextDrawUseBox(mapTextDraw[mapTextDrawCount], true);
	TextDrawBoxColor(mapTextDraw[mapTextDrawCount], 0);
	TextDrawSetShadow(mapTextDraw[mapTextDrawCount], 0);
	TextDrawSetOutline(mapTextDraw[mapTextDrawCount], 1);
	TextDrawBackgroundColor(mapTextDraw[mapTextDrawCount], 51);
	TextDrawFont(mapTextDraw[mapTextDrawCount], 2);
	TextDrawSetProportional(mapTextDraw[mapTextDrawCount], 1);
	TextDrawSetSelectable(mapTextDraw[mapTextDrawCount++], 0);

	mapTextDraw[mapTextDrawCount] = TextDrawCreate(329.399841, 115.488891, "Area~n~51");
	TextDrawLetterSize(mapTextDraw[mapTextDrawCount], 0.225600, 0.947910);
	TextDrawAlignment(mapTextDraw[mapTextDrawCount], 2);
	TextDrawColor(mapTextDraw[mapTextDrawCount], -437918209);
	TextDrawUseBox(mapTextDraw[mapTextDrawCount], true);
	TextDrawBoxColor(mapTextDraw[mapTextDrawCount], 0);
	TextDrawSetShadow(mapTextDraw[mapTextDrawCount], 0);
	TextDrawSetOutline(mapTextDraw[mapTextDrawCount], 1);
	TextDrawBackgroundColor(mapTextDraw[mapTextDrawCount], 51);
	TextDrawFont(mapTextDraw[mapTextDrawCount], 2);
	TextDrawSetProportional(mapTextDraw[mapTextDrawCount], 1);
	TextDrawSetSelectable(mapTextDraw[mapTextDrawCount++], 0);

	mapTextDraw[mapTextDrawCount] = TextDrawCreate(404.399841, 284.239990, "Los Santos");
	TextDrawLetterSize(mapTextDraw[mapTextDrawCount], 0.359598, 1.814043);
	TextDrawTextSize(mapTextDraw[mapTextDrawCount], -0.000003, 0.497774);
	TextDrawAlignment(mapTextDraw[mapTextDrawCount], 2);
	TextDrawColor(mapTextDraw[mapTextDrawCount], -437918209);
	TextDrawSetShadow(mapTextDraw[mapTextDrawCount], 0);
	TextDrawSetOutline(mapTextDraw[mapTextDrawCount], 1);
	TextDrawBackgroundColor(mapTextDraw[mapTextDrawCount], 51);
	TextDrawFont(mapTextDraw[mapTextDrawCount], 2);
	TextDrawSetProportional(mapTextDraw[mapTextDrawCount], 1);
	TextDrawSetSelectable(mapTextDraw[mapTextDrawCount++], 0);

	mapTextDraw[mapTextDrawCount] = TextDrawCreate(411.799926, 119.479942, "Las Venturas");
	TextDrawLetterSize(mapTextDraw[mapTextDrawCount], 0.359598, 1.814043);
	TextDrawTextSize(mapTextDraw[mapTextDrawCount], -0.000003, 0.497774);
	TextDrawAlignment(mapTextDraw[mapTextDrawCount], 2);
	TextDrawColor(mapTextDraw[mapTextDrawCount], -437918209);
	TextDrawSetShadow(mapTextDraw[mapTextDrawCount], 0);
	TextDrawSetOutline(mapTextDraw[mapTextDrawCount], 1);
	TextDrawBackgroundColor(mapTextDraw[mapTextDrawCount], 51);
	TextDrawFont(mapTextDraw[mapTextDrawCount], 2);
	TextDrawSetProportional(mapTextDraw[mapTextDrawCount], 1);
	TextDrawSetSelectable(mapTextDraw[mapTextDrawCount++], 0);

	mapTextDraw[mapTextDrawCount] = TextDrawCreate(405.599822, 335.511047, "Airport");
	TextDrawLetterSize(mapTextDraw[mapTextDrawCount], 0.225600, 0.947910);
	TextDrawAlignment(mapTextDraw[mapTextDrawCount], 2);
	TextDrawColor(mapTextDraw[mapTextDrawCount], -437918209);
	TextDrawUseBox(mapTextDraw[mapTextDrawCount], true);
	TextDrawBoxColor(mapTextDraw[mapTextDrawCount], 0);
	TextDrawSetShadow(mapTextDraw[mapTextDrawCount], 0);
	TextDrawSetOutline(mapTextDraw[mapTextDrawCount], 1);
	TextDrawBackgroundColor(mapTextDraw[mapTextDrawCount], 51);
	TextDrawFont(mapTextDraw[mapTextDrawCount], 2);
	TextDrawSetProportional(mapTextDraw[mapTextDrawCount], 1);
	TextDrawSetSelectable(mapTextDraw[mapTextDrawCount++], 0);

	mapTextDraw[mapTextDrawCount] = TextDrawCreate(211.799850, 330.537750, "Angel~n~Pine");
	TextDrawLetterSize(mapTextDraw[mapTextDrawCount], 0.225600, 0.947910);
	TextDrawAlignment(mapTextDraw[mapTextDrawCount], 2);
	TextDrawColor(mapTextDraw[mapTextDrawCount], -437918209);
	TextDrawSetShadow(mapTextDraw[mapTextDrawCount], 0);
	TextDrawSetOutline(mapTextDraw[mapTextDrawCount], 1);
	TextDrawBackgroundColor(mapTextDraw[mapTextDrawCount], 51);
	TextDrawFont(mapTextDraw[mapTextDrawCount], 2);
	TextDrawSetProportional(mapTextDraw[mapTextDrawCount], 1);
	TextDrawSetSelectable(mapTextDraw[mapTextDrawCount++], 0);

	mapTextDraw[mapTextDrawCount] = TextDrawCreate(197.599929, 286.737823, "Mount~n~Chilliad");
	TextDrawLetterSize(mapTextDraw[mapTextDrawCount], 0.246000, 1.142042);
	TextDrawAlignment(mapTextDraw[mapTextDrawCount], 2);
	TextDrawColor(mapTextDraw[mapTextDrawCount], -437918209);
	TextDrawSetShadow(mapTextDraw[mapTextDrawCount], 0);
	TextDrawSetOutline(mapTextDraw[mapTextDrawCount], 1);
	TextDrawBackgroundColor(mapTextDraw[mapTextDrawCount], 51);
	TextDrawFont(mapTextDraw[mapTextDrawCount], 2);
	TextDrawSetProportional(mapTextDraw[mapTextDrawCount], 1);
	TextDrawSetSelectable(mapTextDraw[mapTextDrawCount++], 0);
	return 1;
}

hook OnPlayerDisconnect(playerid) {

	EndscreenPlayerTextDrawCount[playerid]=0;
	partyBoxPlayerTextDrawCount[playerid]=0;
	gameplayPlayerTextDrawCount[playerid]=0;
/*	for (new i; i < partyBoxPlayerTextDrawCount[playerid]; i++)
	{
		PlayerTextDrawDestroy(playerid, partyBoxPlayerTextDraw[playerid][i]);
	}
	partyBoxPlayerTextDrawCount[playerid] = 0;

	PlayerTextDrawDestroy(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]]);
	PlayerTextDrawDestroy(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawCount[playerid]]);*/
	
	return 1;
}

hook OnGameModeExit() {

	for (new i; i < gameplayTextDrawCount; i++)
 	{
  		TextDrawDestroy(gameplayTextDraw[i]);
    }
	gameplayTextDrawCount=0;
	
	for (new i; i < mapTextDrawCount; i++)
 	{
  		TextDrawDestroy(mapTextDraw[i]);
    }
	mapTextDrawCount=0;

	for (new i; i < partyBoxTextDrawCount; i++)
 	{
  		TextDrawDestroy(partyBoxTextDraw[i]);
    }
	partyBoxTextDrawCount=0;

	for (new i; i < EndscreenTextDrawCount; i++)
 	{
  		TextDrawDestroy(EndscreenTextDraw[i]);
    }
	EndscreenTextDrawCount=0;
	return 1;
}

public FCNPC_OnReachDestination(npcid) {
	//printf("NPC: %d reach destination", npcid);
	
	for(new i=0;i!=MAX_MATCHINGINFO;i++) if(MatchingInfo[i][m_EXIST]) {
		if(MatchingInfo[i][m_Pilot] == npcid) {
			foreach (new x : Player) {
				cmd_jump(x);
			}	
			break;
		}
	}
	return 1;
}

UpdatePlayerMap(playerid) { 

	if(playerUsingMap{playerid}) {
	
		new matchingid = PlayerJoined[playerid];
		if(matchingid != -1) {
		
			for (new i; i < mapPlayerTextDrawCount[playerid]; i++)
			{
				PlayerTextDrawDestroy(playerid, mapPlayerTextDraw[playerid][i]);
			}
			mapPlayerTextDrawCount[playerid] = 0;
			
			new Float:x, Float:y, Float:z, Float:icox, Float:icoy;
			
			new partyid = PlayerParty[playerid];
			if(partyid != NO_PARTY) {
		
				for (new i; i != MAX_PARTY_MEMBER; i++)
				{
					new temp_member = PartyInfo[partyid][pMember][i];
					if(temp_member != INVALID_PLAYER_ID) {
					
						if(PlayerInPlane[temp_member] != INVALID_VEHICLE_ID) {
							GetVehiclePos(MatchingInfo[matchingid][m_Plane], x, y, z);
							icox = (x / 20) + (314.0);
							icoy = (-y / 20) + (215.0);
							mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, icox, icoy, "hud:radar_airYard");
						}
						else {
							GetPlayerPos(temp_member, x, y, z);
							icox = (x / 20) + (314.0);
							icoy = (-y / 20) + (215.0);
							mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, icox, icoy, "hud:arrow");
						}
						PlayerTextDrawLetterSize(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], 0.000000, 0.000000);
						PlayerTextDrawTextSize(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], 10.000000, 10.000000);
						PlayerTextDrawAlignment(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], 1);
						PlayerTextDrawColor(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], -1);
						PlayerTextDrawSetShadow(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], 0);
						PlayerTextDrawSetOutline(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], 0);
						PlayerTextDrawFont(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], 4);
						PlayerTextDrawSetSelectable(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]++], 0);
						
						
						mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, icox + 5.0, icoy + 10.0, ReturnName(temp_member));
						PlayerTextDrawLetterSize(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], 0.161199, 0.918044);
						PlayerTextDrawAlignment(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], 1);
						
						switch(Party_GetPlayerPartySlot(temp_member)) {
							case 0: PlayerTextDrawColor(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], TEAM_RED);
							case 1: PlayerTextDrawColor(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], TEAM_GREEN);
							case 2: PlayerTextDrawColor(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], TEAM_BLUE);
							case 3: PlayerTextDrawColor(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], TEAM_YELLOW);
							default: PlayerTextDrawColor(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], TEAM_RED);
						}
						PlayerTextDrawSetShadow(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], 0);
						PlayerTextDrawSetOutline(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], 1);
						PlayerTextDrawBackgroundColor(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], 51);
						PlayerTextDrawFont(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], 1);
						PlayerTextDrawSetProportional(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], 1);
						PlayerTextDrawSetSelectable(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]++], 0);
					}
				}
			}
			else {
			
				for (new i; i < mapPlayerTextDrawCount[playerid]; i++)
				{
					PlayerTextDrawDestroy(playerid, mapPlayerTextDraw[playerid][i]);
				}
				mapPlayerTextDrawCount[playerid] = 0;
				
				if(PlayerInPlane[playerid] != INVALID_VEHICLE_ID) {
					GetVehiclePos(MatchingInfo[matchingid][m_Plane], x, y, z);
					icox = (x / 20) + (314.0);
					icoy = (-y / 20) + (215.0);
					mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, icox, icoy, "hud:radar_airYard");
				}
				else {
					GetPlayerPos(playerid, x, y, z);
					icox = (x / 20) + (314.0);
					icoy = (-y / 20) + (215.0);
					mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, icox, icoy, "hud:arrow");
				}

				PlayerTextDrawLetterSize(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], 0.000000, 0.000000);
				PlayerTextDrawTextSize(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], 10.000000, 10.000000);
				PlayerTextDrawAlignment(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], 1);
				PlayerTextDrawColor(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], -1);
				PlayerTextDrawSetShadow(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], 0);
				PlayerTextDrawSetOutline(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], 0);
				PlayerTextDrawFont(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], 4);
				PlayerTextDrawSetSelectable(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]++], 0);
				
				mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, icox + 5.0, icoy + 10.0, ReturnName(playerid));
				PlayerTextDrawLetterSize(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], 0.161199, 0.918044);
				PlayerTextDrawAlignment(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], 1);
				PlayerTextDrawColor(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], -1);
				PlayerTextDrawSetShadow(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], 0);
				PlayerTextDrawSetOutline(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], 1);
				PlayerTextDrawBackgroundColor(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], 51);
				PlayerTextDrawFont(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], 1);
				PlayerTextDrawSetProportional(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]], 1);
				PlayerTextDrawSetSelectable(playerid, mapPlayerTextDraw[playerid][mapPlayerTextDrawCount[playerid]++], 0);
			}
		
			/*if(MatchingInfo[matchingid][m_STATE] == STATE_WHITE || MatchingInfo[matchingid][m_STATE] == STATE_BLUE) {
				if(TD_IsCircleCreated(playerid)) {
					TD_DestroyCircle(playerid);
				}
				TD_CreateCircle(playerid, ".", 0xFFFFFFFF, 0x2E64FEFF, (MatchingInfo[matchingid][m_WX] / 20.0) + (314.0), (-MatchingInfo[matchingid][m_WY] / 20.0) + (235.0), MatchingInfo[matchingid][m_WRad]/20.0, 5.0, (MatchingInfo[matchingid][m_BX] / 20.0) + (314.0), (-MatchingInfo[matchingid][m_BY] / 20.0) + (235.0), MatchingInfo[matchingid][m_BRad]/20.0, 5.0);
			}*/
		
			for (new i; i < mapPlayerTextDrawCount[playerid]; i++)
			{
				PlayerTextDrawShow(playerid, mapPlayerTextDraw[playerid][i]);
			}
		}
	}	
	return 1;
}

UpdatePlayerPartyBox(playerid) {

	for (new i; i < partyBoxTextDrawCount; i++)
 	{
  		TextDrawHideForPlayer(playerid, partyBoxTextDraw[i]);
    }
	for (new i; i < partyBoxPlayerTextDrawCount[playerid]; i++)
	{
		PlayerTextDrawDestroy(playerid, partyBoxPlayerTextDraw[playerid][i]);
	}
	partyBoxPlayerTextDrawCount[playerid] = 0;
	playerUsingPartyBox{playerid}=false;
	
	if(!playerUsingMap{playerid} && Lobby_IsPlayerInGame(playerid)) {
		new partyid = PlayerParty[playerid];
		if(partyid != NO_PARTY && Party_CountMember(partyid) >= 2) {
		
			new count;
			for (new x=MAX_PARTY_MEMBER-1;x>=0;x--)
			{
				new temp_member = PartyInfo[partyid][pMember][x];
				if(temp_member != INVALID_PLAYER_ID) {
				
					new Float:hp, color, alpha;
					GetPlayerHealth(temp_member, hp);
					calculateHealthBox(hp, color, alpha);
					
					partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 36.000049, 266.311431 - (17.417617 * float(count)), ReturnName(temp_member));
					PlayerTextDrawLetterSize(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 0.152796, 0.878220);
					PlayerTextDrawAlignment(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 1);
					if(!IsPlayerDeath(temp_member))
						PlayerTextDrawColor(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], -1);
					else
						PlayerTextDrawColor(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 0x888888FF);

					PlayerTextDrawUseBox(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], true);
					PlayerTextDrawBoxColor(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 0);
					PlayerTextDrawSetShadow(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 0);
					PlayerTextDrawSetOutline(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 0);
					PlayerTextDrawBackgroundColor(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 51);
					PlayerTextDrawFont(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 1);
					PlayerTextDrawSetProportional(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 1);
					PlayerTextDrawSetSelectable(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]++], 0);

					partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, hp, 276.277770 - (17.417617 * float(count)), "usebox"); // เลือด
					PlayerTextDrawLetterSize(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 0.000000, 0.039872);
					PlayerTextDrawTextSize(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 27.199996, 0.000000);
					PlayerTextDrawAlignment(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 1);
					PlayerTextDrawColor(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 0);
					PlayerTextDrawUseBox(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], true);
					if(!IsPlayerDeath(temp_member)) {
						PlayerTextDrawBoxColor(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], CreateRGB(255, color, color, alpha));
					}
					else {
						PlayerTextDrawBoxColor(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], CreateRGB(255, color, color, 100));
					}
					PlayerTextDrawSetShadow(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 0);
					PlayerTextDrawSetOutline(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 0);
					PlayerTextDrawFont(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 0);
					PlayerTextDrawSetSelectable(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]++], 0);
					
					partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 36.800003, 268.806640 - (17.417617 * float(count)), "usebox"); // กล่องสี
					PlayerTextDrawLetterSize(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 0.000000, 0.402345);
					PlayerTextDrawTextSize(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 27.199998, 0.000000);
					PlayerTextDrawAlignment(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 1);
			
					PlayerTextDrawUseBox(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], true);
					switch(x) {
						case 0: PlayerTextDrawBoxColor(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], TEAM_RED);
						case 1: PlayerTextDrawBoxColor(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], TEAM_GREEN);
						case 2: PlayerTextDrawBoxColor(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], TEAM_BLUE);
						case 3: PlayerTextDrawBoxColor(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], TEAM_YELLOW);
						default: PlayerTextDrawBoxColor(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], TEAM_RED);
					}
					
					PlayerTextDrawSetShadow(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 0);
					PlayerTextDrawSetOutline(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 0);
					PlayerTextDrawFont(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 0);
					PlayerTextDrawSetSelectable(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]++], 0);
					
					new number[16];
					valstr(number, x + 1);
					partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 31.600019, 265.315551 - (17.417617 * float(count)), number); // หมายเลข
					PlayerTextDrawLetterSize(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 0.232396, 1.052440);
					PlayerTextDrawAlignment(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 2);
					if(!IsPlayerDeath(temp_member))
						PlayerTextDrawColor(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], -1);
					else
						PlayerTextDrawColor(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 0x888888FF);
					PlayerTextDrawUseBox(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], true);
					PlayerTextDrawBoxColor(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 0);
					PlayerTextDrawSetShadow(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 0);
					PlayerTextDrawSetOutline(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 0);
					PlayerTextDrawBackgroundColor(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 51);
					PlayerTextDrawFont(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 1);
					PlayerTextDrawSetProportional(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]], 1);
					PlayerTextDrawSetSelectable(playerid, partyBoxPlayerTextDraw[playerid][partyBoxPlayerTextDrawCount[playerid]++], 0);
				
					TextDrawShowForPlayer(playerid, partyBoxTextDraw[partyBoxTextDrawID[E_PARTYBOX_TEXTDRAW_NAME][count]]);
					TextDrawShowForPlayer(playerid, partyBoxTextDraw[partyBoxTextDrawID[E_PARTYBOX_TEXTDRAW_HEALTH][count]]);
					
					count++;
				}
			}
			
			for (new i; i < partyBoxPlayerTextDrawCount[playerid]; i++)
			{
				PlayerTextDrawShow(playerid, partyBoxPlayerTextDraw[playerid][i]);
			}
			playerUsingPartyBox{playerid}=true;
		}
	}
	return 1;
}

static calculateHealthBox(&Float:hp, &color, &alpha) {
	color = 255;
	alpha = 128;
	
	if(hp < 100) {
		alpha = 255;
		if(hp < 70) {
			color = floatround(hp * 255 / 100.0);
			if(color > 255) {
				color = 255;
			}
			else if(color <= 0) {
				color = 0;
			}
		}
	}
	
	hp *= 112.600097 / 100.0;
	if(hp < 30.600069) hp = 30.600069;
	if(hp > 112.600097) hp = 112.600097;
	
	return 1;
}

// Party ตายไม่หมดแสดงแค่ชื่อ
HideMatchFinished(playerid) {
	for (new i; i < EndscreenTextDrawCount; i++)
	{
		TextDrawHideForPlayer(playerid, EndscreenTextDraw[i]);
	}
	for (new i; i < EndscreenPlayerTextDrawCount[playerid]; i++)
	{
		PlayerTextDrawDestroy(playerid, EndscreenPlayerTextDraw[playerid][i]);
	}
	EndscreenPlayerTextDrawCount[playerid]=0;
}

ShowMatchFinished(playerid, HeaderText[], KillText[], RankText[], rankpoint, killpoint, hitpoint, BigRankText[]) {

	HideMatchFinished(playerid);
	
	new string[64];

	EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 11.999979, 17.919965, ReturnName(playerid));
	PlayerTextDrawLetterSize(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 0.469599, 2.580621);
	PlayerTextDrawTextSize(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 383.199920, -12.942218);
	PlayerTextDrawAlignment(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawColor(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], -1);
	PlayerTextDrawSetShadow(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 0);
	PlayerTextDrawSetOutline(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 0);
	PlayerTextDrawBackgroundColor(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 51);
	PlayerTextDrawFont(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawSetProportional(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawSetSelectable(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]++], 0);

	EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 12.999979, 47.293273, HeaderText);
	PlayerTextDrawLetterSize(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 0.604399, 4.118759);
	PlayerTextDrawTextSize(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 455.199920, -16.924448);
	PlayerTextDrawAlignment(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawColor(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], -4062977);
	PlayerTextDrawSetShadow(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 0);
	PlayerTextDrawSetOutline(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 0);
	PlayerTextDrawBackgroundColor(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 51);
	PlayerTextDrawFont(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawSetProportional(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawSetSelectable(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]++], 0);
	
	EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 139.199844, 94.500000, KillText);
	PlayerTextDrawLetterSize(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 0.405600, 2.570662);
	PlayerTextDrawTextSize(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 201.999984, -46.791152);
	PlayerTextDrawAlignment(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawColor(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], -1);
	PlayerTextDrawSetShadow(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 0);
	PlayerTextDrawSetOutline(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 0);
	PlayerTextDrawBackgroundColor(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 51);
	PlayerTextDrawFont(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawSetProportional(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawSetSelectable(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]++], 0);
	
	EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 72.199943, 94.500000, RankText);
	PlayerTextDrawLetterSize(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 0.405600, 2.570662);
	PlayerTextDrawTextSize(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 119.199958, -143.857833);
	PlayerTextDrawAlignment(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 2);
	PlayerTextDrawColor(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], -1);
	PlayerTextDrawSetShadow(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 0);
	PlayerTextDrawSetOutline(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 0);
	PlayerTextDrawBackgroundColor(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 51);
	PlayerTextDrawFont(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawSetProportional(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawSetSelectable(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]++], 0);

	valstr(string, rankpoint); 
	EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 334.399719, 126.933319, string);
	PlayerTextDrawLetterSize(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 0.273999, 1.390933);
	PlayerTextDrawAlignment(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 3);
	PlayerTextDrawColor(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], -1);
	PlayerTextDrawSetShadow(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 0);
	PlayerTextDrawSetOutline(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 0);
	PlayerTextDrawBackgroundColor(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 51);
	PlayerTextDrawFont(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 2);
	PlayerTextDrawSetProportional(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawSetSelectable(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]++], 0);

	valstr(string, killpoint); 
	EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 334.399719, 138.386581, string);
	PlayerTextDrawLetterSize(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 0.273999, 1.390933);
	PlayerTextDrawAlignment(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 3);
	PlayerTextDrawColor(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], -1);
	PlayerTextDrawSetShadow(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 0);
	PlayerTextDrawSetOutline(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 0);
	PlayerTextDrawBackgroundColor(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 51);
	PlayerTextDrawFont(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 2);
	PlayerTextDrawSetProportional(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawSetSelectable(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]++], 0);
	
	valstr(string, hitpoint); 
	EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 334.399719, 149.342163, string);
	PlayerTextDrawLetterSize(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 0.273999, 1.390933);
	PlayerTextDrawAlignment(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 3);
	PlayerTextDrawColor(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], -1);
	PlayerTextDrawSetShadow(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 0);
	PlayerTextDrawSetOutline(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 0);
	PlayerTextDrawBackgroundColor(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 51);
	PlayerTextDrawFont(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 2);
	PlayerTextDrawSetProportional(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawSetSelectable(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]++], 0);

	format(string, sizeof(string), "REWARD_____%d", rankpoint + killpoint+ hitpoint);
	EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 225.399581, 94.500000, string);
	PlayerTextDrawLetterSize(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 0.405600, 2.570662);
	PlayerTextDrawTextSize(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 201.999984, -46.791152);
	PlayerTextDrawAlignment(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawColor(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], -1);
	PlayerTextDrawSetShadow(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 0);
	PlayerTextDrawSetOutline(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 0);
	PlayerTextDrawBackgroundColor(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 51);
	PlayerTextDrawFont(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawSetProportional(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawSetSelectable(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]++], 0);	

	EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 485.600311, 3.493263, BigRankText); // "~y~#0~w~/0"
	PlayerTextDrawLetterSize(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 0.990399, 6.109870);
	PlayerTextDrawTextSize(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 601.999816, 10.924448);
	PlayerTextDrawAlignment(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawColor(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], -4062977);
	PlayerTextDrawSetShadow(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 0);
	PlayerTextDrawSetOutline(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 0);
	PlayerTextDrawBackgroundColor(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 51);
	PlayerTextDrawFont(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawSetProportional(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]], 1);
	PlayerTextDrawSetSelectable(playerid, EndscreenPlayerTextDraw[playerid][EndscreenPlayerTextDrawCount[playerid]++], 0);
	
	for (new i; i < EndscreenTextDrawCount; i++)
	{
		TextDrawShowForPlayer(playerid, EndscreenTextDraw[i]);
	}
	for (new i; i < EndscreenPlayerTextDrawCount[playerid]; i++)
	{
		PlayerTextDrawShow(playerid, EndscreenPlayerTextDraw[playerid][i]);
	}
	playerUsingEndscreen{playerid}=true;
	
	SelectTextDraw(playerid, 0xD4AC0DFF);
	
	return 1;
}

ShowPlayerKDText(killerid, playerid, reason) {
	new str[128];
	
	if(killerid != INVALID_PLAYER_ID) {
		format(str, sizeof(str), "YOU killed %s with %s", ReturnName(playerid), ReturnWeaponName(reason));
		PlayerTextDrawSetString(killerid, gameplayPlayerTextDraw[killerid][gameplayPlayerTextDrawID[killerid][E_GAMEPLAY_PLAYER_KILL]], str);
		PlayerTextDrawShow(killerid, gameplayPlayerTextDraw[killerid][gameplayPlayerTextDrawID[killerid][E_GAMEPLAY_PLAYER_KILL]]);

		format(str, sizeof(str), "%d_kills", GetPlayerKill(killerid));
		PlayerTextDrawSetString(killerid, gameplayPlayerTextDraw[killerid][gameplayPlayerTextDrawID[killerid][E_GAMEPLAY_PLAYER_KILL_COUNT]], str);
		PlayerTextDrawShow(killerid, gameplayPlayerTextDraw[killerid][gameplayPlayerTextDrawID[killerid][E_GAMEPLAY_PLAYER_KILL_COUNT]]);
	}
	format(str, sizeof(str), "YOU died %s", ReturnWeaponName(reason));
	PlayerTextDrawSetString(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawID[playerid][E_GAMEPLAY_PLAYER_KILL]], str);
	PlayerTextDrawShow(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawID[playerid][E_GAMEPLAY_PLAYER_KILL]]);
	
	SetTimerEx("HidePlayerKDText", 8000, false, "ii", killerid, playerid);
}

forward HidePlayerKDText(killerid, playerid);
public HidePlayerKDText(killerid, playerid) {
	PlayerTextDrawHide(playerid, gameplayPlayerTextDraw[playerid][gameplayPlayerTextDrawID[playerid][E_GAMEPLAY_PLAYER_KILL]]);
	if(killerid != INVALID_PLAYER_ID) {
		PlayerTextDrawHide(killerid, gameplayPlayerTextDraw[killerid][gameplayPlayerTextDrawID[killerid][E_GAMEPLAY_PLAYER_KILL]]);
		PlayerTextDrawHide(killerid, gameplayPlayerTextDraw[killerid][gameplayPlayerTextDrawID[killerid][E_GAMEPLAY_PLAYER_KILL_COUNT]]);
	}
}

UpdateUI_CurrentPlayer(match_id, match_player, match_text[] = "_ALIVE") {
	new str[64];
	
	format(str, sizeof(str), "%s%d", match_player > 99 ? ("") : ("_"), match_player);
	
	if(!gameplayTextDrawID[E_GAMEPLAY_RIGHTUPPER_COUNT][match_id]) {
		gameplayTextDrawID[E_GAMEPLAY_RIGHTUPPER_COUNT][match_id] = gameplayTextDrawCount;
		gameplayTextDraw[gameplayTextDrawCount] = TextDrawCreate(584.801147, 5.973323, str);
		TextDrawLetterSize(gameplayTextDraw[gameplayTextDrawCount], 0.223599, 1.201776);
		TextDrawTextSize(gameplayTextDraw[gameplayTextDrawCount], 630.800231, -40.319995);
		TextDrawAlignment(gameplayTextDraw[gameplayTextDrawCount], 1);
		TextDrawColor(gameplayTextDraw[gameplayTextDrawCount], -1);
		TextDrawUseBox(gameplayTextDraw[gameplayTextDrawCount], true);
		TextDrawBoxColor(gameplayTextDraw[gameplayTextDrawCount], 64);
		TextDrawSetShadow(gameplayTextDraw[gameplayTextDrawCount], 0);
		TextDrawSetOutline(gameplayTextDraw[gameplayTextDrawCount], 0);
		TextDrawBackgroundColor(gameplayTextDraw[gameplayTextDrawCount], 51);
		TextDrawFont(gameplayTextDraw[gameplayTextDrawCount], 1);
		TextDrawSetProportional(gameplayTextDraw[gameplayTextDrawCount], 1);
		TextDrawSetSelectable(gameplayTextDraw[gameplayTextDrawCount++], 0);
	}
	else {
		TextDrawSetString(gameplayTextDraw[gameplayTextDrawID[E_GAMEPLAY_RIGHTUPPER_COUNT][match_id]], str);
	}
	
	if(!gameplayTextDrawID[E_GAMEPLAY_RIGHTUPPER_TEXT][match_id]) {
		gameplayTextDrawID[E_GAMEPLAY_RIGHTUPPER_TEXT][match_id] = gameplayTextDrawCount;
		gameplayTextDraw[gameplayTextDrawCount] = TextDrawCreate(602.000671, 5.973322, match_text);
		TextDrawLetterSize(gameplayTextDraw[gameplayTextDrawCount], 0.223599, 1.201776);
		TextDrawTextSize(gameplayTextDraw[gameplayTextDrawCount], 630.800231, -40.319995);
		TextDrawAlignment(gameplayTextDraw[gameplayTextDrawCount], 1);
		TextDrawColor(gameplayTextDraw[gameplayTextDrawCount], -1);
		TextDrawUseBox(gameplayTextDraw[gameplayTextDrawCount], true);
		TextDrawBoxColor(gameplayTextDraw[gameplayTextDrawCount], 64);
		TextDrawSetShadow(gameplayTextDraw[gameplayTextDrawCount], 0);
		TextDrawSetOutline(gameplayTextDraw[gameplayTextDrawCount], 0);
		TextDrawBackgroundColor(gameplayTextDraw[gameplayTextDrawCount], 51);
		TextDrawFont(gameplayTextDraw[gameplayTextDrawCount], 1);
		TextDrawSetProportional(gameplayTextDraw[gameplayTextDrawCount], 1);
		TextDrawSetSelectable(gameplayTextDraw[gameplayTextDrawCount++], 0);
	}
	else {
		TextDrawSetString(gameplayTextDraw[gameplayTextDrawID[E_GAMEPLAY_RIGHTUPPER_TEXT][match_id]], match_text);
	}
}

HideUI_CurrentPlayer(playerid, matchingid) {
	if(matchingid != -1 && matchingid < MAX_MATCHINGINFO) {
		TextDrawHideForPlayer(playerid, gameplayTextDraw[gameplayTextDrawID[E_GAMEPLAY_RIGHTUPPER_COUNT][matchingid]]);
		TextDrawHideForPlayer(playerid, gameplayTextDraw[gameplayTextDrawID[E_GAMEPLAY_RIGHTUPPER_TEXT][matchingid]]);
	}
}

ShowPlayerCircleShift(playerid) {
	playerUsingcircleshift{playerid}=true;
	UpdatePlayerCircleShift(playerid);
}

UpdatePlayerCircleShift(playerid) {

	for (new i; i < circleshiftPlayerTextDrawCount[playerid]; i++)
	{
		PlayerTextDrawHide(playerid, circleshiftPlayerTextDraw[playerid][i]);
	}
		
	new joined = PlayerJoined[playerid];
	if(joined != -1 && !playerUsingMap{playerid} && (MatchingInfo[joined][m_STATE] == STATE_BLUE || MatchingInfo[joined][m_STATE] == STATE_WHITE)) {
		if(circleshiftPlayerTextDrawCount[playerid] == 0) {
			circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 112.799987, 308.628845, "_G");
			PlayerTextDrawLetterSize(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 0.000000, 0.039999);
			PlayerTextDrawTextSize(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 26.399997, 60.000000);
			PlayerTextDrawAlignment(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 1);
			PlayerTextDrawColor(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 0);
			PlayerTextDrawUseBox(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], true);
			PlayerTextDrawBoxColor(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 80);
			PlayerTextDrawSetShadow(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 0);
			PlayerTextDrawSetOutline(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 0);
			PlayerTextDrawFont(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 1);
			PlayerTextDrawSetSelectable(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]++], 0);

			circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 116.399978, 308.628845, "_W");
			PlayerTextDrawLetterSize(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 0.000000, 0.000000);
			PlayerTextDrawTextSize(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 109.600021, 60.000000);
			PlayerTextDrawAlignment(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 1);
			PlayerTextDrawColor(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 0);
			PlayerTextDrawUseBox(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], true);
			PlayerTextDrawBoxColor(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], -1);
			PlayerTextDrawSetShadow(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 0);
			PlayerTextDrawSetOutline(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 0);
			PlayerTextDrawFont(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 1);
			PlayerTextDrawSetSelectable(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]++], 0);

			circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 33.199958, 308.628875, "_B");
			PlayerTextDrawLetterSize(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 0.000000, 0.000000);
			PlayerTextDrawTextSize(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 26.399997, 60.000000);
			PlayerTextDrawAlignment(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 1);
			PlayerTextDrawColor(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 0);
			PlayerTextDrawUseBox(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], true);
			PlayerTextDrawBoxColor(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 20700927);
			PlayerTextDrawSetShadow(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 0);
			PlayerTextDrawSetOutline(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 0);
			PlayerTextDrawFont(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 1);
			PlayerTextDrawSetSelectable(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]++], 0);

			circleshiftPlayerTextDrawID[playerid][E_CIRCLESHIFT_BLUE] = circleshiftPlayerTextDrawCount[playerid];
			circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 33.200077, 308.628845, "_R");
			PlayerTextDrawLetterSize(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 0.000000, 0.000000);
			PlayerTextDrawTextSize(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 30.000005, 60.000000);
			PlayerTextDrawAlignment(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 1);
			PlayerTextDrawColor(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 0);
			PlayerTextDrawUseBox(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], true);
			PlayerTextDrawBoxColor(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 778370815);
			PlayerTextDrawSetShadow(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 0);
			PlayerTextDrawSetOutline(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 0);
			PlayerTextDrawFont(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 1);
			PlayerTextDrawSetSelectable(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]++], 0);
			
			circleshiftPlayerTextDrawID[playerid][E_CIRCLESHIFT_TIME] = circleshiftPlayerTextDrawCount[playerid];
			circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 26.800024, 293.191101, "!");
			PlayerTextDrawLetterSize(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 0.159997, 1.052443);
			PlayerTextDrawAlignment(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 1);
			PlayerTextDrawColor(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], -1);
			PlayerTextDrawSetShadow(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 0);
			PlayerTextDrawSetOutline(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 0);
			PlayerTextDrawBackgroundColor(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 51);
			PlayerTextDrawFont(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 2);
			PlayerTextDrawSetProportional(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 1);
			PlayerTextDrawSetSelectable(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]++], 0);
		
			circleshiftPlayerTextDrawID[playerid][E_CIRCLESHIFT_RUN] = circleshiftPlayerTextDrawCount[playerid];
			circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 29.599977, 303.146575, "mdl-2001:runing_pin");
			PlayerTextDrawLetterSize(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 0.071998, 0.199110);
			PlayerTextDrawTextSize(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 4.000001, 8.959998);
			PlayerTextDrawAlignment(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 1);
			PlayerTextDrawColor(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], -1);
			PlayerTextDrawSetShadow(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 0);
			PlayerTextDrawSetOutline(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]], 0);
			PlayerTextDrawSetSelectable(playerid, circleshiftPlayerTextDraw[playerid][circleshiftPlayerTextDrawCount[playerid]++], 0);
		}

		new temp_td;
		new Float:PPx,Float:PPy,Float:PPz;	
		GetPlayerPos(playerid, PPx, PPy, PPz);
	
		if(MatchingInfo[joined][m_STATE] == STATE_BLUE) {
		
			temp_td = circleshiftPlayerTextDrawID[playerid][E_CIRCLESHIFT_TIME];
			PlayerTextDrawColor(playerid, circleshiftPlayerTextDraw[playerid][temp_td], (MatchingInfo[joined][m_Timer]%2) ? -16776961 : -1);
			PlayerTextDrawSetString(playerid, circleshiftPlayerTextDraw[playerid][temp_td], "!");
		
		}
		else if(MatchingInfo[joined][m_STATE] == STATE_WHITE) {
			new str[64], minutes, seconds = MatchingInfo[joined][m_Timer];
			
			ConvertTime(seconds, minutes);
			
			if(minutes) 
				format(str, 16, "%d:%02d", minutes, seconds);
			else 
				format(str, 16, "%d", seconds);
				
			temp_td = circleshiftPlayerTextDrawID[playerid][E_CIRCLESHIFT_TIME];
			PlayerTextDrawColor(playerid, circleshiftPlayerTextDraw[playerid][temp_td], -1);
			PlayerTextDrawSetString(playerid, circleshiftPlayerTextDraw[playerid][temp_td], str);
		}
		else {
			temp_td = circleshiftPlayerTextDrawID[playerid][E_CIRCLESHIFT_TIME];
			PlayerTextDrawSetString(playerid, circleshiftPlayerTextDraw[playerid][temp_td], "_");
		}
		new Float:cal_run, Float:cal_pin, Float:BaseSize;
		new temp_shrink_id = MatchingInfo[joined][m_circleID];
		if(temp_shrink_id < 1) {
			BaseSize = MAP_SIZE_LIMIT;
		}
		else {
			BaseSize = CircleData[temp_shrink_id-1][CIRCLEDATA_SIZE];
		}
		cal_run = 33.200077 + (float(CircleData[temp_shrink_id][CIRCLEDATA_BLUETIME]-MatchingInfo[joined][m_Timer]) * 79.599994 / float(CircleData[temp_shrink_id][CIRCLEDATA_BLUETIME]));
		
		if(cal_run > 112.800071) {
			cal_run = 112.800071;
		}
		else if(cal_run < 33.200077) {
			cal_run = 33.200077;
		}
		
		new Float: tempWDistance = GetPlayerDistanceFromPoint(playerid, MatchingInfo[joined][m_WX], MatchingInfo[joined][m_WY], PPz);

		if(tempWDistance < MatchingInfo[joined][m_WRad]) {
			// อยู่ในวงขาว
			cal_pin = 108.800041;
		}
		else {
			new Float: PlayerToWhiteDis = tempWDistance - MatchingInfo[joined][m_WRad];
			cal_pin = 29.599977 + ((BaseSize-PlayerToWhiteDis) * 79.200064 / BaseSize);
		}
		
		new pincolor = -1;
		
		if(cal_pin > 108.800041) {
			cal_pin = 108.800041;
		}
		else if(cal_pin < 29.599977) {
			cal_pin = 28.599977;
			
			pincolor = (MatchingInfo[joined][m_Timer]%2) ? -16776961 : -1;
		}
		// ต่างกัน 3.6001
		temp_td = circleshiftPlayerTextDrawID[playerid][E_CIRCLESHIFT_RUN];
		PlayerTextDrawDestroy(playerid, circleshiftPlayerTextDraw[playerid][temp_td]);
		circleshiftPlayerTextDraw[playerid][temp_td] = CreatePlayerTextDraw(playerid, cal_pin, 303.146575, "mdl-2001:runing_pin"); // ต่ำสุด 29.599977 มากสุด 108.800041
		PlayerTextDrawLetterSize(playerid, circleshiftPlayerTextDraw[playerid][temp_td], 0.071998, 0.199110);
		PlayerTextDrawTextSize(playerid, circleshiftPlayerTextDraw[playerid][temp_td], 4.000001, 8.959998);
		PlayerTextDrawAlignment(playerid, circleshiftPlayerTextDraw[playerid][temp_td], 1);
		PlayerTextDrawColor(playerid, circleshiftPlayerTextDraw[playerid][temp_td], pincolor);
		PlayerTextDrawSetShadow(playerid, circleshiftPlayerTextDraw[playerid][temp_td], 0);
		PlayerTextDrawSetOutline(playerid, circleshiftPlayerTextDraw[playerid][temp_td], 0);
		PlayerTextDrawFont(playerid, circleshiftPlayerTextDraw[playerid][temp_td], 4);
		
		if(MatchingInfo[joined][m_STATE] != STATE_BLUE) {
			temp_td = circleshiftPlayerTextDrawID[playerid][E_CIRCLESHIFT_BLUE];
			PlayerTextDrawDestroy(playerid, circleshiftPlayerTextDraw[playerid][temp_td]);
			circleshiftPlayerTextDraw[playerid][temp_td] = CreatePlayerTextDraw(playerid,  33.200077, 308.628845, "_R"); // ต่ำสุด 33.200077 มากสุด 112.800071
			PlayerTextDrawLetterSize(playerid, circleshiftPlayerTextDraw[playerid][temp_td], 0.000000, 0.000000);
			PlayerTextDrawTextSize(playerid, circleshiftPlayerTextDraw[playerid][temp_td], 30.000005, 60.000000);
			PlayerTextDrawAlignment(playerid, circleshiftPlayerTextDraw[playerid][temp_td], 1);
			PlayerTextDrawColor(playerid, circleshiftPlayerTextDraw[playerid][temp_td], 0);
			PlayerTextDrawUseBox(playerid, circleshiftPlayerTextDraw[playerid][temp_td], true);
			PlayerTextDrawBoxColor(playerid, circleshiftPlayerTextDraw[playerid][temp_td], 778370815);
			PlayerTextDrawSetShadow(playerid, circleshiftPlayerTextDraw[playerid][temp_td], 0);
			PlayerTextDrawSetOutline(playerid, circleshiftPlayerTextDraw[playerid][temp_td], 0);
			PlayerTextDrawFont(playerid, circleshiftPlayerTextDraw[playerid][temp_td], 1);
		}
		else {
			temp_td = circleshiftPlayerTextDrawID[playerid][E_CIRCLESHIFT_BLUE];
			PlayerTextDrawDestroy(playerid, circleshiftPlayerTextDraw[playerid][temp_td]);
			circleshiftPlayerTextDraw[playerid][temp_td] = CreatePlayerTextDraw(playerid, cal_run, 308.628845, "_R"); // ต่ำสุด 33.200077 มากสุด 112.800071
			PlayerTextDrawLetterSize(playerid, circleshiftPlayerTextDraw[playerid][temp_td], 0.000000, 0.000000);
			PlayerTextDrawTextSize(playerid, circleshiftPlayerTextDraw[playerid][temp_td], 30.000005, 60.000000);
			PlayerTextDrawAlignment(playerid, circleshiftPlayerTextDraw[playerid][temp_td], 1);
			PlayerTextDrawColor(playerid, circleshiftPlayerTextDraw[playerid][temp_td], 0);
			PlayerTextDrawUseBox(playerid, circleshiftPlayerTextDraw[playerid][temp_td], true);
			PlayerTextDrawBoxColor(playerid, circleshiftPlayerTextDraw[playerid][temp_td], 778370815);
			PlayerTextDrawSetShadow(playerid, circleshiftPlayerTextDraw[playerid][temp_td], 0);
			PlayerTextDrawSetOutline(playerid, circleshiftPlayerTextDraw[playerid][temp_td], 0);
			PlayerTextDrawFont(playerid, circleshiftPlayerTextDraw[playerid][temp_td], 1);
		}
		
		if(playerUsingcircleshift{playerid}) {
			for (new i; i < circleshiftPlayerTextDrawCount[playerid]; i++)
			{
				PlayerTextDrawShow(playerid, circleshiftPlayerTextDraw[playerid][i]);
			}
		}
	}
}

HidePlayerCircleShift(playerid) {
	for (new i; i < circleshiftPlayerTextDrawCount[playerid]; i++)
	{
		PlayerTextDrawHide(playerid, circleshiftPlayerTextDraw[playerid][i]);
	}
	playerUsingcircleshift{playerid}=false;
}

DestroyPlayerCircleShift(playerid) {
	if(circleshiftPlayerTextDrawCount[playerid]) {
		for (new i; i < circleshiftPlayerTextDrawCount[playerid]; i++) {
			PlayerTextDrawDestroy(playerid, circleshiftPlayerTextDraw[playerid][i]);
		}
		circleshiftPlayerTextDrawCount[playerid]=0;
	}
	playerUsingcircleshift{playerid}=false;
}

/*

forward UpdatePlayerTimeUI(playerid);
public UpdatePlayerTimeUI(playerid) { 

	if(TimeUI{playerid}) {
	
		new temp_shrink_id = MatchingInfo[joined][m_ShrinkID], Float:increase_point;
		if(MatchingInfo[joined][m_STATE]==STATE_BLUE_SHRINK) {
			increase_point = 34 + (float(CircleData[temp_shrink_id][CIRCLEDATA_BLUETIME]-MatchingInfo[joined][m_Timer]) * 80.0 / float(CircleData[temp_shrink_id][CIRCLEDATA_BLUETIME])); //34 to 114 = 80
					
			if(increase_point > 114) {
				increase_point = 114;
			}
			else if(increase_point < 34) {
				increase_point = 34;
			}

			PlayerTextDrawDestroy(playerid, Runing[playerid]);
			Runing[playerid] = CreatePlayerTextDraw(playerid, increase_point, 314.104461, "usebox");
			PlayerTextDrawLetterSize(playerid, Runing[playerid], 0.000000, -0.120123);
			PlayerTextDrawTextSize(playerid, Runing[playerid], 27.199998, 0.000000);
			PlayerTextDrawAlignment(playerid, Runing[playerid], 1);
			PlayerTextDrawColor(playerid, Runing[playerid], 0);
			PlayerTextDrawUseBox(playerid, Runing[playerid], true);
			PlayerTextDrawBoxColor(playerid, Runing[playerid], 9232895);
			PlayerTextDrawShow(playerid, Runing[playerid]);
		}
		else {
			PlayerTextDrawDestroy(playerid, Runing[playerid]);
			Runing[playerid] = CreatePlayerTextDraw(playerid, 34.0, 314.104461, "usebox");
			PlayerTextDrawLetterSize(playerid, Runing[playerid], 0.000000, -0.120123);
			PlayerTextDrawTextSize(playerid, Runing[playerid], 27.199998, 0.000000);
			PlayerTextDrawAlignment(playerid, Runing[playerid], 1);
			PlayerTextDrawColor(playerid, Runing[playerid], 0);
			PlayerTextDrawUseBox(playerid, Runing[playerid], true);
			PlayerTextDrawBoxColor(playerid, Runing[playerid], 9232895);
			PlayerTextDrawShow(playerid, Runing[playerid]);
		}
		new Float:Zang;	
		MapAndreas_FindZ_For2DCoord(MatchingInfo[joined][m_WX], MatchingInfo[joined][m_WY], Zang);
		new Float: tempDistance = GetPlayerDistanceFromPoint(joined, MatchingInfo[joined][m_WX], MatchingInfo[joined][m_WY], Zang);
		tempDistance -= MatchingInfo[joined][m_WRad];
		increase_point = 19.8 + ((CircleData[temp_shrink_id][CIRCLEDATA_SIZE]-tempDistance) * 83 / CircleData[temp_shrink_id][CIRCLEDATA_SIZE]); //19.8 to 102.8 = 83
	
		if(increase_point > 102.8) {
			increase_point = 102.8;
		}
		else if(increase_point < 19.8) {
			increase_point = 19.8;
		}
		
		PlayerTextDrawDestroy(playerid, RuningIcon[playerid]);
		RuningIcon[playerid] = CreatePlayerTextDraw(playerid, increase_point, 290.702178, "ld_shtr:ship");
		PlayerTextDrawLetterSize(playerid,RuningIcon[playerid], 0.000000, 0.000000);
		PlayerTextDrawTextSize(playerid,RuningIcon[playerid], 22.400007, 25.386661);
		PlayerTextDrawAlignment(playerid,RuningIcon[playerid], 1);
		PlayerTextDrawColor(playerid,RuningIcon[playerid], -1);
		PlayerTextDrawSetShadow(playerid,RuningIcon[playerid], 0);
		PlayerTextDrawSetOutline(playerid,RuningIcon[playerid], 0);
		PlayerTextDrawFont(playerid,RuningIcon[playerid], 4);
		PlayerTextDrawShow(playerid, RuningIcon[playerid]);
	}	
	return 1;
}
*/
IsPlayerOpenMap(playerid) {
	return playerUsingMap{playerid};
}