#include <YSI\y_hooks>

#define MAX_PARTIES 100
#define MAX_PARTY_MEMBER 4
/*
new Text:PartyNameBox[MAX_PARTY_MEMBER];
new Text:PartyHealthBox[MAX_PARTY_MEMBER];*/

new PlayerText:PartyName[MAX_PLAYERS][MAX_PARTY_MEMBER];
new PlayerText:PartyHealth[MAX_PLAYERS][MAX_PARTY_MEMBER];
new PlayerText:PartyColor[MAX_PLAYERS][MAX_PARTY_MEMBER];
new PlayerText:PartyNumber[MAX_PLAYERS][MAX_PARTY_MEMBER];
new PlayerText:PartyNameBox[MAX_PLAYERS][MAX_PARTY_MEMBER];
new PlayerText:PartyHealthBox[MAX_PLAYERS][MAX_PARTY_MEMBER];

enum partyInfo
{
    bool:pExists,
	pMember[MAX_PARTY_MEMBER],
}

new bool:PartyBox[MAX_PLAYERS char];
new PartyInfo[MAX_PARTIES][partyInfo];
new InParty[MAX_PLAYERS]; // Checks if the player is in a party or not, returns party ID.
new PartySpot[MAX_PLAYERS]; // Checks which ,,slot" the player is in the party. 1 is leader(RED), 2 is Green, 3 is Blue, 4 is Yellow and 5 is Purple.

/*task PartyTimer[1000]()
{
	for(new partyid=0;partyid!=MAX_PARTIES;partyid++) {
		if(PartyInfo[partyid][pExists]) {
			if(PartyMatchmaking(partyid)) {
				new leaderid = PartyInfo[partyid][pMember][0];
				new matchid = MatchmakingSearch(leaderid, MatchingType[leaderid], partyid);
				if(matchid == -1) {
					PartyPlayerGameText(partyid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~Servers are too busy", 2000);
					PartyPlayerText(partyid, "Ready");
					PartyReady(partyid, false);
				}
				else {
					PartyPlayerGameText(partyid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~STARTED MATCHMAKING...", 5000);
				}
				//printf("leaderid %d %s", leaderid, ReturnName(leaderid));
			}
		}
	}
	return 1;
}*/

hook OnGameModeInit()
{
	ShowPlayerMarkers(PLAYER_MARKERS_MODE_GLOBAL);
	//LimitPlayerMarkerRadius(800.0);
	
	for(new i=0;i!=MAX_PARTIES;i++) {
		PartyInfo[i][pExists]=false;
		PartyInfo[i][pMember][0]=INVALID_PLAYER_ID;
		PartyInfo[i][pMember][1]=INVALID_PLAYER_ID;
		PartyInfo[i][pMember][2]=INVALID_PLAYER_ID;
		PartyInfo[i][pMember][3]=INVALID_PLAYER_ID;
	}

	/*for(new i=0;i!=MAX_PARTY_MEMBER;i++) {	
		PartyNameBox[i] = TextDrawCreate(114.000000, 268.308898 - (17.417617 * float(i)), "usebox"); // - 17.417617
		TextDrawLetterSize(PartyNameBox[i], 0.000000, 0.955429);
		TextDrawTextSize(PartyNameBox[i], 26.799999, 0.000000);
		TextDrawAlignment(PartyNameBox[i], 1);
		TextDrawColor(PartyNameBox[i], 0);
		TextDrawUseBox(PartyNameBox[i], true);
		TextDrawBoxColor(PartyNameBox[i], 102);
		TextDrawSetShadow(PartyNameBox[i], 0);
		TextDrawSetOutline(PartyNameBox[i], 0);
		TextDrawFont(PartyNameBox[i], 0);

		PartyHealthBox[i] = TextDrawCreate(113.200057, 276.273315 - (17.417617 * float(i)), "usebox");
		TextDrawLetterSize(PartyHealthBox[i], 0.000000, 0.039873);
		TextDrawTextSize(PartyHealthBox[i], 27.199996, 0.000000);
		TextDrawAlignment(PartyHealthBox[i], 1);
		TextDrawColor(PartyHealthBox[i], 0);
		TextDrawUseBox(PartyHealthBox[i], true);
		TextDrawBoxColor(PartyHealthBox[i], 102);
		TextDrawSetShadow(PartyHealthBox[i], 0);
		TextDrawSetOutline(PartyHealthBox[i], 0);
		TextDrawFont(PartyHealthBox[i], 0);
	}*/
	return 1;
}

hook OnPlayerConnect(playerid)
{
	InParty[playerid]=-1;
	PartySpot[playerid]=0;

    SetPlayerColor(playerid,TEAM_INVISIBLE);
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if(InParty[playerid] != -1) {
		LeaveParty(playerid);
	}
	InParty[playerid]=-1;
	PartySpot[playerid]=0;
	return 1;
}

/*CMD:partyhelp(playerid)
{
	SendClientMessage(playerid, COLOR_YELLOW,"CMD: /invite | /leaveparty | /kickparty");
	return 1;
}*/

