#include <YSI\y_hooks>

#define MAX_LOBBY_TEXTDRAW			5
#define MAX_PLAYER_LOBBY_TEXTDRAW	7

#define LOBBY_COLOR_TEXT_SELECTED \
	-726921729
#define LOBBY_COLOR_BOX_SELECTED \
	128
	
#define LOBBY_COLOR_TEXT_UNSELECTED \
	-1
#define LOBBY_COLOR_BOX_UNSELECTED \
	32

enum E_LOBBY_TEXTDRAW
{
	E_LOBBY_START,
	E_LOBBY_SOLO,
	E_LOBBY_DUO,
	E_LOBBY_SQUAD,
	E_LOBBY_ONEMAN,
	E_LOBBY_TPP,
	E_LOBBY_FPP
};

new Text:lobbyTextDraw[MAX_LOBBY_TEXTDRAW];
new lobbyTextDrawCount;

new PlayerText:playerlobbyTextDraw[MAX_PLAYERS][MAX_PLAYER_LOBBY_TEXTDRAW];
new playerlobbyTextDrawID[MAX_PLAYERS][E_LOBBY_TEXTDRAW];
new playerlobbyTextDrawCount[MAX_PLAYERS];


new PlayerJoined[MAX_PLAYERS];
new IsPlayerInGame[MAX_PLAYERS char];

// Local Variables
new PlayerModeSelected[MAX_PLAYERS];

new const Float:LobbySpawn[4][4] = {
	{-2384.9851,-555.0211,129.1375,161.9820},
	{-2385.7166,-554.3669,129.1373,173.357666},
	{-2384.0256,-554.9462,129.1071,145.981994},
	{-2382.9797,-555.2518,129.0861,140.981994}
};

