#include <YSI\y_hooks>

#define NO_PARTY			-1
#define MAX_PARTIES 		100
#define MAX_PARTY_MEMBER 	4

new PlayerParty[MAX_PLAYERS];
new PartyOffer[MAX_PLAYERS];
new PartyOffered[MAX_PLAYERS];
new PlayerPartyReady[MAX_PLAYERS char];

enum E_PARTY_DATA
{
    bool:pExists,
	pJoined,
	pLeader,
	pMember[MAX_PARTY_MEMBER],
}

new PartyInfo[MAX_PARTIES][E_PARTY_DATA];

hook OnPlayerConnect(playerid) {
	PlayerParty[playerid]=NO_PARTY;
	PlayerPartyReady{playerid}=false;
	PartyOffer[playerid]=INVALID_PLAYER_ID;
	PartyOffered[playerid]=NO_PARTY;
	return 1;
}

hook OnPlayerDisconnect(playerid, reason) {
	Party_Leave(playerid, PlayerParty[playerid]);
	return 1;
}

hook OnGameModeInit()
{
	for (new i; i != MAX_PARTIES; i++)
 	{
		PartyInfo[i][pExists] = false;
		PartyInfo[i][pJoined] = -1;
  		PartyInfo[i][pLeader] = INVALID_PLAYER_ID;
		
		for (new x; x != MAX_PARTY_MEMBER; x++)
		{
			PartyInfo[i][pMember][x] = INVALID_PLAYER_ID;
		}
    }
	return 1;
}

Party_GetPartyLeaderID(partyid) {
	if(partyid != NO_PARTY) {
		return PartyInfo[partyid][pLeader];
	}
	return INVALID_PLAYER_ID;
}

Party_GetPlayerPartySlot(playerid) {
	if(PlayerParty[playerid] != NO_PARTY) {
		for (new x; x != MAX_PARTY_MEMBER; x++)
		{
			if(PartyInfo[PlayerParty[playerid]][pMember][x] == playerid) {
				return x;
			}
		}
	}
	return INVALID_PLAYER_ID;
}

Party_CountMember(partyid) {
	new count;
	if(partyid != NO_PARTY) {
		for (new x; x != MAX_PARTY_MEMBER; x++)
		{
			if(PartyInfo[partyid][pMember][x] != INVALID_PLAYER_ID) count++;
		}
	}
	return count;
}

Party_CountReady(partyid) {
	new count;
	if(partyid != NO_PARTY) {
		for (new x; x != MAX_PARTY_MEMBER; x++)
		{
			if(PartyInfo[partyid][pMember][x] != INVALID_PLAYER_ID) {
				if(PlayerPartyReady{PartyInfo[partyid][pMember][x]}) {
					count++;
				}
			}
		}
	}
	return count;
}

Party_UpdateLobbyMenu(partyid) {
	if(partyid != NO_PARTY) {
		for (new x; x != MAX_PARTY_MEMBER; x++)
		{
			if(PartyInfo[partyid][pMember][x] != INVALID_PLAYER_ID) {
				Lobby_TextDrawUpdate(PartyInfo[partyid][pMember][x]);
			}
		}
	}
	return 1;
}

Party_UpdateUI(partyid) {
	if(partyid != NO_PARTY) {
		for (new x; x != MAX_PARTY_MEMBER; x++)
		{
			if(PartyInfo[partyid][pMember][x] != INVALID_PLAYER_ID) {
				UpdatePlayerPartyBox(PartyInfo[partyid][pMember][x]);
			}
		}
	}
	return 1;
}

Party_Create(member1, member2 = INVALID_PLAYER_ID, member3 = INVALID_PLAYER_ID, member4 = INVALID_PLAYER_ID) {
	for (new i; i != MAX_PARTIES; i++)
 	{
		if(!PartyInfo[i][pExists]) {
		
			PartyInfo[i][pExists]=true;
			PartyInfo[i][pLeader]=member1;
			PartyInfo[i][pMember][0] = member1;
			PartyInfo[i][pMember][1] = member2;
			PartyInfo[i][pMember][2] = member3;
			PartyInfo[i][pMember][3] = member4;
			
			printf("Party %d created %d, %d ,%d, %d", i, member1, member2, member3, member4);
			return i;
		}
	}
	return NO_PARTY;
}

Party_Add(partyid, targetid) {
	if(partyid != NO_PARTY) {
		for (new x; x != MAX_PARTY_MEMBER; x++)
		{
			if(PartyInfo[partyid][pExists] && PartyInfo[partyid][pMember][x] != INVALID_PLAYER_ID) {
				PartyInfo[partyid][pMember][x] = targetid;
				printf("Player %d join party %d", targetid, partyid);
			}
		}
	}
	return NO_PARTY;
}