CMD:partyhelp(playerid) {
	SendClientMessage(playerid, -1, "[PARTY] /invite - เชิญผู้เล่นเข้าร่วมปาร์ตี้");
	SendClientMessage(playerid, -1, "[PARTY] /leaveparty - ออกจากปาร์ตี้ในปัจจุบัน");
	SendClientMessage(playerid, -1, "[PARTY] /kickparty - เตะผู้เล่นออกจากปาร์ตี้");
	return 1;
}

CMD:invite(playerid, params[])
{
	new targetid;
	if(sscanf(params, "u", targetid)) return SendClientMessage(playerid, COLOR_YELLOW, "[USAGE]: /invite [playerid]");
	
	if(targetid == INVALID_PLAYER_ID || playerid == targetid) return 1;
	if(InGame{playerid} || InGame{targetid}) return 1;
	
	if(InParty[targetid]==-1)
	{
		new bool:success = false;
		if(InParty[playerid] != -1) {
	
			for(new i=0;i!=4;i++) {
				if(PartyInfo[InParty[playerid]][pMember][i] == INVALID_PLAYER_ID) {
					PartyInfo[InParty[playerid]][pMember][i] = targetid;
					InParty[targetid] = InParty[playerid];
					PartySpot[targetid]=i;
					AccountCheck(targetid);
					success = true;
					//printf("%d join party %d", targetid, i);
					break;
				}
			}
			if(!success) {
				GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~Your party is full.", 2000, 3);
				return 1;
			}
			else {
				PartyCheck(InParty[playerid]);
			}
			
		}
		else {
			for(new i=0;i!=MAX_PARTIES;i++) {
				if(!PartyInfo[i][pExists]) {
					PartyInfo[i][pExists]=true;
					InParty[playerid] = i;
					PartySpot[playerid] = 0;	
					PartyInfo[i][pMember][0]=playerid;
					PartyInfo[i][pMember][1]=INVALID_PLAYER_ID;
					PartyInfo[i][pMember][2]=INVALID_PLAYER_ID;
					PartyInfo[i][pMember][3]=INVALID_PLAYER_ID;
					AccountCheck(playerid);	
					//printf("Create party %d", i);
					break;
				}
			}
			
			if(InParty[playerid] != -1) {
				for(new i=0;i!=4;i++) {
					if(PartyInfo[InParty[playerid]][pMember][i] == INVALID_PLAYER_ID) {
						PartyInfo[InParty[playerid]][pMember][i] = targetid;
						InParty[targetid] = InParty[playerid];
						PartySpot[targetid]=i;
						AccountCheck(targetid);
						success = true;
						//printf("%d join party %d", targetid, InParty[playerid]);
						break;
					}
				}
				if(!success) {
					GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~Your party is full.", 2000, 3);
					return 1;
				}
				else {
					PartyCheck(InParty[playerid]);
				}
				
			}
			else {
				GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~Servers not response.", 2000, 3);
				return 1;
			}
		}
	}
	else
	{
		GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~That player already in a party.", 2000, 3);
		return 1;
	}
	
 	return 1;
}

CMD:leaveparty(playerid, params[])
{
	if(InGame{playerid}) return 1;
	
	LeaveParty(playerid);
	AccountCheck(playerid);
	return 1;
}

CMD:kickparty(playerid, params[])
{
	new targetid;
	if(sscanf(params, "u", targetid)) return SendClientMessage(playerid, COLOR_YELLOW, "[USAGE]: /kickparty [playerid]");
	
	if(targetid == INVALID_PLAYER_ID || playerid == targetid) return 1;
	if(InGame{playerid} || InGame{targetid}) return 1;
	
	if(InParty[playerid] != -1 && InParty[playerid] == InParty[targetid])
	{
		LeaveParty(targetid);
		AccountCheck(targetid);
	}
	else
	{
		GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~That player not in your party.", 2000, 3);
		return 1;
	}
	return 1;
}

GetPlayerParty(playerid) {
	return InParty[playerid];
}

GetPlayerSlot(playerid) {
	return PartySpot[playerid];
}

stock IsPartyLeader(playerid) {
	return PartySpot[playerid]==0?true:false;
}

stock GetLeaderID(partyid) {
	if(partyid !=-1 && PartyInfo[partyid][pExists]) {
		return PartyInfo[partyid][pMember][0];
	}
	return INVALID_PLAYER_ID;
}
/*
stock IsPartyLeader(playerid) {

	if(InParty[playerid] !=-1 && PartyInfo[InParty[playerid]][pExists]) {
		for(new i=0;i!=4;i++) {
			if(PartyInfo[InParty[playerid]][pMember][i] != INVALID_PLAYER_ID) {
				if(PartyInfo[InParty[playerid]][pMember][i]==playerid) {
					return 1;
				}
				else {
					return 0;
				}
			}
		}
	}
	return -1;
}*/