hook OnGameModeInit() {
	lobbyTextDraw[lobbyTextDrawCount] = TextDrawCreate(27.999984, 373.333404, "Play solo in third-person perspective");
	TextDrawLetterSize(lobbyTextDraw[lobbyTextDrawCount], 0.179600, 1.107200);
	TextDrawTextSize(lobbyTextDraw[lobbyTextDrawCount], 193.599975, -3.982222);
	TextDrawAlignment(lobbyTextDraw[lobbyTextDrawCount], 1);
	TextDrawColor(lobbyTextDraw[lobbyTextDrawCount], -1);
	TextDrawSetShadow(lobbyTextDraw[lobbyTextDrawCount], 0);
	TextDrawSetOutline(lobbyTextDraw[lobbyTextDrawCount], 0);
	TextDrawBackgroundColor(lobbyTextDraw[lobbyTextDrawCount], 51);
	TextDrawFont(lobbyTextDraw[lobbyTextDrawCount], 1);
	TextDrawSetProportional(lobbyTextDraw[lobbyTextDrawCount], 1);
	TextDrawSetSelectable(lobbyTextDraw[lobbyTextDrawCount++], 0);

	lobbyTextDraw[lobbyTextDrawCount] = TextDrawCreate(28.400020, 217.030975, "TEAM");
	TextDrawLetterSize(lobbyTextDraw[lobbyTextDrawCount], 0.160400, 1.117154);
	TextDrawAlignment(lobbyTextDraw[lobbyTextDrawCount], 1);
	TextDrawColor(lobbyTextDraw[lobbyTextDrawCount], -1);
	TextDrawSetShadow(lobbyTextDraw[lobbyTextDrawCount], 0);
	TextDrawSetOutline(lobbyTextDraw[lobbyTextDrawCount], 0);
	TextDrawBackgroundColor(lobbyTextDraw[lobbyTextDrawCount], 51);
	TextDrawFont(lobbyTextDraw[lobbyTextDrawCount], 2);
	TextDrawSetProportional(lobbyTextDraw[lobbyTextDrawCount], 1);
	TextDrawSetSelectable(lobbyTextDraw[lobbyTextDrawCount++], 0);

	lobbyTextDraw[lobbyTextDrawCount] = TextDrawCreate(115.199996, 230.477859, "usebox");
	TextDrawLetterSize(lobbyTextDraw[lobbyTextDrawCount], 0.000000, 6.547530);
	TextDrawTextSize(lobbyTextDraw[lobbyTextDrawCount], 26.399999, 0.000000);
	TextDrawAlignment(lobbyTextDraw[lobbyTextDrawCount], 1);
	TextDrawColor(lobbyTextDraw[lobbyTextDrawCount], 0);
	TextDrawUseBox(lobbyTextDraw[lobbyTextDrawCount], true);
	TextDrawBoxColor(lobbyTextDraw[lobbyTextDrawCount], 102);
	TextDrawSetShadow(lobbyTextDraw[lobbyTextDrawCount], 0);
	TextDrawSetOutline(lobbyTextDraw[lobbyTextDrawCount], 0);
	TextDrawFont(lobbyTextDraw[lobbyTextDrawCount], 0);
	TextDrawSetSelectable(lobbyTextDraw[lobbyTextDrawCount++], 0);

	lobbyTextDraw[lobbyTextDrawCount] = TextDrawCreate(28.600019, 305.639831, "PERSPECTIVE");
	TextDrawLetterSize(lobbyTextDraw[lobbyTextDrawCount], 0.160400, 1.117154);
	TextDrawAlignment(lobbyTextDraw[lobbyTextDrawCount], 1);
	TextDrawColor(lobbyTextDraw[lobbyTextDrawCount], -1);
	TextDrawUseBox(lobbyTextDraw[lobbyTextDrawCount], true);
	TextDrawBoxColor(lobbyTextDraw[lobbyTextDrawCount], 0);
	TextDrawSetShadow(lobbyTextDraw[lobbyTextDrawCount], 0);
	TextDrawSetOutline(lobbyTextDraw[lobbyTextDrawCount], 0);
	TextDrawBackgroundColor(lobbyTextDraw[lobbyTextDrawCount], 51);
	TextDrawFont(lobbyTextDraw[lobbyTextDrawCount], 2);
	TextDrawSetProportional(lobbyTextDraw[lobbyTextDrawCount], 1);
	TextDrawSetSelectable(lobbyTextDraw[lobbyTextDrawCount++], 0);

	lobbyTextDraw[lobbyTextDrawCount] = TextDrawCreate(115.799987, 319.087036, "usebox");
	TextDrawLetterSize(lobbyTextDraw[lobbyTextDrawCount], 0.000000, 3.067533);
	TextDrawTextSize(lobbyTextDraw[lobbyTextDrawCount], 26.400001, 0.000000);
	TextDrawAlignment(lobbyTextDraw[lobbyTextDrawCount], 1);
	TextDrawColor(lobbyTextDraw[lobbyTextDrawCount], 0);
	TextDrawUseBox(lobbyTextDraw[lobbyTextDrawCount], true);
	TextDrawBoxColor(lobbyTextDraw[lobbyTextDrawCount], 102);
	TextDrawSetShadow(lobbyTextDraw[lobbyTextDrawCount], 0);
	TextDrawSetOutline(lobbyTextDraw[lobbyTextDrawCount], 0);
	TextDrawFont(lobbyTextDraw[lobbyTextDrawCount], 1);
	TextDrawSetSelectable(lobbyTextDraw[lobbyTextDrawCount++], 0);
	return 1;
}

hook OnGameModeExit()
{
	for (new i; i < lobbyTextDrawCount; i++)
 	{
  		TextDrawDestroy(lobbyTextDraw[i]);
    }
	return 1;
}

hook OnPlayerClickTextDraw(playerid, Text:clickedid)
{
    if(!IsPlayerInGame{playerid} && clickedid == Text:INVALID_TEXT_DRAW)
    {
         SelectTextDraw(playerid, 0xD4AC0DFF);
    }
    return 1;
}

