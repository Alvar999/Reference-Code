//--------------------------------[CALLBACKS.PWN]--------------------------------
public OnPlayerConnect(playerid) {
	Player_Textdraw(playerid);
	MatchingType[playerid]=MATCHING_SOLO;
	
	PlayerInMatching[playerid]=-1;
	InGame{playerid}=false;
	PlayerReady{playerid}=false;
	
	SendClientMessage(playerid, -1, "[BOT] พิมพ์ /help เพื่อดูคำสั่งต่าง ๆ");
	return 1;
}

public OnPlayerUpdate(playerid) {
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetSpawnInfo(playerid, 1, 0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0);
	SpawnPlayer(playerid);
	AccountCheck(playerid);
	//TogglePlayerSpectating(playerid, true);
	//TogglePlayerControllable(playerid, false);*/
	//AccountCheck(playerid);
	return 1;
}

forward AccountCheck(playerid);
public AccountCheck(playerid)
{
	TogglePlayerControllable(playerid, false);

	SelectTextDraw(playerid, 0xD4AC0DFF);
	
	ShowLobbyMenu(playerid);

	new partyid = GetPlayerParty(playerid);
	if(partyid != -1) {
		new slot = GetPlayerSlot(playerid);
		new leaderid = GetLeaderID(partyid);

		SetPlayerPos(playerid, LobbySpawn[slot][0], LobbySpawn[slot][1], LobbySpawn[slot][2]);
		SetPlayerFacingAngle(playerid, LobbySpawn[slot][3]);
		
		SetPlayerVirtualWorld(playerid, PARTY + partyid);
		
		new str[128];
		format(str, 128, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~%s is now host!", ReturnName(leaderid));
		PartyPlayerGameText(partyid, str, 2000);
		
		PartyCheck(partyid);
	}
	else {
		SetPlayerPos(playerid, LobbySpawn[0][0], LobbySpawn[0][1], LobbySpawn[0][2]);
		SetPlayerFacingAngle(playerid, LobbySpawn[0][3]);
		SetPlayerVirtualWorld(playerid, LOBBY + playerid);
		UpdateLobbyMenu(playerid);	
	}
	SetPlayerCameraPos(playerid, -2386.2234,-558.7192,130.6172);
	SetPlayerCameraLookAt(playerid, -2384.0381,-552.0007,129.0110);
	PreloadAnimations(playerid);
}

public OnPlayerSpawn(playerid) {

	//AccountCheck(playerid);
	
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
    if(!InGame{playerid} && playertextid == PlayerText:INVALID_TEXT_DRAW)
    {
         SelectTextDraw(playerid, 0xD4AC0DFF);
    }
    return 1;
}

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
    if(!InGame{playerid} && clickedid == Text:INVALID_TEXT_DRAW)
    {
         SelectTextDraw(playerid, 0xD4AC0DFF);
    }
    return 1;
}

forward OnCheatDetected(playerid, ip_address[], type, code);
public OnCheatDetected(playerid, ip_address[], type, code)
{
	new str[128], hacking[64];
	switch(code)
	{
		case 0: format(hacking, sizeof(hacking), "AirBreak (onfoot)");
  		case 1: format(hacking, sizeof(hacking), "AirBreak (in vehicle)");
		case 2: format(hacking, sizeof(hacking), "teleport hack (onfoot)");
		case 3: format(hacking, sizeof(hacking), "teleport hack (in vehicle)");
		case 4: format(hacking, sizeof(hacking), "teleport hack (into vehicles)");
		case 7: format(hacking, sizeof(hacking), "FlyHack (onfoot)");
		case 8: format(hacking, sizeof(hacking), "FlyHack (in vehicle)");
		case 9: format(hacking, sizeof(hacking), "SpeedHack (onfoot)");
		case 10: format(hacking, sizeof(hacking), "SpeedHack (in vehicle)");
		case 11: format(hacking, sizeof(hacking), "Health hack (in vehicle)");
		case 12: format(hacking, sizeof(hacking), "Health hack (onfoot)");
		case 13: format(hacking, sizeof(hacking), "Armour hack");
		case 14: format(hacking, sizeof(hacking), "Money hack");
		case 15: format(hacking, sizeof(hacking), "Weapon hack");
		case 16: format(hacking, sizeof(hacking), "Ammo hack (add)");
		case 17: format(hacking, sizeof(hacking), "Ammo hack (infinite)");
		case 18: format(hacking, sizeof(hacking), "Special actions hack");
		case 19: format(hacking, sizeof(hacking), "GodMode from bullets (onfoot)");
		case 20: format(hacking, sizeof(hacking), "GodMode from bullets (in vehicle)");
		case 21: format(hacking, sizeof(hacking), "Invisible hack");
		case 22: format(hacking, sizeof(hacking), "lagcomp-spoof");
		case 23: format(hacking, sizeof(hacking), "Tuning hack");
		case 24: format(hacking, sizeof(hacking), "Parkour mod");
		case 25: format(hacking, sizeof(hacking), "Quick turn");
		case 26: format(hacking, sizeof(hacking), "Rapid fire");
		case 28: format(hacking, sizeof(hacking), "FakeKill");
		case 29: format(hacking, sizeof(hacking), "Pro Aim");
		case 30: format(hacking, sizeof(hacking), "CJ run");
		case 31: format(hacking, sizeof(hacking), "CarShot");
		case 32: format(hacking, sizeof(hacking), "CarJack");
		case 33: format(hacking, sizeof(hacking), "UnFreeze");
		case 34: format(hacking, sizeof(hacking), "AFK Ghost");
		case 35: format(hacking, sizeof(hacking), "Full Aiming");
		case 36: format(hacking, sizeof(hacking), "Fake NPC");
		case 37: format(hacking, sizeof(hacking), "Reconnect");
		//case 38: format(hacking, sizeof(hacking), "High ping");
		//case 39: format(hacking, sizeof(hacking), "Dialog hack");
		//case 40: format(hacking, sizeof(hacking), "Protection from the sandbox");
		case 41: format(hacking, sizeof(hacking), "Protection against an invalid version");
		case 42: format(hacking, sizeof(hacking), "Rcon hack");
		case 43: format(hacking, sizeof(hacking), "Tuning crasher");
		case 44: format(hacking, sizeof(hacking), "Invalid seat crasher");
		case 45: format(hacking, sizeof(hacking), "Dialog crasher");
		case 46: format(hacking, sizeof(hacking), "Attached object crasher");
		case 47: format(hacking, sizeof(hacking), "Weapon Crasher");
		case 48: format(hacking, sizeof(hacking), "Flood protection connects to one slot");
		case 49: format(hacking, sizeof(hacking), "flood callback functions");
		case 50: format(hacking, sizeof(hacking), "flood change seat");
		case 51: format(hacking, sizeof(hacking), "Ddos");
		case 52: format(hacking, sizeof(hacking), "NOP's");
	}
	if(strlen(hacking) > 0 && InGame{playerid}) {
		format(str, sizeof(str), "%s ถูกเตะออกจากเซิร์ฟเวอร์เนื่องจากถูกตรวจพบว่า %s", ReturnName(playerid), hacking);
		SendClientMessageToAll(TEAM_RED, str);
		KickEx(playerid);
	}
	return 1;
}