stock PartyMatchmaking(partyid) {
	//printf("Party %d Matchmaking Check", partyid);
	if(partyid !=-1 && PartyInfo[partyid][pExists]) {
		for(new i=0;i!=MAX_PARTY_MEMBER;i++) {
			if(PartyInfo[partyid][pMember][i] != INVALID_PLAYER_ID) {
				//printf("%d In Match %d", PartyInfo[partyid][pMember][i], PlayerInMatching[PartyInfo[partyid][pMember][i]], PlayerReady{PartyInfo[partyid][pMember][i]} ? ("Ready") : ("Not Ready"));
				if(!PlayerReady{PartyInfo[partyid][pMember][i]}) {
					return 0;
				}
			}
		}
	}
	return 1;
}

stock PartyPlayerText(partyid, text[]) {

	if(partyid !=-1 && PartyInfo[partyid][pExists]) {
		for(new i=0;i!=4;i++) {
			if(PartyInfo[partyid][pMember][i] != INVALID_PLAYER_ID) {
				PlayerTextDrawSetString(PartyInfo[partyid][pMember][i], LobbyStart[PartyInfo[partyid][pMember][i]], text);
			}
		}
	}
	return 1;
}

stock PartyReady(partyid, bool:on) {

	if(partyid !=-1 && PartyInfo[partyid][pExists]) {
		for(new i=0;i!=4;i++) {
			if(PartyInfo[partyid][pMember][i] != INVALID_PLAYER_ID) {
				if(on) {
					PlayerReady{PartyInfo[partyid][pMember][i]}=true;
				}
				else {
					PlayerReady{PartyInfo[partyid][pMember][i]}=false;
				}
			}
		}
	}
	return 1;
}

stock PartyPlayerGameText(partyid, text[], time = 2000) {

	if(partyid !=-1 && PartyInfo[partyid][pExists]) {
		for(new i=0;i!=4;i++) {
			if(PartyInfo[partyid][pMember][i] != INVALID_PLAYER_ID) {
				GameTextForPlayer(PartyInfo[partyid][pMember][i], text, time, 3);
			}
		}
	}
	return 1;
}

stock LeaveParty(playerid) {
	new partyid = InParty[playerid];
	if(partyid !=-1) {
		PartyInfo[partyid][pMember][PartySpot[playerid]] = INVALID_PLAYER_ID;
		
		if(PartyCount(partyid)==1) {
			PartyInfo[partyid][pExists] = false;
			
			for(new i=0;i!=4;i++) {
				if(PartyInfo[partyid][pMember][i] != INVALID_PLAYER_ID) {
					InParty[PartyInfo[partyid][pMember][i]]=-1;
					PartySpot[PartyInfo[partyid][pMember][i]]=0;
					if(!InGame{PartyInfo[partyid][pMember][i]}) {
						AccountCheck(PartyInfo[partyid][pMember][i]);
						if(PlayerReady{PartyInfo[InParty[playerid]][pMember][i]}) {
							ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0);
							SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
						}
					}
					PlayerReady{PartyInfo[partyid][pMember][i]}=false;
					PartyInfo[partyid][pMember][i] = INVALID_PLAYER_ID;
				}
			}
		}
		else {
			if(PartySpot[playerid] == 0) {
				// New host
				for(new i=0;i!=4;i++) {
					if(PartyInfo[InParty[playerid]][pMember][i] != INVALID_PLAYER_ID) {
						PartyInfo[InParty[playerid]][pMember][0] = PartyInfo[InParty[playerid]][pMember][i];
						PartySpot[PartyInfo[InParty[playerid]][pMember][0]]=0;
						PartyInfo[InParty[playerid]][pMember][i] = INVALID_PLAYER_ID;
						
						if(!InGame{PartyInfo[partyid][pMember][i]}) {
							PartyCheck(PartyInfo[InParty[playerid]][pMember][0]);
							if(PlayerReady{PartyInfo[InParty[playerid]][pMember][i]}) {
								ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0);
								SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
							}
						}
						PlayerReady{PartyInfo[InParty[playerid]][pMember][i]}=false;
						UpdatePartyBox(InParty[playerid], true);
						break;
					}
				}
				
			}
		}
		InParty[playerid]=-1;
		PartySpot[playerid]=0;
		if(!InGame{playerid}) {
			UpdateLobbyMenu(playerid);
			if(PlayerReady{playerid}) {
				ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0);
				SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			}
		}
		PlayerReady{playerid}=false;
	}
}

stock PartyCount(partyid) {
	new count;
	if(partyid !=-1 && PartyInfo[partyid][pExists]) {
		for(new i=0;i!=4;i++) {
			if(PartyInfo[partyid][pMember][i] != INVALID_PLAYER_ID) count++;
		}
	}
	return count;
}

stock PartyMatchCount(matchid) {
	new count;
	for(new i=0;i!=MAX_PARTIES;i++) {
		if(PartyInfo[i][pExists]) {
			for(new x=0;x!=MAX_PARTY_MEMBER;x++) {
				if(PartyInfo[i][pMember][x] != INVALID_PLAYER_ID && PlayerInMatching[PartyInfo[i][pMember][x]] == matchid) count++;
			}
		}
	}
	foreach(new x : Player) {
		if(PlayerInMatching[x] == matchid && InParty[x] == -1) {
			count++;
		}
	}
	return count;
}