hook OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
    if(!IsPlayerInGame{playerid} && playertextid == PlayerText:INVALID_TEXT_DRAW)
    {
         SelectTextDraw(playerid, 0xD4AC0DFF);
    }
	else {
		if(playertextid == playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_START]])
		{
			if(!IsPlayerInGame{playerid} && PlayerJoined[playerid] == -1) {
			
				if(PlayerParty[playerid] != -1) {
					new partyid = PlayerParty[playerid];
					if(PlayerPartyReady{playerid}) {
						GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~Cancelled", 2000, 3);
						PlayerTextDrawSetString(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_START]], "Ready");
						PlayerPartyReady{playerid}=false;
						
						ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0);
						SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
					}
					else {
						GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~Ready", 2000, 3);
						PlayerTextDrawSetString(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_START]], "Cancel");
						PlayerPartyReady{playerid}=true;
						
						ApplyAnimation(playerid, "COP_AMBIENT", "COPLOOK_LOOP", 4.1, false, false, false, true, 0, false);
						
						if(Party_CountMember(partyid) == Party_CountReady(partyid)) {
							if(MatchingSearch(playerid, partyid)) {
								for (new x; x != MAX_PARTY_MEMBER; x++)
								{
									if(PartyInfo[partyid][pMember][x] != INVALID_PLAYER_ID) {
										GameTextForPlayer(PartyInfo[partyid][pMember][x], "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~STARTED MATCHMAKING...", 5000, 3);
									}
								}
							}
							else {
								for (new x; x != MAX_PARTY_MEMBER; x++)
								{
									if(PartyInfo[partyid][pMember][x] != INVALID_PLAYER_ID) {
										PlayerTextDrawSetString(PartyInfo[partyid][pMember][x], playerlobbyTextDraw[PartyInfo[partyid][pMember][x]][playerlobbyTextDrawID[PartyInfo[partyid][pMember][x]][E_LOBBY_START]], "Ready");
										PlayerPartyReady{PartyInfo[partyid][pMember][x]}=false;
										
										ApplyAnimation(PartyInfo[partyid][pMember][x], "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0);
										SetPlayerSpecialAction(PartyInfo[partyid][pMember][x], SPECIAL_ACTION_NONE);
										GameTextForPlayer(PartyInfo[partyid][pMember][x], "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~THE SERVER IS FULL...", 5000, 3);
									}
								}
							}
						}
					}
				}
				else {
				
					PlayerTextDrawSetString(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_START]], "Cancel");
					
					if(MatchingSearch(playerid)) GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~STARTED MATCHMAKING...", 5000, 3);
					else {
						PlayerPartyReady{playerid}=false;
						GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~THE SERVER IS FULL...", 5000, 3);
						PlayerTextDrawSetString(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_START]], "START");
					}
				}
			}
		}
		else if(playertextid == playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_SOLO]]) // Solo
		{
			if(PlayerParty[playerid] == NO_PARTY) {
				PlayerModeSelected[playerid] = MATCHING_SOLO;
				Lobby_TextDrawUpdate(playerid);
			}
		}
		else if(playertextid == playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_DUO]]) // Duo
		{
			if(PlayerParty[playerid] != NO_PARTY && Party_CountMember(PlayerParty[playerid]) == 2 && Party_GetPartyLeaderID(PlayerParty[playerid]) == playerid) {
				PlayerModeSelected[playerid] = MATCHING_DUO;
				Party_UpdateLobbyMenu(PlayerParty[playerid]);
			}
		}
		else if(playertextid == playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_SQUAD]]) // Squad
		{
			if(PlayerParty[playerid] != NO_PARTY && Party_CountMember(PlayerParty[playerid]) > 2 && Party_GetPartyLeaderID(PlayerParty[playerid]) == playerid) {
				PlayerModeSelected[playerid] = MATCHING_SQUAD;
				Party_UpdateLobbyMenu(PlayerParty[playerid]);
			}
		}
		else if(playertextid == playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_ONEMAN]]) // One Man
		{
			if(PlayerParty[playerid] == NO_PARTY) {
				PlayerModeSelected[playerid] = MATCHING_SQUAD;
				Lobby_TextDrawUpdate(playerid);
			}
		}
	}
    return 1;
}

