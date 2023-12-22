hook OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
    if(playertextid == LobbyStart[playerid])
    {
         cmd_matchmaking(playerid);
         return 1;
    }
    else if(playertextid == Lobby4[playerid]) // Solo
    {
		if(InParty[playerid] == -1) {
			MatchingType[playerid] = MATCHING_SOLO;
			UpdateLobbyMenu(playerid);
		}
		return 1;
    }
    else if(playertextid == Lobby5[playerid]) // Duo
    {
		if(InParty[playerid] != -1 && PartyCount(InParty[playerid]) == 2 && IsPartyLeader(playerid)) {
			MatchingType[playerid] = MATCHING_DUO;
			PartyCheck(InParty[playerid]);
		}
		return 1;
    }
    else if(playertextid == Lobby6[playerid]) // Squad
    {
		if(InParty[playerid] != -1 && PartyCount(InParty[playerid]) > 2 && IsPartyLeader(playerid)) {
			MatchingType[playerid] = MATCHING_DUO;
			PartyCheck(InParty[playerid]);
		}
		return 1;
    }
    else if(playertextid == Lobby7[playerid]) // One Man
    {
		if(InParty[playerid] == -1) {
			MatchingType[playerid] = MATCHING_SQUAD;
			UpdateLobbyMenu(playerid);
		}
		return 1;
    }
    return 1;
}

ShowLobbyMenu(playerid) {

	PlayerTextDrawSetString(playerid, LobbyStart[playerid], "START");
	
	if(GetPlayerParty(playerid) != -1) {
		PlayerTextDrawSetString(playerid, LobbyStart[playerid], "READY");
	}
	
	PlayerTextDrawShow(playerid, LobbyStart[playerid]); // Start Button #D4AC0D
	PlayerTextDrawShow(playerid, Lobby1[playerid]);
	PlayerTextDrawShow(playerid, Lobby2[playerid]);
	PlayerTextDrawShow(playerid, Lobby3[playerid]);
	PlayerTextDrawShow(playerid, Lobby4[playerid]);
	PlayerTextDrawShow(playerid, Lobby5[playerid]);
	PlayerTextDrawShow(playerid, Lobby6[playerid]);
	PlayerTextDrawShow(playerid, Lobby7[playerid]);
	PlayerTextDrawShow(playerid, Lobby8[playerid]);
	PlayerTextDrawShow(playerid, Lobby9[playerid]);
	PlayerTextDrawShow(playerid, Lobby10[playerid]);
	PlayerTextDrawShow(playerid, Lobby11[playerid]);
}

HideLobbyMenu(playerid) {
	PlayerTextDrawHide(playerid, LobbyStart[playerid]); // Start Button #D4AC0D
	PlayerTextDrawHide(playerid, Lobby1[playerid]);
	PlayerTextDrawHide(playerid, Lobby2[playerid]);
	PlayerTextDrawHide(playerid, Lobby3[playerid]);
	PlayerTextDrawHide(playerid, Lobby4[playerid]);
	PlayerTextDrawHide(playerid, Lobby5[playerid]);
	PlayerTextDrawHide(playerid, Lobby6[playerid]);
	PlayerTextDrawHide(playerid, Lobby7[playerid]);
	PlayerTextDrawHide(playerid, Lobby8[playerid]);
	PlayerTextDrawHide(playerid, Lobby9[playerid]);
	PlayerTextDrawHide(playerid, Lobby10[playerid]);
	PlayerTextDrawHide(playerid, Lobby11[playerid]);
}