stock DisbandParty(partyid) {
	if(partyid !=-1 && PartyInfo[partyid][pExists]) {
		PartyInfo[partyid][pExists] = false;
		for(new i=0;i!=4;i++) {
			if(PartyInfo[partyid][pMember][i] != INVALID_PLAYER_ID) {
				InParty[PartyInfo[partyid][pMember][i]]=-1;
				PartySpot[PartyInfo[partyid][pMember][i]]=0;
				PartyInfo[partyid][pMember][i] = INVALID_PLAYER_ID;
			}
		}
	}
}

stock SetPartyMatchmaking(partyid, matchid) {

	if(partyid !=-1 && PartyInfo[partyid][pExists]) {
		for(new i=0;i!=4;i++) {
			if(PartyInfo[partyid][pMember][i] != INVALID_PLAYER_ID) {
				PlayerInMatching[PartyInfo[partyid][pMember][i]]=matchid;
				//printf("%d Join matched %d", PartyInfo[partyid][pMember][i], matchid);
			}
		}
	}
	return 1;
}

stock ShowMarkers(playerid) // After pressing N this function reveals your teammates on your radar.
{
	if(InParty[playerid] != -1) {
	
		if(PartyInfo[InParty[playerid]][pMember][0]!=INVALID_PLAYER_ID&&PartyInfo[InParty[playerid]][pMember][0]!=playerid)
		{
			SetPlayerMarkerForPlayer(playerid, PartyInfo[InParty[playerid]][pMember][0], TEAM_RED);
		}
		if(PartyInfo[InParty[playerid]][pMember][1]!=INVALID_PLAYER_ID&&PartyInfo[InParty[playerid]][pMember][1]!=playerid)
		{
			SetPlayerMarkerForPlayer(playerid, PartyInfo[InParty[playerid]][pMember][1], TEAM_GREEN);
		}
		if(PartyInfo[InParty[playerid]][pMember][2]!=INVALID_PLAYER_ID&&PartyInfo[InParty[playerid]][pMember][2]!=playerid)
		{
			SetPlayerMarkerForPlayer(playerid, PartyInfo[InParty[playerid]][pMember][2], TEAM_BLUE);
		}
		if(PartyInfo[InParty[playerid]][pMember][3]!=INVALID_PLAYER_ID&&PartyInfo[InParty[playerid]][pMember][3]!=playerid)
		{
			SetPlayerMarkerForPlayer(playerid, PartyInfo[InParty[playerid]][pMember][3], TEAM_YELLOW);
		}
	}
}

stock RemoveMarkers(playerid)
{
 	foreach(new i : Player)
   	{
		SetPlayerMarkerForPlayer(playerid, i, TEAM_INVISIBLE);
   	}
}

stock PartyCheck(partyid) {
	new party_count = PartyCount(partyid);

	for(new i=0;i!=4;i++) {
		if(PartyInfo[partyid][pMember][i] != INVALID_PLAYER_ID) {
			switch(party_count) {
				case 2: MatchingType[PartyInfo[partyid][pMember][i]] = MATCHING_DUO;
				case 3,4: MatchingType[PartyInfo[partyid][pMember][i]] = MATCHING_SQUAD;
				default: MatchingType[PartyInfo[partyid][pMember][i]] = MATCHING_SOLO;
			}
			UpdateLobbyMenu(PartyInfo[partyid][pMember][i]);
		}
	}
}

stock HidePlayerPartyBox(playerid) {
	for(new i=0;i!=MAX_PARTY_MEMBER;i++) {

		PlayerTextDrawHide(playerid, PartyNameBox[playerid][i]);
		PlayerTextDrawHide(playerid, PartyHealthBox[playerid][i]);
	
		PlayerTextDrawHide(playerid, PartyName[playerid][i]);
		PlayerTextDrawHide(playerid, PartyHealth[playerid][i]);
		PlayerTextDrawHide(playerid, PartyColor[playerid][i]);
		PlayerTextDrawHide(playerid, PartyNumber[playerid][i]);
	}
}

stock DestroyPlayerPartyBox(playerid) {
	for(new id=0;id!=MAX_PARTY_MEMBER;id++) {
	
		PlayerTextDrawDestroy(playerid, PartyNameBox[playerid][id]);
		PlayerTextDrawDestroy(playerid, PartyHealthBox[playerid][id]);		
		PlayerTextDrawDestroy(playerid, PartyName[playerid][id]);
		PlayerTextDrawDestroy(playerid, PartyHealth[playerid][id]);
		PlayerTextDrawDestroy(playerid, PartyColor[playerid][id]);
		PlayerTextDrawDestroy(playerid, PartyNumber[playerid][id]);		
	
	
	/*	if(PlayerText:PartyName[PartyInfo[partyid][pMember][pupdate]][id])   PlayerTextDrawDestroy(PartyInfo[partyid][pMember][pupdate], PartyName[PartyInfo[partyid][pMember][pupdate]][id]);
		if(PlayerText:PartyHealth[PartyInfo[partyid][pMember][pupdate]][id]) PlayerTextDrawDestroy(PartyInfo[partyid][pMember][pupdate], PartyHealth[PartyInfo[partyid][pMember][pupdate]][id]);
		if(PlayerText:PartyColor[PartyInfo[partyid][pMember][pupdate]][id])  PlayerTextDrawDestroy(PartyInfo[partyid][pMember][pupdate], PartyColor[PartyInfo[partyid][pMember][pupdate]][id]);
		if(PlayerText:PartyNumber[PartyInfo[partyid][pMember][pupdate]][id]) PlayerTextDrawDestroy(PartyInfo[partyid][pMember][pupdate], PartyNumber[PartyInfo[partyid][pMember][pupdate]][id]);
	*/
	}
}