hook OnPlayerConnect(playerid) {
	PlayerJoined[playerid]=-1;
	PlayerModeSelected[playerid]=MATCHING_SOLO;
	IsPlayerInGame{playerid}=false;
	SetPlayerColor(playerid,TEAM_INVISIBLE);
	
	playerlobbyTextDrawID[playerid][E_LOBBY_START] = playerlobbyTextDrawCount[playerid];
	playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 70.400009, 387.768890, "START");
	PlayerTextDrawLetterSize(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 0.372799, 3.192887);
	PlayerTextDrawTextSize(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 20.000019, 82.133338);
	PlayerTextDrawAlignment(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 2);
	PlayerTextDrawColor(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], -1);
	PlayerTextDrawUseBox(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], true);
	PlayerTextDrawBoxColor(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], -726921840);
	PlayerTextDrawSetShadow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 0);
	PlayerTextDrawSetOutline(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 0);
	PlayerTextDrawBackgroundColor(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 255);
	PlayerTextDrawFont(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 2);
	PlayerTextDrawSetProportional(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 1);
	PlayerTextDrawSetSelectable(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]++], 1);

	playerlobbyTextDrawID[playerid][E_LOBBY_SOLO] = playerlobbyTextDrawCount[playerid];
	playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 30.000011, 230.968917, "Solo");
	PlayerTextDrawLetterSize(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 0.231199, 1.311288);
	PlayerTextDrawTextSize(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 112.399993, 8.995554);
	PlayerTextDrawAlignment(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 1);
	PlayerTextDrawColor(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], -726921729);
	PlayerTextDrawUseBox(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], true);
	PlayerTextDrawBoxColor(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 128);
	PlayerTextDrawSetShadow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 0);
	PlayerTextDrawSetOutline(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 0);
	PlayerTextDrawBackgroundColor(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 51);
	PlayerTextDrawFont(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 2);
	PlayerTextDrawSetProportional(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 1);
	PlayerTextDrawSetSelectable(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]++], 1);

	playerlobbyTextDrawID[playerid][E_LOBBY_DUO] = playerlobbyTextDrawCount[playerid];
	playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 29.400011, 246.902435, "Duo");
	PlayerTextDrawLetterSize(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 0.231198, 1.311287);
	PlayerTextDrawTextSize(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 112.399993, 8.995554);
	PlayerTextDrawAlignment(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 1);
	PlayerTextDrawColor(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], -1);
	PlayerTextDrawUseBox(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], true);
	PlayerTextDrawBoxColor(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 32);
	PlayerTextDrawSetShadow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 0);
	PlayerTextDrawSetOutline(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 0);
	PlayerTextDrawBackgroundColor(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 51);
	PlayerTextDrawFont(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 2);
	PlayerTextDrawSetProportional(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 1);
	PlayerTextDrawSetSelectable(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]++], 1);

	playerlobbyTextDrawID[playerid][E_LOBBY_SQUAD] = playerlobbyTextDrawCount[playerid];
	playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 29.600015, 261.840362, "SQUAD");
	PlayerTextDrawLetterSize(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 0.231198, 1.311287);
	PlayerTextDrawTextSize(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 112.399993, 8.995554);
	PlayerTextDrawAlignment(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 1);
	PlayerTextDrawColor(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], -1);
	PlayerTextDrawUseBox(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], true);
	PlayerTextDrawBoxColor(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 32);
	PlayerTextDrawSetShadow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 0);
	PlayerTextDrawSetOutline(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 0);
	PlayerTextDrawBackgroundColor(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 51);
	PlayerTextDrawFont(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 2);
	PlayerTextDrawSetProportional(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 1);
	PlayerTextDrawSetSelectable(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]++], 1);

	playerlobbyTextDrawID[playerid][E_LOBBY_ONEMAN] = playerlobbyTextDrawCount[playerid];
	playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 29.800012, 276.778045, "1-man squad");
	PlayerTextDrawLetterSize(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 0.231198, 1.311287);
	PlayerTextDrawTextSize(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 112.399993, 8.995554);
	PlayerTextDrawAlignment(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 1);
	PlayerTextDrawColor(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], -1);
	PlayerTextDrawUseBox(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], true);
	PlayerTextDrawBoxColor(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 32);
	PlayerTextDrawSetShadow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 0);
	PlayerTextDrawSetOutline(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 0);
	PlayerTextDrawBackgroundColor(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 51);
	PlayerTextDrawFont(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 2);
	PlayerTextDrawSetProportional(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 1);
	PlayerTextDrawSetSelectable(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]++], 1);

	playerlobbyTextDrawID[playerid][E_LOBBY_TPP] = playerlobbyTextDrawCount[playerid];
	playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 30.000019, 319.093688, "TPP");
	PlayerTextDrawLetterSize(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 0.231198, 1.311287);
	PlayerTextDrawTextSize(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 112.399993, 8.995554);
	PlayerTextDrawAlignment(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 1);
	PlayerTextDrawColor(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], -726921729);
	PlayerTextDrawUseBox(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], true);
	PlayerTextDrawBoxColor(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 128);
	PlayerTextDrawSetShadow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 0);
	PlayerTextDrawSetOutline(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 0);
	PlayerTextDrawBackgroundColor(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 51);
	PlayerTextDrawFont(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 2);
	PlayerTextDrawSetProportional(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 1);
	PlayerTextDrawSetSelectable(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]++], 1);

	playerlobbyTextDrawID[playerid][E_LOBBY_FPP] = playerlobbyTextDrawCount[playerid];
	playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]] = CreatePlayerTextDraw(playerid, 29.400011, 334.528869, "FPP");
	PlayerTextDrawLetterSize(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 0.231198, 1.311287);
	PlayerTextDrawTextSize(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 112.399993, 8.995554);
	PlayerTextDrawAlignment(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 1);
	PlayerTextDrawColor(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], -1);
	PlayerTextDrawUseBox(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], true);
	PlayerTextDrawBoxColor(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 32);
	PlayerTextDrawSetShadow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 0);
	PlayerTextDrawSetOutline(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 0);
	PlayerTextDrawBackgroundColor(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 51);
	PlayerTextDrawFont(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 2);
	PlayerTextDrawSetProportional(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]], 1);
	PlayerTextDrawSetSelectable(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawCount[playerid]++], 1);
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	for (new i; i < playerlobbyTextDrawCount[playerid]; i++)
 	{
  		PlayerTextDrawDestroy(playerid, playerlobbyTextDraw[playerid][i]);
    }
	playerlobbyTextDrawCount[playerid] = 0;
	
	return 1;
}