Party_Leave(playerid, &partyid) {
	if(partyid != NO_PARTY) {
		new temp_party = partyid, count=0;
		for (new x; x != MAX_PARTY_MEMBER; x++)
		{
			if(PartyInfo[temp_party][pExists] && PartyInfo[temp_party][pMember][x] != INVALID_PLAYER_ID) {
				if(PartyInfo[temp_party][pMember][x] == playerid) {
					
					if(!Lobby_IsPlayerInGame(playerid) && GetPlayerJoinMatch(playerid) == -1)
						SpawnPlayer(PartyInfo[temp_party][pMember][x]);
						
					PartyInfo[temp_party][pMember][x]=INVALID_PLAYER_ID;
					partyid = NO_PARTY;
					

					printf("Player %d leave party %d", playerid, temp_party);	
				}
				count++;
			}
		}
		printf("leave count %d", count);
		if(count<=2) {
		
			new temp_matchingid = GetPlayerJoinMatch(playerid);
			
			if(temp_matchingid != -1)
				MatchingPartyDestroy(temp_matchingid);
			
			PartyInfo[temp_party][pJoined] =-1;
			PartyInfo[temp_party][pExists] = false;
			PartyInfo[temp_party][pLeader] = INVALID_PLAYER_ID;
			
			for (new x; x != MAX_PARTY_MEMBER; x++)
			{
				if(PartyInfo[temp_party][pMember][x] != INVALID_PLAYER_ID) {
					if(!Lobby_IsPlayerInGame(PartyInfo[temp_party][pMember][x]) && GetPlayerJoinMatch(PartyInfo[temp_party][pMember][x]) == -1)
						SpawnPlayer(PartyInfo[temp_party][pMember][x]);
					else Party_UpdateUI(temp_party);
					
					PlayerParty[PartyInfo[temp_party][pMember][x]]=NO_PARTY;
				}
				PartyInfo[temp_party][pMember][x] = INVALID_PLAYER_ID;
			}
			
			printf("party %d destroy", temp_party);
		}
		else {
			if(PartyInfo[temp_party][pLeader] == playerid) { // Leader Leave
				for (new x; x != MAX_PARTY_MEMBER; x++)
				{
					if(PartyInfo[temp_party][pMember][x] != INVALID_PLAYER_ID) {
						if(PartyInfo[temp_party][pLeader] == playerid) {
							PartyInfo[temp_party][pLeader] = PartyInfo[temp_party][pMember][x];
						}

						if(!Lobby_IsPlayerInGame(PartyInfo[temp_party][pMember][x]) && GetPlayerJoinMatch(PartyInfo[temp_party][pMember][x]) == -1) 
							SpawnPlayer(PartyInfo[temp_party][pMember][x]);
						else 
							Party_UpdateUI(temp_party);
					}
				}
				printf("party %d search for new leader %d", temp_party, PartyInfo[temp_party][pLeader]);
			}
		}
	}
	return 1;
}

CMD:invite(playerid, params[])
{
	new targetid = INVALID_PLAYER_ID;
	if(sscanf(params, "u", targetid)) return SendClientMessage(playerid, COLOR_GRAD1, "[USAGE]: /invite [playerid]");
	
	if(targetid == INVALID_PLAYER_ID || playerid == targetid || Lobby_IsPlayerInGame(playerid) || Lobby_IsPlayerInGame(targetid) || (PlayerParty[playerid] != NO_PARTY && PlayerParty[playerid] == PlayerParty[targetid])) 	
		return 1;

	if(PlayerParty[targetid]!=NO_PARTY) 	
		GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~That player already in a party.", 2000, 3);
	
	PartyOffer[targetid] = playerid;
    PartyOffered[targetid] = PlayerParty[playerid];

    SendClientMessageEx(playerid, COLOR_YELLOW3, "   �س���ԭ %s ����������������",  ReturnName(targetid));
    SendClientMessageEx(targetid, COLOR_YELLOW3, "   %s ��ǹ���س������������� (�� \"/partyaccept\")", ReturnName(playerid));

	/*if(PlayerParty[playerid]==NO_PARTY) {
		partyid = Party_Create(playerid, targetid);
		if(partyid != NO_PARTY) {
			PlayerParty[targetid] = partyid;
			PlayerParty[playerid] = partyid;
			
			SpawnPlayer(playerid);
			SpawnPlayer(targetid);
		}
		else {
			GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~Servers not response.", 2000, 3);
			return 1;
		}
	}
	else {
		partyid = Party_Add(PlayerParty[playerid], targetid);
		if(partyid != NO_PARTY) {
			PlayerParty[targetid] = partyid;
			SpawnPlayer(targetid);
		}
		else {
			GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~Your party is full.", 2000, 3);
			return 1;
		}
	}*/
 	return 1;
}

CMD:partyaccept(playerid, params[])
{
	if (PartyOffer[playerid] != INVALID_PLAYER_ID)
	{
	    new
	        targetid = PartyOffer[playerid],
	        partyid = PartyOffered[playerid];

		PartyOffer[playerid]=INVALID_PLAYER_ID;
		PartyOffered[playerid]=NO_PARTY;
		
		if(PlayerParty[targetid]==NO_PARTY || partyid != NO_PARTY || GetPlayerJoinMatch(targetid) != -1) 
			GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~The party does not exist", 2000, 3);
		
		if(PlayerParty[targetid] != NO_PARTY || PlayerParty[targetid] != partyid) 
			GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~The party does not exist", 2000, 3);
			
		if(PlayerParty[targetid]==NO_PARTY) {
			partyid = Party_Create(targetid, playerid);
			if(partyid != NO_PARTY) {
				PlayerParty[playerid] = partyid;
				PlayerParty[targetid] = partyid;
				
				SpawnPlayer(targetid);
				SpawnPlayer(playerid);
			}
			else {
				GameTextForPlayer(targetid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~Servers not response.", 2000, 3);
				return 1;
			}
		}
		else {
			partyid = Party_Add(PlayerParty[targetid], playerid);
			if(partyid != NO_PARTY) {
				PlayerParty[playerid] = partyid;
				SpawnPlayer(playerid);
			}
			else {
				GameTextForPlayer(targetid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~Your party is full.", 2000, 3);
				return 1;
			}
		}
	}
	return 1;
}

CMD:leaveparty(playerid, params[])
{
	if(Lobby_IsPlayerInGame(playerid)) 	
		return 1;
	
	Party_Leave(playerid, PlayerParty[playerid]);
	return 1;
}