stock HidePlayerPartyBoxIndex(playerid, id) {
	PlayerTextDrawHide(playerid, PartyNameBox[playerid][id]);
	PlayerTextDrawHide(playerid, PartyHealthBox[playerid][id]);	
	PlayerTextDrawHide(playerid, PartyName[playerid][id]);
	PlayerTextDrawHide(playerid, PartyHealth[playerid][id]);
	PlayerTextDrawHide(playerid, PartyColor[playerid][id]);
	PlayerTextDrawHide(playerid, PartyNumber[playerid][id]);
}

stock ShowPlayerPartyBoxIndex(playerid, id) {
	PlayerTextDrawShow(playerid, PartyNameBox[playerid][id]);
	PlayerTextDrawShow(playerid, PartyHealthBox[playerid][id]);	
	PlayerTextDrawShow(playerid, PartyName[playerid][id]);
	PlayerTextDrawShow(playerid, PartyHealth[playerid][id]);
	PlayerTextDrawShow(playerid, PartyColor[playerid][id]);
	PlayerTextDrawShow(playerid, PartyNumber[playerid][id]);
}

stock SetPartyBox(playerid, bool:on) {

	if(InParty[playerid] != -1) {
		PartyBox{playerid}=on;
		if(!on) {
			HidePlayerPartyBox(playerid);
		}
	}

}

stock ShowPlayerPartyBox(playerid) {
	if(InParty[playerid] != -1 && PartyBox{playerid}) {

		HidePlayerPartyBox(playerid);

		for(new i=0;i!=4;i++) {
			if(PartyInfo[InParty[playerid]][pMember][i] != INVALID_PLAYER_ID && InGame{PartyInfo[InParty[playerid]][pMember][i]}) {
				ShowPlayerPartyBoxIndex(playerid, i);
			}
		}
	}
}