hook OnPlayerRequestClass(playerid, classid)
{
	SetSpawnInfo(playerid, 1, 0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0);
	SpawnPlayer(playerid);
	return 1;
}


hook OnPlayerSpawn(playerid) {
	if(!IsPlayerInGame{playerid} && PlayerJoined[playerid] == -1) {
		
		PlayerTextDrawSetString(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_START]], "START");
		
		if(PlayerParty[playerid] != NO_PARTY) {
			new partyslot = Party_GetPlayerPartySlot(playerid);
			if(partyslot != INVALID_PLAYER_ID) {
				SetPlayerPos(playerid, LobbySpawn[partyslot][0], LobbySpawn[partyslot][1], LobbySpawn[partyslot][2]);
				SetPlayerFacingAngle(playerid, LobbySpawn[partyslot][3]);
				SetPlayerVirtualWorld(playerid, 100+PlayerParty[playerid]);
			}
		}
		else {
			SetPlayerPos(playerid, LobbySpawn[0][0], LobbySpawn[0][1], LobbySpawn[0][2]);
			SetPlayerFacingAngle(playerid, LobbySpawn[0][3]);
			SetPlayerVirtualWorld(playerid, 200+playerid);
		}
			
		SetPlayerCameraPos(playerid, -2386.2234,-558.7192,130.6172);
		SetPlayerCameraLookAt(playerid, -2384.0381,-552.0007,129.0110);
		
		TogglePlayerControllable(playerid, false);
		
		SelectTextDraw(playerid, 0xD4AC0DFF);
		Lobby_TextDrawUpdate(playerid);	
		RemoveMarkers(playerid);
	}
	//printf("lobby.pwn called OnPlayerSpawn");
	return 1;
}