CMD:matchmaking(playerid) {

	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 1;
	
	new partyid = GetPlayerParty(playerid);
	if(partyid != -1) {
		if(PlayerReady{playerid}) {
			GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~Cancelled", 2000, 3);
			PlayerTextDrawSetString(playerid, LobbyStart[playerid], "Ready");
			PlayerReady{playerid}=false;
			
			ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		}
		else {
			GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~Ready", 2000, 3);
			PlayerTextDrawSetString(playerid, LobbyStart[playerid], "Cancel");
			PlayerReady{playerid}=true;
			
			ApplyAnimation(playerid, "COP_AMBIENT", "COPLOOK_LOOP", 4.1, false, false, false, true, 0, false);
			
			if(PartyMatchmaking(partyid)) {
				MatchmakingSearch(playerid, MatchingType[playerid]);
				PartyPlayerGameText(partyid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~STARTED MATCHMAKING...", 5000);
				/*
				if(matchid == -1) {
					PartyPlayerGameText(partyid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~Servers are too busy", 2000);
					PartyPlayerText(partyid, "Ready");
					PartyReady(partyid, false);
				}
				else {
					PartyPlayerGameText(partyid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~STARTED MATCHMAKING...", 5000);
					//SetPartyMatchmaking(partyid, matchid);
					//PartyReady(partyid, false);
					//printf("Party Match Start");
				}
				*/
			}
		}
	}
	else {
	
		PlayerTextDrawSetString(playerid, LobbyStart[playerid], "Cancel");
		
		if(PlayerInMatching[playerid] == -1) {
			MatchmakingSearch(playerid, MatchingType[playerid]);
			GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~STARTED MATCHMAKING...", 5000, 3);
			/*if((PlayerInMatching[playerid] = MatchmakingSearch(playerid, MatchingType[playerid], -1)) == -1) {

				GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~Servers are too busy", 2000, 3);
				PlayerTextDrawSetString(playerid, LobbyStart[playerid], "Start");
				
			}
			else {
				GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~STARTED MATCHMAKING...", 5000, 3);
				PlayerReady{playerid}=false;
			}*/
			
		}
		else {
			if(!InGame{playerid} && !InPlane{playerid}) {
				new matchid = PlayerInMatching[playerid];
				
				if(matchid != -1) {
					MatchMaking[matchid][m_Alive]--;
					UpdateAliveText(matchid);
				}
				InPlane{playerid} = false;
				PlayerInMatching[playerid] = -1;

				if(TD_IsCircleCreated(playerid)) {
					TD_DestroyCircle(playerid);
				}
				GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~Cancelled", 2000, 3);
				
				PlayerTextDrawSetString(playerid, LobbyStart[playerid], "Start");
			}
		}
	}
	return 1;
}

CMD:map(playerid) {
	if(PlayerInMatching[playerid] != -1 && InGame{playerid}) {
		if(openMap{playerid}) {
			PlayerMap(playerid, false);
			//PlayerCompass(playerid, true);
			PlayerTimeUI(playerid, true);
			
			if(InParty[playerid] != -1) {
				SetPartyBox(playerid, true);
				UpdatePartyBox(InParty[playerid], true);
			}
		}
		else {
			PlayerTimeUI(playerid, false);
			//PlayerCompass(playerid, false);
			PlayerMap(playerid, true);
			
			if(InParty[playerid] != -1) {
				SetPartyBox(playerid, false);
			}
		}
	}
	return 1;
}

CMD:jump(playerid) {
	if(PlayerInMatching[playerid] != -1 && InGame{playerid} && InPlane{playerid}) {

		TextDrawHideForPlayer(playerid, TDJump);
	
		InPlane{playerid} = false;

		TogglePlayerSpectating(playerid, false);
		
		// Weapon Set
		GivePlayerWeapon(playerid, 24, 50);
		GivePlayerWeapon(playerid, 25, 60);
		GivePlayerWeapon(playerid, 29, 300);
		GivePlayerWeapon(playerid, 30, 200);
		SetPlayerArmour(playerid, 100.0);
		
		new Float:x, Float:y, Float:z;
		GetVehiclePos(MatchMaking[PlayerInMatching[playerid]][m_Plane], x, y, z);
		GivePlayerWeapon(playerid, 46, 1);
		SetPlayerPos(playerid, x, y, z - 10);
		SetPlayerHealthEx(playerid, 100);
	}
	return 1;
}

CMD:exit(playerid) {

	new matchid = PlayerInMatching[playerid];
	ResetPlayerToLobby(playerid);
	
	if(matchid != -1) {
		PlayerData[playerid][pDeaths]++;
		CheckWinner(matchid);
	}

	return 1;
}

CMD:ga(playerid) {
	GivePlayerWeapon(playerid, 24, 100);
	return 1;
}

CMD:car(playerid) {
	if(PlayerInMatching[playerid] != -1 && InGame{playerid}) {
		GetPlayerPos(playerid, PlayerData[playerid][pPosX], PlayerData[playerid][pPosY], PlayerData[playerid][pPosZ]);
		new carid = CreateVehicle(404, PlayerData[playerid][pPosX], PlayerData[playerid][pPosY], PlayerData[playerid][pPosZ], 0, -1, -1, -1);
		SetVehicleVirtualWorld(carid, PlayerInMatching[playerid]+1);
		PutPlayerInVehicle(playerid, carid, 0);
	}
	return 1;
}

CMD:help(playerid) {
	SendClientMessage(playerid, -1, "[HELP] /partyhelp, /gamehelp");
	SendClientMessage(playerid, COLOR_YELLOW, "*** เซิร์ฟเวอร์ยังอยู่ในการพัฒนาท่านสามารถแนะนำ หรือรายงานบัคต่าง ๆ ให้เราได้ที่นี่ SA-MP SA-MP-PUBG");
	return 1;
}

stock UpdateLobbyMenu(playerid) {
	if(GetPlayerPartyID(playerid) != NO_PARTY) {
		switch(MatchingType[playerid]) {
			case MATCHING_SOLO: {
				PlayerTextDrawColor(playerid,Lobby4[playerid], -726921729);
				PlayerTextDrawBoxColor(playerid,Lobby4[playerid], 128);
				PlayerTextDrawShow(playerid, Lobby4[playerid]);
				
				PlayerTextDrawColor(playerid,Lobby5[playerid], -1);
				PlayerTextDrawBoxColor(playerid,Lobby5[playerid], 32);
				PlayerTextDrawShow(playerid, Lobby5[playerid]);
				
				PlayerTextDrawColor(playerid,Lobby6[playerid], -1);
				PlayerTextDrawBoxColor(playerid,Lobby6[playerid], 32);
				PlayerTextDrawShow(playerid, Lobby6[playerid]);
				
				PlayerTextDrawColor(playerid,Lobby7[playerid], -1);
				PlayerTextDrawBoxColor(playerid,Lobby7[playerid], 32);
				PlayerTextDrawShow(playerid, Lobby7[playerid]);
			}
			case MATCHING_DUO: {
				PlayerTextDrawColor(playerid,Lobby4[playerid], -1);
				PlayerTextDrawBoxColor(playerid,Lobby4[playerid], 32);
				PlayerTextDrawShow(playerid, Lobby4[playerid]);
				
				PlayerTextDrawColor(playerid,Lobby5[playerid], -726921729);
				PlayerTextDrawBoxColor(playerid,Lobby5[playerid], 128);
				PlayerTextDrawShow(playerid, Lobby5[playerid]);
				
				PlayerTextDrawColor(playerid,Lobby6[playerid], -1);
				PlayerTextDrawBoxColor(playerid,Lobby6[playerid], 32);
				PlayerTextDrawShow(playerid, Lobby6[playerid]);
				
				PlayerTextDrawColor(playerid,Lobby7[playerid], -1);
				PlayerTextDrawBoxColor(playerid,Lobby7[playerid], 32);
				PlayerTextDrawShow(playerid, Lobby7[playerid]);
			}
			case MATCHING_SQUAD: {
				PlayerTextDrawColor(playerid,Lobby4[playerid], -1);
				PlayerTextDrawBoxColor(playerid,Lobby4[playerid], 32);
				PlayerTextDrawShow(playerid, Lobby4[playerid]);
				
				PlayerTextDrawColor(playerid,Lobby5[playerid], -1);
				PlayerTextDrawBoxColor(playerid,Lobby5[playerid], 32);
				PlayerTextDrawShow(playerid, Lobby5[playerid]);
				
				PlayerTextDrawColor(playerid,Lobby6[playerid], -726921729);
				PlayerTextDrawBoxColor(playerid,Lobby6[playerid], 32);
				PlayerTextDrawShow(playerid, Lobby6[playerid]);
				
				PlayerTextDrawColor(playerid,Lobby7[playerid], -1);
				PlayerTextDrawBoxColor(playerid,Lobby7[playerid], 32);
				PlayerTextDrawShow(playerid, Lobby7[playerid]);
			}
		}
	}
	else {
		switch(MatchingType[playerid]) {
			case MATCHING_SOLO: {
				PlayerTextDrawColor(playerid,Lobby4[playerid], -726921729);
				PlayerTextDrawBoxColor(playerid,Lobby4[playerid], 128);
				PlayerTextDrawShow(playerid, Lobby4[playerid]);
				
				PlayerTextDrawColor(playerid,Lobby5[playerid], -1);
				PlayerTextDrawBoxColor(playerid,Lobby5[playerid], 32);
				PlayerTextDrawShow(playerid, Lobby5[playerid]);
				
				PlayerTextDrawColor(playerid,Lobby6[playerid], -1);
				PlayerTextDrawBoxColor(playerid,Lobby6[playerid], 32);
				PlayerTextDrawShow(playerid, Lobby6[playerid]);
				
				PlayerTextDrawColor(playerid,Lobby7[playerid], -1);
				PlayerTextDrawBoxColor(playerid,Lobby7[playerid], 32);
				PlayerTextDrawShow(playerid, Lobby7[playerid]);
			}
			case MATCHING_DUO: {
				PlayerTextDrawColor(playerid,Lobby4[playerid], -726921729);
				PlayerTextDrawBoxColor(playerid,Lobby4[playerid], 128);
				PlayerTextDrawShow(playerid, Lobby4[playerid]);
				
				PlayerTextDrawColor(playerid,Lobby5[playerid], -1);
				PlayerTextDrawBoxColor(playerid,Lobby5[playerid], 32);
				PlayerTextDrawShow(playerid, Lobby5[playerid]);
				
				PlayerTextDrawColor(playerid,Lobby6[playerid], -1);
				PlayerTextDrawBoxColor(playerid,Lobby6[playerid], 32);
				PlayerTextDrawShow(playerid, Lobby6[playerid]);
				
				PlayerTextDrawColor(playerid,Lobby7[playerid], -1);
				PlayerTextDrawBoxColor(playerid,Lobby7[playerid], 32);
				PlayerTextDrawShow(playerid, Lobby7[playerid]);
				
				MatchingType[playerid] = MATCHING_SOLO;
			}
			case MATCHING_SQUAD: {
				PlayerTextDrawColor(playerid,Lobby4[playerid], -1);
				PlayerTextDrawBoxColor(playerid,Lobby4[playerid], 32);
				PlayerTextDrawShow(playerid, Lobby4[playerid]);
				
				PlayerTextDrawColor(playerid,Lobby5[playerid], -1);
				PlayerTextDrawBoxColor(playerid,Lobby5[playerid], 32);
				PlayerTextDrawShow(playerid, Lobby5[playerid]);
				
				PlayerTextDrawColor(playerid,Lobby6[playerid], -1);
				PlayerTextDrawBoxColor(playerid,Lobby6[playerid], 32);
				PlayerTextDrawShow(playerid, Lobby6[playerid]);
				
				PlayerTextDrawColor(playerid,Lobby7[playerid], -726921729);
				PlayerTextDrawBoxColor(playerid,Lobby7[playerid], 128);
				PlayerTextDrawShow(playerid, Lobby7[playerid]);
			}
		}
	}
	return 1;
}