stock UpdatePartyBox(partyid, bool:rebuild) {
	if(partyid != -1) {

		new count;
		
		for(new pupdate=0;pupdate!=MAX_PARTY_MEMBER;pupdate++) {
			if(PartyInfo[partyid][pMember][pupdate] != INVALID_PLAYER_ID && InGame{PartyInfo[partyid][pMember][pupdate]} && PartyBox{PartyInfo[partyid][pMember][pupdate]}) {
				
				count = 0;
				
				if(rebuild) {
					DestroyPlayerPartyBox(PartyInfo[partyid][pMember][pupdate]);
				}
				
				for(new i=MAX_PARTY_MEMBER-1;i>=0;i--) {
					//printf("i = %d", i);
					if(PartyInfo[partyid][pMember][i] != INVALID_PLAYER_ID && InGame{PartyInfo[partyid][pMember][i]}) {
					
						if(rebuild) {
							//printf("partyid %d PartyInfo[partyid][pMember][pupdate] %d count %d", partyid, PartyInfo[partyid][pMember][pupdate], count);

							/*TextDrawShowForPlayer(PartyInfo[partyid][pMember][pupdate], PartyNameBox[count]);
							TextDrawShowForPlayer(PartyInfo[partyid][pMember][pupdate], PartyHealthBox[count]);*/
							
							PartyNameBox[PartyInfo[partyid][pMember][pupdate]][count] = CreatePlayerTextDraw(PartyInfo[partyid][pMember][pupdate], 114.000000, 268.308898 - (17.417617 * float(count)), "usebox"); // - 17.417617
							PlayerTextDrawLetterSize(PartyInfo[partyid][pMember][pupdate], PartyNameBox[PartyInfo[partyid][pMember][pupdate]][count], 0.000000, 0.955429);
							PlayerTextDrawTextSize(PartyInfo[partyid][pMember][pupdate], PartyNameBox[PartyInfo[partyid][pMember][pupdate]][count], 26.799999, 0.000000);
							PlayerTextDrawAlignment(PartyInfo[partyid][pMember][pupdate], PartyNameBox[PartyInfo[partyid][pMember][pupdate]][count], 1);
							PlayerTextDrawColor(PartyInfo[partyid][pMember][pupdate], PartyNameBox[PartyInfo[partyid][pMember][pupdate]][count], 0);
							PlayerTextDrawUseBox(PartyInfo[partyid][pMember][pupdate], PartyNameBox[PartyInfo[partyid][pMember][pupdate]][count], true);
							PlayerTextDrawBoxColor(PartyInfo[partyid][pMember][pupdate], PartyNameBox[PartyInfo[partyid][pMember][pupdate]][count], 102);
							PlayerTextDrawSetShadow(PartyInfo[partyid][pMember][pupdate], PartyNameBox[PartyInfo[partyid][pMember][pupdate]][count], 0);
							PlayerTextDrawSetOutline(PartyInfo[partyid][pMember][pupdate], PartyNameBox[PartyInfo[partyid][pMember][pupdate]][count], 0);
							PlayerTextDrawFont(PartyInfo[partyid][pMember][pupdate], PartyNameBox[PartyInfo[partyid][pMember][pupdate]][count], 0);
							PlayerTextDrawShow(PartyInfo[partyid][pMember][pupdate], PartyNameBox[PartyInfo[partyid][pMember][pupdate]][count]);

							PartyHealthBox[PartyInfo[partyid][pMember][pupdate]][count] = CreatePlayerTextDraw(PartyInfo[partyid][pMember][pupdate], 113.200057, 276.273315 - (17.417617 * float(count)), "usebox");
							PlayerTextDrawLetterSize(PartyInfo[partyid][pMember][pupdate], PartyHealthBox[PartyInfo[partyid][pMember][pupdate]][count], 0.000000, 0.039873);
							PlayerTextDrawTextSize(PartyInfo[partyid][pMember][pupdate], PartyHealthBox[PartyInfo[partyid][pMember][pupdate]][count], 27.199996, 0.000000);
							PlayerTextDrawAlignment(PartyInfo[partyid][pMember][pupdate], PartyHealthBox[PartyInfo[partyid][pMember][pupdate]][count], 1);
							PlayerTextDrawColor(PartyInfo[partyid][pMember][pupdate], PartyHealthBox[PartyInfo[partyid][pMember][pupdate]][count], 0);
							PlayerTextDrawUseBox(PartyInfo[partyid][pMember][pupdate], PartyHealthBox[PartyInfo[partyid][pMember][pupdate]][count], true);
							PlayerTextDrawBoxColor(PartyInfo[partyid][pMember][pupdate], PartyHealthBox[PartyInfo[partyid][pMember][pupdate]][count], 102);
							PlayerTextDrawSetShadow(PartyInfo[partyid][pMember][pupdate], PartyHealthBox[PartyInfo[partyid][pMember][pupdate]][count], 0);
							PlayerTextDrawSetOutline(PartyInfo[partyid][pMember][pupdate], PartyHealthBox[PartyInfo[partyid][pMember][pupdate]][count], 0);
							PlayerTextDrawFont(PartyInfo[partyid][pMember][pupdate], PartyHealthBox[PartyInfo[partyid][pMember][pupdate]][count], 0);
							PlayerTextDrawShow(PartyInfo[partyid][pMember][pupdate], PartyHealthBox[PartyInfo[partyid][pMember][pupdate]][count]);
	
							PartyName[PartyInfo[partyid][pMember][pupdate]][count] = CreatePlayerTextDraw(PartyInfo[partyid][pMember][pupdate], 36.000049, 266.311431 - (17.417617 * float(count)), ReturnName(PartyInfo[partyid][pMember][i]));
							PlayerTextDrawLetterSize(PartyInfo[partyid][pMember][pupdate], PartyName[PartyInfo[partyid][pMember][pupdate]][count], 0.152796, 0.878220);
							PlayerTextDrawAlignment(PartyInfo[partyid][pMember][pupdate], PartyName[PartyInfo[partyid][pMember][pupdate]][count], 1);
							PlayerTextDrawColor(PartyInfo[partyid][pMember][pupdate], PartyName[PartyInfo[partyid][pMember][pupdate]][count], -1);
							PlayerTextDrawUseBox(PartyInfo[partyid][pMember][pupdate], PartyName[PartyInfo[partyid][pMember][pupdate]][count], true);
							PlayerTextDrawBoxColor(PartyInfo[partyid][pMember][pupdate], PartyName[PartyInfo[partyid][pMember][pupdate]][count], 0);
							PlayerTextDrawSetShadow(PartyInfo[partyid][pMember][pupdate], PartyName[PartyInfo[partyid][pMember][pupdate]][count], 0);
							PlayerTextDrawSetOutline(PartyInfo[partyid][pMember][pupdate], PartyName[PartyInfo[partyid][pMember][pupdate]][count], 0);
							PlayerTextDrawBackgroundColor(PartyInfo[partyid][pMember][pupdate], PartyName[PartyInfo[partyid][pMember][pupdate]][count], 51);
							PlayerTextDrawFont(PartyInfo[partyid][pMember][pupdate], PartyName[PartyInfo[partyid][pMember][pupdate]][count], 1);
							PlayerTextDrawSetProportional(PartyInfo[partyid][pMember][pupdate], PartyName[PartyInfo[partyid][pMember][pupdate]][count], 1);
							PlayerTextDrawShow(PartyInfo[partyid][pMember][pupdate], PartyName[PartyInfo[partyid][pMember][pupdate]][count]);
							
							new Float:hp = PlayerData[PartyInfo[partyid][pMember][count]][pHealth];
							new Float:h_percent = hp * 112.600097 / 100.0;
							if(h_percent < 30.600069) h_percent = 30.600069;
							if(h_percent > 112.600097) h_percent = 112.600097;
							
							new color = 255, alpha = 128;
							
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
							PartyHealth[PartyInfo[partyid][pMember][pupdate]][count] = CreatePlayerTextDraw(PartyInfo[partyid][pMember][pupdate], h_percent, 276.277770 - (17.417617 * float(count)), "usebox"); // เลือด
							PlayerTextDrawLetterSize(PartyInfo[partyid][pMember][pupdate], PartyHealth[PartyInfo[partyid][pMember][pupdate]][count], 0.000000, 0.039872);
							PlayerTextDrawTextSize(PartyInfo[partyid][pMember][pupdate], PartyHealth[PartyInfo[partyid][pMember][pupdate]][count], 27.199996, 0.000000);
							PlayerTextDrawAlignment(PartyInfo[partyid][pMember][pupdate], PartyHealth[PartyInfo[partyid][pMember][pupdate]][count], 1);
							PlayerTextDrawColor(PartyInfo[partyid][pMember][pupdate], PartyHealth[PartyInfo[partyid][pMember][pupdate]][count], 0);
							PlayerTextDrawUseBox(PartyInfo[partyid][pMember][pupdate], PartyHealth[PartyInfo[partyid][pMember][pupdate]][count], true);
							PlayerTextDrawBoxColor(PartyInfo[partyid][pMember][pupdate], PartyHealth[PartyInfo[partyid][pMember][pupdate]][count], CreateRGB(255, color, color, alpha));
							PlayerTextDrawSetShadow(PartyInfo[partyid][pMember][pupdate], PartyHealth[PartyInfo[partyid][pMember][pupdate]][count], 0);
							PlayerTextDrawSetOutline(PartyInfo[partyid][pMember][pupdate], PartyHealth[PartyInfo[partyid][pMember][pupdate]][count], 0);
							PlayerTextDrawFont(PartyInfo[partyid][pMember][pupdate], PartyHealth[PartyInfo[partyid][pMember][pupdate]][count], 0);
							PlayerTextDrawShow(PartyInfo[partyid][pMember][pupdate], PartyHealth[PartyInfo[partyid][pMember][pupdate]][count]);
							
							PartyColor[PartyInfo[partyid][pMember][pupdate]][count] = CreatePlayerTextDraw(PartyInfo[partyid][pMember][pupdate], 36.800003, 268.806640 - (17.417617 * float(count)), "usebox"); // กล่องสี
							PlayerTextDrawLetterSize(PartyInfo[partyid][pMember][pupdate], PartyColor[PartyInfo[partyid][pMember][pupdate]][count], 0.000000, 0.402345);
							PlayerTextDrawTextSize(PartyInfo[partyid][pMember][pupdate], PartyColor[PartyInfo[partyid][pMember][pupdate]][count], 27.199998, 0.000000);
							PlayerTextDrawAlignment(PartyInfo[partyid][pMember][pupdate], PartyColor[PartyInfo[partyid][pMember][pupdate]][count], 1);
	
							PlayerTextDrawUseBox(PartyInfo[partyid][pMember][pupdate], PartyColor[PartyInfo[partyid][pMember][pupdate]][count], true);
							switch(i) {
								case 0: PlayerTextDrawBoxColor(PartyInfo[partyid][pMember][pupdate], PartyColor[PartyInfo[partyid][pMember][pupdate]][count], TEAM_RED);
								case 1: PlayerTextDrawBoxColor(PartyInfo[partyid][pMember][pupdate], PartyColor[PartyInfo[partyid][pMember][pupdate]][count], TEAM_GREEN);
								case 2: PlayerTextDrawBoxColor(PartyInfo[partyid][pMember][pupdate], PartyColor[PartyInfo[partyid][pMember][pupdate]][count], TEAM_BLUE);
								case 3: PlayerTextDrawBoxColor(PartyInfo[partyid][pMember][pupdate], PartyColor[PartyInfo[partyid][pMember][pupdate]][count], TEAM_YELLOW);
							}
							PlayerTextDrawSetShadow(PartyInfo[partyid][pMember][pupdate], PartyColor[PartyInfo[partyid][pMember][pupdate]][count], 0);
							PlayerTextDrawSetOutline(PartyInfo[partyid][pMember][pupdate], PartyColor[PartyInfo[partyid][pMember][pupdate]][count], 0);
							PlayerTextDrawFont(PartyInfo[partyid][pMember][pupdate], PartyColor[PartyInfo[partyid][pMember][pupdate]][count], 0);
							PlayerTextDrawShow(PartyInfo[partyid][pMember][pupdate], PartyColor[PartyInfo[partyid][pMember][pupdate]][count]);
							
							new number[16];
							format(number, 16, "%d", i + 1);
							PartyNumber[PartyInfo[partyid][pMember][pupdate]][count] = CreatePlayerTextDraw(PartyInfo[partyid][pMember][pupdate], 31.600019, 265.315551 - (17.417617 * float(count)), number); // หมายเลข
							PlayerTextDrawLetterSize(PartyInfo[partyid][pMember][pupdate], PartyNumber[PartyInfo[partyid][pMember][pupdate]][count], 0.232396, 1.052440);
							PlayerTextDrawAlignment(PartyInfo[partyid][pMember][pupdate], PartyNumber[PartyInfo[partyid][pMember][pupdate]][count], 2);
							PlayerTextDrawColor(PartyInfo[partyid][pMember][pupdate], PartyNumber[PartyInfo[partyid][pMember][pupdate]][count], -1);
							PlayerTextDrawUseBox(PartyInfo[partyid][pMember][pupdate], PartyNumber[PartyInfo[partyid][pMember][pupdate]][count], true);
							PlayerTextDrawBoxColor(PartyInfo[partyid][pMember][pupdate], PartyNumber[PartyInfo[partyid][pMember][pupdate]][count], 0);
							PlayerTextDrawSetShadow(PartyInfo[partyid][pMember][pupdate], PartyNumber[PartyInfo[partyid][pMember][pupdate]][count], 0);
							PlayerTextDrawSetOutline(PartyInfo[partyid][pMember][pupdate], PartyNumber[PartyInfo[partyid][pMember][pupdate]][count], 0);
							PlayerTextDrawBackgroundColor(PartyInfo[partyid][pMember][pupdate], PartyNumber[PartyInfo[partyid][pMember][pupdate]][count], 51);
							PlayerTextDrawFont(PartyInfo[partyid][pMember][pupdate], PartyNumber[PartyInfo[partyid][pMember][pupdate]][count], 1);
							PlayerTextDrawSetProportional(PartyInfo[partyid][pMember][pupdate], PartyNumber[PartyInfo[partyid][pMember][pupdate]][count], 1);
							PlayerTextDrawShow(PartyInfo[partyid][pMember][pupdate], PartyNumber[PartyInfo[partyid][pMember][pupdate]][count]);
						}
						else {
	
							PlayerTextDrawDestroy(PartyInfo[partyid][pMember][pupdate], PartyHealth[PartyInfo[partyid][pMember][pupdate]][count]);
							
							new Float:hp = PlayerData[PartyInfo[partyid][pMember][i]][pHealth];
							new Float:h_percent = hp * 112.600097 / 100.0;
							if(h_percent < 30.600069) h_percent = 30.600069;
							if(h_percent > 112.600097) h_percent = 112.600097;
							
							new color = 255, alpha = 128;
							
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
							PartyHealth[PartyInfo[partyid][pMember][pupdate]][count] = CreatePlayerTextDraw(PartyInfo[partyid][pMember][pupdate], h_percent, 276.277770 - (17.417617 * float(count)), "usebox"); // เลือด
							//PlayerTextDrawBoxColor(PartyInfo[partyid][pMember][pupdate], PartyHealth[PartyInfo[partyid][pMember][pupdate]][count], CreateRGB(255, color, color, alpha));
							PlayerTextDrawLetterSize(PartyInfo[partyid][pMember][pupdate], PartyHealth[PartyInfo[partyid][pMember][pupdate]][count], 0.000000, 0.039872);
							PlayerTextDrawTextSize(PartyInfo[partyid][pMember][pupdate], PartyHealth[PartyInfo[partyid][pMember][pupdate]][count], 27.199996, 0.000000);
							PlayerTextDrawAlignment(PartyInfo[partyid][pMember][pupdate], PartyHealth[PartyInfo[partyid][pMember][pupdate]][count], 1);
							PlayerTextDrawColor(PartyInfo[partyid][pMember][pupdate], PartyHealth[PartyInfo[partyid][pMember][pupdate]][count], 0);
							PlayerTextDrawUseBox(PartyInfo[partyid][pMember][pupdate], PartyHealth[PartyInfo[partyid][pMember][pupdate]][count], true);
							PlayerTextDrawBoxColor(PartyInfo[partyid][pMember][pupdate], PartyHealth[PartyInfo[partyid][pMember][pupdate]][count], CreateRGB(255, color, color, alpha));
							PlayerTextDrawSetShadow(PartyInfo[partyid][pMember][pupdate], PartyHealth[PartyInfo[partyid][pMember][pupdate]][count], 0);
							PlayerTextDrawSetOutline(PartyInfo[partyid][pMember][pupdate], PartyHealth[PartyInfo[partyid][pMember][pupdate]][count], 0);
							PlayerTextDrawFont(PartyInfo[partyid][pMember][pupdate], PartyHealth[PartyInfo[partyid][pMember][pupdate]][count], 0);
							PlayerTextDrawShow(PartyInfo[partyid][pMember][pupdate], PartyHealth[PartyInfo[partyid][pMember][pupdate]][count]);
						}
						count++;
					}
				}
			}
		}
	}
}