Lobby_TextDrawUpdate(playerid) {

	for (new i; i < lobbyTextDrawCount; i++)
 	{
  		TextDrawShowForPlayer(playerid, lobbyTextDraw[i]);
    }
	for (new i; i < playerlobbyTextDrawCount[playerid]; i++)
 	{
  		PlayerTextDrawShow(playerid, playerlobbyTextDraw[playerid][i]);
    }
	new leaderid = INVALID_PLAYER_ID;
	if((leaderid = Party_GetPartyLeaderID(PlayerParty[playerid])) != INVALID_PLAYER_ID) {
	
		if(Party_CountMember(PlayerParty[playerid]) > 2) {
			PlayerModeSelected[leaderid]=MATCHING_SQUAD;
		}
		else {
			PlayerModeSelected[leaderid]=MATCHING_DUO;
		}
		
		PlayerModeSelected[playerid]=PlayerModeSelected[leaderid];

		switch(PlayerModeSelected[playerid]) {
			case MATCHING_DUO: {
				PlayerTextDrawColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_SOLO]], LOBBY_COLOR_TEXT_UNSELECTED);
				PlayerTextDrawBoxColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_SOLO]], LOBBY_COLOR_BOX_UNSELECTED);
				PlayerTextDrawShow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_SOLO]]);

				PlayerTextDrawColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_DUO]], LOBBY_COLOR_TEXT_SELECTED);
				PlayerTextDrawBoxColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_DUO]], LOBBY_COLOR_BOX_SELECTED);
				PlayerTextDrawShow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_DUO]]);
				
				PlayerTextDrawColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_SQUAD]], LOBBY_COLOR_TEXT_UNSELECTED);
				PlayerTextDrawBoxColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_SQUAD]], LOBBY_COLOR_BOX_UNSELECTED);
				PlayerTextDrawShow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_SQUAD]]);
				
				PlayerTextDrawColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_ONEMAN]], LOBBY_COLOR_TEXT_UNSELECTED);
				PlayerTextDrawBoxColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_ONEMAN]], LOBBY_COLOR_BOX_UNSELECTED);
				PlayerTextDrawShow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_ONEMAN]]);
				
				PlayerTextDrawColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_TPP]], LOBBY_COLOR_TEXT_SELECTED);
				PlayerTextDrawBoxColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_TPP]], LOBBY_COLOR_BOX_SELECTED);
				PlayerTextDrawShow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_TPP]]);

				PlayerTextDrawColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_FPP]], LOBBY_COLOR_TEXT_UNSELECTED);
				PlayerTextDrawBoxColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_FPP]], LOBBY_COLOR_BOX_UNSELECTED);
				PlayerTextDrawShow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_FPP]]);
			}
			case MATCHING_SQUAD: {
				PlayerTextDrawColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_SOLO]], LOBBY_COLOR_TEXT_UNSELECTED);
				PlayerTextDrawBoxColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_SOLO]], LOBBY_COLOR_BOX_UNSELECTED);
				PlayerTextDrawShow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_SOLO]]);

				PlayerTextDrawColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_DUO]], LOBBY_COLOR_TEXT_UNSELECTED);
				PlayerTextDrawBoxColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_DUO]], LOBBY_COLOR_BOX_UNSELECTED);
				PlayerTextDrawShow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_DUO]]);
				
				PlayerTextDrawColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_SQUAD]], LOBBY_COLOR_TEXT_UNSELECTED);
				PlayerTextDrawBoxColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_SQUAD]], LOBBY_COLOR_BOX_UNSELECTED);
				PlayerTextDrawShow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_SQUAD]]);
				
				PlayerTextDrawColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_ONEMAN]], LOBBY_COLOR_TEXT_SELECTED);
				PlayerTextDrawBoxColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_ONEMAN]], LOBBY_COLOR_BOX_SELECTED);
				PlayerTextDrawShow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_ONEMAN]]);
				
				PlayerTextDrawColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_TPP]], LOBBY_COLOR_TEXT_SELECTED);
				PlayerTextDrawBoxColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_TPP]], LOBBY_COLOR_BOX_SELECTED);
				PlayerTextDrawShow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_TPP]]);

				PlayerTextDrawColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_FPP]], LOBBY_COLOR_TEXT_UNSELECTED);
				PlayerTextDrawBoxColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_FPP]], LOBBY_COLOR_BOX_UNSELECTED);
				PlayerTextDrawShow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_FPP]]);
			}
		}
	}
	else {
		switch(PlayerModeSelected[playerid]) {
			case MATCHING_SOLO: { // Solo
				PlayerTextDrawColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_SOLO]], LOBBY_COLOR_TEXT_SELECTED);
				PlayerTextDrawBoxColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_SOLO]], LOBBY_COLOR_BOX_SELECTED);
				PlayerTextDrawShow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_SOLO]]);

				PlayerTextDrawColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_DUO]], LOBBY_COLOR_TEXT_UNSELECTED);
				PlayerTextDrawBoxColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_DUO]], LOBBY_COLOR_BOX_UNSELECTED);
				PlayerTextDrawShow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_DUO]]);
				
				PlayerTextDrawColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_SQUAD]], LOBBY_COLOR_TEXT_UNSELECTED);
				PlayerTextDrawBoxColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_SQUAD]], LOBBY_COLOR_BOX_UNSELECTED);
				PlayerTextDrawShow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_SQUAD]]);
				
				PlayerTextDrawColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_ONEMAN]], LOBBY_COLOR_TEXT_UNSELECTED);
				PlayerTextDrawBoxColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_ONEMAN]], LOBBY_COLOR_BOX_UNSELECTED);
				PlayerTextDrawShow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_ONEMAN]]);
				
				PlayerTextDrawColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_TPP]], LOBBY_COLOR_TEXT_SELECTED);
				PlayerTextDrawBoxColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_TPP]], LOBBY_COLOR_BOX_SELECTED);
				PlayerTextDrawShow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_TPP]]);

				PlayerTextDrawColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_FPP]], LOBBY_COLOR_TEXT_UNSELECTED);
				PlayerTextDrawBoxColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_FPP]], LOBBY_COLOR_BOX_UNSELECTED);
				PlayerTextDrawShow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_FPP]]);
			}
			case MATCHING_SQUAD: { // ONE-MAN-SQUAD 
				PlayerTextDrawColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_SOLO]], LOBBY_COLOR_TEXT_UNSELECTED);
				PlayerTextDrawBoxColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_SOLO]], LOBBY_COLOR_BOX_UNSELECTED);
				PlayerTextDrawShow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_SOLO]]);

				PlayerTextDrawColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_DUO]], LOBBY_COLOR_TEXT_UNSELECTED);
				PlayerTextDrawBoxColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_DUO]], LOBBY_COLOR_BOX_UNSELECTED);
				PlayerTextDrawShow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_DUO]]);
				
				PlayerTextDrawColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_SQUAD]], LOBBY_COLOR_TEXT_UNSELECTED);
				PlayerTextDrawBoxColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_SQUAD]], LOBBY_COLOR_BOX_UNSELECTED);
				PlayerTextDrawShow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_SQUAD]]);
				
				PlayerTextDrawColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_ONEMAN]], LOBBY_COLOR_TEXT_SELECTED);
				PlayerTextDrawBoxColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_ONEMAN]], LOBBY_COLOR_BOX_SELECTED);
				PlayerTextDrawShow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_ONEMAN]]);
				
				PlayerTextDrawColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_TPP]], LOBBY_COLOR_TEXT_SELECTED);
				PlayerTextDrawBoxColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_TPP]], LOBBY_COLOR_BOX_SELECTED);
				PlayerTextDrawShow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_TPP]]);

				PlayerTextDrawColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_FPP]], LOBBY_COLOR_TEXT_UNSELECTED);
				PlayerTextDrawBoxColor(playerid,playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_FPP]], LOBBY_COLOR_BOX_UNSELECTED);
				PlayerTextDrawShow(playerid, playerlobbyTextDraw[playerid][playerlobbyTextDrawID[playerid][E_LOBBY_FPP]]);
			}
		}
	}
	return 1;
}

Lobby_IsPlayerInGame(playerid)
	return IsPlayerInGame{playerid};
	
GetPlayerJoinMatch(playerid)
	return PlayerJoined[playerid];