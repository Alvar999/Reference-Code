#define MODETEXT "03.02.2018(Last Update)"
#include <a_samp>
#if defined MAX_PLAYERS
#undef MAX_PLAYERS
	#define MAX_PLAYERS 500
#else
	#define MAX_PLAYERS 500
#endif
#include <a_mysql>
#include <dc_cmd>
#include <foreach>
#include <mxdate>
#include <md5>
#include <streamer>
#include <sscanf2>
#include <Add/TextDraw>
#include <Add/Objects>
#include <Add/RemoveObj>
#include <Add/Pos>
#define kick(%0) SetTimerEx("Kickk", 100,0,"i",%0)
#define publics%0(%1) forward%0(%1); public%0(%1)
#define SPD ShowPlayerDialog
#define DSP DIALOG_STYLE_PASSWORD
#define DSI DIALOG_STYLE_INPUT
#define DSM DIALOG_STYLE_MSGBOX
#define GivePVarInt(%0,%1,%2) SetPVarInt(%0,%1,(GetPVarInt(%0,%1) + %2))
new StartDay;
new SearchTeammate[10];
new Restart=0;
new MAXFORSTART = 5;
new mysql = -1;
new ClearAnimTimer[MAX_PLAYERS];
new PlayerTimer[MAX_PLAYERS];
new Timer[MAX_PLAYERS];
new ZoneMaxX[2][101]; new ZoneMaxY[2][101]; new ZoneMinX[2][101]; new ZoneMinY[2][101];
new Zone[2][101];
new OffsetZoneTimer[101];
new OffsetZone[101];
new Game[101];
new WaitGame[101];
new Plan[101];
new PlayersInGame[101];
new MaxPlayers[101];
new Clock[101];
new Weather[101];
new Cars[101][20];
new Float: CarsFuel[101][20];
new LootObject[101][4000];
new LootC[101][4000];
new LootID[101][4000];
new BoxObj[101][100];
new BoxLoot[101][100][50];
new BoxLootC[101][100][50];
new Float:pos_x[MAX_PLAYERS],
    Float:pos_y[MAX_PLAYERS],
    Float:pos_z[MAX_PLAYERS];
new Float:pos_x2[MAX_PLAYERS],
    Float:pos_y2[MAX_PLAYERS],
    Float:pos_z2[MAX_PLAYERS];
new Float:VehPos[MAX_VEHICLES][4];
new bool: BanCar[MAX_VEHICLES];
new TimeUpdate[MAX_PLAYERS];
new Skin[20] = {1,2,3,4,5,14,15,18,19,20,13,39,41,54,69,75,77,89,90,131};
new SkinCase[282] = {  7,8,9,10,16,27,31,32,34,35,36,37,38,42,43,44,50,53,57,58,63,64,72,73,78,79,87,88,94,95,97,128,129,130,134,135,136,//37
					137,151,152,157,158,159,160,161,162,168,182,183,184,196,197,198,199,200,201,202,207,209,212,213,218,220,221,222,229,//29
					230,231,232,234,235,236,237,238,239,241,242,243,244,245,250,252,256,257,258,261,262,//21 = 87
					6,11,12,17,21,22,24,25,30,40,45,47,48,55,56,59,60,62,66,67,69,91,93,96,98,100,101,102,103,104,105,106,107,108,109, // 35
					110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,138,139,140,141,142,143,144,145,146,147,148,150, // 29
					153,154,155,163,164,165,166,169,170,171,172,173,174,175,176,177,178,180,181,185,186,187,188,189,190,192,193,194,195, // 29
					203,204,205,206,208,210,211,214,215,217,219,223,224,225,226,227,228,233,240,246,247,248,251,253,254,259,260,263,268, // 29
					269,270,271,272,273,289,290,291,292,293,294,295,297,303,304,305,//16 = 138
					23,28,29,33,41,46,61,65,70,71,76,80,81,82,83,84,85,86,127,149,156,167,179,191,249,255,264,265,266,267,274,275,276,277,//34
					278,279,280,281,282,283,284,285,286,287,288,296,298,299,300,301,302,306,307,308,309,310,311 };//23 = 57
new NSEW[24][4] = {"N","15","30","NE","60","75","E","105","120","SE","150","165","S","195","210","SW","240","255","W","285","300","NW","330","345"};
enum pInfo {
	pName[MAX_PLAYER_NAME],
	pPass[100],
	pSkin,
	pAdm,
	pPM,
	pLanguage,
	pLanguageTD,
	pBI,
	pRadar,
	pDonate,
	pCoins,
	pPlayed,
	pWins,
	pMHands,
	pMDE,
	pM9mm,
	pMS9mm,
	pMSG,
	pMSS,
	pMM4,
	pMAK47,
	pMMP5,
	pMGrenade,
	pMMC,
	pMCR,
	pMSR,
	pDHands,
	pDDE,
	pD9mm,
	pDS9mm,
	pDSG,
	pDSS,
	pDM4,
	pDAK47,
	pDMP5,
	pDGrenade,
	pDMC,
	pDCR,
	pDSR,
	pDOTHER,
	pRewards,
	pRewardsC,
	pChristmasHat,
	pSkins[282],
	Slot[50], // no save
	SlotC[50], // no save
	SlotLoot[50] // no save
}
new Player[MAX_PLAYERS][pInfo];
enum AirInfo {
	Float: aX,
	Float: aY,
	Float: aZ,
	bool: aPos,
	aObj[2],
	aDoorObj[2],
	aLookObj,
	aLookHP,
	Text3D: a3dtext
}
new AirDrop[101][AirInfo];
new Text3D: igrok[MAX_PLAYERS];
public OnGameModeInit() {
	new day;
	getdate(day,day,day);
	StartDay=day;
    SendRconCommand("mapname Rus | Eng");
	SetGameModeText(MODETEXT);
	mysql = mysql_connect("localhost", "root", "pubg", "");
	//mysql = mysql_connect("212.22.93.13", "rmfchgon", "rmfchgon_11188", "aStasd#fajl!...");
	if(mysql_errno(mysql)) { mysql = -1; printf("[MySQL]: Failed to connect to the database."); }
	else printf("[MySQL]: The database is successfully connected.");
	for(new i=0;i<10;i++) SearchTeammate[i] = -1;
	mysql_set_charset("cp1251");
	mysql_function_query(mysql,"SET NAMES cp1251",false,"","");
	mysql_function_query(mysql,"set character_set_client=\'cp1251\'",false,"","");
	mysql_function_query(mysql,"set character_set_results=\'cp1251\'",false,"","");
	mysql_function_query(mysql,"set collation_connection=\'cp1251_general_ci\'",false,"","");
	DisableInteriorEnterExits();
	SetNameTagDrawDistance(15.0);
	EnableStuntBonusForAll(0);
	LimitGlobalChatRadius(0.0);
	LimitPlayerMarkerRadius(100);
	SetGravity(0.008);
	ShowNameTags(0);
	ObjectLoad();
	if(getDay()) mysql_tquery(mysql,"UPDATE `users` SET `RewardsC` = '0'", "", "");
	mysql_tquery(mysql, "SELECT * FROM `users`","SkinRemove","");
	SetTimer("WaitRestart",5000,1);
    WriteLog("GameMode","OnGameMode","Games mod running");
	return true;
}
main() {
    new a[][] =     {"Unarmed (Fist)","Brass K"};
	#pragma unused a
}
public OnGameModeExit() {
	foreach(Player, i) { if(!IsPlayerNotAuth(i)) SavePlayer(i); }
	mysql_close(mysql);
	return true;
}
public OnPlayerRequestSpawn(playerid) return false;
public OnPlayerRequestClass(playerid, classid) {
    for(new i;i<20;i++) SCM(playerid, "", "");
    SetPlayerColor(playerid, 0xDFDFDF00);
 	SetPlayerSkillLevel(playerid,0,10);
    SpawnPlayer(playerid);
    TogglePlayerSpectating(playerid, 1);
    InterpolateCameraPos(playerid, 2079.5432,1249.8418,716.6501, 2079.5432,1249.8418,716.6501, 1000);
	InterpolateCameraLookAt(playerid, 2071.2625,1245.6322,715.9300, 2071.2625,1245.6322,715.9300, 1000);
	if(GetPVarInt(playerid,"Location") == 10 || GetPVarInt(playerid,"Location") == 11 || GetPVarInt(playerid,"Location") == 9 || GetPVarInt(playerid,"Location") == 8) {
		PlayersInGame[GetPlayerVirtualWorld(playerid)]--;
	 	ExitTheGame(playerid,GetPlayerVirtualWorld(playerid),0);
		kick(playerid);
		SCM(playerid,"{AA3A3A}| {DFDFDF}Вас кикнули с сервера за нажатие F4.","{AA3A3A}| {DFDFDF}You kicked from the server press F4.");
	}
    SetPlayerVirtualWorld(playerid, playerid+1000);
	return true;
}
public OnPlayerConnect(playerid) {
    if(mysql == -1) { SCM(playerid, "{AA3A3A}| {DFDFDF}Сервер временно недоступен.", "{AA3A3A}| {DFDFDF}Сервер временно недоступен."); SCM(playerid, "{AA3A3A}| {DFDFDF}The server is temporarily unavailable.", "{AA3A3A}| {DFDFDF}The server is temporarily unavailable."); return SetTimerEx("Kickk", 10,0,"i",playerid); }
    SetPVarInt(playerid, "Position", gettime() + 600);
	SetPVarInt(playerid,"Location",0);
	Player[playerid][pSkin] = 1;Player[playerid][pAdm] = 0;Player[playerid][pPM] = 0;Player[playerid][pLanguage] = 0;Player[playerid][pLanguageTD] = 0;
	Player[playerid][pBI] = 0;Player[playerid][pRadar] = 0;Player[playerid][pDonate] = 0;Player[playerid][pCoins] = 0;Player[playerid][pPlayed] = 0;Player[playerid][pWins] = 0;
	Player[playerid][pMHands] = 0;Player[playerid][pMDE] = 0;Player[playerid][pM9mm] = 0;Player[playerid][pMS9mm] = 0;Player[playerid][pMSG] = 0;
	Player[playerid][pMSS] = 0;Player[playerid][pMM4] = 0;Player[playerid][pMAK47] = 0;Player[playerid][pMMP5] = 0;Player[playerid][pMGrenade] = 0;
	Player[playerid][pMMC] = 0;Player[playerid][pMCR] = 0;Player[playerid][pMSR] = 0;Player[playerid][pDHands] = 0;Player[playerid][pDDE] = 0;
	Player[playerid][pD9mm] = 0;Player[playerid][pDS9mm] = 0;Player[playerid][pDSG] = 0;Player[playerid][pDSS] = 0;Player[playerid][pDM4] = 0;
	Player[playerid][pDAK47] = 0;Player[playerid][pDMP5] = 0;Player[playerid][pDGrenade] = 0;Player[playerid][pDMC] = 0;Player[playerid][pDCR] = 0;
	Player[playerid][pDSR] = 0;Player[playerid][pDOTHER] = 0;Player[playerid][pRewards] = 0;Player[playerid][pRewardsC] = 0;Player[playerid][pChristmasHat] = 0;
	for(new i=0;i<282;i++) Player[playerid][pSkins][i] = 0;
	SetPVarInt(playerid,"Teammate1",-1); SetPVarInt(playerid,"Teammate2",-1); SetPVarInt(playerid,"Teammate3",-1);  SetPVarInt(playerid,"Teammate4",-1);
    new string[45+MAX_PLAYER_NAME];
	GetPlayerName(playerid, Player[playerid][pName], MAX_PLAYER_NAME);
	mysql_format(mysql, string, sizeof(string), "SELECT * FROM `users` WHERE `Name` = '%e' LIMIT 1", Player[playerid][pName]);
	mysql_tquery(mysql, string, "CheckReg", "i", playerid);
	mysql_format(mysql, string, sizeof(string), "SELECT * FROM `Bans` WHERE `Nick` = '%e' LIMIT 1", Player[playerid][pName]);
	mysql_tquery(mysql, string, "CheckBan", "d", playerid);
	new ipStr[16];
	GetPlayerIp( playerid, ipStr, 16 );
	mysql_format(mysql, string, sizeof(string), "SELECT * FROM `Bans` WHERE `Nick` = '%e' LIMIT 1", ipStr);
	mysql_tquery(mysql, string, "CheckBanIP", "d", playerid);
    TogglePlayerControllable(playerid, 1);
    Player[playerid][pLanguageTD] = 0;
	RemoveObjectLoad(playerid);
    TextDrawLoad(playerid);
    SetPVarInt(playerid,"Shots",0);SetPVarInt(playerid,"ShotsAuto",0);SetPVarInt(playerid,"ShotsPlayer",0);SetPVarInt(playerid,"Shots3",0);
	SetPVarInt(playerid,"Shots4",0);SetPVarInt(playerid,"Shots5",0);SetPVarInt(playerid,"Shots6",0);SetPVarInt(playerid,"Shots7",0);
	SetPVarInt(playerid,"Shots8",0);SetPVarInt(playerid,"Shots9",0);
    PlayerTimer[playerid] = SetTimerEx("PlayerUpdate",500,1,"i",playerid);
 	SetPVarInt(playerid,"Error",-1);
	format(string, sizeof(string), "%s(%d)",Player[playerid][pName],playerid);
	igrok[playerid] = Create3DTextLabel(string, 0xDFDFDFFF, 7.77, 7.77, 7.77, 15.0,0,1);
	Attach3DTextLabelToPlayer(igrok[playerid], playerid,  0.0, 0.0, 0.2);
    ApplyAnimation(playerid, "BOMBER","null",0.0,0,0,0,0,0);
	ApplyAnimation(playerid, "BOMBER", "BOM_Plant_Loop", 4.0, 1, 0, 0, 0, 0,1);
    ApplyAnimation(playerid, "PED","null",0.0,0,0,0,0,0);
	ApplyAnimation(playerid,"PED","getup_front",4.0,1,0,0,0,0,1);
	return true;
}
public OnPlayerDisconnect(playerid, reason) {
	Delete3DTextLabel(igrok[playerid]);
	KillTimer(PlayerTimer[playerid]);
	if(IsPlayerNotAuth(playerid)) return true;
	if(GetPVarInt(playerid,"Team") == 1) {
		if(GetPVarInt(GetPVarInt(playerid,"Teammate1"),"Teammate1") == playerid) SetPVarInt(GetPVarInt(playerid,"Teammate1"),"Teammate1",-1);
		else if(GetPVarInt(GetPVarInt(playerid,"Teammate1"),"Teammate2") == playerid) SetPVarInt(GetPVarInt(playerid,"Teammate1"),"Teammate2",-1);
		else if(GetPVarInt(GetPVarInt(playerid,"Teammate1"),"Teammate3") == playerid) SetPVarInt(GetPVarInt(playerid,"Teammate1"),"Teammate3",-1);
		else if(GetPVarInt(GetPVarInt(playerid,"Teammate1"),"Teammate4") == playerid) SetPVarInt(GetPVarInt(playerid,"Teammate1"),"Teammate4",-1);
	}
	new g=GetPlayerVirtualWorld(playerid);
	KillTimer(ClearAnimTimer[playerid]);
	ClearAnimTimer[playerid] = 0;
	KillTimer(Timer[playerid]);
	SavePlayer(playerid);
	if(GetPVarInt(playerid,"Location") == 10 || GetPVarInt(playerid,"Location") == 11 || GetPVarInt(playerid,"Location") == 9 || GetPVarInt(playerid,"Location") == 8) {
		PlayersInGame[g]--;
	    DropBox(playerid,g);
	    if(GetPVarInt(playerid,"GiftCar") > -1) { SetPVarInt(playerid,"GiftCar",-1);DestroyVehicle(GetPVarInt(playerid,"GiftCar")); }
	    if(reason != 2) ExitTheGame(playerid,GetPlayerVirtualWorld(playerid),reason);
	    else ExitTheGame(playerid,GetPlayerVirtualWorld(playerid),6);
	}
	return true;
}
public OnPlayerSpawn(playerid) {
    SetPVarInt(playerid, "Position", gettime() + 8);
    SetPlayerSkin(playerid,Player[playerid][pSkin]);
	if(GetPVarInt(playerid,"Team") == 0) SetPlayerColor(playerid, 0xDFDFDF00);
	if(Player[playerid][pChristmasHat] == 1) SetPlayerAttachedObject(playerid,0, 19066, 2, 0.13, 0.0, 0.0, 0.0, 80.0, 80.0);
	return true;
}
public OnPlayerDeath(playerid, killerid, reason) {
	switch(GetPVarInt(playerid,"Location")) {
	    case 8: {
	        new str[58];
			PlayersInGame[GetPlayerVirtualWorld(playerid)]--;
			foreach(Player, i) {
				if(GetPlayerVirtualWorld(i) == GetPlayerVirtualWorld(playerid)) {
					format(str,sizeof(str),"%d",PlayersInGame[GetPlayerVirtualWorld(i)]); PlayerTextDrawSetString(i,Indicators[i][5],str);
					if(Player[i][pLanguage] == 0) format(str,sizeof(str),"%s died {FFFFFF}- %d left",Player[playerid][pName],PlayersInGame[GetPlayerVirtualWorld(i)]); else format(str,sizeof(str),"%s умирает {FFFFFF}- осталось %d",Player[playerid][pName],PlayersInGame[GetPlayerVirtualWorld(i)]); SCM(i,str,str);
					if(GetPVarInt(i,"Location") == playerid+1000){Spoff(i);LoadMenu(i);}
				}
			}
			LoadMenu(playerid);
		}
		case 9,10,11: {
		    new str[110],string[110];
		    PlayersInGame[GetPlayerVirtualWorld(playerid)]--;
			DropBox(playerid,GetPlayerVirtualWorld(playerid));
			if(GetPVarInt(playerid,"GiftCar") > -1) { SetPVarInt(playerid,"GiftCar",-1);DestroyVehicle(GetPVarInt(playerid,"GiftCar")); }
	    	SetPVarInt(playerid,"Location",12);
    		ShowFatalScreen(playerid,0);
    		if(GetPVarInt(playerid,"DEATH") == 1) return true;
		    if(killerid != INVALID_PLAYER_ID) {
				GivePVarInt(killerid,"pKills",1);
				format(str,sizeof(str),"%d",GetPVarInt(killerid,"pKills"));PlayerTextDrawSetString(killerid,Indicators[killerid][4],str);PlayerTextDrawShow(killerid,Indicators[killerid][4]);
				PlayerTextDrawShow(killerid,Indicators[killerid][2]); PlayerTextDrawShow(killerid,Indicators[killerid][1]);
				if(Player[killerid][pLanguageTD] == 0) PlayerTextDrawSetString(killerid,Indicators[killerid][6],"Killed");
				else PlayerTextDrawSetString(killerid,Indicators[killerid][6],FixText("УБИТО"));
				PlayerTextDrawShow(killerid,Indicators[killerid][6]);
				switch(reason) {
					case 30: { str="AK-47"; Player[playerid][pDAK47]++; Player[killerid][pMAK47]++; } case 31: { str="M4"; Player[playerid][pDM4]++; Player[killerid][pMM4]++; } case 33: { str="Rifle"; Player[playerid][pDCR]++; Player[killerid][pMCR]++; }
					case 29: { str="MP5"; Player[playerid][pDMP5]++; Player[killerid][pMMP5]++; } case 22: { str="Colt45"; Player[playerid][pD9mm]++; Player[killerid][pM9mm]++; }
					case 23: { str="Silenced"; Player[playerid][pDS9mm]++; Player[killerid][pMS9mm]++; } case 24: { str="Desert Eagle"; Player[playerid][pDDE]++; Player[killerid][pMDE]++; }
					case 25: { Player[playerid][pDSG]++; Player[killerid][pMSG]++; } case 16: {Player[playerid][pDGrenade]++; Player[killerid][pMGrenade]++; }
					default: { Player[playerid][pDHands]++; Player[killerid][pMHands]++; } }
				format(string,sizeof(string),"YOU killed %s with %s - %d left",Player[playerid][pName],str,PlayersInGame[GetPlayerVirtualWorld(killerid)]);PlayerTextDrawSetString(killerid, Indicators[killerid][10],string);
	            format(string,sizeof(string),"%d KILL", GetPVarInt(killerid,"pKills")); PlayerTextDrawSetString(killerid, Indicators[killerid][9],string);
		        PlayerTextDrawColor(killerid, Indicators[killerid][9], -329901825); PlayerTextDrawShow(killerid, Indicators[killerid][9]);PlayerTextDrawShow(killerid, Indicators[killerid][10]);
	            SetPVarInt(killerid,"KILL",5);
				foreach(Player, i) {
			        if(GetPlayerVirtualWorld(i) == GetPlayerVirtualWorld(playerid)) {
			            switch(reason) { case 25: { if(Player[i][pLanguage] == 0) str="shotgun"; else str="дробовик"; } case 4: { if(Player[i][pLanguage] == 0) str="knife"; else str="нож"; } case 16: { if(Player[i][pLanguage] == 0) str="grenade"; else str="гранату"; } }
	                    if(Player[i][pLanguage] == 0) {if(Player[i][pAdm]>=5) format(string,sizeof(string),"%s(%d) killed %s(%d) with %s {FFFFFF}- %d left",Player[killerid][pName],killerid,Player[playerid][pName],playerid,str,PlayersInGame[GetPlayerVirtualWorld(i)]); else format(string,sizeof(string),"%s killed %s with %s {FFFFFF}- %d left",Player[killerid][pName],Player[playerid][pName],str,PlayersInGame[GetPlayerVirtualWorld(i)]);}
						else {if(Player[i][pAdm]>=5) format(string,sizeof(string),"%s(%d) убивает %s(%d), используя %s {FFFFFF}- осталось %d",Player[killerid][pName],killerid,Player[playerid][pName],playerid,str,PlayersInGame[GetPlayerVirtualWorld(i)]); else format(string,sizeof(string),"%s убивает %s, используя %s {FFFFFF}- осталось %d",Player[killerid][pName],Player[playerid][pName],str,PlayersInGame[GetPlayerVirtualWorld(i)]);}
						SCM(i,string,string);
						format(string,sizeof(string),"%d",PlayersInGame[GetPlayerVirtualWorld(i)]); PlayerTextDrawSetString(i,Indicators[i][5],string);
						if(GetPVarInt(i,"Location") == playerid+1000){Spoff(i);LoadMenu(i);}
						else if(GetPVarInt(i,"Location") == playerid+2000) {
							for(new tm=1;tm<5;tm++) {
					       		format(string,sizeof(string),"Teammate%d",tm);
					       		if(GetPVarInt(playerid,string) == GetPVarInt(playerid,"Location")-2000) continue;
					       		if(GetPVarInt(playerid,string) == -1 ||  GetPVarInt(playerid,string) == playerid) continue;
					       		if(GetPVarInt(GetPVarInt(playerid,string),"Location") == 11 || GetPVarInt(GetPVarInt(playerid,string),"Location") == 10) {
									TogglePlayerSpectating(playerid, 0);
									SpawnPlayer(playerid);
									TogglePlayerControllable(playerid, false);
									SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(GetPVarInt(playerid,string)));
									HideAllTextDraws(playerid);
									SetPVarInt(playerid,"Location",2000+GetPVarInt(playerid,string));
									CancelSelectTextDraw(playerid);
									TogglePlayerSpectating(playerid, true);
									TogglePlayerControllable(playerid, true);
									PlayerSpectatePlayer(playerid, GetPVarInt(playerid,string));
									continue; }
								LoadMenu(i);
							}
						}
					}
			    }
		    }
		    else {
		        Player[playerid][pDOTHER]++;
			    foreach(Player, i) {
			        if(GetPlayerVirtualWorld(i) == GetPlayerVirtualWorld(playerid)) {
						format(str,sizeof(str),"%d",PlayersInGame[GetPlayerVirtualWorld(i)]); PlayerTextDrawSetString(i,Indicators[i][5],str);
						if(Player[i][pLanguage] == 0) format(str,sizeof(str),"%s died {FFFFFF}- %d left",Player[playerid][pName],PlayersInGame[GetPlayerVirtualWorld(i)]); else format(str,sizeof(str),"%s умирает {FFFFFF}- осталось %d",Player[playerid][pName],PlayersInGame[GetPlayerVirtualWorld(i)]); SCM(i,str,str);
						if(GetPVarInt(i,"Location") == playerid+1000){Spoff(i);LoadMenu(i);}
						else if(GetPVarInt(i,"Location") == playerid+2000) {
							for(new tm=1;tm<5;tm++) {
					       		format(str,sizeof(str),"Teammate%d",tm);
					       		if(GetPVarInt(playerid,str) == GetPVarInt(playerid,"Location")-2000) continue;
					       		if(GetPVarInt(playerid,str) == -1 ||  GetPVarInt(playerid,str) == playerid) continue;
					       		if(GetPVarInt(GetPVarInt(playerid,str),"Location") == 11 || GetPVarInt(GetPVarInt(playerid,str),"Location") == 10) {
									TogglePlayerSpectating(playerid, 0);
									SpawnPlayer(playerid);
									TogglePlayerControllable(playerid, false);
									SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(GetPVarInt(playerid,str)));
									HideAllTextDraws(playerid);
									SetPVarInt(playerid,"Location",2000+GetPVarInt(playerid,str));
									CancelSelectTextDraw(playerid);
									TogglePlayerSpectating(playerid, true);
									TogglePlayerControllable(playerid, true);
									PlayerSpectatePlayer(playerid, GetPVarInt(playerid,str));
									return true; }
							}
							LoadMenu(i);
						}
					}
			    }
			}
		}
		default: LoadMenu(playerid);
	}
	return true;
}
public OnVehicleSpawn(vehicleid) {
	return true;
}
public OnVehicleDeath(vehicleid, killerid) {
	for(new i=0;i<20;i++) if(vehicleid == Cars[GetVehicleVirtualWorld(vehicleid)][i]) { Cars[GetVehicleVirtualWorld(vehicleid)][i] = 0; DestroyVehicle(vehicleid);}
	return true;
}
public OnPlayerText(playerid, text[]) {
    if(IsPlayerNotAuth(playerid)) return false;
	if(GetPVarInt(playerid,"Team") == 0) return false;
	new string[200];
	if(GetPVarInt(playerid,"Teammate1") == playerid) format(string,sizeof(string),"{A44444}[T] {DFDFDF}%s(%d): %s",Player[playerid][pName],playerid,text);
	else if(GetPVarInt(playerid,"Teammate2") == playerid) format(string,sizeof(string),"{B7AD3E}[T] {DFDFDF}%s(%d): %s",Player[playerid][pName],playerid,text);
	else if(GetPVarInt(playerid,"Teammate3") == playerid) format(string,sizeof(string),"{57A444}[T] {DFDFDF}%s(%d): %s",Player[playerid][pName],playerid,text);
	else if(GetPVarInt(playerid,"Teammate4") == playerid) format(string,sizeof(string),"{42719D}[T] {DFDFDF}%s(%d): %s",Player[playerid][pName],playerid,text);
	SCM(GetPVarInt(playerid,"Teammate1"),string,string);
	if(GetPVarInt(GetPVarInt(playerid,"Teammate1"),"Teammate2")!=-1) SCM(GetPVarInt(GetPVarInt(playerid,"Teammate1"),"Teammate2"),string,string);
	if(GetPVarInt(GetPVarInt(playerid,"Teammate1"),"Teammate3")!=-1) SCM(GetPVarInt(GetPVarInt(playerid,"Teammate1"),"Teammate3"),string,string);
	if(GetPVarInt(GetPVarInt(playerid,"Teammate1"),"Teammate4")!=-1) SCM(GetPVarInt(GetPVarInt(playerid,"Teammate1"),"Teammate4"),string,string);
    return false;
}
public OnPlayerCommandText(playerid, cmdtext[]) {
	return false;
}
public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger) {
	SetPVarInt(playerid,"ac_car_id",vehicleid);
	return true;
}
public OnPlayerExitVehicle(playerid, vehicleid) {
	if(GetPVarInt(playerid,"AntiPad") != 0) SetPVarInt(playerid,"AntiPad",0);
	for(new td=0;td<7;td++) TextDrawHideForPlayer(playerid,SpeedometrT[td]);
	PlayerTextDrawHide(playerid,Speedometr[playerid][0]);PlayerTextDrawHide(playerid,Speedometr[playerid][1]);
	return true;
}
public OnPlayerStateChange(playerid, newstate, oldstate)  {
    if(newstate == PLAYER_STATE_DRIVER) {
		SetPVarInt(playerid,"VehID",GetPlayerVehicleID(playerid));
		for(new td=0;td<7;td++) TextDrawShowForPlayer(playerid,SpeedometrT[td]);
		for(new s=0;s<20;s++) { if(GetPlayerVehicleID(playerid) == Cars[GetPlayerVirtualWorld(playerid)][s]) PlayerTextDrawTextSize(playerid, Speedometr[playerid][1], CarsFuel[GetPlayerVirtualWorld(playerid)][s], 5.000000); }
		PlayerTextDrawShow(playerid,Speedometr[playerid][0]);PlayerTextDrawShow(playerid,Speedometr[playerid][1]);
    }
    if(oldstate == PLAYER_STATE_DRIVER) {
        if(BanCar[GetPVarInt(playerid,"VehID")]) KillTimer(TimeUpdate[playerid]);
        TimeUpdate[playerid] = SetTimerEx("UpdateVehiclePos", 10000, false, "ii", GetPVarInt(playerid,"VehID"), 1);
        BanCar[GetPVarInt(playerid,"VehID")] = true; }
    if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) SetPVarInt(playerid, "Position", gettime() + 8);
	return true;
}
public OnPlayerEnterCheckpoint(playerid)  {
	return true;
}
public OnPlayerLeaveCheckpoint(playerid) {
	return true;
}
public OnPlayerEnterRaceCheckpoint(playerid) {
	return true;
}
public OnPlayerLeaveRaceCheckpoint(playerid) {
	return true;
}
public OnRconCommand(cmd[]) {
	return true;
}
public OnObjectMoved(objectid) {
	return true;
}
public OnPlayerPickUpPickup(playerid, pickupid) {
	return true;
}
public OnVehicleMod(playerid, vehicleid, componentid) {
	return true;
}
public OnVehiclePaintjob(playerid, vehicleid, paintjobid) {
	return true;
}
public OnVehicleRespray(playerid, vehicleid, color1, color2) {
	return true;
}
public OnPlayerSelectedMenuRow(playerid, row) {
	return true;
}
public OnPlayerExitedMenu(playerid) {
	return true;
}
public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid) {
	return true;
}
publics ClearAnim(p,Float: X,Float: Y,Float: Z) {
    if(!IsPlayerInRangeOfPoint(p,2.3,X,Y,Z)) {
        new str[200],Float:px,Float:py,Float:pz; GetPlayerPos(p,px,py,pz);format(str,sizeof(str),"(%s[%d]) PlayerX: %f,PlayerY: %f,PlayerZ: %f | PosX: %f,PosY: %f,PosZ: %f",Player[p][pName],p,px,py,pz,X,Y,Z);
    	WriteLog("AntiCheat","A01",str);
		return AntiCheat(p,1,"A01"); }
	TogglePlayerControllable(p, true);
	ClearAnimations(p);
	KillTimer(ClearAnimTimer[p]);
	ClearAnimTimer[p] = 0;
	TogglePlayerControllable(p, true);
	return true;
}
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
	if((GetPVarInt(playerid,"Location") == 11 || GetPVarInt(playerid,"Location") == 10) && newkeys == KEY_NO) {
	    TextDrawShowForPlayer(playerid,MAPT[0]);
	    TextDrawShowForPlayer(playerid,MAPT[1]);
	    new Float:x,Float:y,Float:z;
	    GetPlayerPos(playerid,x,y,z);
	    if(PlayerToKvadrat(playerid,-1000.0, -3000.0, 3000.0, 500.0)) {
	        x = 524+(0.025*(x+1000));
	        y = 424-(0.02857142857*(y+3000));
	        for(new t=0;t<2;t++) {
				if(ZoneMinX[t][GetPlayerVirtualWorld(playerid)] != 0) {
					MAP[playerid][t+1] = CreatePlayerTextDraw(playerid,527+(0.0265*(ZoneMaxX[t][GetPlayerVirtualWorld(playerid)]+1000)), 440.008300-(0.02857142857*(ZoneMaxY[t][GetPlayerVirtualWorld(playerid)]+3000)), "usebox");
					if(ZoneMinY[t][GetPlayerVirtualWorld(playerid)] < 0) PlayerTextDrawLetterSize(playerid,MAP[playerid][t+1], 0.000000, 0.00302666*(floatabs(ZoneMinY[t][GetPlayerVirtualWorld(playerid)]-ZoneMaxY[t][GetPlayerVirtualWorld(playerid)])));
					else PlayerTextDrawLetterSize(playerid,MAP[playerid][t+1], 0.000000, 0.00302666*(floatabs(ZoneMaxY[t][GetPlayerVirtualWorld(playerid)])-floatabs(ZoneMinY[t][GetPlayerVirtualWorld(playerid)])));
					PlayerTextDrawTextSize(playerid,MAP[playerid][t+1], 527+(0.0265*(ZoneMinX[t][GetPlayerVirtualWorld(playerid)]+1000)), 0.000000);
					PlayerTextDrawAlignment(playerid,MAP[playerid][t+1], 1);
					PlayerTextDrawColor(playerid,MAP[playerid][t+1], 0);
					PlayerTextDrawUseBox(playerid,MAP[playerid][t+1], true);
					if(t == 1) PlayerTextDrawBoxColor(playerid,MAP[playerid][t+1], 589518176);
					else PlayerTextDrawBoxColor(playerid,MAP[playerid][t+1], -538976432);
					PlayerTextDrawSetShadow(playerid,MAP[playerid][t+1], 0);
					PlayerTextDrawSetOutline(playerid,MAP[playerid][t+1], 0);
					PlayerTextDrawFont(playerid,MAP[playerid][t+1], 0);
					PlayerTextDrawShow(playerid,MAP[playerid][t+1]);
				}
			}
	        MAP[playerid][0] = CreatePlayerTextDraw(playerid,x, y, "LD_BEAT:down");
			PlayerTextDrawLetterSize(playerid,MAP[playerid][0], 0.000000, 0.000000);
			PlayerTextDrawTextSize(playerid,MAP[playerid][0], 9.370422, 15.166687);
			PlayerTextDrawAlignment(playerid,MAP[playerid][0], 1);
			PlayerTextDrawColor(playerid,MAP[playerid][0], 0xCF8D00FF);
			PlayerTextDrawSetShadow(playerid,MAP[playerid][0], 0);
			PlayerTextDrawSetOutline(playerid,MAP[playerid][0], 0);
			PlayerTextDrawFont(playerid,MAP[playerid][0], 4);
			PlayerTextDrawShow(playerid,MAP[playerid][0]);
		}
		return true;
	}
	if((GetPVarInt(playerid,"Location") == 11 || GetPVarInt(playerid,"Location") == 10) && oldkeys == KEY_NO) {
	    TextDrawHideForPlayer(playerid,MAPT[0]);
	    TextDrawHideForPlayer(playerid,MAPT[1]);
	    PlayerTextDrawHide(playerid,MAP[playerid][0]);
	    PlayerTextDrawDestroy(playerid,MAP[playerid][0]);
	    PlayerTextDrawHide(playerid,MAP[playerid][1]);
	    PlayerTextDrawDestroy(playerid,MAP[playerid][1]);
	    PlayerTextDrawHide(playerid,MAP[playerid][2]);
	    PlayerTextDrawDestroy(playerid,MAP[playerid][2]);
		return true;
	}
    if(newkeys & KEY_HANDBRAKE && !IsPlayerInAnyVehicle(playerid)) SetPVarInt(playerid,"TintaApasata",1);
    else if(oldkeys & KEY_HANDBRAKE) SetPVarInt(playerid,"TintaApasata",0);
	if(newkeys == 2 && GetPVarInt(playerid,"AntiCBug") == 1) {
		ApplyAnimation(playerid,"PED","getup_front",4.0,1,0,0,0,0,1);
		ClearAnimTimer[playerid] = SetTimerEx("ClearAnim2", 1000, false, "d", playerid); }
	if(newkeys == KEY_NO && GetPVarInt(playerid,"Location") >= 2000) {
		for(new tm=1;tm<5;tm++) {
       		new str[10]; format(str,sizeof(str),"Teammate%d",tm);
       		if(GetPVarInt(playerid,str) == GetPVarInt(playerid,"Location")-2000) continue;
       		if(GetPVarInt(playerid,str) == -1 ||  GetPVarInt(playerid,str) == playerid) continue;
       		if(GetPVarInt(GetPVarInt(playerid,str),"Location") == 11 || GetPVarInt(GetPVarInt(playerid,str),"Location") == 10) {
				TogglePlayerSpectating(playerid, 0);
				SpawnPlayer(playerid);
				TogglePlayerControllable(playerid, false);
				SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(GetPVarInt(playerid,str)));
				HideAllTextDraws(playerid);
				SetPVarInt(playerid,"Location",2000+GetPVarInt(playerid,str));
				CancelSelectTextDraw(playerid);
				TogglePlayerSpectating(playerid, true);
				TogglePlayerControllable(playerid, true);
				PlayerSpectatePlayer(playerid, GetPVarInt(playerid,str));
				break; }
		}
	    return true;
	}
	if(newkeys == KEY_HANDBRAKE) {
	    if(GetPlayerWeapon(playerid) == 34 && (GetPVarInt(playerid,"pHelmet") > 0 || Player[playerid][pChristmasHat] == 1)) RemovePlayerAttachedObject(playerid,0); }
	if(oldkeys == KEY_HANDBRAKE) {
		if(GetPlayerWeapon(playerid) == 34 && (GetPVarInt(playerid,"pHelmet") > 0 || Player[playerid][pChristmasHat] == 1)) {
			new id;
			if(GetPVarInt(playerid,"pHelmet") > 0 && GetPVarInt(playerid,"pHelmet") < 101) id = 12;
			else if(GetPVarInt(playerid,"pHelmet") > 100 && GetPVarInt(playerid,"pHelmet") < 201) id = 13;
			else if(GetPVarInt(playerid,"pHelmet") > 200 && GetPVarInt(playerid,"pHelmet") < 301) id = 14;
			else if(Player[playerid][pChristmasHat] == 1) return SetPlayerAttachedObject(playerid,0, 19066, 2, 0.13, 0.0, 0.0, 0.0, 80.0, 80.0);
			SetPlayerAttachedObjectSkin(Player[playerid][pSkin],playerid,GetObjectID(id),0,0,0); } }
    if(newkeys == KEY_SECONDARY_ATTACK || newkeys == KEY_YES) {
        if(IsPlayerInAnyVehicle(playerid)) return true;
    	new Float:Xx,Float:Yy,Float:Zz;
    	GetPlayerPos(playerid,Xx,Yy,Zz);
		for(new i=0;i<4000;i++) {
	    	if(LootObject[GetPlayerVirtualWorld(playerid)][i] == 0) continue;
	    	new Float:X,Float:Y,Float:Z;
			GetDynamicObjectPos(LootObject[GetPlayerVirtualWorld(playerid)][i],X,Y,Z);
			if(IsPlayerInRangeOfPoint(playerid,1.5,X,Y,Z) && ClearAnimTimer[playerid] == 0) {
				if(RaiseLoot(playerid, i, 0)) {
                	SetPlayerPosACSE(playerid,Xx,Yy,Zz);
					ClearAnimations(playerid);
					TogglePlayerControllable(playerid, false);
					ApplyAnimation(playerid, "BOMBER", "BOM_Plant_Loop", 4.0, 1, 0, 0, 0, 0,1);
					ClearAnimTimer[playerid] = SetTimerEx("ClearAnim", 1000, false, "dfff", playerid,X,Y,Z); }
				break;
			}
		}
	}
    if(GetPVarInt(playerid,"Location") == 9) {
	    if(newkeys == KEY_SECONDARY_ATTACK) {
            SetPVarInt(playerid,"Location",10);
        	new Float: X, Float: Y, Float: Z, Float: R;
        	GetDynamicObjectPos(Plan[GetPlayerVirtualWorld(playerid)],X,Y,Z);
        	GetDynamicObjectRot(Plan[GetPlayerVirtualWorld(playerid)],R,R,R);
        	PlayerTextDrawShow(playerid,HUD[playerid][0]); TextDrawShowForPlayer(playerid,HUDT[0]);
			TogglePlayerSpectating(playerid, false);
			TogglePlayerControllable(playerid, true);
            SetPVarFloat(playerid,"pHealth",125.0);
        	GivePlayerWeapon(playerid,46,1);
        	PlayerTextDrawHide(playerid, KeysF[playerid]);
        	for(new td=0;td<5;td++) TextDrawHideForPlayer(playerid, KeysFT[td]);
			SetPlayerSkin(playerid,Player[playerid][pSkin]);
		    SetPlayerFacingAngle(playerid,R+180);
			SetCameraBehindPlayer(playerid);
        	if(R<=225&&R>=135) { X=X-25+(X*0.0125); Y=Y-25; }
			else if(R>=-45&&R<=45) { X=X-25+(X*0.0125); Y=Y+25; }
			else if(R>=45&&R<=135) { Y=Y-25+(Y*0.01428571429); X=X-25; }
			else if(R>=225&&R<=315) { Y=Y-25+(Y*0.01428571429); X=X+25; }
        	SetPlayerPosACSE(playerid,(X+10)-random(20),(Y+10)-random(20),483-random(6));
        	if(Player[playerid][pChristmasHat] == 1) SetPlayerAttachedObject(playerid,0, 19066, 2, 0.13, 0.0, 0.0, 0.0, 80.0, 80.0);
        	SetPVarInt(playerid,"KeyF",10);
	    }
		if(newkeys == KEY_FIRE) {
		    TextDrawShowForPlayer(playerid,MAPT[0]);
		    TextDrawShowForPlayer(playerid,MAPT[1]);
		    new Float:x,Float:y,Float:z;
		    GetPlayerPos(playerid,x,y,z);
		    if(PlayerToKvadrat(playerid,-1000.0, -3000.0, 3000.0, 500.0)) {
		        x = 524+(0.025*(x+1000));
		        y = 424-(0.02857142857*(y+3000));
		        MAP[playerid][0] = CreatePlayerTextDraw(playerid,x, y, "LD_BEAT:down");
				PlayerTextDrawLetterSize(playerid,MAP[playerid][0], 0.000000, 0.000000);
				PlayerTextDrawTextSize(playerid,MAP[playerid][0], 9.370422, 15.166687);
				PlayerTextDrawAlignment(playerid,MAP[playerid][0], 1);
				PlayerTextDrawColor(playerid,MAP[playerid][0], 0xCF8D00FF);
				PlayerTextDrawSetShadow(playerid,MAP[playerid][0], 0);
				PlayerTextDrawSetOutline(playerid,MAP[playerid][0], 0);
				PlayerTextDrawFont(playerid,MAP[playerid][0], 4);
				PlayerTextDrawShow(playerid,MAP[playerid][0]);
			}
			return true;
		}
		if(oldkeys == KEY_FIRE) {
		    TextDrawHideForPlayer(playerid,MAPT[0]);
		    TextDrawHideForPlayer(playerid,MAPT[1]);
		    PlayerTextDrawHide(playerid,MAP[playerid][0]);
		    PlayerTextDrawDestroy(playerid,MAP[playerid][0]);
			return true;
		}
    }
    if(newkeys == KEY_CTRL_BACK && (GetPVarInt(playerid,"Location") == 11 || GetPVarInt(playerid,"Location") == 10) && !IsPlayerInAnyVehicle(playerid)) {
        if(GetPVarInt(playerid,"OpenInv") == 1) {
        	for(new td=0;td<89;td++) {
        		if(td<20) TextDrawHideForPlayer(playerid, InvGunT[td]);
        		if(td<14) PlayerTextDrawHide(playerid, InvGun[playerid][td]);
        		if(td<10) {PlayerTextDrawHide(playerid, InvStat[playerid][td]);}
				PlayerTextDrawHide(playerid, InvSlot[playerid][td]);}
        	TextDrawHideForPlayer(playerid,RegistrationT[0]);
			for(new td=0;td<10;td++) PlayerTextDrawDestroy(playerid, Sliders[playerid][td]);
        	SetPVarInt(playerid,"SlidersInvLoot",0); SetPVarInt(playerid,"SlidersInv",0);
        	SetPVarInt(playerid,"OpenInv",0);
        	CancelSelectTextDraw(playerid);
        }
        else ShowInv(playerid);
    }
	return true;
}
public OnRconLoginAttempt(ip[], password[], success) {
	return true;
}
public OnPlayerUpdate(playerid) {
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {new speed[4]; format(speed,sizeof(speed),"%d",GetVehicleSpeed(GetPlayerVehicleID(playerid))); PlayerTextDrawSetString(playerid,Speedometr[playerid][0],speed);}
	if(GetPVarInt(playerid,"Location")>=1000) {
	    new sp; if(IsPlayerInAnyVehicle(GetPVarInt(playerid,"Location")-1000)) sp = GetVehicleSpeed(GetPlayerVehicleID(GetPVarInt(playerid,"Location")-1000)); else sp = GetPlayerSpeed(GetPVarInt(playerid,"Location")-1000);
	    new str[30]; format(str,sizeof(str),"%d %d %d",GetPlayerPing(GetPVarInt(playerid,"Location")-1000),sp,floatround(GetPVarFloat(GetPVarInt(playerid,"Location")-1000,"pHealth"),floatround_round));
		PlayerTextDrawSetString(playerid,AdmSystem[playerid][1],str); PlayerTextDrawTextSize(playerid, HUD[playerid][0], GetPVarFloat(GetPVarInt(playerid,"Location")-1000,"pHealth"), 14.000000);PlayerTextDrawShow(playerid,HUD[playerid][0]); }
    if(IsPlayerInAnyVehicle(playerid)) { if(GetPlayerVehicleID(playerid) != GetPVarInt(playerid,"ac_car_id")) AntiCheat(playerid,1,"A77"); }
	SetPVarInt(playerid,"AFKS",gettime());
	if(GetPVarInt(playerid,"Location") == 10 || GetPVarInt(playerid,"Location") == 11) {
		if(GetPVarInt(playerid,"Location")==10) {
		    if(!PlayerToKvadrat(playerid,ZoneMinX[0][GetPlayerVirtualWorld(playerid)],ZoneMinY[0][GetPlayerVirtualWorld(playerid)],ZoneMaxX[0][GetPlayerVirtualWorld(playerid)],ZoneMaxY[0][GetPlayerVirtualWorld(playerid)])) SetPVarInt(playerid,"Location",11); }
		if(GetPVarInt(playerid,"Location")==11) {
		    if(PlayerToKvadrat(playerid,ZoneMinX[0][GetPlayerVirtualWorld(playerid)],ZoneMinY[0][GetPlayerVirtualWorld(playerid)],ZoneMaxX[0][GetPlayerVirtualWorld(playerid)],ZoneMaxY[0][GetPlayerVirtualWorld(playerid)])) SetPVarInt(playerid,"Location",10); }
		switch(GetPVarInt(playerid,"pGun1")) {
		    case 1: { if(GetPlayerWeapon(playerid) == 30) { if(IsPlayerAttachedObjectSlotUsed(playerid,3)) RemovePlayerAttachedObject(playerid,3); } else { if(!IsPlayerAttachedObjectSlotUsed(playerid,3)) SetPlayerAttachedObjectSkin(Player[playerid][pSkin],playerid,355,1,0,0); } }
			case 2: { if(GetPlayerWeapon(playerid) == 31) { if(IsPlayerAttachedObjectSlotUsed(playerid,3)) RemovePlayerAttachedObject(playerid,3); } else { if(!IsPlayerAttachedObjectSlotUsed(playerid,3)) SetPlayerAttachedObjectSkin(Player[playerid][pSkin],playerid,356,1,0,0); } }
			case 3: { if(GetPlayerWeapon(playerid) == 33) { if(IsPlayerAttachedObjectSlotUsed(playerid,3)) RemovePlayerAttachedObject(playerid,3); } else { if(!IsPlayerAttachedObjectSlotUsed(playerid,3)) SetPlayerAttachedObjectSkin(Player[playerid][pSkin],playerid,357,1,0,0); } }
			case 4: { if(GetPlayerWeapon(playerid) == 34) { if(IsPlayerAttachedObjectSlotUsed(playerid,3)) RemovePlayerAttachedObject(playerid,3); } else { if(!IsPlayerAttachedObjectSlotUsed(playerid,3)) SetPlayerAttachedObjectSkin(Player[playerid][pSkin],playerid,358,1,0,0); } }
			case 5: { if(GetPlayerWeapon(playerid) == 25) { if(IsPlayerAttachedObjectSlotUsed(playerid,3)) RemovePlayerAttachedObject(playerid,3); } else { if(!IsPlayerAttachedObjectSlotUsed(playerid,3)) SetPlayerAttachedObjectSkin(Player[playerid][pSkin],playerid,349,1,0,0); } }
			case 6: { if(GetPlayerWeapon(playerid) == 29) { if(IsPlayerAttachedObjectSlotUsed(playerid,3)) RemovePlayerAttachedObject(playerid,3); } else { if(!IsPlayerAttachedObjectSlotUsed(playerid,3)) SetPlayerAttachedObjectSkin(Player[playerid][pSkin],playerid,353,1,0,0); } }
			case 14: { if(GetPlayerWeapon(playerid) == 35) { if(IsPlayerAttachedObjectSlotUsed(playerid,3)) RemovePlayerAttachedObject(playerid,3); } else { if(!IsPlayerAttachedObjectSlotUsed(playerid,3)) SetPlayerAttachedObjectSkin(Player[playerid][pSkin],playerid,359,1,0,0); } }
		}
		switch(GetPVarInt(playerid,"pGun2")) {
		    case 1: { if(GetPlayerWeapon(playerid) == 30) { if(IsPlayerAttachedObjectSlotUsed(playerid,4)) RemovePlayerAttachedObject(playerid,4); } else { if(!IsPlayerAttachedObjectSlotUsed(playerid,4)) SetPlayerAttachedObjectSkin(Player[playerid][pSkin],playerid,355,2,0,0); } }
			case 2: { if(GetPlayerWeapon(playerid) == 31) { if(IsPlayerAttachedObjectSlotUsed(playerid,4)) RemovePlayerAttachedObject(playerid,4); } else { if(!IsPlayerAttachedObjectSlotUsed(playerid,4)) SetPlayerAttachedObjectSkin(Player[playerid][pSkin],playerid,356,2,0,0); } }
			case 3: { if(GetPlayerWeapon(playerid) == 33) { if(IsPlayerAttachedObjectSlotUsed(playerid,4)) RemovePlayerAttachedObject(playerid,4); } else { if(!IsPlayerAttachedObjectSlotUsed(playerid,4)) SetPlayerAttachedObjectSkin(Player[playerid][pSkin],playerid,357,2,0,0); } }
			case 4: { if(GetPlayerWeapon(playerid) == 34) { if(IsPlayerAttachedObjectSlotUsed(playerid,4)) RemovePlayerAttachedObject(playerid,4); } else { if(!IsPlayerAttachedObjectSlotUsed(playerid,4)) SetPlayerAttachedObjectSkin(Player[playerid][pSkin],playerid,358,2,0,0); } }
			case 5: { if(GetPlayerWeapon(playerid) == 25) { if(IsPlayerAttachedObjectSlotUsed(playerid,4)) RemovePlayerAttachedObject(playerid,4); } else { if(!IsPlayerAttachedObjectSlotUsed(playerid,4)) SetPlayerAttachedObjectSkin(Player[playerid][pSkin],playerid,349,2,0,0); } }
			case 6: { if(GetPlayerWeapon(playerid) == 29) { if(IsPlayerAttachedObjectSlotUsed(playerid,4)) RemovePlayerAttachedObject(playerid,4); } else { if(!IsPlayerAttachedObjectSlotUsed(playerid,4)) SetPlayerAttachedObjectSkin(Player[playerid][pSkin],playerid,353,2,0,0); } }
			case 14: { if(GetPlayerWeapon(playerid) == 35) { if(IsPlayerAttachedObjectSlotUsed(playerid,4)) RemovePlayerAttachedObject(playerid,4); } else { if(!IsPlayerAttachedObjectSlotUsed(playerid,4)) SetPlayerAttachedObjectSkin(Player[playerid][pSkin],playerid,359,2,0,0); } }
		}
	}
	if(Player[playerid][pRadar] == 0) return true;
	if(GetPVarInt(playerid,"Location") == 11 || GetPVarInt(playerid,"Location") == 10 || GetPVarInt(playerid,"Location") == 9) {
		new Float:rr;
		if(!IsPlayerInAnyVehicle(playerid)) GetPlayerFacingAngle(playerid,rr);
		else GetVehicleZAngle(GetPlayerVehicleID(playerid), rr);
		NSWE(playerid,rr);
	}
	return true;
}
public OnPlayerStreamIn(playerid, forplayerid) {
	return true;
}
public OnPlayerStreamOut(playerid, forplayerid) {
	return true;
}
public OnVehicleStreamIn(vehicleid, forplayerid) {
   	UpdateVehiclePos(vehicleid, 0);
	return true;
}
public OnVehicleStreamOut(vehicleid, forplayerid) {
	return true;
}
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
	if(!response && dialogid != 6) {
		if(dialogid == 14 || dialogid == 15 || dialogid == 16 || dialogid == 17) DonateShow(playerid);
		return true; }
	switch(dialogid) {
	    case 1: {
            if(!strlen(inputtext)) { SetPVarInt(playerid,"Error", -1); if(Player[playerid][pLanguageTD] == 0) return PlayerTextDrawSetString(playerid,Registration[playerid][2],"ENTER_PASSWORD"); else return PlayerTextDrawSetString(playerid,Registration[playerid][2],FixText("ВВЕДИТЕ_ПАРОЛЬ")); }
            for(new i = strlen(inputtext); i != 0; --i)
		 	switch(inputtext[i]) {
		 	    case 'А'..'Я', 'а'..'я', ' ': { SetPVarInt(playerid,"Error", 1); if(Player[playerid][pLanguageTD] == 0) return PlayerTextDrawSetString(playerid,Registration[playerid][2],"WRONG_SYMBOLS"); else return PlayerTextDrawSetString(playerid,Registration[playerid][2],FixText("НЕВЕРНЫЕ_СИМВОЛЫ")); }
			}
	  		if(strlen(inputtext) < 6 || strlen(inputtext) > 20) { SetPVarInt(playerid,"Error", 2); if(Player[playerid][pLanguageTD] == 0) return PlayerTextDrawSetString(playerid,Registration[playerid][2],"WRONG_NUMBER_SYMBOLS"); else return PlayerTextDrawSetString(playerid,Registration[playerid][2],FixText("НЕВЕРНОЕ_КОЛ-ВО_СИМВОЛОВ")); }
			strmid(Player[playerid][pPass], MD5_Hash(inputtext), 0, strlen(MD5_Hash(inputtext)), 80);
			if(Player[playerid][pLanguageTD] == 0) PlayerTextDrawSetString(playerid,Registration[playerid][2],"ENTERED"); else PlayerTextDrawSetString(playerid,Registration[playerid][2],FixText("ВВЕДЕНО"));
			SetPVarInt(playerid,"Error", 0);
			return true;
	    }
	    case 2: {
	        if(!strlen(inputtext)) { SetPVarInt(playerid,"Error", -1); if(Player[playerid][pLanguageTD] == 0) return PlayerTextDrawSetString(playerid,Registration[playerid][2],"ENTER_PASSWORD"); else return PlayerTextDrawSetString(playerid,Registration[playerid][2],FixText("ВВЕДИТЕ_ПАРОЛЬ")); }
			strmid(Player[playerid][pPass], MD5_Hash(inputtext), 0, strlen(MD5_Hash(inputtext)), 80);
			new string[180+MAX_PLAYER_NAME];
			mysql_format(mysql, string, sizeof(string), "SELECT * FROM `users` WHERE `Name` = '%e' AND `Pass` = '%e'", Player[playerid][pName], Player[playerid][pPass]);
			mysql_function_query(mysql, string, true, "AutoLogin", "d", playerid);
			return true;
	    }
     	case 3,4,5: {
	        new id;
	        if(sscanf(inputtext,"i", id)) return SCM(playerid,"{AA3A3A}| {DFDFDF}Недопустимый ID.","{AA3A3A}| {DFDFDF}Invalid ID.");
	        if(id < 0 || id > 1000) return SCM(playerid,"{AA3A3A}| {DFDFDF}Недопустимый ID.","{AA3A3A}| {DFDFDF}Invalid ID.");
			if(!IsPlayerConnected(id))  return SCM(playerid, "{AA3A3A}| {DFDFDF}Игрок не найден.","{AA3A3A}| {DFDFDF}Player not found.");
	        if(id == playerid) return SCM(playerid,"{AA3A3A}| {DFDFDF}Вы ввели свой ID.","{AA3A3A}| {DFDFDF}You entered your ID.");
			if(GetPVarInt(id,"Team") == 0) return SCM(playerid,"{AA3A3A}| {DFDFDF}Игрок не переключился на командный режим.","{AA3A3A}| {DFDFDF}The player will not switch to command mode.");
            if(GetPVarInt(id,"Teammate2") != -1 || GetPVarInt(id,"Teammate3") != -1 || GetPVarInt(id,"Teammate4") != -1) return SCM(playerid,"{AA3A3A}| {DFDFDF}Игрок уже состоит в команде.","{AA3A3A}| {DFDFDF}The player is already in the team.");
            if(GetPVarInt(id,"Location") != 3 && GetPVarInt(id,"Location") != 5 && GetPVarInt(id,"Location") != 6 && GetPVarInt(id,"Location") != 7) return SCM(playerid,"{AA3A3A}| {DFDFDF}Игрок уже играет.","{AA3A3A}| {DFDFDF}The player is already playing.");
            if(GetPVarInt(playerid,"Teammate2") == id || GetPVarInt(playerid,"Teammate3") == id || GetPVarInt(playerid,"Teammate4") == id) return SCM(playerid,"{AA3A3A}| {DFDFDF}Вы уже приглашали этого игрока.","{AA3A3A}| {DFDFDF}You is already invited this player.");
            if(dialogid == 3) { SetPVarInt(id,"Teammate2",playerid+1000); SetPVarInt(playerid,"Teammate2",id+1000); }
            else if(dialogid == 4) { SetPVarInt(id,"Teammate3",playerid+1000); SetPVarInt(playerid,"Teammate3",id+1000); }
            else if(dialogid == 5) { SetPVarInt(id,"Teammate4",playerid+1000); SetPVarInt(playerid,"Teammate4",id+1000); }
            new str[100];
            if(Player[id][pLanguage] == 0) format(str,sizeof(str),"{DFDFDF}%s has invited You to join the team.",Player[playerid][pName]);
            else format(str,sizeof(str),"{DFDFDF}%s пригласил Вас в  команду.",Player[playerid][pName]);
            SPD(id,12,DSM," ",str,"Принять","Отклонить");
			return true;
	    }
	    case 6..11: {
	        if(!response) return true;
	        new count;
	        if(sscanf(inputtext,"i", count)) return SCM(playerid,"{AA3A3A}| {DFDFDF}Недопустимый кол-во.","{AA3A3A}| {DFDFDF}Invalid count.");
	        if(count < 1 || count >= Player[playerid][SlotC][GetPVarInt(playerid,"ClickSlot")-1]) return SCM(playerid,"{AA3A3A}| {DFDFDF}Недопустимое кол-во.","{AA3A3A}| {DFDFDF}Invalid count.");
		    switch(Player[playerid][Slot][GetPVarInt(playerid,"ClickSlot")-1]) {
				case 6: {
					GivePVarInt(playerid,"pAmmo1",-count);
					if(GetPVarInt(playerid,"pGun3") == 7) UpdateWeapon(playerid);
					if(GetPVarInt(playerid,"pGun3") == 8) UpdateWeapon(playerid);
				    if(GetPVarInt(playerid,"pGun1") == 6 || GetPVarInt(playerid,"pGun2") == 6) UpdateWeapon(playerid);
				}
			    case 7: { GivePVarInt(playerid,"pAmmo2",-count); if(GetPVarInt(playerid,"pGun3") == 9) { UpdateWeapon(playerid); } }
			    case 8: { GivePVarInt(playerid,"pAmmo3",-count); if(GetPVarInt(playerid,"pGun1") == 5 || GetPVarInt(playerid,"pGun2") == 5) { UpdateWeapon(playerid); } }
			    case 9: { GivePVarInt(playerid,"pAmmo4",-count); if(GetPVarInt(playerid,"pGun1") == 2 || GetPVarInt(playerid,"pGun2") == 2) { UpdateWeapon(playerid); } }
			    case 10: { GivePVarInt(playerid,"pAmmo5",-count); if(GetPVarInt(playerid,"pGun1") == 1 || GetPVarInt(playerid,"pGun2") == 1) { UpdateWeapon(playerid); } }
			    case 11: { GivePVarInt(playerid,"pAmmo6",-count); if(GetPVarInt(playerid,"pGun1") == 3 || GetPVarInt(playerid,"pGun2") == 3) { UpdateWeapon(playerid); } }
			}
		    switch(Player[playerid][Slot][GetPVarInt(playerid,"ClickSlot")-1]) {
		        case 6..11: {
					new Float:x,Float:y,Float:z; GetPlayerPos(playerid,x,y,z);
					Player[playerid][SlotC][GetPVarInt(playerid,"ClickSlot")-1] -= count;
					new str[20];format(str,sizeof(str),"%d",Player[playerid][SlotC][GetPVarInt(playerid,"ClickSlot")-1]);PlayerTextDrawSetString(playerid,InvSlot[playerid][GetPVarInt(playerid,"ClickSlot")+69],str);
					DropLoot(playerid,Player[playerid][Slot][GetPVarInt(playerid,"ClickSlot")-1],x,y,z-1,GetPlayerVirtualWorld(playerid),count);
					SetPlayerPosACSE(playerid,x+0.001,y,z);
					for(new td=81;td<85;td++) PlayerTextDrawDestroy(playerid,InvSlot[playerid][td]);
					DeletePVar(playerid,"ClickSlot");
		        }
	        }
			ShowSliders(playerid);
	    }
	    case 12: {
	        if(!response) {
            	new str[MAX_PLAYER_NAME+12];
            	if(Player[playerid][pLanguage] == 0) format(str,sizeof(str),"%s refused.",Player[playerid][pName]);
            	else format(str,sizeof(str),"%s отказался.",Player[playerid][pName]);
				if(GetPVarInt(playerid,"Teammate2") >= 1000){ SCM(GetPVarInt(playerid,"Teammate2")-1000,str,str); SetPVarInt(GetPVarInt(playerid,"Teammate2")-1000,"Teammate2",-1); SetPVarInt(playerid,"Teammate2",-1); }
		        else if(GetPVarInt(playerid,"Teammate3") >= 1000){ SCM(GetPVarInt(playerid,"Teammate3")-1000,str,str); SetPVarInt(GetPVarInt(playerid,"Teammate3")-1000,"Teammate3",-1); SetPVarInt(playerid,"Teammate3",-1); }
		        else if(GetPVarInt(playerid,"Teammate4") >= 1000){ SCM(GetPVarInt(playerid,"Teammate4")-1000,str,str); SetPVarInt(GetPVarInt(playerid,"Teammate4")-1000,"Teammate4",-1); SetPVarInt(playerid,"Teammate4",-1); }
		        return true;
	        }
	        if(GetPVarInt(playerid,"Teammate2") >= 1000) {
	            PlayerTextDrawSetString(GetPVarInt(playerid,"Teammate2")-1000,LobbyMenu[GetPVarInt(playerid,"Teammate2")-1000][7],Player[playerid][pName]);
	            PlayerTextDrawSetString(playerid,LobbyMenu[playerid][6],Player[GetPVarInt(playerid,"Teammate2")-1000][pName]);PlayerTextDrawSetString(playerid,LobbyMenu[playerid][7],Player[playerid][pName]);
	            if(GetPVarInt(GetPVarInt(playerid,"Teammate2")-1000,"Teammate3") != -1) { PlayerTextDrawSetString(playerid,LobbyMenu[playerid][8],Player[GetPVarInt(GetPVarInt(playerid,"Teammate2")-1000,"Teammate3")][pName]); SetPVarInt(playerid,"Teammate3",GetPVarInt(GetPVarInt(playerid,"Teammate2")-1000,"Teammate3")); SetPVarInt(GetPVarInt(GetPVarInt(playerid,"Teammate2")-1000,"Teammate3"),"Teammate3",playerid); }
	            if(GetPVarInt(GetPVarInt(playerid,"Teammate2")-1000,"Teammate4") != -1) { PlayerTextDrawSetString(playerid,LobbyMenu[playerid][9],Player[GetPVarInt(GetPVarInt(playerid,"Teammate2")-1000,"Teammate4")][pName]); SetPVarInt(playerid,"Teammate4",GetPVarInt(GetPVarInt(playerid,"Teammate2")-1000,"Teammate4")); SetPVarInt(GetPVarInt(GetPVarInt(playerid,"Teammate2")-1000,"Teammate4"),"Teammate4",playerid); }
	            SetPlayerVirtualWorld(playerid,GetPVarInt(playerid,"Teammate2")); SetPVarInt(playerid,"Teammate1",GetPVarInt(playerid,"Teammate2")-1000);
				SetPVarInt(GetPVarInt(playerid,"Teammate2")-1000,"Teammate2",playerid); SetPVarInt(playerid,"Teammate2",playerid);
				SetPlayerPosACSE(playerid,2075.7493,1246.1554,716.1840); SetPlayerFacingAngle(playerid,310.5863); }
	        else if(GetPVarInt(playerid,"Teammate3") >= 1000) {
	            PlayerTextDrawSetString(GetPVarInt(playerid,"Teammate3")-1000,LobbyMenu[GetPVarInt(playerid,"Teammate3")-1000][8],Player[playerid][pName]);
	            PlayerTextDrawSetString(playerid,LobbyMenu[playerid][6],Player[GetPVarInt(playerid,"Teammate3")-1000][pName]);PlayerTextDrawSetString(playerid,LobbyMenu[playerid][8],Player[playerid][pName]);
	            if(GetPVarInt(GetPVarInt(playerid,"Teammate3")-1000,"Teammate2") != -1) { PlayerTextDrawSetString(playerid,LobbyMenu[playerid][8],Player[GetPVarInt(GetPVarInt(playerid,"Teammate3")-1000,"Teammate2")][pName]); SetPVarInt(playerid,"Teammate2",GetPVarInt(GetPVarInt(playerid,"Teammate3")-1000,"Teammate2")); SetPVarInt(GetPVarInt(GetPVarInt(playerid,"Teammate3")-1000,"Teammate2"),"Teammate2",playerid); }
	            if(GetPVarInt(GetPVarInt(playerid,"Teammate3")-1000,"Teammate4") != -1) { PlayerTextDrawSetString(playerid,LobbyMenu[playerid][9],Player[GetPVarInt(GetPVarInt(playerid,"Teammate3")-1000,"Teammate4")][pName]); SetPVarInt(playerid,"Teammate4",GetPVarInt(GetPVarInt(playerid,"Teammate3")-1000,"Teammate4")); SetPVarInt(GetPVarInt(GetPVarInt(playerid,"Teammate3")-1000,"Teammate4"),"Teammate4",playerid); }
	            SetPlayerVirtualWorld(playerid,GetPVarInt(playerid,"Teammate3")); SetPVarInt(playerid,"Teammate1",GetPVarInt(playerid,"Teammate3")-1000);
				SetPVarInt(GetPVarInt(playerid,"Teammate3")-1000,"Teammate3",playerid); SetPVarInt(playerid,"Teammate3",playerid);
				SetPlayerPosACSE(playerid,2075.1975,1248.3281,716.1840); SetPlayerFacingAngle(playerid,289.6162); }
	        else if(GetPVarInt(playerid,"Teammate4") >= 1000) {
	            PlayerTextDrawSetString(GetPVarInt(playerid,"Teammate4")-1000,LobbyMenu[GetPVarInt(playerid,"Teammate4")-1000][9],Player[playerid][pName]);
	            PlayerTextDrawSetString(playerid,LobbyMenu[playerid][6],Player[GetPVarInt(playerid,"Teammate4")-1000][pName]);PlayerTextDrawSetString(playerid,LobbyMenu[playerid][9],Player[playerid][pName]);
	            if(GetPVarInt(GetPVarInt(playerid,"Teammate4")-1000,"Teammate3") != -1) { PlayerTextDrawSetString(playerid,LobbyMenu[playerid][8],Player[GetPVarInt(GetPVarInt(playerid,"Teammate4")-1000,"Teammate3")][pName]); SetPVarInt(playerid,"Teammate3",GetPVarInt(GetPVarInt(playerid,"Teammate4")-1000,"Teammate3")); SetPVarInt(GetPVarInt(GetPVarInt(playerid,"Teammate4")-1000,"Teammate3"),"Teammate3",playerid); }
	            if(GetPVarInt(GetPVarInt(playerid,"Teammate4")-1000,"Teammate2") != -1) { PlayerTextDrawSetString(playerid,LobbyMenu[playerid][9],Player[GetPVarInt(GetPVarInt(playerid,"Teammate4")-1000,"Teammate2")][pName]); SetPVarInt(playerid,"Teammate2",GetPVarInt(GetPVarInt(playerid,"Teammate4")-1000,"Teammate2")); SetPVarInt(GetPVarInt(GetPVarInt(playerid,"Teammate4")-1000,"Teammate2"),"Teammate2",playerid); }
	            SetPlayerVirtualWorld(playerid,GetPVarInt(playerid,"Teammate4")); SetPVarInt(playerid,"Teammate1",GetPVarInt(playerid,"Teammate4")-1000);
				SetPVarInt(GetPVarInt(playerid,"Teammate4")-1000,"Teammate4",playerid); SetPVarInt(playerid,"Teammate4",playerid);
				SetPlayerPosACSE(playerid,2074.5430,1249.0677,716.1840); SetPlayerFacingAngle(playerid,299.9796); }
	    }
	    case 13: {
	        switch(listitem) {
	            case 0: {
	                new string[200];
					mysql_format(mysql, string, sizeof(string), "SELECT * FROM `Donate` WHERE `name` = '%e' LIMIT 1", Player[playerid][pName]);
					mysql_tquery(mysql, string, "DonateUpd", "d", playerid);
		        	return true;
		        }
	            case 1: {
					if(Player[playerid][pLanguage] == 0) SPD(playerid,14,DSM,"{FFFFFF}Information about the account","{FFFFFF}To add funds to your account on the website:\nwww.pubgsamp.ru","Enter","Back");
					else SPD(playerid,14,DSM,"{FFFFFF}Информация о пополнении счёта","{FFFFFF}Пополнить счёт аккаунта можно на сайте:\nwww.pubgsamp.ru","Выбрать","Назад");
				}
	            case 2: {
					if(Player[playerid][pLanguage] == 0) SPD(playerid,15,DSI,"{FFFFFF}RUB -> BP","{FFFFFF}Enter the amount of RUB exchange","Enter","Back");
					else SPD(playerid,15,DSI,"{FFFFFF}RUB -> BP","{FFFFFF}Введите количество RUB для обмена","Ввести","Назад");
				}
	            case 3: {
					if(Player[playerid][pLanguage] == 0) SPD(playerid,16,DSI,"{FFFFFF}Nickname change","{FFFFFF}Enter nickname","Enter","Back");
					else SPD(playerid,16,DSI,"{FFFFFF}Изменение ника","{FFFFFF}Введите ник","Ввести","Назад");
				}
	            case 4: {
	                if(Player[playerid][pChristmasHat] == 1) {
						if(Player[playerid][pLanguage] == 0) SPD(playerid,17,DSM,"{FFFFFF}Remove Christmas hat","{FFFFFF}Confirm ?","Enter","Back");
						else SPD(playerid,17,DSM,"{FFFFFF}Удаление новогодней шапки","{FFFFFF}Подтверждаете ?","Ввести","Назад");
					}
	                else {
						if(Player[playerid][pLanguage] == 0) SPD(playerid,17,DSM,"{FFFFFF}Buy Christmas hat","{FFFFFF}Confirm ?","Enter","Back");
						else SPD(playerid,17,DSM,"{FFFFFF}Покупка новогодней шапки","{FFFFFF}Подтверждаете ?","Ввести","Назад");
					}
				}
	        }
	    }
	    case 14: DonateShow(playerid);
	    case 15: {
            if(!strlen(inputtext)) return DonateShow(playerid);
	        new count;
	        if(sscanf(inputtext,"i", count)) return SCM(playerid,"{AA3A3A}| {DFDFDF}Недопустимое кол-во.","{AA3A3A}| {DFDFDF}Invalid count.");
	        if(count < 1 || count >= Player[playerid][pDonate]) return SCM(playerid,"{AA3A3A}| {DFDFDF}Недопустимое кол-во.","{AA3A3A}| {DFDFDF}Invalid count.");
	        Player[playerid][pDonate] -= count;
	        Player[playerid][pCoins] += count*40;
	        return DonateShow(playerid);
	    }
	    case 16: {
            if(!strlen(inputtext)) return DonateShow(playerid);
            for(new i = strlen(inputtext); i != 0; --i)
		 	switch(inputtext[i]) {
		 	    case 'А'..'Я', 'а'..'я', ' ': return SCM(playerid,"{AA3A3A}| {DFDFDF}Недопустимый ник.","{AA3A3A}| {DFDFDF}Invalid nickname.");
			}
			if(strlen(inputtext) < 3 || strlen(inputtext) > 20) return SCM(playerid,"{AA3A3A}| {DFDFDF}Недопустимый ник.","{AA3A3A}| {DFDFDF}Invalid nickname.");
			if(Player[playerid][pDonate] < 20) return SCM(playerid,"{AA3A3A}| {DFDFDF}Недопустимое кол-во.","{AA3A3A}| {DFDFDF}Invalid count.");
			new string[200];
			mysql_format(mysql, string, sizeof(string), "SELECT * FROM `users` WHERE `Name` = '%e'", inputtext);
			mysql_tquery(mysql, string, "CheckNickForDonate", "is", playerid,inputtext);
			return DonateShow(playerid);
	    }
	    case 17: {
            if(Player[playerid][pChristmasHat] == 1) { Player[playerid][pChristmasHat] = 0; RemovePlayerAttachedObject(playerid, 0); }
            else {
				if(Player[playerid][pDonate] < 15) return SCM(playerid,"{AA3A3A}| {DFDFDF}Недопустимое кол-во доната.","{AA3A3A}| {DFDFDF}Invalid count donate.");
                Player[playerid][pChristmasHat] = 1;
				SetPlayerAttachedObject(playerid,0, 19064, 2, 0.13, 0.0, 0.0, 0.0, 80.0, 80.0);
				Player[playerid][pDonate]-=15;
			}
	    }
	    case 18: {
	        if(!strlen(inputtext)) return true;
	        new count;
	        if(sscanf(inputtext,"i", count)) return SCM(playerid,"{AA3A3A}| {DFDFDF}Недопустимое кол-во.","{AA3A3A}| {DFDFDF}Invalid count.");
			if(Player[playerid][pDonate] < count*10) return SCM(playerid,"{AA3A3A}| {DFDFDF}Недопустимое кол-во доната.","{AA3A3A}| {DFDFDF}Invalid count donate.");
   			if(Player[playerid][pSkins][GetPVarInt(playerid,"ValidForSkin")]+count > 99) return SCM(playerid,"{AA3A3A}| {DFDFDF}НКоличество дней должно получиться не больше 99.","{AA3A3A}| {DFDFDF}The number of days should be not more than 99.");
			Player[playerid][pSkins][GetPVarInt(playerid,"ValidForSkin")] += count;
			Player[playerid][pDonate]-=count*10;
	    }
	}
	return true;
}
publics AutoLogin(playerid) {
	new f, r;
	cache_get_data(r,f);
	if(r) {
		if(Player[playerid][pLanguageTD] == 0) PlayerTextDrawSetString(playerid,Registration[playerid][2],"ENTERED"); else PlayerTextDrawSetString(playerid,Registration[playerid][2],FixText("ВВЕДЕНО"));
		SetPVarInt(playerid,"Error", 0);
        return true;
	}
	else {
		if(Player[playerid][pLanguageTD] == 0) PlayerTextDrawSetString(playerid,Registration[playerid][2],"WRONG_PASSWORD"); else PlayerTextDrawSetString(playerid,Registration[playerid][2],FixText("НЕВЕРНЫЙ_ПАРОЛЬ"));
		SetPVarInt(playerid,"Error", 1);
        return true;
	}
}
publics SkinRemove() {
	new h; gettime(h);
	if(h == 3) {
		static rows, fields;
		new vremya = GetTickCount();
		cache_get_data(rows,fields);
		if(rows) {
		    for(new i=0;i<rows;i++) {
		        new str[900],sk[282],name[MAX_PLAYER_NAME]; new c=0;
    			cache_get_field_content(i, "Name", name, mysql, 25);
    			cache_get_field_content(i, "Skins", str, mysql, 600), sscanf(str, "p<,>a<i>[282]", sk);
			    for(new s=0;s<282;s++) {if(sk[s] > 0) {sk[s]--;c++;}}
			    if(c==0) continue;
				format(str,600,"%d,",sk[0]);
				for(new s=1;s<282;s++) { format(str,600,"%s%d,",str, sk[s]); }
				mysql_format(mysql,str,sizeof(str),"UPDATE `users` SET `Skins` = '%s' WHERE `Name` = '%s'", str,name);
				mysql_function_query(mysql, str, false, "", "");
		    }
		}
		printf("SkinRemove: %dms",GetTickCount()-vremya);
	}
	return true;
}
publics LoadAccount(i) {
    cache_get_field_content(0, "Pass", Player[i][pPass], mysql, 100);
    Player[i][pSkin] = cache_get_field_content_int(0, "Skin");
    Player[i][pAdm] = cache_get_field_content_int(0, "Adm");
    Player[i][pPM] = cache_get_field_content_int(0, "PM");
    Player[i][pLanguage] = cache_get_field_content_int(0, "Language");
    Player[i][pBI] = cache_get_field_content_int(0, "NickHead");
    Player[i][pRadar] = cache_get_field_content_int(0, "Radar");
    Player[i][pDonate] = cache_get_field_content_int(0, "Donate");
    Player[i][pCoins] = cache_get_field_content_int(0, "Coins");
    Player[i][pPlayed] = cache_get_field_content_int(0, "Played");
    Player[i][pWins] = cache_get_field_content_int(0, "Wins");
    Player[i][pMHands] = cache_get_field_content_int(0, "MHands"); Player[i][pDHands] = cache_get_field_content_int(0, "DHands");
    Player[i][pMDE] = cache_get_field_content_int(0, "MDE"); Player[i][pDDE] = cache_get_field_content_int(0, "DDE");
    Player[i][pM9mm] = cache_get_field_content_int(0, "M9mm"); Player[i][pD9mm] = cache_get_field_content_int(0, "D9mm");
    Player[i][pMS9mm] = cache_get_field_content_int(0, "MS9mm"); Player[i][pDS9mm] = cache_get_field_content_int(0, "DS9mm");
    Player[i][pMSG] = cache_get_field_content_int(0, "MSG"); Player[i][pDSG] = cache_get_field_content_int(0, "DSG");
    Player[i][pMSS] = cache_get_field_content_int(0, "MSS"); Player[i][pDSS] = cache_get_field_content_int(0, "DSS");
    Player[i][pMM4] = cache_get_field_content_int(0, "MM4"); Player[i][pDM4] = cache_get_field_content_int(0, "DM4");
    Player[i][pMAK47] = cache_get_field_content_int(0, "MAK47"); Player[i][pDAK47] = cache_get_field_content_int(0, "DAK47");
    Player[i][pMMP5] = cache_get_field_content_int(0, "MMP5"); Player[i][pDMP5] = cache_get_field_content_int(0, "DMP5");
    Player[i][pMGrenade] = cache_get_field_content_int(0, "MGrenade"); Player[i][pDGrenade] = cache_get_field_content_int(0, "DGrenade");
    Player[i][pMMC] = cache_get_field_content_int(0, "MMC"); Player[i][pDMC] = cache_get_field_content_int(0, "DMC");
    Player[i][pMCR] = cache_get_field_content_int(0, "MCR"); Player[i][pDCR] = cache_get_field_content_int(0, "DCR");
    Player[i][pMSR] = cache_get_field_content_int(0, "MSR"); Player[i][pDSR] = cache_get_field_content_int(0, "DSR"); Player[i][pDOTHER] = cache_get_field_content_int(0, "DOTHER");
    Player[i][pRewards] = cache_get_field_content_int(0, "Rewards");
    Player[i][pRewardsC] = cache_get_field_content_int(0, "RewardsC");
    Player[i][pChristmasHat] = cache_get_field_content_int(0, "Sex");
    new str[600];
    cache_get_field_content(0, "Skins", str, mysql, 600), sscanf(str, "p<,>a<i>[282]", Player[i][pSkins]);
    for(new s=0;s<282;s++) {
		if(Player[i][pSkin] == SkinCase[s]) { if(Player[i][pSkins][s] <= 0) Player[i][pSkin] = Skin[random(20)]; } }
    LoadMenu(i);
    SCM(i,"Сервер находится на стадии открытого бета тестирования. Вы можете помочь нам исправить недостатки, написав о них в /bug","The server is under open beta testing. You can help us to correct the shortcomings by writing about them in a /bug");
    SCM(i,"Помощь по игре и командам: /help","Help on game and commands: /help");
	SetPlayerScore(i,Player[i][pWins]);
	return true;
}
stock SavePlayer(playerid) {
	new str[700];
	mysql_format(mysql,str,sizeof(str),"UPDATE `users` SET `Skin` = %d, `Adm` = %d, `PM` = %d, `Language` = %d, `LanguageTD` = %d, `NickHead` = %d, `Radar` = %d, `Donate` = %d, `Coins` = %d, `Played` = %d, `Wins` = %d, `Rewards` = %d, `RewardsC` = %d, `Sex` = %d WHERE `Name` = '%e' LIMIT 1",
	Player[playerid][pSkin], Player[playerid][pAdm], Player[playerid][pPM], Player[playerid][pLanguage], Player[playerid][pLanguageTD], Player[playerid][pBI], Player[playerid][pRadar], Player[playerid][pDonate], Player[playerid][pCoins], Player[playerid][pPlayed], Player[playerid][pWins], Player[playerid][pRewards], Player[playerid][pRewardsC], Player[playerid][pChristmasHat], Player[playerid][pName]);
	mysql_function_query(mysql, str, false, "", "");
	mysql_format(mysql,str,sizeof(str),"UPDATE `users` SET `MHands` = %d, `MDE` = %d, `M9mm` = %d, `MS9mm` = %d, `MSG` = %d, `MSS` = %d, `MM4` = %d, `MAK47` = %d, `MMP5` = %d, `MGrenade` = %d, `MMC` = %d, `MCR` = %d, `MSR` = %d WHERE `Name` = '%e' LIMIT 1",
	Player[playerid][pMHands], Player[playerid][pMDE], Player[playerid][pM9mm], Player[playerid][pMS9mm], Player[playerid][pMSG], Player[playerid][pMSS], Player[playerid][pMM4], Player[playerid][pMAK47], Player[playerid][pMMP5], Player[playerid][pMGrenade], Player[playerid][pMMC], Player[playerid][pMCR], Player[playerid][pMSR], Player[playerid][pName]);
	mysql_function_query(mysql, str, false, "", "");
	mysql_format(mysql,str,sizeof(str),"UPDATE `users` SET `DHands` = %d, `DDE` = %d, `D9mm` = %d, `DS9mm` = %d, `DSG` = %d, `DSS` = %d, `DM4` = %d, `DAK47` = %d, `DMP5` = %d, `DGrenade` = %d, `DMC` = %d, `DCR` = %d, `DSR` = %d, `DOTHER` = %d WHERE `Name` = '%e' LIMIT 1",
	Player[playerid][pDHands], Player[playerid][pDDE], Player[playerid][pD9mm], Player[playerid][pDS9mm], Player[playerid][pDSG], Player[playerid][pDSS], Player[playerid][pDM4], Player[playerid][pDAK47], Player[playerid][pDMP5], Player[playerid][pDGrenade], Player[playerid][pDMC], Player[playerid][pDCR], Player[playerid][pDSR], Player[playerid][pDOTHER], Player[playerid][pName]);
	mysql_function_query(mysql, str, false, "", "");
	new save[600];
	format(save,600,"%d,",Player[playerid][pSkins][0]);
	for(new i=1;i<282;i++) { format(save,600,"%s%d,",save, Player[playerid][pSkins][i]); }
	mysql_format(mysql,str,sizeof(str),"UPDATE `users` SET `Skins` = '%s' WHERE `Name` = '%e' LIMIT 1", save, Player[playerid][pName]);
	mysql_function_query(mysql, str, false, "", "");
	return true;
}
public OnPlayerClickPlayer(playerid, clickedplayerid, source) {
	return true;
}
publics Errors(playerid) { KillTimer(Timer[playerid]); PlayerTextDrawColor(playerid, Registration[playerid][2], 353703423); PlayerTextDrawShow(playerid, Registration[playerid][2]); return true; }
public OnPlayerClickTextDraw(playerid, Text: clickedid) {
	if(_:clickedid == INVALID_TEXT_DRAW) {
		if(IsPlayerNotAuth(playerid)) SelectTextDraw(playerid, 0xC7C7C750);
		if(GetPVarInt(playerid,"Location") == 12) SelectTextDraw(playerid, 0x15151550);
		if(GetPVarInt(playerid,"Location") == 3 || GetPVarInt(playerid,"Location") == 4 || GetPVarInt(playerid,"Location") == 5 || GetPVarInt(playerid,"Location") == 6 || GetPVarInt(playerid,"Location") == 7) SelectTextDraw(playerid, 0xFFFFFF50);
        if(GetPVarInt(playerid,"OpenInv") == 1) {
        	for(new td=0;td<89;td++) {
        		if(td<20) TextDrawHideForPlayer(playerid, InvGunT[td]);
        		if(td<14) PlayerTextDrawHide(playerid, InvGun[playerid][td]);
        		if(td<10) {PlayerTextDrawHide(playerid, InvStat[playerid][td]);}
				PlayerTextDrawHide(playerid, InvSlot[playerid][td]);}
			TextDrawHideForPlayer(playerid,RegistrationT[0]);
			for(new td=0;td<10;td++) PlayerTextDrawDestroy(playerid, Sliders[playerid][td]);
			SetPVarInt(playerid,"SlidersInvLoot",0); SetPVarInt(playerid,"SlidersInv",0);
        	SetPVarInt(playerid,"OpenInv",0);
        	CancelSelectTextDraw(playerid);
        }
		return true;
	}
	if(clickedid == TOP10[1]) { mysql_function_query(mysql, "SELECT `Name`, `Wins` FROM `users` ORDER BY `Wins` DESC LIMIT 10", true, "Top_10", "d", playerid); }
	if(clickedid == RegistrationT[1]) {
		if(GetPVarInt(playerid,"Location") == 1) {
			if(Player[playerid][pLanguageTD] == 0) return SPD(playerid,1,DSP," ","{FFFFFF}Create and enter in the box below Your password:\n{989898}Придумайте и укажите в поле ниже Ваш пароль:","ENTER","CLOSE");
			else return SPD(playerid,1,DSP," ","{FFFFFF}Придумайте и укажите в поле ниже Ваш пароль:\n{989898}Create and enter in the box below Your password:","ENTER","CLOSE");
  		}
  		else {
			if(Player[playerid][pLanguageTD] == 0) return SPD(playerid,2,DSP," ","{FFFFFF}Enter in the box below Your password:\n{989898}Укажите в поле ниже Ваш пароль:","ENTER","CLOSE");
			else return SPD(playerid,2,DSP," ","{FFFFFF}Укажите в поле ниже Ваш пароль:\n{989898}Enter in the box below Your password:","ENTER","CLOSE");
  		}
	}
	if(clickedid == RegistrationT[2]) {
	    if(GetPVarInt(playerid,"Error") != 0) { PlayerTextDrawColor(playerid, Registration[playerid][2], 0xAA3A3AFF); PlayerTextDrawShow(playerid, Registration[playerid][2]); return Timer[playerid] = SetTimerEx("Errors",500,0,"i",playerid); }
		if(GetPVarInt(playerid,"Location") == 1) {
	    	for(new td=0;td<5;td++) { if(td<3) TextDrawHideForPlayer(playerid,RegistrationT[td]); PlayerTextDrawHide(playerid,Registration[playerid][td]); }
    		TogglePlayerSpectating(playerid, 0);
    		TogglePlayerControllable(playerid, 0);
			SpawnPlayer(playerid);
			SetPlayerPosACSE(playerid,2076.57,1247.75,716.18);
			SetPlayerSkin(playerid,1);
	    	Player[playerid][pSkin] = 1;
			SetPlayerFacingAngle(playerid,289.8827);
			SetPlayerVirtualWorld(playerid, playerid+1000);
			if(Player[playerid][pLanguageTD] == 0) PlayerTextDrawSetString(playerid,CharMenu[playerid][0],"SKIN"); else PlayerTextDrawSetString(playerid,CharMenu[playerid][0],FixText("СКИН"));
	    	for(new td=0;td<6;td++) TextDrawShowForPlayer(playerid,CharMenuT[td]);
	    	TextDrawHideForPlayer(playerid,CharMenuT[3]); TextDrawHideForPlayer(playerid,CharMenuT[2]);
	    	TextDrawShowForPlayer(playerid,RegistrationT[3]); TextDrawShowForPlayer(playerid,RegistrationT[4]);
	    	for(new td=0;td<11;td++) PlayerTextDrawShow(playerid,CharMenu[playerid][td]);
	    	PlayerTextDrawBackgroundColor(playerid,CharMenu[playerid][1], -5636000);
    		SetPVarInt(playerid,"SkinEnter",0);
	    	for(new i=0;i<10;i++) {
				PlayerTextDrawSetPreviewModel(playerid, CharMenu[playerid][i+1], Skin[i]);
				if(Player[playerid][pSkin] == Skin[i]) PlayerTextDrawBackgroundColor(playerid,CharMenu[playerid][i+1], -5636000); else PlayerTextDrawBackgroundColor(playerid,CharMenu[playerid][i+1], 0xFFFFFF30);
				PlayerTextDrawShow(playerid,CharMenu[playerid][i+1]); }
		    InterpolateCameraPos(playerid, 2079.5432,1249.8418,716.6501, 2079.5432,1249.8418+2,716.6501, 2000);
			InterpolateCameraLookAt(playerid, 2071.2625,1245.6322,715.9300, 2071.2625,1245.6322,715.9300, 1000);
		}
		else {
		    new str[100];
		    mysql_format(mysql, str, sizeof(str), "SELECT * FROM `users` WHERE `Name` = '%e' LIMIT 1", Player[playerid][pName]);
			mysql_tquery(mysql, str, "LoadAccount", "d", playerid);
		}
		return true;
	}
	if(clickedid == RegistrationT[3]) {
	    if(GetPVarInt(playerid,"Location") != 1) return true;
	    new string[300];
	    mysql_format(mysql, string,sizeof(string), "INSERT INTO `users` (`Name`,`Pass`,`Language`,`LanguageTD`) VALUES ('%e','%e','%d','%d')",Player[playerid][pName],Player[playerid][pPass],Player[playerid][pLanguageTD],Player[playerid][pLanguageTD]);
		mysql_function_query(mysql, string, false, "", "");
		mysql_format(mysql, string, sizeof(string), "SELECT * FROM `users` WHERE `Name` = '%e' AND `Pass` = '%e' LIMIT 1", Player[playerid][pName], Player[playerid][pPass]);
		mysql_function_query(mysql, string, false, "", "");
		LoadMenu(playerid);
		return true;
	}
	if(clickedid == CharMenuT[4]) {
	    if(GetPVarInt(playerid,"SkinEnter") == 0) return true;
	    for(new i=15;i<25;i++) PlayerTextDrawHide(playerid,CharMenu[playerid][i]);
	    GivePVarInt(playerid,"SkinEnter",-5);
	    if(GetPVarInt(playerid,"SkinEnter") <= 10) {for(new i=0;i<10;i++) {
			PlayerTextDrawSetPreviewModel(playerid, CharMenu[playerid][i+1], Skin[i+GetPVarInt(playerid,"SkinEnter")]);
			if(Player[playerid][pSkin] == Skin[i+GetPVarInt(playerid,"SkinEnter")]) PlayerTextDrawBackgroundColor(playerid,CharMenu[playerid][i+1], -5636000); else PlayerTextDrawBackgroundColor(playerid,CharMenu[playerid][i+1], 0xFFFFFF30);
			PlayerTextDrawShow(playerid,CharMenu[playerid][i+1]); } }
		else {
		    for(new td=0;td<10;td++) PlayerTextDrawHide(playerid,CharMenu[playerid][td+1]);
		    for(new i=15;i<25;i++) PlayerTextDrawHide(playerid,CharMenu[playerid][i]);
			new c=GetPVarInt(playerid,"SkinEnter")-15; new ss=0;
			for(new i=0;i<10;i++) {
				for(new s=ss;s<282;s++) {
				    if(Player[playerid][pSkins][s] <= 0) continue;
				    if(c == 0) {
				        new str[30]; format(str,sizeof(str),"DAYS_________________%d",Player[playerid][pSkins][s]); PlayerTextDrawSetString(playerid,CharMenu[playerid][i+15],str);PlayerTextDrawShow(playerid,CharMenu[playerid][i+15]);
						PlayerTextDrawSetPreviewModel(playerid, CharMenu[playerid][i+1], SkinCase[s]);
						if(Player[playerid][pSkin] == SkinCase[s]) PlayerTextDrawBackgroundColor(playerid,CharMenu[playerid][i+1], -5636000); else PlayerTextDrawBackgroundColor(playerid,CharMenu[playerid][i+1], 0xFFFFFF30);
						PlayerTextDrawShow(playerid,CharMenu[playerid][i+1]); ss=s+1;
						break;
				    }
				    else c--;
				} } }
	    return true;
	}
	if(clickedid == CharMenuT[5]) {
	    if(GetPVarInt(playerid,"SkinEnter")-10 >= GetPVarInt(playerid,"SkinCount")) return true;
	    GivePVarInt(playerid,"SkinEnter",5);
	    if(GetPVarInt(playerid,"SkinEnter") <= 10) {for(new i=0;i<10;i++) {
			PlayerTextDrawSetPreviewModel(playerid, CharMenu[playerid][i+1], Skin[i+GetPVarInt(playerid,"SkinEnter")]);
			if(Player[playerid][pSkin] == Skin[i+GetPVarInt(playerid,"SkinEnter")]) PlayerTextDrawBackgroundColor(playerid,CharMenu[playerid][i+1], -5636000); else PlayerTextDrawBackgroundColor(playerid,CharMenu[playerid][i+1], 0xFFFFFF30);
			PlayerTextDrawShow(playerid,CharMenu[playerid][i+1]); } }
		else {
		    for(new td=0;td<10;td++) PlayerTextDrawHide(playerid,CharMenu[playerid][td+1]);
		    for(new i=15;i<25;i++) PlayerTextDrawHide(playerid,CharMenu[playerid][i]);
			new c=GetPVarInt(playerid,"SkinEnter")-15; new ss=0;
			for(new i=0;i<10;i++) {
				for(new s=ss;s<282;s++) {
				    if(Player[playerid][pSkins][s] <= 0) continue;
				    if(c == 0) {
				        new str[30]; format(str,sizeof(str),"DAYS_________________%d",Player[playerid][pSkins][s]); PlayerTextDrawSetString(playerid,CharMenu[playerid][i+15],str);PlayerTextDrawShow(playerid,CharMenu[playerid][i+15]);
						PlayerTextDrawSetPreviewModel(playerid, CharMenu[playerid][i+1], SkinCase[s]);
						if(Player[playerid][pSkin] == SkinCase[s]) PlayerTextDrawBackgroundColor(playerid,CharMenu[playerid][i+1], -5636000); else PlayerTextDrawBackgroundColor(playerid,CharMenu[playerid][i+1], 0xFFFFFF30);
						PlayerTextDrawShow(playerid,CharMenu[playerid][i+1]); ss=s+1;
						break;
				    }
				    else c--;
				} } }
	    return true;
	}
	if(clickedid == LobbyMenuT[2]) {
	    HideAllTextDraws(playerid);
	    TextDrawShowForPlayer(playerid,RegistrationT[0]);
        if(Player[playerid][pLanguageTD] == 0) PlayerTextDrawSetString(playerid,Registration[playerid][0],"/q_-_FOR_EXIT_THE_GAME");
        else PlayerTextDrawSetString(playerid,Registration[playerid][0],FixText("/q_-_ДЛЯ_ВЫХОДА_ИЗ_ИГРЫ"));
        PlayerTextDrawShow(playerid,Registration[playerid][0]);
		kick(playerid);
		return true;
	}
	if(clickedid == LobbyMenuT[5]) {
	    switch(GetPVarInt(playerid,"Location")) {
	        case 1: {
				if(Player[playerid][pLanguageTD] == 0) {
				    Player[playerid][pLanguageTD] = 1;
	        		PlayerTextDrawSetString(playerid,Registration[playerid][0],FixText("РЕГИСТРАЦИЯ")); PlayerTextDrawSetString(playerid,Registration[playerid][1],FixText("РЕГИСТРАЦИЯ"));
	        		PlayerTextDrawSetString(playerid,Registration[playerid][3],FixText("СОЗДАТЬ"));
	        		PlayerTextDrawSetString(playerid,CharMenu[playerid][0],FixText("СКИН"));
	        		if(GetPVarInt(playerid,"Error") == -1) PlayerTextDrawSetString(playerid,Registration[playerid][2],FixText("ВВЕДИТЕ_ПАРОЛЬ")); else if(GetPVarInt(playerid,"Error") == 0) PlayerTextDrawSetString(playerid,Registration[playerid][2],FixText("ВВЕДЕНО"));
	        		else if(GetPVarInt(playerid,"Error") == 1) PlayerTextDrawSetString(playerid,Registration[playerid][2],FixText("НЕВЕРНЫЕ_СИМВОЛЫ")); else if(GetPVarInt(playerid,"Error") == 2) PlayerTextDrawSetString(playerid,Registration[playerid][2],FixText("НЕВЕРНОЕ_КОЛ-ВО_СИМВОЛОВ"));
				}
				else {
				    Player[playerid][pLanguageTD] = 0;
	        		PlayerTextDrawSetString(playerid,Registration[playerid][0],"REGISTRATION"); PlayerTextDrawSetString(playerid,Registration[playerid][1],"REGISTRATION");
	        		PlayerTextDrawSetString(playerid,Registration[playerid][3],"CREATE");
	        		PlayerTextDrawSetString(playerid,CharMenu[playerid][0],"SKIN"); 
					if(GetPVarInt(playerid,"Error") == -1) PlayerTextDrawSetString(playerid,Registration[playerid][2],"ENTER_PASSWORD"); else if(GetPVarInt(playerid,"Error") == 0) PlayerTextDrawSetString(playerid,Registration[playerid][2],"ENTERED");
	        		else if(GetPVarInt(playerid,"Error") == 1) PlayerTextDrawSetString(playerid,Registration[playerid][2],"WRONG_SYMBOLS"); else if(GetPVarInt(playerid,"Error") == 2) PlayerTextDrawSetString(playerid,Registration[playerid][2],"WRONG_NUMBER_SYMBOLS");
				}
				return true;
			}
			case 2: {
				if(Player[playerid][pLanguageTD] == 0) {
				    Player[playerid][pLanguageTD] = 1;
	        		PlayerTextDrawSetString(playerid,Registration[playerid][0],FixText("АВТОРИЗАЦИЯ")); PlayerTextDrawSetString(playerid,Registration[playerid][1],FixText("АВТОРИЗАЦИЯ"));
	        		PlayerTextDrawSetString(playerid,Registration[playerid][3],FixText("ДАЛЕЕ"));
	        		if(GetPVarInt(playerid,"Error") == -1) PlayerTextDrawSetString(playerid,Registration[playerid][2],FixText("ВВЕДИТЕ_ПАРОЛЬ")); else if(GetPVarInt(playerid,"Error") == 0) PlayerTextDrawSetString(playerid,Registration[playerid][2],FixText("ВВЕДЕНО"));
	        		else if(GetPVarInt(playerid,"Error") == 1) PlayerTextDrawSetString(playerid,Registration[playerid][2],FixText("НЕВЕРНЫЙ_ПАРОЛЬ"));
				}
				else {
				    Player[playerid][pLanguageTD] = 0;
	        		PlayerTextDrawSetString(playerid,Registration[playerid][0],"AUTHORIZATION"); PlayerTextDrawSetString(playerid,Registration[playerid][1],"AUTHORIZATION");
	        		PlayerTextDrawSetString(playerid,Registration[playerid][3],"NEXT");
	        		if(GetPVarInt(playerid,"Error") == -1) PlayerTextDrawSetString(playerid,Registration[playerid][2],"ENTER_PASSWORD"); else if(GetPVarInt(playerid,"Error") == 0) PlayerTextDrawSetString(playerid,Registration[playerid][2],"ENTERED");
	        		else if(GetPVarInt(playerid,"Error") == 1) PlayerTextDrawSetString(playerid,Registration[playerid][2],"WRONG_PASSWORD");
				}
				return true;
			}
			case 4: {
			    SetPVarInt(playerid,"Location",3);
			    InterpolateCameraPos(playerid, 2079.5432,1249.8418+1,716.6501, 2079.5432,1249.8418,716.6501, 1000);
				InterpolateCameraLookAt(playerid, 2071.2625,1245.6322+1,715.9300, 2071.2625,1245.6322,715.9300, 1000);
				SetPlayerFacingAngle(playerid,289.8827);
        		PlayerTextDrawColor(playerid, LobbyMenu[playerid][2], -1061109505); PlayerTextDrawShow(playerid, LobbyMenu[playerid][2]);
			    for(new td=0;td<25;td++) PlayerTextDrawHide(playerid,CharMenu[playerid][td]);
			    for(new td=0;td<9;td++) TextDrawHideForPlayer(playerid,CharMenuT[td]);
				return true;
			}
			case 5: { PlayerTextDrawColor(playerid, LobbyMenu[playerid][1], -1061109505); PlayerTextDrawShow(playerid, LobbyMenu[playerid][1]); SetPVarInt(playerid,"Location",3); for(new td=0;td<4;td++) PlayerTextDrawHide(playerid,RewMenu[playerid][td]); for(new td=0;td<7;td++) TextDrawHideForPlayer(playerid,RewMenuT[td]); return true; }
			case 6: { PlayerTextDrawColor(playerid, LobbyMenu[playerid][3], -1061109505); PlayerTextDrawShow(playerid, LobbyMenu[playerid][3]); SetPVarInt(playerid,"Location",3); for(new td=0;td<11;td++) PlayerTextDrawHide(playerid,StatMenu[playerid][td]); return true; }
			case 7: {
				SetPVarInt(playerid,"Location",3); for(new td=0;td<19;td++) {if(td<7)PlayerTextDrawHide(playerid,SetMenu[playerid][td]); TextDrawHideForPlayer(playerid,SetMenuT[td]); }
				return true;
			}
		}
		if(Player[playerid][pLanguageTD] == 0) {
		    PlayerTextDrawSetString(playerid,SetMenu[playerid][0],"LANGUAGE_INTERFACE:");
		    PlayerTextDrawSetString(playerid,SetMenu[playerid][1],"LANGUAGE:");
		    PlayerTextDrawSetString(playerid,SetMenu[playerid][2],"ENGLISH");
		    if(Player[playerid][pLanguage] == 0) PlayerTextDrawSetString(playerid,SetMenu[playerid][3],"ENGLISH");
		    else PlayerTextDrawSetString(playerid,SetMenu[playerid][3],"RUSSIAN");
		    PlayerTextDrawSetString(playerid,SetMenu[playerid][4],"personal_message");
		    PlayerTextDrawSetString(playerid,SetMenu[playerid][5],"The_blacked_out_inventory");
		    PlayerTextDrawSetString(playerid,SetMenu[playerid][6],"Radar_at_the_top_of_the_screen");
		}
		else {
		    PlayerTextDrawSetString(playerid,SetMenu[playerid][0],FixText("ЯЗЫК_ИНТЕРФЕЙСА:"));
		    PlayerTextDrawSetString(playerid,SetMenu[playerid][1],FixText("ЯЗЫК:"));
		    PlayerTextDrawSetString(playerid,SetMenu[playerid][2],FixText("РУССКИЙ"));
		    if(Player[playerid][pLanguage] == 0) PlayerTextDrawSetString(playerid,SetMenu[playerid][3],FixText("АНГЛИЙСКИЙ"));
		    else PlayerTextDrawSetString(playerid,SetMenu[playerid][3],FixText("РУССКИЙ"));
		    PlayerTextDrawSetString(playerid,SetMenu[playerid][4],FixText("ЛИЧЫЕ_СООБЩЕНИЯ"));
		    PlayerTextDrawSetString(playerid,SetMenu[playerid][5],FixText("Затемнённый_инвентарь"));
		    PlayerTextDrawSetString(playerid,SetMenu[playerid][6],FixText("Радар_вверху_экрана"));
		}
		SetPVarInt(playerid,"Location",7);
        for(new td=0;td<19;td++) {if(td<7)PlayerTextDrawShow(playerid,SetMenu[playerid][td]); TextDrawShowForPlayer(playerid,SetMenuT[td]); }
		if(Player[playerid][pPM] == 0) TextDrawHideForPlayer(playerid,SetMenuT[16]);
		if(Player[playerid][pBI] == 0) TextDrawHideForPlayer(playerid,SetMenuT[17]);
		if(Player[playerid][pRadar] == 0) TextDrawHideForPlayer(playerid,SetMenuT[18]);
		return true;
	}
	if(clickedid == LobbyMenuT[19]) {
	    if(GetPVarInt(playerid,"Battlegrounds")==0) {
            SetPVarInt(playerid,"Battlegrounds",1);
		    for(new td=20;td<25;td++) TextDrawShowForPlayer(playerid,LobbyMenuT[td]);
		    if(GetPVarInt(playerid,"Team") == 0) TextDrawShowForPlayer(playerid,LobbyMenuT[25]);
		    else TextDrawShowForPlayer(playerid,LobbyMenuT[26]);
	    }
	    else {
            SetPVarInt(playerid,"Battlegrounds",0);
	    	for(new td=20;td<27;td++) TextDrawHideForPlayer(playerid,LobbyMenuT[td]);
	    }
	    return true;
	}
	if(clickedid == LobbyMenuT[22]) {
		if(GetPVarInt(playerid,"Team") == 0) return true;
		SetPVarInt(playerid,"Team",0); TextDrawShowForPlayer(playerid,LobbyMenuT[25]); TextDrawHideForPlayer(playerid,LobbyMenuT[26]);
		LoadMenu(playerid);
		SetPVarInt(playerid,"Teammate1",-1); SetPVarInt(playerid,"Teammate2",-1); SetPVarInt(playerid,"Teammate3",-1);  SetPVarInt(playerid,"Teammate4",-1);
	    return true;
	}
 	if(clickedid == TeammateSearchT[10]) {
        return SCM(playerid,"Временно отключено.","Temporarily disabled.");
	    /*if(GetPVarInt(playerid,"Teammate1") != playerid) return SCM(playerid,"{AA3A3A}| {DFDFDF}Вы не лидер.","{AA3A3A}| {DFDFDF}You not the leader.");
		if(GetPVarInt(playerid,"Teammate2") != -1 && GetPVarInt(playerid,"Teammate3") != -1 && GetPVarInt(playerid,"Teammate4") != -1) return SCM(playerid,"{AA3A3A}| {DFDFDF}Нет свободных мест.","{AA3A3A}| {DFDFDF}There are no free seats.");
		for(new td=0;td<10;td++) {
            if(SearchTeammate[td] >= 0) continue;
            if(SearchTeammate[td] == playerid) return SCM(playerid,"{AA3A3A}| {DFDFDF}Вас уже внесли в список.","{AA3A3A}| {DFDFDF}You already made the list.");
            SearchTeammate[td] = playerid;
            UpdateSearchTeammate(playerid);
            return true;
		}
		return SCM(playerid,"{AA3A3A}| {DFDFDF}В списке поиска нет мест.","{AA3A3A}| {DFDFDF}In the search list has no place.");*/
	}
	for(new td=0;td<10;td++) { if(clickedid == TeammateSearchT[td]) {
	    	if(SearchTeammate[td] == playerid) return SCM(playerid,"{AA3A3A}| {DFDFDF}Вы не можете присоединится к себе.","{AA3A3A}| {DFDFDF}You can not join yourself.");
	    	if(GetPVarInt(SearchTeammate[td],"Teammate2") != -1 && GetPVarInt(SearchTeammate[td],"Teammate3") != -1 && GetPVarInt(SearchTeammate[td],"Teammate4") != -1) {SearchTeammate[td]=-1;return SCM(playerid,"{AA3A3A}| {DFDFDF}В команде игрока нет места.","{AA3A3A}| {DFDFDF}In the team of the player no place."); }
		} }
	if(clickedid == LobbyMenuT[23]) {
	    if(GetPVarInt(playerid,"Team") == 1) return true;
    	for(new td=10;td<13;td++) TextDrawShowForPlayer(playerid,TeammateSearchT[td]);
	    UpdateSearchTeammate(playerid);
		SetPVarInt(playerid,"Team",1); TextDrawShowForPlayer(playerid,LobbyMenuT[26]); TextDrawHideForPlayer(playerid,LobbyMenuT[25]);
		for(new td=27;td<31;td++) TextDrawShowForPlayer(playerid,LobbyMenuT[td]);
		for(new td=6;td<10;td++) { PlayerTextDrawSetString(playerid,LobbyMenu[playerid][td],"none"); PlayerTextDrawShow(playerid,LobbyMenu[playerid][td]); }
		PlayerTextDrawSetString(playerid,LobbyMenu[playerid][6],Player[playerid][pName]);
		SetPVarInt(playerid,"Teammate1",playerid); SetPVarInt(playerid,"Teammate2",-1); SetPVarInt(playerid,"Teammate3",-1); SetPVarInt(playerid,"Teammate4",-1);
	    return true;
	}
	if(clickedid == LobbyMenuT[28]) {
	    if(GetPVarInt(playerid,"Teammate1") != playerid) return true;
	    if(GetPVarInt(playerid,"Teammate2") != -1) {
	        LoadMenu(GetPVarInt(playerid,"Teammate2")); PlayerTextDrawSetString(playerid,LobbyMenu[playerid][7],"none");
			for(new td=27;td<31;td++) TextDrawShowForPlayer(GetPVarInt(playerid,"Teammate2"),LobbyMenuT[td]);
			for(new td=6;td<10;td++) { PlayerTextDrawSetString(GetPVarInt(playerid,"Teammate2"),LobbyMenu[GetPVarInt(playerid,"Teammate2")][td],"none"); PlayerTextDrawShow(GetPVarInt(playerid,"Teammate2"),LobbyMenu[GetPVarInt(playerid,"Teammate2")][td]); }
			PlayerTextDrawSetString(GetPVarInt(playerid,"Teammate2"),LobbyMenu[GetPVarInt(playerid,"Teammate2")][6],Player[GetPVarInt(playerid,"Teammate2")][pName]);
			SCM(playerid, "Вас выгнали из команды.","You got kicked off the team.");
			SetPVarInt(GetPVarInt(playerid,"Teammate2"),"Teammate1",GetPVarInt(playerid,"Teammate2")); SetPVarInt(GetPVarInt(playerid,"Teammate2"),"Teammate2",-1); SetPVarInt(GetPVarInt(playerid,"Teammate2"),"Teammate3",-1); SetPVarInt(GetPVarInt(playerid,"Teammate2"),"Teammate4",-1);
        	SetPVarInt(playerid,"Teammate2",-1);
	        return true;
		}
	    if(Player[playerid][pLanguage]==0) SPD(playerid,3,DSI," ","{FFFFFF}Enter ID player","Enter","Exit"); else SPD(playerid,3,DSI," ","{FFFFFF}Введите ID игрока:","Ввести","Выйти");
	    return true;
	}
	if(clickedid == LobbyMenuT[29]) {
	    if(GetPVarInt(playerid,"Teammate1") != playerid) return true;
	    if(GetPVarInt(playerid,"Teammate3") != -1) {
	        LoadMenu(GetPVarInt(playerid,"Teammate3")); PlayerTextDrawSetString(playerid,LobbyMenu[playerid][8],"none");
			for(new td=27;td<31;td++) TextDrawShowForPlayer(GetPVarInt(playerid,"Teammate3"),LobbyMenuT[td]);
			for(new td=6;td<10;td++) { PlayerTextDrawSetString(GetPVarInt(playerid,"Teammate3"),LobbyMenu[GetPVarInt(playerid,"Teammate3")][td],"none"); PlayerTextDrawShow(GetPVarInt(playerid,"Teammate3"),LobbyMenu[GetPVarInt(playerid,"Teammate3")][td]); }
			PlayerTextDrawSetString(GetPVarInt(playerid,"Teammate3"),LobbyMenu[GetPVarInt(playerid,"Teammate3")][6],Player[GetPVarInt(playerid,"Teammate3")][pName]);
			SCM(GetPVarInt(playerid,"Teammate3"),"Вас выгнали из команды.","You got kicked off the team.");
			SetPVarInt(GetPVarInt(playerid,"Teammate3"),"Teammate1",GetPVarInt(playerid,"Teammate3")); SetPVarInt(GetPVarInt(playerid,"Teammate3"),"Teammate2",-1); SetPVarInt(GetPVarInt(playerid,"Teammate3"),"Teammate3",-1); SetPVarInt(GetPVarInt(playerid,"Teammate3"),"Teammate4",-1);
        	SetPVarInt(playerid,"Teammate3",-1);
	        return true;
		}
	    if(Player[playerid][pLanguage]==0) SPD(playerid,4,DSI," ","{FFFFFF}Enter ID player","Enter","Exit"); else SPD(playerid,4,DSI," ","{FFFFFF}Введите ID игрока:","Ввести","Выйти");
	    return true;
	}
	if(clickedid == LobbyMenuT[30]) {
	    if(GetPVarInt(playerid,"Teammate1") != playerid) return true;
	    if(GetPVarInt(playerid,"Teammate4") != -1) {
	        LoadMenu(GetPVarInt(playerid,"Teammate4")); PlayerTextDrawSetString(playerid,LobbyMenu[playerid][9],"none");
			for(new td=27;td<31;td++) TextDrawShowForPlayer(GetPVarInt(playerid,"Teammate4"),LobbyMenuT[td]);
			for(new td=6;td<10;td++) { PlayerTextDrawSetString(GetPVarInt(playerid,"Teammate4"),LobbyMenu[GetPVarInt(playerid,"Teammate4")][td],"none"); PlayerTextDrawShow(GetPVarInt(playerid,"Teammate4"),LobbyMenu[GetPVarInt(playerid,"Teammate4")][td]); }
			PlayerTextDrawSetString(GetPVarInt(playerid,"Teammate4"),LobbyMenu[GetPVarInt(playerid,"Teammate4")][6],Player[GetPVarInt(playerid,"Teammate4")][pName]);
			SCM(GetPVarInt(playerid,"Teammate4"),"Вас выгнали из команды.","You got kicked off the team.");
			SetPVarInt(GetPVarInt(playerid,"Teammate4"),"Teammate1",GetPVarInt(playerid,"Teammate4")); SetPVarInt(GetPVarInt(playerid,"Teammate4"),"Teammate2",-1); SetPVarInt(GetPVarInt(playerid,"Teammate4"),"Teammate3",-1); SetPVarInt(GetPVarInt(playerid,"Teammate4"),"Teammate4",-1);
        	SetPVarInt(playerid,"Teammate4",-1);
	        return true;
		}
	    if(Player[playerid][pLanguage]==0) SPD(playerid,5,DSI," ","{FFFFFF}Enter ID player","Enter","Exit"); else SPD(playerid,5,DSI," ","{FFFFFF}Введите ID игрока:","Ввести","Выйти");
	    return true;
	}
	if(clickedid == KilledT[8]) return LoadMenu(playerid);
	if(clickedid == KilledT[9]) {
 		for(new tm=1;tm<5;tm++) {
       		new str[10]; format(str,sizeof(str),"Teammate%d",tm);
       		if(GetPVarInt(playerid,str) == -1 ||  GetPVarInt(playerid,str) == playerid) continue;
       		if(GetPVarInt(GetPVarInt(playerid,str),"Location") == 11 || GetPVarInt(GetPVarInt(playerid,str),"Location") == 10) {
				TogglePlayerSpectating(playerid, 0);
				SpawnPlayer(playerid);
				TogglePlayerControllable(playerid, false);
				SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(GetPVarInt(playerid,str)));
				HideAllTextDraws(playerid);
				SetPVarInt(playerid,"Location",2000+GetPVarInt(playerid,str));
				CancelSelectTextDraw(playerid);
				TogglePlayerSpectating(playerid, true);
				TogglePlayerControllable(playerid, true);
				PlayerSpectatePlayer(playerid, GetPVarInt(playerid,str));
				break; }
		}
	    return true;
	}
	if(clickedid == SetMenuT[10] || clickedid == SetMenuT[11]) {
		if(Player[playerid][pLanguageTD] == 0) {
		    Player[playerid][pLanguageTD] = 1;
		    PlayerTextDrawSetString(playerid,SetMenu[playerid][0],FixText("ЯЗЫК_ИНТЕРФЕЙСА:"));
		    PlayerTextDrawSetString(playerid,SetMenu[playerid][1],FixText("ЯЗЫК:"));
		    PlayerTextDrawSetString(playerid,SetMenu[playerid][2],FixText("РУССКИЙ"));
		    if(Player[playerid][pLanguage] == 0) PlayerTextDrawSetString(playerid,SetMenu[playerid][3],FixText("АНГЛИЙСКИЙ"));
		    else PlayerTextDrawSetString(playerid,SetMenu[playerid][3],FixText("РУССКИЙ"));
		    PlayerTextDrawSetString(playerid,SetMenu[playerid][4],FixText("ЛИЧЫЕ_СООБЩЕНИЯ"));
		    PlayerTextDrawSetString(playerid,SetMenu[playerid][5],FixText("Затемнённый_инвентарь"));
		    PlayerTextDrawSetString(playerid,SetMenu[playerid][6],FixText("Радар_вверху_экрана"));
		    PlayerTextDrawSetString(playerid,LobbyMenu[playerid][0],FixText("ИГРАТЬ")); PlayerTextDrawSetString(playerid,LobbyMenu[playerid][1],FixText("НАГРАДЫ"));
	    	PlayerTextDrawSetString(playerid,LobbyMenu[playerid][2],FixText("ПЕРСОНАЖ")); PlayerTextDrawSetString(playerid,LobbyMenu[playerid][3],FixText("СТАТИСТИКА"));
		}
		else {
		    Player[playerid][pLanguageTD] = 0;
		    PlayerTextDrawSetString(playerid,SetMenu[playerid][0],"LANGUAGE_INTERFACE:");
		    PlayerTextDrawSetString(playerid,SetMenu[playerid][1],"LANGUAGE:");
		    PlayerTextDrawSetString(playerid,SetMenu[playerid][2],"ENGLISH");
		    if(Player[playerid][pLanguage] == 0) PlayerTextDrawSetString(playerid,SetMenu[playerid][3],"ENGLISH");
		    else PlayerTextDrawSetString(playerid,SetMenu[playerid][3],"RUSSIAN");
		    PlayerTextDrawSetString(playerid,SetMenu[playerid][4],"personal_message");
		    PlayerTextDrawSetString(playerid,SetMenu[playerid][5],"The_blacked_out_inventory");
		    PlayerTextDrawSetString(playerid,SetMenu[playerid][6],"Radar_at_the_top_of_the_screen");
		    PlayerTextDrawSetString(playerid,LobbyMenu[playerid][0],"PLAY"); PlayerTextDrawSetString(playerid,LobbyMenu[playerid][1],"REWARDS");
        	PlayerTextDrawSetString(playerid,LobbyMenu[playerid][2],"CHARACTER"); PlayerTextDrawSetString(playerid,LobbyMenu[playerid][3],"STATISTICS");
		}
		return true;
	}
	if(clickedid == SetMenuT[12] || clickedid == SetMenuT[13]) {
		if(Player[playerid][pLanguage] == 0) {Player[playerid][pLanguage] = 1; if(Player[playerid][pLanguageTD] == 0) PlayerTextDrawSetString(playerid,SetMenu[playerid][3],FixText("RUSSIAN")); else PlayerTextDrawSetString(playerid,SetMenu[playerid][3],FixText("РУССКИЙ")); }
		else {Player[playerid][pLanguage] = 0; if(Player[playerid][pLanguageTD] == 0) PlayerTextDrawSetString(playerid,SetMenu[playerid][3],"ENGLISH"); else PlayerTextDrawSetString(playerid,SetMenu[playerid][3],FixText("АНГЛИЙСКИЙ")); }
		return true;
	}
	if(clickedid == SetMenuT[14]) {
	    if(Player[playerid][pPM] == 0) { Player[playerid][pPM]=1; TextDrawShowForPlayer(playerid,SetMenuT[16]); }
	    else { Player[playerid][pPM]=0; TextDrawHideForPlayer(playerid,SetMenuT[16]); }
	    return true;
	}
	if(clickedid == SetMenuT[15]) {
	    if(Player[playerid][pBI] == 0) { Player[playerid][pBI]=1; TextDrawShowForPlayer(playerid,SetMenuT[17]); }
	    else { Player[playerid][pBI]=0; TextDrawHideForPlayer(playerid,SetMenuT[17]); }
	    return true;
	}
	if(clickedid == SetMenuT[4]) {
	    if(Player[playerid][pRadar] == 0) { Player[playerid][pRadar]=1; TextDrawShowForPlayer(playerid,SetMenuT[18]); }
	    else { Player[playerid][pRadar]=0; TextDrawHideForPlayer(playerid,SetMenuT[18]); }
	    return true;
	}
	if(clickedid == SetMenuT[8]) return DonateShow(playerid);
	//if(clickedid == SetMenuT[5]) return SettingsPassShow(playerid);
	if(clickedid == RewMenuT[6]) {
		new str[10];
	    if(Player[playerid][pRewardsC] == 0) { if(Player[playerid][pCoins] < 700) return true; Player[playerid][pCoins] -= 700;PlayerTextDrawSetString(playerid,RewMenu[playerid][1],"1400"); PlayerTextDrawSetString(playerid,RewMenu[playerid][3],"2st");}
	    else if(Player[playerid][pRewardsC] == 1) { if(Player[playerid][pCoins] < 1400) return true; Player[playerid][pCoins] -= 1400;PlayerTextDrawSetString(playerid,RewMenu[playerid][1],"2800"); PlayerTextDrawSetString(playerid,RewMenu[playerid][3],"3st");}
	    else if(Player[playerid][pRewardsC] == 2) { if(Player[playerid][pCoins] < 2800) return true; Player[playerid][pCoins] -= 2800;PlayerTextDrawSetString(playerid,RewMenu[playerid][1],"4200"); PlayerTextDrawSetString(playerid,RewMenu[playerid][3],"4st");}
	    else if(Player[playerid][pRewardsC] == 3) { if(Player[playerid][pCoins] < 4200) return true; Player[playerid][pCoins] -= 4200;PlayerTextDrawSetString(playerid,RewMenu[playerid][1],"5600"); PlayerTextDrawSetString(playerid,RewMenu[playerid][3],"5st");}
	    else if(Player[playerid][pRewardsC] == 4) { if(Player[playerid][pCoins] < 5600) return true; Player[playerid][pCoins] -= 5600;PlayerTextDrawSetString(playerid,RewMenu[playerid][1],"7000"); PlayerTextDrawSetString(playerid,RewMenu[playerid][3],"6st");}
	    else if(Player[playerid][pRewardsC] >= 5) { if(Player[playerid][pCoins] < 7000) return true; Player[playerid][pCoins] -= 7000;PlayerTextDrawSetString(playerid,RewMenu[playerid][1],"7000"); format(str,sizeof(str),"%dth",Player[playerid][pRewardsC]); PlayerTextDrawSetString(playerid,RewMenu[playerid][3],str);}
	    Player[playerid][pRewardsC]++; Player[playerid][pRewards]++;
		format(str,sizeof(str),"%d",Player[playerid][pCoins]);
		PlayerTextDrawSetString(playerid,LobbyMenu[playerid][5],str);
	    return true;
	}
	for(new clicktd=0;clicktd<5;clicktd++) {
		if(clickedid == InvGunT[clicktd]) {
		    if(GetPVarInt(playerid,"ClickTDD") > 0) {
				if(clicktd != 3 && clicktd != 4) PlayerTextDrawHide(playerid, InvGun[playerid][10+clicktd]);
				ResetPlayerWeapons(playerid);
				PlayerTextDrawHide(playerid, InvGun[playerid][clicktd]);
				PlayerTextDrawHide(playerid, InvGun[playerid][5+clicktd]); TextDrawHideForPlayer(playerid, InvGunT[clicktd]);
				TextDrawHideForPlayer(playerid, InvGunT[10+clicktd]); TextDrawHideForPlayer(playerid, InvGunT[5+clicktd]);
				new Float:x,Float:y,Float:z; GetPlayerPos(playerid,x,y,z);
				switch(clicktd) {
				    case 0: {
				    	RemovePlayerAttachedObject(playerid,3);
						switch(GetPVarInt(playerid,"pGun1")) {
							case 1: { SetPVarInt(playerid,"pGun1",0); UpdateWeapon(playerid); DropLoot(playerid,21,x,y,z-1,GetPlayerVirtualWorld(playerid),1); }
							case 2: { SetPVarInt(playerid,"pGun1",0); UpdateWeapon(playerid); DropLoot(playerid,22,x,y,z-1,GetPlayerVirtualWorld(playerid),1); }
							case 3: { SetPVarInt(playerid,"pGun1",0); UpdateWeapon(playerid); DropLoot(playerid,23,x,y,z-1,GetPlayerVirtualWorld(playerid),1); }
							case 4: { SetPVarInt(playerid,"pGun1",0); UpdateWeapon(playerid); DropLoot(playerid,24,x,y,z-1,GetPlayerVirtualWorld(playerid),1); }
							case 5: { SetPVarInt(playerid,"pGun1",0); UpdateWeapon(playerid); DropLoot(playerid,25,x,y,z-1,GetPlayerVirtualWorld(playerid),1); }
							case 6: { SetPVarInt(playerid,"pGun1",0); UpdateWeapon(playerid); DropLoot(playerid,26,x,y,z-1,GetPlayerVirtualWorld(playerid),1); }
							case 14: { SetPVarInt(playerid,"pGun1",0); UpdateWeapon(playerid); DropLoot(playerid,35,x,y,z-1,GetPlayerVirtualWorld(playerid),1); }
						}
				    }
				    case 1: {
				    	RemovePlayerAttachedObject(playerid,4);
						switch(GetPVarInt(playerid,"pGun2")) {
							case 1: { SetPVarInt(playerid,"pGun2",0); UpdateWeapon(playerid); DropLoot(playerid,21,x,y,z-1,GetPlayerVirtualWorld(playerid),1); }
							case 2: { SetPVarInt(playerid,"pGun2",0); UpdateWeapon(playerid); DropLoot(playerid,22,x,y,z-1,GetPlayerVirtualWorld(playerid),1); }
							case 3: { SetPVarInt(playerid,"pGun2",0); UpdateWeapon(playerid); DropLoot(playerid,23,x,y,z-1,GetPlayerVirtualWorld(playerid),1); }
							case 4: { SetPVarInt(playerid,"pGun2",0); UpdateWeapon(playerid); DropLoot(playerid,24,x,y,z-1,GetPlayerVirtualWorld(playerid),1); }
							case 5: { SetPVarInt(playerid,"pGun2",0); UpdateWeapon(playerid); DropLoot(playerid,25,x,y,z-1,GetPlayerVirtualWorld(playerid),1); }
							case 6: { SetPVarInt(playerid,"pGun2",0); UpdateWeapon(playerid); DropLoot(playerid,26,x,y,z-1,GetPlayerVirtualWorld(playerid),1); }
							case 14: { SetPVarInt(playerid,"pGun2",0); UpdateWeapon(playerid); DropLoot(playerid,35,x,y,z-1,GetPlayerVirtualWorld(playerid),1); }
						}
					}
				    case 2: {
						switch(GetPVarInt(playerid,"pGun3")) {
							case 7: { SetPVarInt(playerid,"pGun3",0); UpdateWeapon(playerid); DropLoot(playerid,27,x,y,z-1,GetPlayerVirtualWorld(playerid),1); }
							case 8: { SetPVarInt(playerid,"pGun3",0); UpdateWeapon(playerid); DropLoot(playerid,28,x,y,z-1,GetPlayerVirtualWorld(playerid),1); }
							case 9: { SetPVarInt(playerid,"pGun3",0); UpdateWeapon(playerid); DropLoot(playerid,29,x,y,z-1,GetPlayerVirtualWorld(playerid),1); }
						}
					}
				    case 3: { if(GetPVarInt(playerid,"pGun4") == 10) { SetPVarInt(playerid,"pGun4",0); UpdateWeapon(playerid); DropLoot(playerid,30,x,y,z-1,GetPlayerVirtualWorld(playerid),1); } }
					case 4: {
						if(GetPVarInt(playerid,"pGun5") != 0) {
							DropLoot(playerid,20+GetPVarInt(playerid,"pGun5"),x,y,z-1,GetPlayerVirtualWorld(playerid),1);
							if(GetPVarInt(playerid,"Grenades")==1) { DeletePVar(playerid,"Grenades");SetPVarInt(playerid,"pGun5",0);PlayerTextDrawHide(playerid, InvGun[playerid][13]); }
							else {
								PlayerTextDrawShow(playerid, InvGun[playerid][clicktd]);PlayerTextDrawShow(playerid, InvGun[playerid][5+clicktd]);TextDrawShowForPlayer(playerid, InvGunT[clicktd]);
								TextDrawShowForPlayer(playerid, InvGunT[10+clicktd]); TextDrawShowForPlayer(playerid, InvGunT[5+clicktd]);
								GivePVarInt(playerid,"Grenades",-1); RaiseGun(playerid,GetPVarInt(playerid,"pGun5"),5);}
                            UpdateWeapon(playerid);
						}
					}
				}
				SetPlayerPosACSE(playerid,x+0.001,y,z);
			}
		    else SetPVarInt(playerid,"ClickTDD",3);
		    return true;
		}
	}
	return true;
}
stock TeamRasform(p) {
	if(GetPVarInt(p,"Teammate2") != -1) { SetPVarInt(GetPVarInt(p,"Teammate2"),"Teammate2",-1); }
	if(GetPVarInt(p,"Teammate3") != -1) { SetPVarInt(GetPVarInt(p,"Teammate3"),"Teammate3",-1); }
	if(GetPVarInt(p,"Teammate4") != -1) { SetPVarInt(GetPVarInt(p,"Teammate4"),"Teammate4",-1); }
	return true;
}
stock EnterInGame(p,g) {
	SetPVarInt(p,"Location",8);
	foreach(Player, i) { if(g == GetPlayerVirtualWorld(i)) {
		new str[26+MAX_PLAYER_NAME]; format(str,sizeof(str),"%d",PlayersInGame[g]); PlayerTextDrawSetString(p,Indicators[p][5],str);
		if(Player[i][pLanguage] == 0) {if(Player[i][pAdm]>=5) format(str,sizeof(str),"Player %s(%d) joined the lobby.",Player[p][pName],p); else format(str,sizeof(str),"Player %s joined the lobby.",Player[p][pName]);}
		else {if(Player[i][pAdm]>=5) format(str,sizeof(str),"Игрок %s(%d) присоединился к лобби.",Player[p][pName],p); else format(str,sizeof(str),"Игрок %s присоединился к лобби.",Player[p][pName]);}
		SCM(i,str,str);
	} }
	HideAllTextDraws(p);
	for(new td=0;td<50;td++) { Player[p][Slot][td] = 0; Player[p][SlotC][td] = 0; }
	DeletePVar(p,"pHelmet"); DeletePVar(p,"pArmour");DeletePVar(p,"pBackpack");DeletePVar(p,"pKills");
    DeletePVar(p,"pReason"); DeletePVar(p,"Slots");DeletePVar(p,"DEATH");SetPVarInt(p,"GiftCar",-1);
    DeletePVar(p,"pGun1"); DeletePVar(p,"pGun2"); DeletePVar(p,"pGun3"); DeletePVar(p,"pGun4"); DeletePVar(p,"pGun5");DeletePVar(p,"Grenades");
    DeletePVar(p,"pAmmo1");DeletePVar(p,"pAmmo2");DeletePVar(p,"pAmmo3");DeletePVar(p,"pAmmo4");DeletePVar(p,"pAmmo5");DeletePVar(p,"pAmmo6");
	PlayerTextDrawTextSize(p, HUD[p][0], 125.000000, 14.000000);PlayerTextDrawShow(p,HUD[p][0]); TextDrawShowForPlayer(p,HUDT[0]);
	TogglePlayerSpectating(p, false); TogglePlayerControllable(p, true);
	SetPlayerVirtualWorld(p,g); SetPlayerFacingAngle(p,random(360));
    SetPlayerPosACSE(p,-2583.8032+random(27),3875.5337+random(55),11.2);
	SetCameraBehindPlayer(p); CancelSelectTextDraw(p);
    PlayerTextDrawShow(p,Indicators[p][0]); PlayerTextDrawShow(p,Indicators[p][3]);
	PlayerTextDrawShow(p,Indicators[p][5]); PlayerTextDrawShow(p,Indicators[p][7]);
	PlayerTextDrawColor(p, Indicators[p][8], -1829653249);PlayerTextDrawColor(p, Indicators[p][9], -1829653249);
	PlayerTextDrawShow(p,Indicators[p][8]); PlayerTextDrawShow(p,Indicators[p][9]);
	if(Player[p][pLanguageTD] == 0) PlayerTextDrawSetString(p,Indicators[p][7],"IN_LOBBY");
	else PlayerTextDrawSetString(p,Indicators[p][7],FixText("В_ЛОББИ"));
	return true;
}
public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid) {
	if(playertextid == CharMenu[playerid][12]) {
	    if(Player[playerid][pRewards]<=0) return true;
	    if(Player[playerid][pRewards]==1) { PlayerTextDrawHide(playerid,CharMenu[playerid][13]); PlayerTextDrawHide(playerid,CharMenu[playerid][12]); }
	    else { new str[5];format(str,sizeof(str),"x%d",Player[playerid][pRewards]-1);PlayerTextDrawSetString(playerid,CharMenu[playerid][13],str); }
	    Player[playerid][pRewards]--;
	    SetPVarInt(playerid,"ClickTDD",4);
	    new Winnings;
	    switch(random(15)) {
	        case 0..7:Winnings = random(87);
	        case 8..11:Winnings = 87+random(138);
	        case 12..14:Winnings = 225+random(57);
	    }
        if(Player[playerid][pSkins][Winnings] <= 0) GivePVarInt(playerid,"SkinCount",1);
		if(Winnings < 87) { Player[playerid][pSkins][Winnings]=Player[playerid][pSkins][Winnings]+30;PlayerTextDrawSetString(playerid,CharMenu[playerid][14],"DAYS________________30"); }
		else if(Winnings >= 225) { Player[playerid][pSkins][Winnings]=Player[playerid][pSkins][Winnings]+7;PlayerTextDrawSetString(playerid,CharMenu[playerid][14],"DAYS________________7"); }
		else { Player[playerid][pSkins][Winnings]=Player[playerid][pSkins][Winnings]+14;PlayerTextDrawSetString(playerid,CharMenu[playerid][14],"DAYS________________14"); }
		Winnings = SkinCase[Winnings];
	    PlayerTextDrawSetPreviewModel(playerid, RewMenu[playerid][4], Winnings);PlayerTextDrawShow(playerid,CharMenu[playerid][14]);
	    PlayerTextDrawShow(playerid,RewMenu[playerid][4]);PlayerTextDrawShow(playerid,RewMenu[playerid][5]); TextDrawShowForPlayer(playerid,RewMenuT[7]);
	    return true;
	}
	if(playertextid == LobbyMenu[playerid][0] && GetPVarInt(playerid,"Location") != 8) {
	    if(Restart > 0) return SCM(playerid,"{AA3A3A}| {DFDFDF}Сервер находится в ожидании рестарта. Начать игру можно будет после рестарта.","{AA3A3A}| {DFDFDF}The server is pending restart. To start the game after the restart.");
	    if(GetPVarInt(playerid,"Team") == 0) {
			for(new i=1;i<51;i++) {
			    if(Game[i] == 1 || (Game[i] >= 100 && Game[i] <=300)) {
			        if(PlayersInGame[i] >= 100) continue;
			        if(GetPVarInt(playerid,"Location") != 8) PlayersInGame[i]++;
			        SCM(playerid,"Игра в команде на данном режиме запрещена и будет наказываться.","The team at this mode is forbidden and will be punished.");
					EnterInGame(playerid,i);
					return true;
			    }
			}
			for(new i=1;i<51;i++) {
			    if(Game[i] == 0) {
			        Game[i] = 1;
			        PlayersInGame[i]=0;
			        WaitGame[i] = SetTimerEx("WaitGames",1000,1,"i",i);
			        SCM(playerid,"Игра в команде на данном режиме запрещена и будет наказываться.","The team at this mode is forbidden and will be punished.");
			        if(GetPVarInt(playerid,"Location") != 8) PlayersInGame[i]++;
			        EnterInGame(playerid,i);
			       	return true;
			    }
			}
		}
		else {
			for(new i=51;i<101;i++) {
			    if(Game[i] == 1 || (Game[i] >= 100 && Game[i] <=300)) {
			        if(GetPVarInt(playerid,"Teammate1") != playerid) return SCM(playerid,"{AA3A3A}| {DFDFDF}Игру может начать только лидер.","{AA3A3A}| {DFDFDF}The game could start only leader");
			        if(GetPVarInt(GetPVarInt(playerid,"Teammate2"),"Location") == 11 || GetPVarInt(GetPVarInt(playerid,"Teammate2"),"Location") == 10 || GetPVarInt(GetPVarInt(playerid,"Teammate2"),"Location") == 9 || GetPVarInt(GetPVarInt(playerid,"Teammate2"),"Location") == 8 ||
			            GetPVarInt(GetPVarInt(playerid,"Teammate3"),"Location") == 11 || GetPVarInt(GetPVarInt(playerid,"Teammate3"),"Location") == 10 || GetPVarInt(GetPVarInt(playerid,"Teammate3"),"Location") == 9 || GetPVarInt(GetPVarInt(playerid,"Teammate3"),"Location") == 8 ||
			            GetPVarInt(GetPVarInt(playerid,"Teammate4"),"Location") == 11 || GetPVarInt(GetPVarInt(playerid,"Teammate4"),"Location") == 10 || GetPVarInt(GetPVarInt(playerid,"Teammate4"),"Location") == 9 || GetPVarInt(GetPVarInt(playerid,"Teammate4"),"Location") == 8)  return SCM(playerid,"{AA3A3A}| {DFDFDF}Кто-то из команды уже играет.","{AA3A3A}| {DFDFDF}Someone from the team already plays.");
			        for(new tm=1;tm<5;tm++) {
			       		new str[10]; format(str,sizeof(str),"Teammate%d",tm);
				        if(GetPVarInt(GetPVarInt(playerid,"Teammate1"),str) == -1) continue;
				        if(GetPVarInt(GetPVarInt(playerid,str),"Location") != 8) PlayersInGame[i]++;
		    			EnterInGame(GetPVarInt(playerid,str),i);
						if(GetPVarInt(GetPVarInt(playerid,str),"Teammate2") != -1) SetPlayerMarkerForPlayer(GetPVarInt(playerid,str),GetPVarInt(playerid,"Teammate2"),0xB7AD3EFF);
						if(GetPVarInt(GetPVarInt(playerid,str),"Teammate3") != -1) SetPlayerMarkerForPlayer(GetPVarInt(playerid,str),GetPVarInt(playerid,"Teammate3"),0x57A444FF);
						if(GetPVarInt(GetPVarInt(playerid,str),"Teammate4") != -1) SetPlayerMarkerForPlayer(GetPVarInt(playerid,str),GetPVarInt(playerid,"Teammate4"),0x42719DFF);
						SetPlayerMarkerForPlayer(GetPVarInt(playerid,str),GetPVarInt(playerid,"Teammate1"),0xA44444FF);
					}
			        return true;
			    }
			}
			for(new i=51;i<101;i++) {
			    if(Game[i] == 0) {
			        if(GetPVarInt(playerid,"Teammate1") != playerid) return SCM(playerid,"{AA3A3A}| {DFDFDF}Игру может начать только лидер.","{AA3A3A}| {DFDFDF}The game could start only leader");
			        Game[i] = 1;
			        PlayersInGame[i]=0;
			        WaitGame[i] = SetTimerEx("WaitGames",1000,1,"i",i);
			        for(new tm=1;tm<5;tm++) {
			       		new str[10]; format(str,sizeof(str),"Teammate%d",tm);
				        if(GetPVarInt(GetPVarInt(playerid,"Teammate1"),str) == -1) continue;
				        if(GetPVarInt(GetPVarInt(playerid,str),"Location") != 8) PlayersInGame[i]++;
		    			EnterInGame(GetPVarInt(playerid,str),i);
						if(GetPVarInt(GetPVarInt(playerid,str),"Teammate2") != -1) SetPlayerMarkerForPlayer(GetPVarInt(playerid,str),GetPVarInt(playerid,"Teammate2"),0xB7AD3EFF);
						if(GetPVarInt(GetPVarInt(playerid,str),"Teammate3") != -1) SetPlayerMarkerForPlayer(GetPVarInt(playerid,str),GetPVarInt(playerid,"Teammate3"),0x57A444FF);
						if(GetPVarInt(GetPVarInt(playerid,str),"Teammate4") != -1) SetPlayerMarkerForPlayer(GetPVarInt(playerid,str),GetPVarInt(playerid,"Teammate4"),0x42719DFF);
						SetPlayerMarkerForPlayer(GetPVarInt(playerid,str),GetPVarInt(playerid,"Teammate1"),0xA44444FF);
					}
			        return true;
			    }
			}
		}
	    return true;
	}
	if(playertextid == LobbyMenu[playerid][1]) {
	    switch(GetPVarInt(playerid,"Location")) {
			case 4: {
			    SetPVarInt(playerid,"Location",3);
			    InterpolateCameraPos(playerid, 2079.5432,1249.8418+1,716.6501, 2079.5432,1249.8418,716.6501, 1000);
				InterpolateCameraLookAt(playerid, 2071.2625,1245.6322+1,715.9300, 2071.2625,1245.6322,715.9300, 1000);
				SetPlayerFacingAngle(playerid,289.8827);
        		PlayerTextDrawColor(playerid, LobbyMenu[playerid][2], -1061109505); PlayerTextDrawShow(playerid, LobbyMenu[playerid][2]);
			    for(new td=0;td<25;td++) PlayerTextDrawHide(playerid,CharMenu[playerid][td]);
			    for(new td=0;td<9;td++) TextDrawHideForPlayer(playerid,CharMenuT[td]);
				return true;
			}
			case 5: { PlayerTextDrawColor(playerid, LobbyMenu[playerid][1], -1061109505); PlayerTextDrawShow(playerid, LobbyMenu[playerid][1]); SetPVarInt(playerid,"Location",3); for(new td=0;td<6;td++) PlayerTextDrawHide(playerid,RewMenu[playerid][td]); for(new td=0;td<8;td++) TextDrawHideForPlayer(playerid,RewMenuT[td]); return true; }
			case 6: { PlayerTextDrawColor(playerid, LobbyMenu[playerid][3], -1061109505); PlayerTextDrawShow(playerid, LobbyMenu[playerid][3]); SetPVarInt(playerid,"Location",3); for(new td=0;td<11;td++) PlayerTextDrawHide(playerid,StatMenu[playerid][td]); return true; }
			case 7: {
				SetPVarInt(playerid,"Location",3); for(new td=0;td<19;td++) {if(td<7)PlayerTextDrawHide(playerid,SetMenu[playerid][td]); TextDrawHideForPlayer(playerid,SetMenuT[td]); }
				return true;
			}
		}
     	PlayerTextDrawColor(playerid, LobbyMenu[playerid][1], 0xFFFFFFFF); PlayerTextDrawShow(playerid, LobbyMenu[playerid][1]);
		SetPVarInt(playerid,"Location",5);
		if(Player[playerid][pLanguageTD]==0) { PlayerTextDrawSetString(playerid,RewMenu[playerid][0],"PIONEER_CRATE"); PlayerTextDrawSetString(playerid,RewMenu[playerid][2],"RECEIVE"); }
		else { PlayerTextDrawSetString(playerid,RewMenu[playerid][0],FixText("КЕЙС_'PIONEER'")); PlayerTextDrawSetString(playerid,RewMenu[playerid][2],FixText("ПОЛУЧИТЬ")); }
		new str[10];
	    if(Player[playerid][pRewardsC] == 0) { PlayerTextDrawSetString(playerid,RewMenu[playerid][1],"700"); PlayerTextDrawSetString(playerid,RewMenu[playerid][3],"1st");}
	    else if(Player[playerid][pRewardsC] == 1) { PlayerTextDrawSetString(playerid,RewMenu[playerid][1],"1400"); PlayerTextDrawSetString(playerid,RewMenu[playerid][3],"2st");}
	    else if(Player[playerid][pRewardsC] == 2) { PlayerTextDrawSetString(playerid,RewMenu[playerid][1],"2800"); PlayerTextDrawSetString(playerid,RewMenu[playerid][3],"3st");}
	    else if(Player[playerid][pRewardsC] == 3) { PlayerTextDrawSetString(playerid,RewMenu[playerid][1],"4200"); PlayerTextDrawSetString(playerid,RewMenu[playerid][3],"4st");}
	    else if(Player[playerid][pRewardsC] == 4) { PlayerTextDrawSetString(playerid,RewMenu[playerid][1],"5600"); PlayerTextDrawSetString(playerid,RewMenu[playerid][3],"5st");}
	    else if(Player[playerid][pRewardsC] == 5) { PlayerTextDrawSetString(playerid,RewMenu[playerid][1],"7000"); PlayerTextDrawSetString(playerid,RewMenu[playerid][3],"6st");}
	    else if(Player[playerid][pRewardsC] >= 6) { PlayerTextDrawSetString(playerid,RewMenu[playerid][1],"7000"); format(str,sizeof(str),"%dth",Player[playerid][pRewardsC]); PlayerTextDrawSetString(playerid,RewMenu[playerid][3],str);}
		for(new td=0;td<4;td++) PlayerTextDrawShow(playerid,RewMenu[playerid][td]);
		for(new td=0;td<7;td++) TextDrawShowForPlayer(playerid,RewMenuT[td]);
	    return true;
	}
	if(playertextid == LobbyMenu[playerid][2]) {
	    switch(GetPVarInt(playerid,"Location")) {
			case 4: {
			    SetPVarInt(playerid,"Location",3);
			    InterpolateCameraPos(playerid, 2079.5432,1249.8418+1,716.6501, 2079.5432,1249.8418,716.6501, 1000);
				InterpolateCameraLookAt(playerid, 2071.2625,1245.6322+1,715.9300, 2071.2625,1245.6322,715.9300, 1000);
				SetPlayerFacingAngle(playerid,289.8827);
        		PlayerTextDrawColor(playerid, LobbyMenu[playerid][2], -1061109505); PlayerTextDrawShow(playerid, LobbyMenu[playerid][2]);
			    for(new td=0;td<25;td++) PlayerTextDrawHide(playerid,CharMenu[playerid][td]);
			    for(new td=0;td<9;td++) TextDrawHideForPlayer(playerid,CharMenuT[td]);
				return true;
			}
			case 5: { PlayerTextDrawColor(playerid, LobbyMenu[playerid][1], -1061109505); PlayerTextDrawShow(playerid, LobbyMenu[playerid][1]); SetPVarInt(playerid,"Location",3); for(new td=0;td<6;td++) PlayerTextDrawHide(playerid,RewMenu[playerid][td]); for(new td=0;td<8;td++) TextDrawHideForPlayer(playerid,RewMenuT[td]); return true; }
			case 6: { PlayerTextDrawColor(playerid, LobbyMenu[playerid][3], -1061109505); PlayerTextDrawShow(playerid, LobbyMenu[playerid][3]); SetPVarInt(playerid,"Location",3); for(new td=0;td<11;td++) PlayerTextDrawHide(playerid,StatMenu[playerid][td]); return true; }
			case 7: {
				SetPVarInt(playerid,"Location",3); for(new td=0;td<19;td++) {if(td<7)PlayerTextDrawHide(playerid,SetMenu[playerid][td]); TextDrawHideForPlayer(playerid,SetMenuT[td]); }
				return true;
			}
		}
     	PlayerTextDrawColor(playerid, LobbyMenu[playerid][2], 0xFFFFFFFF); PlayerTextDrawShow(playerid, LobbyMenu[playerid][2]);
	    SetPVarInt(playerid,"Location",4);
	    InterpolateCameraPos(playerid, 2079.5432,1249.8418,716.6501, 2079.5432,1249.8418+1,716.6501, 1000);
		InterpolateCameraLookAt(playerid, 2071.2625,1245.6322,715.9300, 2071.2625,1245.6322+1,715.9300, 1000);
		SetPlayerFacingAngle(playerid,320.0);
		new SkinC=0;
		for(new i=0;i<282;i++) { if(Player[playerid][pSkins][i] > 0) SkinC++; }
		SetPVarInt(playerid,"SkinCount",SkinC);
		SetPVarInt(playerid,"SkinEnter",0);
		if(Player[playerid][pLanguageTD]==0) { PlayerTextDrawSetString(playerid,CharMenu[playerid][0],"WARDROBE"); PlayerTextDrawSetString(playerid,CharMenu[playerid][11],"REWARDS"); }
		else { PlayerTextDrawSetString(playerid,CharMenu[playerid][0],FixText("ШКАФ")); PlayerTextDrawSetString(playerid,CharMenu[playerid][11],FixText("НАГРАДЫ")); }
	   	for(new td=0;td<9;td++) TextDrawShowForPlayer(playerid,CharMenuT[td]);
    	for(new i=0;i<10;i++) {
			PlayerTextDrawSetPreviewModel(playerid, CharMenu[playerid][i+1], Skin[i]);
			if(Player[playerid][pSkin] == Skin[i]) PlayerTextDrawBackgroundColor(playerid,CharMenu[playerid][i+1], -5636000); else PlayerTextDrawBackgroundColor(playerid,CharMenu[playerid][i+1], 0xFFFFFF30);
			PlayerTextDrawShow(playerid,CharMenu[playerid][i+1]); }
	    for(new td=0;td<14;td++) {if((td==12 || td==13) && Player[playerid][pRewards]==0) continue; PlayerTextDrawShow(playerid,CharMenu[playerid][td]); }
	    if(Player[playerid][pRewards]!=0) { new str[5];format(str,sizeof(str),"x%d",Player[playerid][pRewards]);PlayerTextDrawSetString(playerid,CharMenu[playerid][13],str); }
		return true;
	}
	if(playertextid == LobbyMenu[playerid][3]) {
	    switch(GetPVarInt(playerid,"Location")) {
			case 4: {
			    SetPVarInt(playerid,"Location",3);
			    InterpolateCameraPos(playerid, 2079.5432,1249.8418+1,716.6501, 2079.5432,1249.8418,716.6501, 1000);
				InterpolateCameraLookAt(playerid, 2071.2625,1245.6322+1,715.9300, 2071.2625,1245.6322,715.9300, 1000);
				SetPlayerFacingAngle(playerid,289.8827);
        		PlayerTextDrawColor(playerid, LobbyMenu[playerid][2], -1061109505); PlayerTextDrawShow(playerid, LobbyMenu[playerid][2]);
			    for(new td=0;td<25;td++) PlayerTextDrawHide(playerid,CharMenu[playerid][td]);
			    for(new td=0;td<9;td++) TextDrawHideForPlayer(playerid,CharMenuT[td]);
				return true;
			}
			case 5: { PlayerTextDrawColor(playerid, LobbyMenu[playerid][1], -1061109505); PlayerTextDrawShow(playerid, LobbyMenu[playerid][1]); SetPVarInt(playerid,"Location",3); for(new td=0;td<6;td++) PlayerTextDrawHide(playerid,RewMenu[playerid][td]); for(new td=0;td<8;td++) TextDrawHideForPlayer(playerid,RewMenuT[td]); return true; }
			case 6: { PlayerTextDrawColor(playerid, LobbyMenu[playerid][3], -1061109505); PlayerTextDrawShow(playerid, LobbyMenu[playerid][3]); SetPVarInt(playerid,"Location",3); for(new td=0;td<11;td++) PlayerTextDrawHide(playerid,StatMenu[playerid][td]); return true; }
			case 7: {
				SetPVarInt(playerid,"Location",3); for(new td=0;td<19;td++) {if(td<7)PlayerTextDrawHide(playerid,SetMenu[playerid][td]); TextDrawHideForPlayer(playerid,SetMenuT[td]); }
				return true;
			}
		}
     	PlayerTextDrawColor(playerid, LobbyMenu[playerid][3], 0xFFFFFFFF); PlayerTextDrawShow(playerid, LobbyMenu[playerid][3]);
	    SetPVarInt(playerid,"Location",6);
	    new str[50];
	    if(Player[playerid][pLanguageTD] == 0) {
	        format(str,sizeof(str),"MURDER:_%d",Player[playerid][pMHands]+Player[playerid][pMDE]+Player[playerid][pM9mm]+Player[playerid][pMS9mm]+Player[playerid][pMSG]+Player[playerid][pMM4]+Player[playerid][pMAK47]+Player[playerid][pMCR]+Player[playerid][pMGrenade]);
	        PlayerTextDrawSetString(playerid,StatMenu[playerid][3],str);
	        format(str,sizeof(str),"DEATHS:_%d",Player[playerid][pDHands]+Player[playerid][pDDE]+Player[playerid][pD9mm]+Player[playerid][pDS9mm]+Player[playerid][pDSG]+Player[playerid][pDM4]+Player[playerid][pDAK47]+Player[playerid][pDCR]+Player[playerid][pDGrenade]+Player[playerid][pDOTHER]);
	        PlayerTextDrawSetString(playerid,StatMenu[playerid][5],str);
         	format(str,sizeof(str),"PLAYED:_%d",Player[playerid][pPlayed]);
         	PlayerTextDrawSetString(playerid,StatMenu[playerid][9],str);
         	format(str,sizeof(str),"WINS:_%d",Player[playerid][pWins]);
         	PlayerTextDrawSetString(playerid,StatMenu[playerid][10],str);
	        PlayerTextDrawSetString(playerid,StatMenu[playerid][4],"HANDS: DESERT_EAGLE: 9mm: SILENCED_9mm: SHOTGUN: M4: AK-47: COUNTRY_RIFLE: GRENADE:");
	        PlayerTextDrawSetString(playerid,StatMenu[playerid][6],"HANDS: DESERT_EAGLE: 9mm: SILENCED_9mm: SHOTGUN: M4: AK-47: COUNTRY_RIFLE: GRENADE: OTHER:");
	    }
	    else {
	        format(str,sizeof(str),FixText("УБИЙСТВ:_%d"),Player[playerid][pMHands]+Player[playerid][pMDE]+Player[playerid][pM9mm]+Player[playerid][pMS9mm]+Player[playerid][pMSG]+Player[playerid][pMM4]+Player[playerid][pMAK47]+Player[playerid][pMCR]+Player[playerid][pMGrenade]);
	        PlayerTextDrawSetString(playerid,StatMenu[playerid][3],str);
         	format(str,sizeof(str),FixText("СМЕРТЕЙ:_%d"),Player[playerid][pDHands]+Player[playerid][pDDE]+Player[playerid][pD9mm]+Player[playerid][pDS9mm]+Player[playerid][pDSG]+Player[playerid][pDM4]+Player[playerid][pDAK47]+Player[playerid][pDCR]+Player[playerid][pDGrenade]+Player[playerid][pDOTHER]);
         	PlayerTextDrawSetString(playerid,StatMenu[playerid][5],str);
         	format(str,sizeof(str),FixText("ИГР_СЫГРАНО:_%d"),Player[playerid][pPlayed]);
         	PlayerTextDrawSetString(playerid,StatMenu[playerid][9],str);
         	format(str,sizeof(str),FixText("ПОБЕД:_%d"),Player[playerid][pWins]);
         	PlayerTextDrawSetString(playerid,StatMenu[playerid][10],str);
	        PlayerTextDrawSetString(playerid,StatMenu[playerid][4],FixText("РУКАМИ: DESERT_EAGLE: 9mm: SILENCED_9mm: SHOTGUN: M4: AK-47: COUNTRY_RIFLE: ГРАНАТОЙ:"));
	        PlayerTextDrawSetString(playerid,StatMenu[playerid][6],FixText("РУКАМИ: DESERT_EAGLE: 9mm: SILENCED_9mm: SHOTGUN: M4: AK-47: COUNTRY_RIFLE: ГРАНАТОЙ: ОСТАЛЬНОЕ:"));
	    }
     	format(str,sizeof(str),"%d %d %d %d %d %d %d %d %d",Player[playerid][pMHands],Player[playerid][pMDE],Player[playerid][pM9mm],Player[playerid][pMS9mm],Player[playerid][pMSG],Player[playerid][pMM4],Player[playerid][pMAK47],Player[playerid][pMCR],Player[playerid][pMGrenade]);
     	PlayerTextDrawSetString(playerid,StatMenu[playerid][7],str);
     	format(str,sizeof(str),"%d %d %d %d %d %d %d %d %d %d",Player[playerid][pDHands],Player[playerid][pDDE],Player[playerid][pD9mm],Player[playerid][pDS9mm],Player[playerid][pDSG],Player[playerid][pDM4],Player[playerid][pDAK47],Player[playerid][pDCR],Player[playerid][pDGrenade],Player[playerid][pDOTHER]);
     	PlayerTextDrawSetString(playerid,StatMenu[playerid][8],str);
	    for(new td=0;td<11;td++) PlayerTextDrawShow(playerid,StatMenu[playerid][td]);
		return true;
	}
	for(new clicktd=0;clicktd<10;clicktd++) {
		if(playertextid == CharMenu[playerid][clicktd+1]) {
  			if(GetPVarInt(playerid,"SkinEnter") <= 10) {
		    	for(new i=0;i<10;i++) { if(Player[playerid][pSkin] == Skin[i+GetPVarInt(playerid,"SkinEnter")]) { PlayerTextDrawBackgroundColor(playerid,CharMenu[playerid][i+1], 0xFFFFFF30); PlayerTextDrawShow(playerid,CharMenu[playerid][i+1]); } }
		    	SetPlayerSkin(playerid,Skin[clicktd+GetPVarInt(playerid,"SkinEnter")]);
		    	Player[playerid][pSkin] = Skin[clicktd+GetPVarInt(playerid,"SkinEnter")];
				PlayerTextDrawBackgroundColor(playerid,CharMenu[playerid][clicktd+1], -5636000); PlayerTextDrawShow(playerid,CharMenu[playerid][clicktd+1]);
			}
			else {
			    new c=GetPVarInt(playerid,"SkinEnter")-15; new ss=clicktd;
				for(new i=0;i<10;i++) {PlayerTextDrawBackgroundColor(playerid,CharMenu[playerid][i+1], 0xFFFFFF30); }
		    	for(new s=0;s<282;s++) {
				    if(Player[playerid][pSkins][s] <= 0) continue;
				    if(c == 0) {
				        if(ss != 0) { ss--; continue; }
				        SetPlayerSkin(playerid,SkinCase[s]);
			    		Player[playerid][pSkin] = SkinCase[s];
						PlayerTextDrawBackgroundColor(playerid,CharMenu[playerid][clicktd+1], -5636000); PlayerTextDrawShow(playerid,CharMenu[playerid][clicktd+1]);
						break;
				    }
				    else c--;
				} }
			return true;
		}
		if(playertextid == CharMenu[playerid][clicktd+15]) {
		    new c=GetPVarInt(playerid,"SkinEnter")-15; new ss=clicktd;
			for(new s=0;s<282;s++) {
			    if(Player[playerid][pSkins][s] <= 0) continue;
			    if(c == 0) {
			        if(ss != 0) { ss--; continue; }
					new str[200];
					SetPVarInt(playerid,"ValidForSkin",s);
					if(Player[playerid][pLanguage] == 0) format(str,sizeof(str),"{FFFFFF}ID of skin: %d\t\tValid for %d days\n1 day = 10 RUB\t\tYou have %d RUB\nEnter how many days You want to extend this skin:",SkinCase[s],Player[playerid][pSkins][s],Player[playerid][pDonate]);
					else format(str,sizeof(str),"{FFFFFF}ID скина: %d\t\tДействует %d дней\n1 день = 10 RUB\tУ Вас %d RUB\nВведи на сколько дней Вы хотите продлить этот скин:",SkinCase[s],Player[playerid][pSkins][s],Player[playerid][pDonate]);
					if(Player[playerid][pLanguage] == 0) SPD(playerid,18,DSI,"{FFFFFF}Extension of skin",str,"Enter","Exit");
					else SPD(playerid,18,DSI,"{FFFFFF}Продлевание скина",str,"Ввести","Выход");
					break;
			    }
			    else c--;
			}
			return true;
		}
	}
	if(playertextid == InvSlot[playerid][82]) {
	    switch(Player[playerid][Slot][GetPVarInt(playerid,"ClickSlot")-1]) {
	        case 1: {
	            if(GetPVarFloat(playerid,"pHealth") == 125) return true;
				SetPVarInt(playerid,"Healing",25); PlayerTextDrawShow(playerid,TDProcess[playerid][0]); PlayerTextDrawSetString(playerid,TDProcess[playerid][1],"25"); PlayerTextDrawShow(playerid,TDProcess[playerid][1]); GivePVarInt(playerid,"Slots",-4);
			}
			case 2: {
	            if(GetPVarFloat(playerid,"pHealth") == 125) return true;
				SetPVarInt(playerid,"Healing",15); PlayerTextDrawShow(playerid,TDProcess[playerid][0]); PlayerTextDrawSetString(playerid,TDProcess[playerid][1],"15"); PlayerTextDrawShow(playerid,TDProcess[playerid][1]); GivePVarInt(playerid,"Slots",-3);
			}
			case 3: {
	            if(GetPVarFloat(playerid,"pHealth") == 125) return true;
	            SetPVarInt(playerid,"Healing",4); PlayerTextDrawShow(playerid,TDProcess[playerid][0]); PlayerTextDrawSetString(playerid,TDProcess[playerid][1],"4"); PlayerTextDrawShow(playerid,TDProcess[playerid][1]); GivePVarInt(playerid,"Slots",-2);
			}
			case 4,5: {
				if(GetPVarInt(playerid,"EnergyH") <= 100) {
					GivePVarInt(playerid,"EnergyH",50);
					PlayerTextDrawTextSize(playerid,HUD[playerid][1],25,3.0);
					PlayerTextDrawShow(playerid,HUD[playerid][1]); TextDrawShowForPlayer(playerid,HUDT[1]);
					if(GetPVarInt(playerid,"EnergyH")>50) {TextDrawShowForPlayer(playerid,HUDT[2]);PlayerTextDrawTextSize(playerid,HUD[playerid][2],GetPVarInt(playerid,"EnergyH")-50,3.0);PlayerTextDrawShow(playerid,HUD[playerid][2]);}}}
			case 6..11: SPD(playerid,Player[playerid][Slot][GetPVarInt(playerid,"ClickSlot")-1],DSI," ","{FFFFFF}Введите кол-во патронов:","Выкинуть","Отмена");
			/*case 34: { //NEWYEAR
			    new result,id,idc;
			    new Float: X, Float: Y, Float: Z;
				GetPlayerPos(playerid, X, Y, Z);
				new r=random(140);
				if(r<100 && r>80 && GetPVarFloat(playerid,"pHealth") <= 80) { SetPVarFloat(playerid,"pHealth",125); UpdateHealth(playerid); SCM(playerid,"{1FB8FF}| {FFFFFF}Подарке восстановил Вам {1FB8FF}HP{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift has restored You {1FB8FF}HP{FFFFFF}."); return true; }
				if(r>11 && r<15 && Player[playerid][pChristmasHat] == 0) {Player[playerid][pChristmasHat] = 1; SetPlayerAttachedObject(playerid,0, 19064, 2, 0.13, 0.0, 0.0, 0.0, 80.0, 80.0);SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке была {1FB8FF}новогодняя шапка{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the  {1FB8FF}Christmas hat{FFFFFF}."); return true; }
				switch(r) {
			        case 0: { result=0;id=400; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}автомобиль{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}car{FFFFFF}."); }
					case 12,18: { result=1; id=r;idc=100; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}Предмет{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}item{FFFFFF}."); }
					case 13,19: { result=1; id=r;idc=200; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}Предмет{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}item{FFFFFF}."); }
					case 14,20: { result=1; id=r;idc=300; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}Предмет{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}item{FFFFFF}."); }
					case 1,2,15..17,21..33: { result=1; id=r;idc=1; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}Предмет{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}item{FFFFFF}."); }
			        case 6..11: { result=1; id=r;idc=30; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}Предмет{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}item{FFFFFF}."); }
			        case 3..5: { result=1; id=r;idc=5; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}Предмет{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}item{FFFFFF}."); }
			        case 12+33,18+33: { result=1; id=r-33;idc=100; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}Предмет{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}item{FFFFFF}."); }
					case 13+33,19+33: { result=1; id=r-33;idc=200; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}Предмет{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}item{FFFFFF}."); }
					case 14+33,20+33: { result=1; id=r-33;idc=300; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}Предмет{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}item{FFFFFF}."); }
					case 1+33,2+33,15+33..17+33,21+33..33+33: { result=1; id=r-33;idc=1; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}Предмет{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}item{FFFFFF}."); }
			        case 6+33..11+33: { result=1; id=r-33;idc=30; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}Предмет{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}item{FFFFFF}."); }
			        case 3+33..5+33: { result=1; id=r-33;idc=5; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}Предмет{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}item{FFFFFF}."); }
			        case 12+66,18+66: { result=1; id=r-66;idc=100; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}Предмет{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}item{FFFFFF}."); }
					case 13+66,19+66: { result=1; id=r-66;idc=200; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}Предмет{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}item{FFFFFF}."); }
					case 14+66,20+66: { result=1; id=r-66;idc=300; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}Предмет{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}item{FFFFFF}."); }
					case 1+66,2+66,15+66..17+66,21+66..33+66: { result=1; id=r-66;idc=1; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}Предмет{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}item{FFFFFF}."); }
			        case 6+66..11+66: { result=1; id=r-66;idc=30; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}Предмет{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}item{FFFFFF}."); }
			        case 3+66..5+66: { result=1; id=r-66;idc=5; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}Предмет{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}item{FFFFFF}."); }
			        case 100..104: {Player[playerid][pDonate]=Player[playerid][pDonate]+10;SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке было {1FB8FF}10 доната{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was {1FB8FF}10 donation{FFFFFF}.");}
			        case 105..115: {Player[playerid][pCoins]=Player[playerid][pCoins]+200;SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке было {1FB8FF}10 BP{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was {1FB8FF}200 BP{FFFFFF}.");}
			    	case 116: { result=0;id=400; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}автомобиль{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}car{FFFFFF}."); }
			    	case 117: { result=0;id=413; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}автомобиль{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}car{FFFFFF}."); }
			    	case 118: { result=0;id=419; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}автомобиль{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}car{FFFFFF}."); }
			    	case 119: { result=0;id=429; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}автомобиль{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}car{FFFFFF}."); }
			    	case 120: { result=0;id=444; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}автомобиль{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}car{FFFFFF}."); }
			    	case 121: { result=0;id=451; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}автомобиль{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}car{FFFFFF}."); }
			    	case 122: { result=0;id=457; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}автомобиль{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}car{FFFFFF}."); }
			    	case 123: { result=0;id=475; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}автомобиль{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}car{FFFFFF}."); }
			    	case 124: { result=0;id=477; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}автомобиль{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}car{FFFFFF}."); }
			    	case 125: { result=0;id=486; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}автомобиль{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}car{FFFFFF}."); }
			    	case 126: { result=0;id=541; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}автомобиль{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}car{FFFFFF}."); }
			    	case 127: { result=0;id=561; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}автомобиль{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}car{FFFFFF}."); }
			    	case 128: { result=0;id=602; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}автомобиль{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}car{FFFFFF}."); }
			    	case 129: { result=0;id=603; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}автомобиль{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}car{FFFFFF}."); }
			    	case 130..139: { result=1;id=24; idc=1; SCM(playerid,"{1FB8FF}| {FFFFFF}В подарке был {1FB8FF}Предмет{FFFFFF}.","{1FB8FF}| {FFFFFF}The gift was the {1FB8FF}item{FFFFFF}."); }
			    }
			    switch(result) {
			        case 0: {
						new car = CreateVehicle(id, X, Y, Z+2, 0.0, 1, 1, -1);
						SetVehicleVirtualWorld(car,GetPlayerVirtualWorld(playerid));
						SetVehicleNumberPlate(car, "NEWYEAR");
						if(GetPVarInt(playerid,"GiftCar") > -1) DestroyVehicle(GetPVarInt(playerid,"GiftCar"));
						SetPVarInt(playerid,"GiftCar",car);
			        }
			        case 1: DropLoot(playerid,id,X,Y,Z-1,GetPlayerVirtualWorld(playerid),idc);
			    }
			}*/
	    }
	    switch(Player[playerid][Slot][GetPVarInt(playerid,"ClickSlot")-1]) {
			case 1..5,34: {
				if(Player[playerid][SlotC][GetPVarInt(playerid,"ClickSlot")-1] > 1) { Player[playerid][SlotC][GetPVarInt(playerid,"ClickSlot")-1]--; new str[20];format(str,sizeof(str),"%d",Player[playerid][SlotC][GetPVarInt(playerid,"ClickSlot")-1]); PlayerTextDrawSetString(playerid,InvSlot[playerid][GetPVarInt(playerid,"ClickSlot")+69],str); }
				else MoveSlot(playerid,GetPVarInt(playerid,"ClickSlot")-1,1);
			}
		}
		for(new td=81;td<85;td++) PlayerTextDrawDestroy(playerid,InvSlot[playerid][td]);
		switch(GetPVarInt(playerid,"pBackpack")) {
		    case 0: { PlayerTextDrawTextSize(playerid, InvStat[playerid][7], 4.000000, GetPVarInt(playerid,"Slots")*-22); }
		    case 1: { PlayerTextDrawTextSize(playerid, InvStat[playerid][7], 4.000000, GetPVarInt(playerid,"Slots")*-11); }
		    case 2: { PlayerTextDrawTextSize(playerid, InvStat[playerid][7], 4.000000, GetPVarInt(playerid,"Slots")*-5.5); }
		    case 3: { PlayerTextDrawTextSize(playerid, InvStat[playerid][7], 4.000000, GetPVarInt(playerid,"Slots")*-3.66666666667); }
		}
	    PlayerTextDrawShow(playerid, InvStat[playerid][7]);
	    return true;
	}
	if(playertextid == InvSlot[playerid][83]) {
	    switch(Player[playerid][Slot][GetPVarInt(playerid,"ClickSlot")-1]) {
			case 1: GivePVarInt(playerid,"Slots",-4); case 2: GivePVarInt(playerid,"Slots",-3); case 3: GivePVarInt(playerid,"Slots",-2); case 4,5: GivePVarInt(playerid,"Slots",-1);
			case 6: {
				GivePVarInt(playerid,"pAmmo1",-Player[playerid][SlotC][GetPVarInt(playerid,"ClickSlot")-1]);
				if(GetPVarInt(playerid,"pGun3") == 7) { UpdateWeapon(playerid); }
				if(GetPVarInt(playerid,"pGun3") == 8) { UpdateWeapon(playerid); }
			    if(GetPVarInt(playerid,"pGun1") == 6 || GetPVarInt(playerid,"pGun2") == 6) { UpdateWeapon(playerid); }
			}
		    case 7: { GivePVarInt(playerid,"pAmmo2",-Player[playerid][SlotC][GetPVarInt(playerid,"ClickSlot")-1]); if(GetPVarInt(playerid,"pGun3") == 9) { UpdateWeapon(playerid); } }
		    case 8: { GivePVarInt(playerid,"pAmmo3",-Player[playerid][SlotC][GetPVarInt(playerid,"ClickSlot")-1]); if(GetPVarInt(playerid,"pGun1") == 5 || GetPVarInt(playerid,"pGun2") == 5) { UpdateWeapon(playerid); } }
		    case 9: { GivePVarInt(playerid,"pAmmo4",-Player[playerid][SlotC][GetPVarInt(playerid,"ClickSlot")-1]); if(GetPVarInt(playerid,"pGun1") == 2 || GetPVarInt(playerid,"pGun2") == 2) { UpdateWeapon(playerid); } }
		    case 10: { GivePVarInt(playerid,"pAmmo5",-Player[playerid][SlotC][GetPVarInt(playerid,"ClickSlot")-1]); if(GetPVarInt(playerid,"pGun1") == 1 || GetPVarInt(playerid,"pGun2") == 1) { UpdateWeapon(playerid); } }
		    case 11: { GivePVarInt(playerid,"pAmmo6",-Player[playerid][SlotC][GetPVarInt(playerid,"ClickSlot")-1]); if(GetPVarInt(playerid,"pGun1") == 3 || GetPVarInt(playerid,"pGun2") == 3) { UpdateWeapon(playerid); } }
		}
	    switch(Player[playerid][Slot][GetPVarInt(playerid,"ClickSlot")-1]) {
	        case 1..5,34: {
				new Float:x,Float:y,Float:z; GetPlayerPos(playerid,x,y,z);
				DropLoot(playerid,Player[playerid][Slot][GetPVarInt(playerid,"ClickSlot")-1],x,y,z-1,GetPlayerVirtualWorld(playerid),1);
                SetPlayerPosACSE(playerid,x+0.001,y,z);
				if(Player[playerid][SlotC][GetPVarInt(playerid,"ClickSlot")-1] > 1) {
	                Player[playerid][SlotC][GetPVarInt(playerid,"ClickSlot")-1]--;
	                new str[20];format(str,sizeof(str),"%d",Player[playerid][SlotC][GetPVarInt(playerid,"ClickSlot")-1]); PlayerTextDrawSetString(playerid,InvSlot[playerid][GetPVarInt(playerid,"ClickSlot")+69],str);
	            }
	            else MoveSlot(playerid,GetPVarInt(playerid,"ClickSlot")-1,1);
				for(new td=81;td<85;td++) PlayerTextDrawDestroy(playerid,InvSlot[playerid][td]);
				DeletePVar(playerid,"ClickSlot");
				switch(GetPVarInt(playerid,"pBackpack")) {
				    case 0: { PlayerTextDrawTextSize(playerid, InvStat[playerid][7], 4.000000, GetPVarInt(playerid,"Slots")*-22); }
				    case 1: { PlayerTextDrawTextSize(playerid, InvStat[playerid][7], 4.000000, GetPVarInt(playerid,"Slots")*-11); }
				    case 2: { PlayerTextDrawTextSize(playerid, InvStat[playerid][7], 4.000000, GetPVarInt(playerid,"Slots")*-5.5); }
				    case 3: { PlayerTextDrawTextSize(playerid, InvStat[playerid][7], 4.000000, GetPVarInt(playerid,"Slots")*-3.66666666667); }
				}
			    PlayerTextDrawShow(playerid, InvStat[playerid][7]);
			}
	        case 6..11: {
				new Float:x,Float:y,Float:z; GetPlayerPos(playerid,x,y,z);
				DropLoot(playerid,Player[playerid][Slot][GetPVarInt(playerid,"ClickSlot")-1],x,y,z-1,GetPlayerVirtualWorld(playerid),Player[playerid][SlotC][GetPVarInt(playerid,"ClickSlot")-1]);
                SetPlayerPosACSE(playerid,x+0.001,y,z);
				MoveSlot(playerid,GetPVarInt(playerid,"ClickSlot")-1,1);
				for(new td=81;td<85;td++) PlayerTextDrawDestroy(playerid,InvSlot[playerid][td]);
				DeletePVar(playerid,"ClickSlot");
	        }
	    }
		return true;
	}
	for(new clicktd=0;clicktd<10;clicktd++) {
		if(playertextid == InvSlot[playerid][clicktd+20]) {
			if(RaiseLoot(playerid, Player[playerid][SlotLoot][clicktd+GetPVarInt(playerid,"SlidersInvLoot")], clicktd+GetPVarInt(playerid,"SlidersInvLoot"))) return true;
		}
		if(playertextid == InvSlot[playerid][clicktd+30]) {
			if(GetPVarInt(playerid,"ClickSlot") == 0) {
			    new Float: cc;
			    if(clicktd != 9) cc = 33.19167*clicktd; else cc = (33.19167*clicktd)-13;
				InvSlot[playerid][81] = CreatePlayerTextDraw(playerid, 188.019287, 103.216674+cc, "123");
				InvSlot[playerid][82] = CreatePlayerTextDraw(playerid, 187.923843, 147.2+cc, "LD_SPAC:white");
				InvSlot[playerid][83] = CreatePlayerTextDraw(playerid, 212.897674, 147.2+cc, "LD_SPAC:white");
				InvSlot[playerid][84] = CreatePlayerTextDraw(playerid, 193.873916, 149.999984+cc, "USE______DROP");
				PlayerTextDrawLetterSize(playerid, InvSlot[playerid][81], 0.449999, 1.600000);
				PlayerTextDrawTextSize(playerid, InvSlot[playerid][81], 50.000000, 55.000000);
				PlayerTextDrawAlignment(playerid, InvSlot[playerid][81], 1);
				PlayerTextDrawColor(playerid, InvSlot[playerid][81], -1);
				PlayerTextDrawUseBox(playerid, InvSlot[playerid][81], true);
				PlayerTextDrawBoxColor(playerid, InvSlot[playerid][81], 0);
				PlayerTextDrawSetShadow(playerid, InvSlot[playerid][81], 0);
				PlayerTextDrawSetOutline(playerid, InvSlot[playerid][81], 1);
				PlayerTextDrawBackgroundColor(playerid, InvSlot[playerid][81], -112);
				PlayerTextDrawFont(playerid, InvSlot[playerid][81], 5);
				PlayerTextDrawSetProportional(playerid, InvSlot[playerid][81], 1);
				PlayerTextDrawSetPreviewModel(playerid, InvSlot[playerid][81], GetObjectID(Player[playerid][Slot][clicktd]));
				TextDrawObjectRot(playerid, InvSlot[playerid][81],GetObjectID(Player[playerid][Slot][clicktd]));
				for(new td=82;td<84;td++) {
					PlayerTextDrawLetterSize(playerid, InvSlot[playerid][td], 0.000000, 0.000000);
					PlayerTextDrawTextSize(playerid, InvSlot[playerid][td], 25.500000, 10.500000);
					PlayerTextDrawAlignment(playerid, InvSlot[playerid][td], 1);
					PlayerTextDrawColor(playerid, InvSlot[playerid][td], -1);
					PlayerTextDrawSetShadow(playerid, InvSlot[playerid][td], 0);
					PlayerTextDrawSetOutline(playerid, InvSlot[playerid][td], 0);
					PlayerTextDrawFont(playerid, InvSlot[playerid][td], 4);
					PlayerTextDrawSetSelectable(playerid, InvSlot[playerid][td], true);
				}
				PlayerTextDrawLetterSize(playerid, InvSlot[playerid][84], 0.162795, 0.619998);
				PlayerTextDrawAlignment(playerid, InvSlot[playerid][84], 1);
				PlayerTextDrawColor(playerid, InvSlot[playerid][84], 255);
				PlayerTextDrawSetShadow(playerid, InvSlot[playerid][84], 0);
				PlayerTextDrawSetOutline(playerid, InvSlot[playerid][84], 0);
				PlayerTextDrawBackgroundColor(playerid, InvSlot[playerid][84], 51);
				PlayerTextDrawFont(playerid, InvSlot[playerid][84], 2);
				PlayerTextDrawSetProportional(playerid, InvSlot[playerid][84], 1);
				if(Player[playerid][pLanguage] == 0) PlayerTextDrawSetString(playerid,InvSlot[playerid][84],"USE______DROP");
				else PlayerTextDrawSetString(playerid,InvSlot[playerid][84],FixText("ИСП._____ВЫК."));
				if(Player[playerid][Slot][clicktd] == 6 || Player[playerid][Slot][clicktd] == 7 || Player[playerid][Slot][clicktd] == 8 || Player[playerid][Slot][clicktd] == 9 || Player[playerid][Slot][clicktd] == 10 || Player[playerid][Slot][clicktd] == 11) {
					if(Player[playerid][pLanguage] == 0) PlayerTextDrawSetString(playerid,InvSlot[playerid][84],"DROP_____ALL");
					else PlayerTextDrawSetString(playerid,InvSlot[playerid][84],FixText("ВЫК._____ВСЁ"));
				}
				for(new td=81;td<85;td++) PlayerTextDrawShow(playerid,InvSlot[playerid][td]);
				SetPVarInt(playerid,"ClickSlot",clicktd+1);
			}
			else {
				for(new td=81;td<85;td++) PlayerTextDrawDestroy(playerid,InvSlot[playerid][td]);
				DeletePVar(playerid,"ClickSlot");
			}
		}
	}
	if(playertextid == InvStat[playerid][2]) {
	    if(GetPVarInt(playerid,"ClickTDD") > 0) {
	        if(GetPVarInt(playerid,"pHelmet") <= 0)return true;
	        new Float:x,Float:y,Float:z; GetPlayerPos(playerid,x,y,z);
			RemovePlayerAttachedObject(playerid,0);
			if(Player[playerid][pChristmasHat] == 1) SetPlayerAttachedObject(playerid,0, 19066, 2, 0.13, 0.0, 0.0, 0.0, 80.0, 80.0);
			new id;
			if(GetPVarInt(playerid,"pHelmet") > 0 && GetPVarInt(playerid,"pHelmet") < 101) id = 12;
			else if(GetPVarInt(playerid,"pHelmet") > 100 && GetPVarInt(playerid,"pHelmet") < 201) id = 13;
			else if(GetPVarInt(playerid,"pHelmet") > 200 && GetPVarInt(playerid,"pHelmet") < 301) id = 14;
			DropLoot(playerid,id,x,y,z-1,GetPlayerVirtualWorld(playerid),GetPVarInt(playerid,"pHelmet"));
			SetPlayerPosACSE(playerid,x+0.001,y,z);
			PlayerTextDrawSetPreviewModel(playerid, InvStat[playerid][2], 1649); PlayerTextDrawSetPreviewRot(playerid, InvStat[playerid][2], 90.000000, 0.000000, 0.000000, 1.000000);
			PlayerTextDrawShow(playerid, InvStat[playerid][2]);PlayerTextDrawHide(playerid, InvStat[playerid][8]);
			PlayerTextDrawHide(playerid, HUD[playerid][4]);TextDrawHideForPlayer(playerid, HUDT[4]);
			DeletePVar(playerid,"pHelmet");
	    }
	    else SetPVarInt(playerid,"ClickTDD",3);
	    return true;
	}
	if(playertextid == InvStat[playerid][3]) {
	    if(GetPVarInt(playerid,"ClickTDD") > 0) {
	        if(GetPVarInt(playerid,"pArmour") <= 0)return true;
	        new Float:x,Float:y,Float:z; GetPlayerPos(playerid,x,y,z);
			PlayerTextDrawHide(playerid, HUD[playerid][3]);TextDrawHideForPlayer(playerid, HUDT[3]);
		    RemovePlayerAttachedObject(playerid,2);
			new id;
			if(GetPVarInt(playerid,"pArmour") > 0 && GetPVarInt(playerid,"pArmour") < 101) id = 18;
			else if(GetPVarInt(playerid,"pArmour") > 100 && GetPVarInt(playerid,"pArmour") < 201) id = 19;
			else if(GetPVarInt(playerid,"pArmour") > 200 && GetPVarInt(playerid,"pArmour") < 301) id = 20;
			DropLoot(playerid,id,x,y,z-1,GetPlayerVirtualWorld(playerid),GetPVarInt(playerid,"pArmour"));
			SetPlayerPosACSE(playerid,x+0.001,y,z);
			PlayerTextDrawSetPreviewModel(playerid, InvStat[playerid][3], 1649); PlayerTextDrawSetPreviewRot(playerid, InvStat[playerid][3], 90.000000, 0.000000, 0.000000, 1.000000);
			PlayerTextDrawShow(playerid, InvStat[playerid][3]);PlayerTextDrawHide(playerid, InvStat[playerid][9]);
			DeletePVar(playerid,"pArmour");
	    }
	    else SetPVarInt(playerid,"ClickTDD",3);
	    return true;
	}
	for(new td=0;td<5;td++) {
		if(playertextid == Sliders[playerid][td]) {
		    SetPVarInt(playerid,"SlidersInvLoot",td*10);
			ShowSliders(playerid);
			for(new d=0;d<10;d++) {PlayerTextDrawHide(playerid, InvSlot[playerid][d]); PlayerTextDrawHide(playerid, InvSlot[playerid][d+20]);PlayerTextDrawHide(playerid, InvSlot[playerid][d+40]); PlayerTextDrawHide(playerid, InvSlot[playerid][d+60]); }
		    for(new d=0;d<10;d++) {
				if(Player[playerid][SlotLoot][d+GetPVarInt(playerid,"SlidersInvLoot")] <= 0) break;
				PlayerTextDrawSetPreviewModel(playerid, InvSlot[playerid][d], GetObjectID(LootID[GetPlayerVirtualWorld(playerid)][Player[playerid][SlotLoot][d+GetPVarInt(playerid,"SlidersInvLoot")]]));
				TextDrawObjectRot(playerid, InvSlot[playerid][d],GetObjectID(LootID[GetPlayerVirtualWorld(playerid)][Player[playerid][SlotLoot][d+GetPVarInt(playerid,"SlidersInvLoot")]]));
				PlayerTextDrawSetString(playerid,InvSlot[playerid][d+40],GetObjectName(playerid,LootID[GetPlayerVirtualWorld(playerid)][Player[playerid][SlotLoot][d+GetPVarInt(playerid,"SlidersInvLoot")]]));
				new str[5]; format(str,sizeof(str),"%d",LootC[GetPlayerVirtualWorld(playerid)][Player[playerid][SlotLoot][d+GetPVarInt(playerid,"SlidersInvLoot")]]);
				if(LootID[GetPlayerVirtualWorld(playerid)][Player[playerid][SlotLoot][d+GetPVarInt(playerid,"SlidersInvLoot")]] == 19 || LootID[GetPlayerVirtualWorld(playerid)][Player[playerid][SlotLoot][d+GetPVarInt(playerid,"SlidersInvLoot")]] == 13) format(str,sizeof(str),"%d",LootC[GetPlayerVirtualWorld(playerid)][Player[playerid][SlotLoot][d+GetPVarInt(playerid,"SlidersInvLoot")]]-100);
				if(LootID[GetPlayerVirtualWorld(playerid)][Player[playerid][SlotLoot][d+GetPVarInt(playerid,"SlidersInvLoot")]] == 20 || LootID[GetPlayerVirtualWorld(playerid)][Player[playerid][SlotLoot][d+GetPVarInt(playerid,"SlidersInvLoot")]] == 14) format(str,sizeof(str),"%d",LootC[GetPlayerVirtualWorld(playerid)][Player[playerid][SlotLoot][d+GetPVarInt(playerid,"SlidersInvLoot")]]-200);
				PlayerTextDrawSetString(playerid,InvSlot[playerid][d+60],str);
			    PlayerTextDrawShow(playerid, InvSlot[playerid][d]); PlayerTextDrawShow(playerid, InvSlot[playerid][d+20]);
			    PlayerTextDrawShow(playerid, InvSlot[playerid][d+40]); PlayerTextDrawShow(playerid, InvSlot[playerid][d+60]);
			}
			break;
		}
		if(playertextid == Sliders[playerid][td+5]) {
		    SetPVarInt(playerid,"SlidersInv",td*10);
			ShowSliders(playerid);
			for(new d=0;d<10;d++) {PlayerTextDrawHide(playerid, InvSlot[playerid][d+10]); PlayerTextDrawHide(playerid, InvSlot[playerid][d+30]);PlayerTextDrawHide(playerid, InvSlot[playerid][d+50]); PlayerTextDrawHide(playerid, InvSlot[playerid][d+70]); }
		    for(new d=0;d<10;d++) {
				if(Player[playerid][Slot][d+GetPVarInt(playerid,"SlidersInv")] <= 0) break;
				PlayerTextDrawSetPreviewModel(playerid, InvSlot[playerid][d+10], GetObjectID(Player[playerid][Slot][d+GetPVarInt(playerid,"SlidersInv")]));
				TextDrawObjectRot(playerid, InvSlot[playerid][d+10],GetObjectID(Player[playerid][Slot][d+GetPVarInt(playerid,"SlidersInv")]));
				PlayerTextDrawSetString(playerid,InvSlot[playerid][d+50],GetObjectName(playerid,Player[playerid][Slot][d+GetPVarInt(playerid,"SlidersInv")]));
				new str[5]; format(str,sizeof(str),"%d",Player[playerid][SlotC][d+GetPVarInt(playerid,"SlidersInv")]);
				if(Player[playerid][Slot][d+GetPVarInt(playerid,"SlidersInv")] == 19 || Player[playerid][Slot][d+GetPVarInt(playerid,"SlidersInv")] == 13) format(str,sizeof(str),"%d",Player[playerid][SlotC][d+GetPVarInt(playerid,"SlidersInv")]-100);
				if(Player[playerid][Slot][d+GetPVarInt(playerid,"SlidersInv")] == 20 || Player[playerid][Slot][d+GetPVarInt(playerid,"SlidersInv")] == 14) format(str,sizeof(str),"%d",Player[playerid][SlotC][d+GetPVarInt(playerid,"SlidersInv")]-200);
				PlayerTextDrawSetString(playerid,InvSlot[playerid][d+70],str);
			    PlayerTextDrawShow(playerid, InvSlot[playerid][d+10]); PlayerTextDrawShow(playerid, InvSlot[playerid][d+30]);
			    PlayerTextDrawShow(playerid, InvSlot[playerid][d+50]); PlayerTextDrawShow(playerid, InvSlot[playerid][d+70]);
			}
			break;
		} }
	return true;
}
public OnDynamicObjectMoved(objectid) {
	for(new i=1;i<101;i++) {
		if(objectid == AirDrop[i][aObj][0]) {
		    AirDrop[i][aPos] = true;
		    AirDrop[i][aLookHP] = 20;
			DestroyDynamicObject(AirDrop[i][aObj][1]); DestroyDynamicObject(AirDrop[i][aObj][0]);
			DestroyDynamicObject(AirDrop[i][aDoorObj][0]); DestroyDynamicObject(AirDrop[i][aDoorObj][1]);DestroyDynamicObject(AirDrop[i][aLookObj]);
			AirDrop[i][aObj][0] = CreateDynamicObject(2669,AirDrop[i][aX], AirDrop[i][aY], AirDrop[i][aZ],0,0,0,i);
		    AirDrop[i][aDoorObj][0] = CreateDynamicObject(2678, AirDrop[i][aX]-0.76038,  AirDrop[i][aY]-2.6482, AirDrop[i][aZ]-0.13200, 0.00000, 0.00000, 0.00000,i);
		    AirDrop[i][aDoorObj][1] = CreateDynamicObject(2679, AirDrop[i][aX]+0.76135,  AirDrop[i][aY]-2.65039, AirDrop[i][aZ]-0.13200, 0.00000, 0.00000, 0.00000,i);
            AirDrop[i][aLookObj] = CreateDynamicObject(2680, AirDrop[i][aX]-0.01,  AirDrop[i][aY]-2.864, AirDrop[i][aZ]-0.1, -10.00000, 0.00000, 0.00000,i);
            AirDrop[i][a3dtext] = Create3DTextLabel("20/20", 0xFFFFFF80, AirDrop[i][aX]-0.01,  AirDrop[i][aY]-2.864, AirDrop[i][aZ]-0.1, 25.0 , i, 1);
		}
		if(objectid == Plan[i]) {
		    new rand=random(13);
		    AirDrop[i][aPos] = false;
		    AirDrop[i][aX] = AirDropSpawn[rand][0]; AirDrop[i][aY] = AirDropSpawn[rand][1]; AirDrop[i][aZ] = AirDropSpawn[rand][2];
		    foreach(Player, p) {
				if(i == GetPlayerVirtualWorld(p) && GetPVarInt(p,"Location") < 99) {
				    if(GetPVarInt(p,"Location") == 9) {
        				PlayerTextDrawHide(p, KeysF[p]);
        				for(new td=0;td<5;td++) TextDrawHideForPlayer(p, KeysFT[td]);
		            	SetPVarInt(p,"Location",10);
		        		new Float: X, Float: Y, Float: Z, Float: R;
		        		GetDynamicObjectPos(Plan[GetPlayerVirtualWorld(p)],X,Y,Z);
		        		GetDynamicObjectRot(Plan[GetPlayerVirtualWorld(p)],R,R,R);
						TogglePlayerSpectating(p, false);
						TogglePlayerControllable(p, true);
		            	SetPVarFloat(p,"pHealth",125.0);
		        		GivePlayerWeapon(p,46,1);
						SetPlayerSkin(p,Player[p][pSkin]);
				    	SetPlayerFacingAngle(p,R+180);
						SetCameraBehindPlayer(p);
		        		if(R<=225&&R>=135) { X=X-25+(X*0.0125); Y=Y-25; }
						else if(R>=-45&&R<=45) { X=X-25+(X*0.0125); Y=Y+25; }
						else if(R>=45&&R<=135) { Y=Y-25+(Y*0.01428571429); X=X-25; }
						else if(R>=225&&R<=315) { Y=Y-25+(Y*0.01428571429); X=X+25; }
		        		SetPlayerPosACSE(p,(X+10)-random(20),(Y+10)-random(20),483-random(6));
		        		SetPVarInt(p,"KeyF",10);
		        	}
		        	SetPlayerMapIcon(p,0,AirDrop[i][aX], AirDrop[i][aY], AirDrop[i][aZ],5,0,1);
				}
		    }
		    AirDrop[i][aObj][0] = CreateDynamicObject(2669,AirDrop[i][aX], AirDrop[i][aY], AirDrop[i][aZ]+100,0,0,0,i);
		    AirDrop[i][aObj][1] = CreateDynamicObject(18849, AirDrop[i][aX], AirDrop[i][aY], AirDrop[i][aZ]+7.5848+100, 0, 0, 0,i);
		    AirDrop[i][aDoorObj][0] = CreateDynamicObject(2678, AirDrop[i][aX]-0.76038,  AirDrop[i][aY]-2.6482, AirDrop[i][aZ]-0.13200+100, 0.00000, 0.00000, 0.00000,i);
		    AirDrop[i][aDoorObj][1] = CreateDynamicObject(2679, AirDrop[i][aX]+0.76135,  AirDrop[i][aY]-2.65039, AirDrop[i][aZ]-0.13200+100, 0.00000, 0.00000, 0.00000,i);
            AirDrop[i][aLookObj] = CreateDynamicObject(2680, AirDrop[i][aX]-0.01,  AirDrop[i][aY]-2.864, AirDrop[i][aZ]-0.10+100, -10.00000, 0.00000, 0.00000,i);
			MoveDynamicObject(AirDrop[i][aObj][0],AirDrop[i][aX], AirDrop[i][aY], AirDrop[i][aZ],2,0.0,0.0,0.0);
		    MoveDynamicObject(AirDrop[i][aObj][1],AirDrop[i][aX], AirDrop[i][aY], AirDrop[i][aZ]+7.5848,2);
		    MoveDynamicObject(AirDrop[i][aDoorObj][0],AirDrop[i][aX]-0.76038,  AirDrop[i][aY]-2.6482, AirDrop[i][aZ]-0.13200,2);
		    MoveDynamicObject(AirDrop[i][aDoorObj][1], AirDrop[i][aX]+0.76135,  AirDrop[i][aY]-2.65039, AirDrop[i][aZ]-0.13200, 2);
			MoveDynamicObject(AirDrop[i][aLookObj], AirDrop[i][aX],  AirDrop[i][aY]-2.814, AirDrop[i][aZ]-0.04, 2);
		    DestroyDynamicObject(Plan[i]);
			OffsetZone[i] = 1620;
			OffsetZoneTimer[i] = SetTimerEx("OffsetZones",1000,1,"i",i);
			return true;
		} }
    return true;
}
public OnPlayerObjectMoved(playerid,objectid) {
 	DestroyPlayerObject(playerid,objectid);
    return true;
}
public OnPlayerEditAttachedObject(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ) {
    new string[256];
    format(string,sizeof(string), "X: %f Y: %f Z: %f | RotX: %f RotY: %f RotZ: %f | ScaleX: %f ScaleY: %f ScaleZ: %f",fOffsetX,fOffsetY,fOffsetZ,fRotX,fRotY,fRotZ,fScaleX,fScaleY,fScaleZ);
    SCM(playerid,string,string);
    return true;
}
publics ClearAnim2(p) {
	ClearAnimations(p);
	KillTimer(ClearAnimTimer[p]);
	ClearAnimTimer[p] = 0;
	return true;
}
public OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid, bodypart) {
	SetPlayerHealth(playerid,1000);
	if(GetPVarInt(playerid,"AntiPad") != 0) SetPVarInt(playerid,"AntiPad",0);
    if((GetPVarInt(playerid,"Location") == 11 || GetPVarInt(playerid,"Location") == 10) && GetPVarInt(playerid,"DEATH") != 1) {
		switch(weaponid) {
		    case 22..36: return true;
			default:{SetPVarFloat(playerid,"pHealth",GetPVarFloat(playerid,"pHealth")-amount);UpdateHealth(playerid);}
		} }
    return true;
}
public OnPlayerGiveDamage(playerid, damagedid, Float: amount, weaponid, bodypart) {
	SetPlayerHealth(playerid,1000);
    new str[10];format(str,sizeof(str),"Shots%d",bodypart);GivePVarInt(playerid,str,1);
    return true;
}
stock Float: GetArmour(p, Float: dam) {
	if(GetPVarInt(p,"pArmour") <= 0) return dam;
	if(GetPVarInt(p,"pArmour") > 0 && GetPVarInt(p,"pArmour") < 101) dam=dam/1.2;
	else if(GetPVarInt(p,"pArmour") > 100 && GetPVarInt(p,"pArmour") < 201) dam=dam/1.5;
	else if(GetPVarInt(p,"pArmour") > 200 && GetPVarInt(p,"pArmour") < 301) dam=dam/2;
	GivePVarInt(p,"pArmour",-5);
	if(GetPVarInt(p,"pArmour") <= 0 || GetPVarInt(p,"pArmour") == 100 || GetPVarInt(p,"pArmour") == 200){
		RemovePlayerAttachedObject(p,2);
		DeletePVar(p,"pArmour");
	}
	return dam;
}
stock UpdateHealth(p) {
	new Float:h=GetPVarFloat(p,"pHealth");
	if(h<=0 && GetPVarInt(p,"DEATH") != 1) {
		h=0;
	    new str[110]; SetPVarInt(p,"DEATH",1);
	    ApplyAnimation(p, "PED", "KO_SHOT_FRONT", 3.0, 0, 0, 0, 1, 0,1);
	    PlayersInGame[GetPlayerVirtualWorld(p)]--;
		DropBox(p,GetPlayerVirtualWorld(p));
		if(GetPVarInt(p,"GiftCar") > -1) { SetPVarInt(p,"GiftCar",-1);DestroyVehicle(GetPVarInt(p,"GiftCar")); }
    	SetPVarInt(p,"Location",12);
		ShowFatalScreen(p,0);
        Player[p][pDOTHER]++;
	    foreach(Player, i) {
	        if(GetPlayerVirtualWorld(i) == GetPlayerVirtualWorld(p)) {
				format(str,sizeof(str),"%d",PlayersInGame[GetPlayerVirtualWorld(i)]); PlayerTextDrawSetString(i,Indicators[i][5],str);
				if(Player[i][pLanguage] == 0) format(str,sizeof(str),"%s died {FFFFFF}- %d left",Player[p][pName],PlayersInGame[GetPlayerVirtualWorld(i)]); else format(str,sizeof(str),"%s умирает {FFFFFF}- осталось %d",Player[p][pName],PlayersInGame[GetPlayerVirtualWorld(i)]); SCM(i,str,str);
				if(GetPVarInt(i,"Location") == p+1000){Spoff(i);LoadMenu(i);}
				else if(GetPVarInt(i,"Location") == p+2000) {
					for(new tm=1;tm<5;tm++) {
			       		format(str,sizeof(str),"Teammate%d",tm);
			       		if(GetPVarInt(p,str) == GetPVarInt(p,"Location")-2000) continue;
			       		if(GetPVarInt(p,str) == -1 ||  GetPVarInt(p,str) == p) continue;
			       		if(GetPVarInt(GetPVarInt(p,str),"Location") == 11 || GetPVarInt(GetPVarInt(p,str),"Location") == 10) {
							TogglePlayerSpectating(p, 0);
							SpawnPlayer(p);
							TogglePlayerControllable(p, false);
							SetPlayerVirtualWorld(p, GetPlayerVirtualWorld(GetPVarInt(p,str)));
							HideAllTextDraws(p);
							SetPVarInt(p,"Location",2000+GetPVarInt(p,str));
							CancelSelectTextDraw(p);
							TogglePlayerSpectating(p, true);
							TogglePlayerControllable(p, true);
							PlayerSpectatePlayer(p, GetPVarInt(p,str));
							return true; }
					}
					LoadMenu(i);
				}
			}
	    }
	}
	if(h>125) h=125;
    PlayerTextDrawTextSize(p, HUD[p][0], h, 14.000000);
	PlayerTextDrawShow(p,HUD[p][0]); TextDrawShowForPlayer(p,HUDT[0]);
	return true;
}
public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ) {
	//printf("%d with %d in %d %d (%f | %f | %f)",playerid, weaponid, hittype, hitid, fX, fY, fZ);
	if(GetPVarInt(playerid,"Location") == 8) return false;
	//if(GetPVarFloat(playerid,"LastfX") == fX && GetPVarFloat(playerid,"LastfY") == fY && GetPVarFloat(playerid,"LastfZ") == fZ && fX != 0.0 && fY != 0.0 && fZ != 0.0 && weaponid != 0) {
	//	new str[110];
	//	format(str,sizeof(str),"Игрок %s(%d) возможно аимет с оружия %d",Player[playerid][pName],playerid,weaponid);
	//	ASCM(str,str);
	//}//AntiCheat(playerid,1,);
	//SetPVarFloat(playerid,"LastfX",fX);SetPVarFloat(playerid,"LastfY",fY);SetPVarFloat(playerid,"LastfZ",fZ);
	GivePVarInt(playerid,"Shots",1);
	if(GetPVarInt(playerid, "AntiCBug") == 1) {
	    if(ClearAnimTimer[playerid] != 0) AntiCheat(playerid,2,"B30");
		ApplyAnimation(playerid,"PED","getup_front",4.0,1,0,0,0,0,1);
		ClearAnimTimer[playerid] = SetTimerEx("ClearAnim2", 1000, false, "d", playerid);
	}
	switch(weaponid) { case 24, 25, 33, 34: { if(GetPVarInt(playerid,"AntiCBug") <= 0) SetPVarInt(playerid, "AntiCBug", 1); } }
	switch(weaponid) {
	    case 22,23,29: GivePVarInt(playerid,"pAmmo1",-1);
	    case 24: GivePVarInt(playerid,"pAmmo2",-1);
	    case 25: GivePVarInt(playerid,"pAmmo3",-1);
	    case 31: GivePVarInt(playerid,"pAmmo4",-1);
	    case 30: GivePVarInt(playerid,"pAmmo5",-1);
	    case 33: GivePVarInt(playerid,"pAmmo6",-1);
	    case 34: GivePVarInt(playerid,"pAmmo6",-1);
	}
	if(hittype == BULLET_HIT_TYPE_PLAYER) {
	    if(GetPVarInt(playerid,"Team") == 1) { if(GetPVarInt(playerid,"Teammate1") == GetPVarInt(hitid,"Teammate1")) { return false; } }
	    if(fZ >= 0.66) {
			if((GetPVarInt(hitid,"pHelmet") == 0 && GetPVarInt(hitid,"DEATH") != 1)) {
	            new str[110],string[110];
	    		ApplyAnimation(hitid, "PED", "KO_SHOT_FRONT", 3.0, 0, 0, 0, 1, 0,1);
				SetPVarInt(hitid,"DEATH",1);
				SetPVarFloat(hitid,"pHealth",-1);
				PlayersInGame[GetPlayerVirtualWorld(hitid)]--;
	            GivePVarInt(playerid,"pKills",1);
				format(str,sizeof(str),"%d",GetPVarInt(playerid,"pKills"));PlayerTextDrawSetString(playerid,Indicators[playerid][4],str);PlayerTextDrawShow(playerid,Indicators[playerid][4]);
				PlayerTextDrawShow(playerid,Indicators[playerid][2]); PlayerTextDrawShow(playerid,Indicators[playerid][1]);
				if(Player[playerid][pLanguageTD] == 0) PlayerTextDrawSetString(playerid,Indicators[playerid][6],"Killed");
				else PlayerTextDrawSetString(playerid,Indicators[playerid][6],FixText("УБИТО"));
				PlayerTextDrawShow(playerid,Indicators[playerid][6]);
				switch(weaponid) {
					case 30: { str="AK-47"; Player[hitid][pDAK47]++; Player[playerid][pMAK47]++; } case 31: { str="M4"; Player[hitid][pDM4]++; Player[playerid][pMM4]++; } case 33: { str="Rifle"; Player[hitid][pDCR]++; Player[playerid][pMCR]++; }
					case 29: { str="MP5"; Player[hitid][pDMP5]++; Player[playerid][pMMP5]++; } case 22: { str="Colt45"; Player[hitid][pD9mm]++; Player[playerid][pM9mm]++; }
					case 23: { str="Silenced"; Player[hitid][pDS9mm]++; Player[playerid][pMS9mm]++; } case 24: { str="Desert Eagle"; Player[hitid][pDDE]++; Player[playerid][pMDE]++; }
					case 25: { str="shotgun"; Player[hitid][pDSG]++; Player[playerid][pMSG]++; } case 16: {str="grenade";Player[hitid][pDGrenade]++; Player[playerid][pMGrenade]++; }
					default: { str="knife"; Player[hitid][pDHands]++; Player[playerid][pMHands]++; } }
				format(string,sizeof(string),"YOU killed %s by headshot with %s - %d left",Player[hitid][pName],str,PlayersInGame[GetPlayerVirtualWorld(playerid)]);PlayerTextDrawSetString(playerid, Indicators[playerid][10],string);
	            format(string,sizeof(string),"%d KILL", GetPVarInt(playerid,"pKills"));PlayerTextDrawSetString(playerid, Indicators[playerid][9],string);
		        PlayerTextDrawColor(playerid, Indicators[playerid][9], -329901825); PlayerTextDrawShow(playerid, Indicators[playerid][9]);PlayerTextDrawShow(playerid, Indicators[playerid][10]);
	            SetPVarInt(playerid,"KILL",5);
				foreach(Player, i) {
			        if(GetPlayerVirtualWorld(i) == GetPlayerVirtualWorld(playerid)) {
			            switch(weaponid) { case 25: { if(Player[i][pLanguage] == 0) str="shotgun"; else str="дробовик"; } case 4: { if(Player[i][pLanguage] == 0) str="knife"; else str="нож"; } case 16: { if(Player[i][pLanguage] == 0) str="grenade"; else str="гранату"; } }
	                    if(Player[i][pLanguage] == 0) {if(Player[i][pAdm]>=5) format(string,sizeof(string),"%s(%d) killed %s(%d) by headshot with %s {FFFFFF}- %d left",Player[playerid][pName],playerid,Player[hitid][pName],hitid,str,PlayersInGame[GetPlayerVirtualWorld(i)]-1); else format(string,sizeof(string),"%s killed %s by headshot with %s {FFFFFF}- %d left",Player[playerid][pName],Player[hitid][pName],str,PlayersInGame[GetPlayerVirtualWorld(i)]-1);}
						else {if(Player[i][pAdm]>=5) format(string,sizeof(string),"%s(%d) убивает %s(%d) в голову, используя %s {FFFFFF}- осталось %d",Player[playerid][pName],playerid,Player[hitid][pName],hitid,str,PlayersInGame[GetPlayerVirtualWorld(i)]-1); else format(string,sizeof(string),"%s убивает %s в голову, используя %s {FFFFFF}- осталось %d",Player[playerid][pName],Player[hitid][pName],str,PlayersInGame[GetPlayerVirtualWorld(i)]-1);}
						SCM(i,string,string);
						format(string,sizeof(string),"%d",PlayersInGame[GetPlayerVirtualWorld(i)]-1); PlayerTextDrawSetString(i,Indicators[i][5],string);
						if(GetPVarInt(i,"Location") == hitid+1000){Spoff(i);LoadMenu(i);}
						else if(GetPVarInt(i,"Location") == hitid+2000) {
							for(new tm=1;tm<5;tm++) {
					       		format(string,sizeof(string),"Teammate%d",tm);
					       		if(GetPVarInt(hitid,string) == GetPVarInt(hitid,"Location")-2000) continue;
					       		if(GetPVarInt(hitid,string) == -1 ||  GetPVarInt(hitid,string) == hitid) continue;
					       		if(GetPVarInt(GetPVarInt(hitid,string),"Location") == 11 || GetPVarInt(GetPVarInt(hitid,string),"Location") == 10) {
									TogglePlayerSpectating(hitid, 0);
									SpawnPlayer(hitid);
									TogglePlayerControllable(hitid, false);
									SetPlayerVirtualWorld(hitid, GetPlayerVirtualWorld(GetPVarInt(hitid,string)));
									HideAllTextDraws(hitid);
									SetPVarInt(hitid,"Location",2000+GetPVarInt(hitid,string));
									CancelSelectTextDraw(hitid);
									TogglePlayerSpectating(hitid, true);
									TogglePlayerControllable(hitid, true);
									PlayerSpectatePlayer(hitid, GetPVarInt(hitid,string));
									continue; }
								LoadMenu(i);
							}
						}
					}
					DropBox(hitid,GetPlayerVirtualWorld(hitid));
					if(GetPVarInt(hitid,"GiftCar") > -1) { SetPVarInt(hitid,"GiftCar",-1);DestroyVehicle(GetPVarInt(hitid,"GiftCar")); }
			    	SetPVarInt(hitid,"Location",12);
					ShowFatalScreen(hitid,0);
				}
		    }
		    else {
				if(GetPVarInt(hitid,"pHelmet") <=100) GivePVarInt(hitid,"pHelmet",-25);
				if(GetPVarInt(hitid,"pHelmet") > 100 && GetPVarInt(hitid,"pHelmet") <=200) GivePVarInt(hitid,"pHelmet",-10);
				else GivePVarInt(hitid,"pHelmet",-5);
				if(GetPVarInt(hitid,"pHelmet") == 0 || GetPVarInt(hitid,"pHelmet") == 100 || GetPVarInt(hitid,"pHelmet") == 200){
					RemovePlayerAttachedObject(hitid,0);
					if(Player[playerid][pChristmasHat] == 1) SetPlayerAttachedObject(playerid,0, 19066, 2, 0.13, 0.0, 0.0, 0.0, 80.0, 80.0);
                    PlayerTextDrawHide(hitid, HUD[hitid][4]);TextDrawHideForPlayer(hitid, HUDT[4]);
					DeletePVar(hitid,"pHelmet");
				}
		    }
	    }
        new Float:xyz[3];
        GetPlayerPos(hitid,xyz[0],xyz[1],xyz[2]);
        new Float: DistantaAim = GetPlayerDistanceFromPoint(playerid,xyz[0],xyz[1],xyz[2]);
		switch(weaponid) {
			case 30: {
				if(DistantaAim > 70) return false;
				SetPVarFloat(hitid,"pHealth",GetPVarFloat(hitid,"pHealth")-GetArmour(hitid,12.0));
			}
			case 31: {
				if(DistantaAim > 90) return false;
				SetPVarFloat(hitid,"pHealth",GetPVarFloat(hitid,"pHealth")-GetArmour(hitid,12.0));
			}
			case 33: {
				if(DistantaAim > 100) return false;
				SetPVarFloat(hitid,"pHealth",GetPVarFloat(hitid,"pHealth")-GetArmour(hitid,39.0));
			}
			case 34: {
				if(DistantaAim > 200) return false;
				SetPVarFloat(hitid,"pHealth",GetPVarFloat(hitid,"pHealth")-GetArmour(hitid,49.0));
			}
			case 25: {
				if(DistantaAim > 30) return false;
				SetPVarFloat(hitid,"pHealth",GetPVarFloat(hitid,"pHealth")-GetArmour(hitid,100/(DistantaAim/3)));
			}
			case 29: {
				if(DistantaAim > 40) return false;
				SetPVarFloat(hitid,"pHealth",GetPVarFloat(hitid,"pHealth")-GetArmour(hitid,10.0));
			}
			case 22: {
				if(DistantaAim > 50) return false;
				SetPVarFloat(hitid,"pHealth",GetPVarFloat(hitid,"pHealth")-GetArmour(hitid,15.0));
			}
			case 23: {
				if(DistantaAim > 50) return false;
				SetPVarFloat(hitid,"pHealth",GetPVarFloat(hitid,"pHealth")-GetArmour(hitid,14.0));
			}
			case 24: {
				if(DistantaAim > 50) return false;
				SetPVarFloat(hitid,"pHealth",GetPVarFloat(hitid,"pHealth")-GetArmour(hitid,35.0));
			}
		}
		PlayerPlaySound(playerid,17802,0,0,0);
	    PlayerPlaySound(hitid,17802,0,0,0);
	    GivePVarInt(playerid,"ShotsPlayer",1);
		if(GetPVarFloat(hitid,"pHealth")<=0 && GetPVarInt(hitid,"DEATH") != 1) {
  			new str[110],string[110];
			SetPVarInt(hitid,"DEATH",1);
	    	ApplyAnimation(hitid, "PED", "KO_SHOT_FRONT", 3.0, 0, 0, 0, 1, 0,1);
			PlayersInGame[GetPlayerVirtualWorld(hitid)]--;
			GivePVarInt(playerid,"pKills",1);
			format(str,sizeof(str),"%d",GetPVarInt(playerid,"pKills"));PlayerTextDrawSetString(playerid,Indicators[playerid][4],str);PlayerTextDrawShow(playerid,Indicators[playerid][4]);
			PlayerTextDrawShow(playerid,Indicators[playerid][2]); PlayerTextDrawShow(playerid,Indicators[playerid][1]);
			if(Player[playerid][pLanguageTD] == 0) PlayerTextDrawSetString(playerid,Indicators[playerid][6],"Killed");
			else PlayerTextDrawSetString(playerid,Indicators[playerid][6],FixText("УБИТО"));
			PlayerTextDrawShow(playerid,Indicators[playerid][6]);
			switch(weaponid) {
				case 30: { str="AK-47"; Player[hitid][pDAK47]++; Player[playerid][pMAK47]++; } case 31: { str="M4"; Player[hitid][pDM4]++; Player[playerid][pMM4]++; } case 33: { str="Rifle"; Player[hitid][pDCR]++; Player[playerid][pMCR]++; }
				case 29: { str="MP5"; Player[hitid][pDMP5]++; Player[playerid][pMMP5]++; } case 22: { str="Colt45"; Player[hitid][pD9mm]++; Player[playerid][pM9mm]++; }
				case 23: { str="Silenced"; Player[hitid][pDS9mm]++; Player[playerid][pMS9mm]++; } case 24: { str="Desert Eagle"; Player[hitid][pDDE]++; Player[playerid][pMDE]++; }
				case 25: { Player[hitid][pDSG]++; Player[playerid][pMSG]++; } case 16: {Player[hitid][pDGrenade]++; Player[playerid][pMGrenade]++; }
				default: { Player[hitid][pDHands]++; Player[playerid][pMHands]++; } }
			format(string,sizeof(string),"YOU killed %s with %s - %d left",Player[hitid][pName],str,PlayersInGame[GetPlayerVirtualWorld(playerid)]);PlayerTextDrawSetString(playerid, Indicators[playerid][10],string);
            format(string,sizeof(string),"%d KILL", GetPVarInt(playerid,"pKills")); PlayerTextDrawSetString(playerid, Indicators[playerid][9],string);
	        PlayerTextDrawColor(playerid, Indicators[playerid][9], -329901825); PlayerTextDrawShow(playerid, Indicators[playerid][9]);PlayerTextDrawShow(playerid, Indicators[playerid][10]);
            SetPVarInt(playerid,"KILL",5);
			foreach(Player, i) {
		        if(GetPlayerVirtualWorld(i) == GetPlayerVirtualWorld(hitid)) {
		            switch(weaponid) { case 25: { if(Player[i][pLanguage] == 0) str="shotgun"; else str="дробовик"; } case 4: { if(Player[i][pLanguage] == 0) str="knife"; else str="нож"; } case 16: { if(Player[i][pLanguage] == 0) str="grenade"; else str="гранату"; } }
                    if(Player[i][pLanguage] == 0) {if(Player[i][pAdm]>=5) format(string,sizeof(string),"%s(%d) killed %s(%d) with %s {FFFFFF}- %d left",Player[playerid][pName],playerid,Player[hitid][pName],hitid,str,PlayersInGame[GetPlayerVirtualWorld(i)]); else format(string,sizeof(string),"%s killed %s with %s {FFFFFF}- %d left",Player[playerid][pName],Player[hitid][pName],str,PlayersInGame[GetPlayerVirtualWorld(i)]);}
					else {if(Player[i][pAdm]>=5) format(string,sizeof(string),"%s(%d) убивает %s(%d), используя %s {FFFFFF}- осталось %d",Player[playerid][pName],playerid,Player[hitid][pName],hitid,str,PlayersInGame[GetPlayerVirtualWorld(i)]); else format(string,sizeof(string),"%s убивает %s, используя %s {FFFFFF}- осталось %d",Player[playerid][pName],Player[hitid][pName],str,PlayersInGame[GetPlayerVirtualWorld(i)]);}
					SCM(i,string,string);
					format(string,sizeof(string),"%d",PlayersInGame[GetPlayerVirtualWorld(i)]); PlayerTextDrawSetString(i,Indicators[i][5],string);
					if(GetPVarInt(i,"Location") == hitid+1000){Spoff(i);LoadMenu(i);}
					else if(GetPVarInt(i,"Location") == hitid+2000) {
						for(new tm=1;tm<5;tm++) {
				       		format(string,sizeof(string),"Teammate%d",tm);
				       		if(GetPVarInt(hitid,string) == GetPVarInt(hitid,"Location")-2000) continue;
				       		if(GetPVarInt(hitid,string) == -1 ||  GetPVarInt(hitid,string) == hitid) continue;
				       		if(GetPVarInt(GetPVarInt(hitid,string),"Location") == 11 || GetPVarInt(GetPVarInt(hitid,string),"Location") == 10) {
								TogglePlayerSpectating(hitid, 0);
								SpawnPlayer(hitid);
								TogglePlayerControllable(hitid, false);
								SetPlayerVirtualWorld(hitid, GetPlayerVirtualWorld(GetPVarInt(hitid,string)));
								HideAllTextDraws(hitid);
								SetPVarInt(hitid,"Location",2000+GetPVarInt(hitid,string));
								CancelSelectTextDraw(hitid);
								TogglePlayerSpectating(hitid, true);
								TogglePlayerControllable(hitid, true);
								PlayerSpectatePlayer(hitid, GetPVarInt(hitid,string));
								continue; }
							LoadMenu(i);
						}
					}
				}
		    }
			DropBox(hitid,GetPlayerVirtualWorld(hitid));
			if(GetPVarInt(hitid,"GiftCar") > -1) { SetPVarInt(hitid,"GiftCar",-1);DestroyVehicle(GetPVarInt(hitid,"GiftCar")); }
	    	SetPVarInt(hitid,"Location",12);
			ShowFatalScreen(hitid,0);
			return false;
	    }
		UpdateHealth(hitid);
	}
	if(hittype == BULLET_HIT_TYPE_VEHICLE) {new Float:HPHP;GetVehicleHealth(hitid,HPHP);SetVehicleHealth(hitid,HPHP-25);GivePVarInt(playerid,"ShotsAuto",1);}
	return true;
}
public OnPlayerShootDynamicObject(playerid, weaponid, objectid, Float:x, Float:y, Float:z) {
	for(new i=1;i<101;i++) {
 		if(objectid == AirDrop[i][aLookObj] && AirDrop[i][aPos] == true) {
 		    if(AirDrop[i][aLookHP] > 1) {
				AirDrop[i][aLookHP]--;
				new str[6]; format(str,6,"%d/20",AirDrop[i][aLookHP]);
				Update3DTextLabelText(AirDrop[i][a3dtext], 0xFFFFFF80, str);
				return true; }
			foreach(Player, p) {
				if(i == GetPlayerVirtualWorld(p) && GetPVarInt(p,"Location") < 99) RemovePlayerMapIcon(p,0); }
			Delete3DTextLabel(AirDrop[i][a3dtext]);
 			DestroyDynamicObject(AirDrop[i][aDoorObj][0]);DestroyDynamicObject(AirDrop[i][aDoorObj][1]);DestroyDynamicObject(AirDrop[i][aLookObj]);
	    	AirDrop[i][aDoorObj][0] = CreateDynamicObject(2678, AirDrop[i][aX]-0.76038,  AirDrop[i][aY]-2.6482, AirDrop[i][aZ]-0.13200, 0.00000, 0.00000, -110.00000,i);
	    	AirDrop[i][aDoorObj][1] = CreateDynamicObject(2679, AirDrop[i][aX]+0.76135,  AirDrop[i][aY]-2.65039, AirDrop[i][aZ]-0.13200, 0.00000, 0.00000, 110.00000,i);
			switch(random(3)) { case 1:DropLoot(playerid,35,AirDrop[i][aX],AirDrop[i][aY],AirDrop[i][aZ]-1.2,GetPlayerVirtualWorld(playerid),1); case 0,2:DropLoot(playerid,24,AirDrop[i][aX],AirDrop[i][aY],AirDrop[i][aZ]-1.2,GetPlayerVirtualWorld(playerid),1); }
			DropLoot(playerid,20,AirDrop[i][aX]+0.76135,AirDrop[i][aY]+0.76135,AirDrop[i][aZ]-1.2,GetPlayerVirtualWorld(playerid),300);
			DropLoot(playerid,1,AirDrop[i][aX]-0.76038,AirDrop[i][aY]+0.76135,AirDrop[i][aZ]-1.2,GetPlayerVirtualWorld(playerid),1);
			DropLoot(playerid,11,AirDrop[i][aX],AirDrop[i][aY]-0.76038,AirDrop[i][aZ]-1.2,GetPlayerVirtualWorld(playerid),90);
			new Float:X,Float:Y,Float:Z; GetPlayerPos(playerid,X,Y,Z); SetPlayerPosACSE(playerid,X+0.001,Y,Z);
		}
 	}
	return true;
}
publics WaitGames(g) {
	if(PlayersInGame[g] <= 0) { Game[g]=0; return KillTimer(WaitGame[g]); }
    if(PlayersInGame[g] < MAXFORSTART) {
        Game[g] = 1;
		foreach(Player, i) {
		    if(g == GetPlayerVirtualWorld(i) && GetPVarInt(i,"Location") < 99) {
	        	new str[4]; format(str,sizeof(str),"%d",PlayersInGame[g]); PlayerTextDrawSetString(i,Indicators[i][5],str);
				if(Player[i][pLanguageTD] == 0) PlayerTextDrawSetString(i,Indicators[i][8],"WAITING_PLAYERS");
				else PlayerTextDrawSetString(i,Indicators[i][8],FixText("ОЖИДАНИЕ_ИГРОКОВ"));
				format(str,sizeof(str),"%d",MAXFORSTART-PlayersInGame[g]); PlayerTextDrawSetString(i,Indicators[i][9],str);
			}
		}
    }
    else {
        if(Game[g] == 1) { if(MAXFORSTART < 5) Game[g] = 106; else Game[g] = 160; }
        Game[g]--;
        if(Game[g] <= 100) { StartTheGame(g); KillTimer(WaitGame[g]); return Game[g]=2; }
		foreach(Player, i) {
		    if(g == GetPlayerVirtualWorld(i) && GetPVarInt(i,"Location") < 99) {
	        	new str[4]; format(str,sizeof(str),"%d",PlayersInGame[g]); PlayerTextDrawSetString(i,Indicators[i][5],str);
				if(Player[i][pLanguageTD] == 0) PlayerTextDrawSetString(i,Indicators[i][8],"MATCH_STARTS_IN");
				else PlayerTextDrawSetString(i,Indicators[i][8],FixText("Матч_начинается_через"));
				format(str,sizeof(str),"%d",Game[g]-100); PlayerTextDrawSetString(i,Indicators[i][9],str);
			}
		}
    }
	return true;
}
publics OffsetZones(g) {
	if(PlayersInGame[g] <= 0) { StopGame(g); KillTimer(OffsetZoneTimer[g]); }
	if(OffsetZone[g]>30 && MAXFORSTART>0) {
		if(PlayersInGame[g] <= 1 && g<51) {
			OffsetZone[g]=30;
		    foreach(Player,i) {
		    	if(g != GetPlayerVirtualWorld(i) || GetPVarInt(i,"Location") > 99) continue;
		    	if(GetPVarInt(i,"Location") != 12) ShowFatalScreen(i,1);
		    }
		}
		else if(PlayersInGame[g] <= 4 && g>=51) {
		    new id1 = -1,id2 = -1,id3 = -1,id4 = -1;
		    foreach(Player,i) {
				if(g != GetPlayerVirtualWorld(i) || GetPVarInt(i,"Location") > 99) continue;
				if(GetPVarInt(i,"Location") != 12) { if(id1 == -1) id1 = i; else if(id2 == -1) id2 = i; else if(id3 == -1) id3 = i; else if(id4 == -1) id4 = i; }
			}
			if(PlayersInGame[g] == 4) { if(GetPVarInt(id1,"Teammate1") == GetPVarInt(id2,"Teammate1") && GetPVarInt(id2,"Teammate1") == GetPVarInt(id3,"Teammate1") && GetPVarInt(id3,"Teammate1") == GetPVarInt(id4,"Teammate1")) { OffsetZone[g]=30;ShowFatalScreen(id1,1);ShowFatalScreen(id2,1);ShowFatalScreen(id3,1);ShowFatalScreen(id4,1); } }
			if(PlayersInGame[g] == 3) { if(GetPVarInt(id1,"Teammate1") == GetPVarInt(id2,"Teammate1") && GetPVarInt(id2,"Teammate1") == GetPVarInt(id3,"Teammate1")) { ShowFatalScreen(id1,1);ShowFatalScreen(id2,1);ShowFatalScreen(id3,1);OffsetZone[g]=30; } }
			if(PlayersInGame[g] == 2) { if(GetPVarInt(id1,"Teammate1") == GetPVarInt(id2,"Teammate1")) { OffsetZone[g]=30;ShowFatalScreen(id1,1);ShowFatalScreen(id2,1); } }
			if(PlayersInGame[g] == 1) {OffsetZone[g]=30;ShowFatalScreen(id1,1);}
		}
	}
	switch(OffsetZone[g]) {
	    case 1500..1560: { new str[10]; if(60-(1560-OffsetZone[g]) < 10) format(str,sizeof(str),"2:0%d",60-(1560-OffsetZone[g])); else format(str,sizeof(str),"2:%d",60-(1560-OffsetZone[g])); TextDrawSetString(Offset[g],str); }
	    case 1440..1499: { new str[10]; if(60-(1500-OffsetZone[g]) < 10) format(str,sizeof(str),"1:0%d",60-(1500-OffsetZone[g])); else format(str,sizeof(str),"1:%d",60-(1500-OffsetZone[g])); TextDrawSetString(Offset[g],str); }
	    case 1380..1439: { new str[10]; if(60-(1440-OffsetZone[g]) < 10) format(str,sizeof(str),"0:0%d",60-(1440-OffsetZone[g])); else format(str,sizeof(str),"0:%d",60-(1440-OffsetZone[g])); TextDrawSetString(Offset[g],str); }
	    case 1320..1379: { new str[10]; if(60-(1380-OffsetZone[g]) < 10) format(str,sizeof(str),"1:0%d",60-(1380-OffsetZone[g])); else format(str,sizeof(str),"1:%d",60-(1380-OffsetZone[g])); TextDrawSetString(Offset[g],str); }
	    case 1260..1319: { new str[10]; if(60-(1320-OffsetZone[g]) < 10) format(str,sizeof(str),"0:0%d",60-(1320-OffsetZone[g])); else format(str,sizeof(str),"0:%d",60-(1320-OffsetZone[g])); TextDrawSetString(Offset[g],str); }
		case 1230..1259: { new str[10]; if(30-(1260-OffsetZone[g]) < 10) format(str,sizeof(str),"0:0%d",30-(1260-OffsetZone[g])); else format(str,sizeof(str),"0:%d",30-(1260-OffsetZone[g])); TextDrawSetString(Offset[g],str); }
		case 1200..1229: { new str[10]; if(30-(1230-OffsetZone[g]) < 10) format(str,sizeof(str),"0:0%d",30-(1230-OffsetZone[g])); else format(str,sizeof(str),"0:%d",30-(1230-OffsetZone[g])); TextDrawSetString(Offset[g],str); }
	}
	switch(OffsetZone[g]) {
	    case 1560: {
	        OffsetZone[g]--;
	        GangZoneDestroy(Zone[0][g]);
			Zone[0][g] = GangZoneCreate(ZoneMinX[0][g], ZoneMinY[0][g],ZoneMaxX[0][g], ZoneMaxY[0][g]);
			ZoneMinX[1][g] = -1000+random(2500); ZoneMinY[1][g] = -3000+random(2100);
			ZoneMaxX[1][g] = ZoneMinX[1][g]+1500; ZoneMaxY[1][g] = ZoneMinY[1][g]+1400;
			Zone[1][g] = GangZoneCreate(ZoneMinX[1][g], ZoneMinY[1][g],ZoneMaxX[1][g], ZoneMaxY[1][g]);
			foreach(Player, i) {
			    if(g != GetPlayerVirtualWorld(i)) continue;
			    TextDrawShowForPlayer(i,Offset[g]);
	    		GangZoneShowForPlayer(i,Zone[0][g],0xFFFFFF70);
	    		GangZoneShowForPlayer(i,Zone[1][g],0x4F64B170);
			    PlayerTextDrawColor(i, Indicators[i][8], -269461761);
			    if(Player[i][pLanguageTD] == 0) PlayerTextDrawSetString(i, Indicators[i][8],"PROCEED_TO_THE_PLAYGROUND_AREA,_MARKED_ON_THE_MAP_FOR_3_MINUTES");
            	else PlayerTextDrawSetString(i, Indicators[i][8],FixText("ПРОСЛЕДУЙТЕ_В_ИГРОВУЮ_ОБЛАСТЬ,_ОТМЕЧЕННУЮ_НА_КАРТЕ_ЗА_3_МИНУТЫ"));
            	PlayerTextDrawShow(i, Indicators[i][8]);
            	SetPVarInt(i,"ZoneOffset",9);
	    	}
	    }
	    case 1500: { OffsetZone[g]--; foreach(Player, i) {
			if(g != GetPlayerVirtualWorld(i)) continue; if(Player[i][pLanguageTD] == 0) PlayerTextDrawSetString(i, Indicators[i][8],"LIMIT_THE_PLAYING_AREA_AFTER_2_MIN.!"); else PlayerTextDrawSetString(i, Indicators[i][8],FixText("ОГРАНИЧЕНИЕ_ИГРОВОЙ_ОБЛАСТИ_ЧЕРЕЗ_2_МИН.!")); PlayerTextDrawColor(i, Indicators[i][8], -269461761);PlayerTextDrawShow(i, Indicators[i][8]); SetPVarInt(i,"ZoneOffset",6); } }
	    case 1440,1320: { OffsetZone[g]--; foreach(Player, i) {
			if(g != GetPlayerVirtualWorld(i)) continue; if(Player[i][pLanguageTD] == 0) PlayerTextDrawSetString(i, Indicators[i][8],"LIMIT_THE_PLAYING_AREA_IN_1_MIN.!"); else PlayerTextDrawSetString(i, Indicators[i][8],FixText("ОГРАНИЧЕНИЕ_ИГРОВОЙ_ОБЛАСТИ_ЧЕРЕЗ_1_МИН.!")); PlayerTextDrawColor(i, Indicators[i][8], -269461761);PlayerTextDrawShow(i, Indicators[i][8]); SetPVarInt(i,"ZoneOffset",6); } }
	    case 1410,1290: { OffsetZone[g]--; foreach(Player, i) {
			if(g != GetPlayerVirtualWorld(i)) continue; if(Player[i][pLanguageTD] == 0) PlayerTextDrawSetString(i, Indicators[i][8],"LIMIT_THE_PLAYING_AREA_AFTER_30_SEC.!"); else PlayerTextDrawSetString(i, Indicators[i][8],FixText("ОГРАНИЧЕНИЕ_ИГРОВОЙ_ОБЛАСТИ_ЧЕРЕЗ_30_СЕК.!")); PlayerTextDrawColor(i, Indicators[i][8], -269461761);PlayerTextDrawShow(i, Indicators[i][8]); SetPVarInt(i,"ZoneOffset",6); } }
	    case 1390,1210,1240,1270: { OffsetZone[g]--; foreach(Player, i) {
			if(g != GetPlayerVirtualWorld(i)) continue; if(Player[i][pLanguageTD] == 0) PlayerTextDrawSetString(i, Indicators[i][8],"LIMIT_THE_PLAY_AREA_AFTER_10_SEC.!"); else PlayerTextDrawSetString(i, Indicators[i][8],FixText("ОГРАНИЧЕНИЕ_ИГРОВОЙ_ОБЛАСТИ_ЧЕРЕЗ_10_СЕК.!")); PlayerTextDrawColor(i, Indicators[i][8], -269461761);PlayerTextDrawShow(i, Indicators[i][8]); SetPVarInt(i,"ZoneOffset",6); } }
	    case 1385,1205,1235,1265: { OffsetZone[g]--; foreach(Player, i) {
			if(g != GetPlayerVirtualWorld(i)) continue; if(Player[i][pLanguageTD] == 0) PlayerTextDrawSetString(i, Indicators[i][8],"LIMIT_THE_PLAY_AREA_AFTER_5_SEC.!"); else PlayerTextDrawSetString(i, Indicators[i][8],FixText("ОГРАНИЧЕНИЕ_ИГРОВОЙ_ОБЛАСТИ_ЧЕРЕЗ_5_СЕК.!")); PlayerTextDrawColor(i, Indicators[i][8], -269461761);PlayerTextDrawShow(i, Indicators[i][8]); SetPVarInt(i,"ZoneOffset",6); } }
	    case 1381,1261,1231,1201: { OffsetZone[g]--; KillTimer(OffsetZoneTimer[g]); OffsetZoneTimer[g]=SetTimerEx("OffsetZones",100,1,"i",g); foreach(Player, i) {
			if(g != GetPlayerVirtualWorld(i)) continue; if(Player[i][pLanguageTD] == 0) PlayerTextDrawSetString(i, Indicators[i][8],"LIMIT_GAMING_AREA!"); else PlayerTextDrawSetString(i, Indicators[i][8],FixText("ОГРАНИЧЕНИЕ_ИГРОВОЙ_ОБЛАСТИ!")); PlayerTextDrawColor(i, Indicators[i][8], -269461761); PlayerTextDrawShow(i, Indicators[i][8]); SetPVarInt(i,"ZoneOffset",6); } }
		case 1380,1260,1230,1200: {
	        GangZoneDestroy(Zone[0][g]);
	        if(ZoneMaxX[1][g] != ZoneMaxX[0][g]) { ZoneMaxX[0][g]-=1; if(ZoneMaxX[0][g] < ZoneMaxX[1][g]) ZoneMaxX[0][g] = ZoneMaxX[1][g]; }
	        if(ZoneMaxY[1][g] != ZoneMaxY[0][g]) { ZoneMaxY[0][g]-=1; if(ZoneMaxY[0][g] < ZoneMaxY[1][g]) ZoneMaxY[0][g] = ZoneMaxY[1][g]; }
	        if(ZoneMinX[1][g] != ZoneMinX[0][g]) { ZoneMinX[0][g]+=1; if(ZoneMinX[0][g] > ZoneMinX[1][g]) ZoneMinX[0][g] = ZoneMinX[1][g]; }
	        if(ZoneMinY[1][g] != ZoneMinY[0][g]) { ZoneMinY[0][g]+=1; if(ZoneMinY[0][g] > ZoneMinY[1][g]) ZoneMinY[0][g] = ZoneMinY[1][g]; }
	        if(ZoneMaxX[1][g] == ZoneMaxX[0][g] && ZoneMaxY[1][g] == ZoneMaxY[0][g] && ZoneMinX[1][g] == ZoneMinX[0][g] && ZoneMinY[1][g] == ZoneMinY[0][g]) { KillTimer(OffsetZoneTimer[g]); OffsetZoneTimer[g]=SetTimerEx("OffsetZones",1000,1,"i",g); OffsetZone[g]--; }
			Zone[0][g] = GangZoneCreate(ZoneMinX[0][g], ZoneMinY[0][g],ZoneMaxX[0][g], ZoneMaxY[0][g]);
	        GangZoneDestroy(Zone[1][g]);
			Zone[1][g] = GangZoneCreate(ZoneMinX[1][g], ZoneMinY[1][g],ZoneMaxX[1][g], ZoneMaxY[1][g]);
   			foreach(Player, i) {
			    if(g != GetPlayerVirtualWorld(i)) continue;
			    TextDrawHideForPlayer(i,Offset[g]);
	    		GangZoneShowForPlayer(i,Zone[0][g],0xFFFFFF70);
	    		GangZoneShowForPlayer(i,Zone[1][g],0x4F64B170);
			}
	    }
	    case 1379: {
	        OffsetZone[g]--;
	        GangZoneDestroy(Zone[0][g]);
	        GangZoneDestroy(Zone[1][g]);
			Zone[0][g] = GangZoneCreate(ZoneMinX[0][g], ZoneMinY[0][g],ZoneMaxX[0][g], ZoneMaxY[0][g]);
			if(ZoneMaxY[1][g] < -1000) {
				ZoneMinX[1][g] = ZoneMinX[1][g]+random(600);
				if(ZoneMinX[1][g] > -600 && ZoneMinX[1][g] < 300) ZoneMinY[1][g] = ZoneMinY[1][g];
			    if(ZoneMinX[1][g] < -730 || ZoneMinX[1][g] > 1000) ZoneMinY[1][g] = ZoneMinY[1][g]+random(500);
			    else ZoneMinY[1][g] = ZoneMinY[1][g]+random(700);
			}
			else { ZoneMinX[1][g] = ZoneMinX[1][g]+random(1000); ZoneMinY[1][g] = ZoneMinY[1][g]+random(900); }
			ZoneMaxX[1][g] = ZoneMinX[1][g]+500; ZoneMaxY[1][g] = ZoneMinY[1][g]+400;
			Zone[1][g] = GangZoneCreate(ZoneMinX[1][g], ZoneMinY[1][g],ZoneMaxX[1][g], ZoneMaxY[1][g]);
			foreach(Player, i) {
			    if(g != GetPlayerVirtualWorld(i)) continue;
			    PlayerTextDrawColor(i, Indicators[i][8], -269461761);
			    TextDrawShowForPlayer(i,Offset[g]);
			    if(Player[i][pLanguageTD] == 0) PlayerTextDrawSetString(i, Indicators[i][8],"PROCEED_TO_THE_PLAYGROUND_AREA,_MARKED_ON_THE_MAP_FOR_2_MINUTES");
            	else PlayerTextDrawSetString(i, Indicators[i][8],FixText("ПРОСЛЕДУЙТЕ_В_ИГРОВУЮ_ОБЛАСТЬ,_ОТМЕЧЕННУЮ_НА_КАРТЕ_ЗА_2_МИНУТЫ"));
            	PlayerTextDrawShow(i, Indicators[i][8]);
            	SetPVarInt(i,"ZoneOffset",9);
	    		GangZoneShowForPlayer(i,Zone[0][g],0xFFFFFF70);
	    		GangZoneShowForPlayer(i,Zone[1][g],0x4F64B170);
	    	}
	    }
	    case 1259: {
	        OffsetZone[g]--;
	        GangZoneDestroy(Zone[0][g]);
	        GangZoneDestroy(Zone[1][g]);
			Zone[0][g] = GangZoneCreate(ZoneMinX[0][g], ZoneMinY[0][g],ZoneMaxX[0][g], ZoneMaxY[0][g]);
			ZoneMinX[1][g] = ZoneMinX[1][g]+random(300); ZoneMinY[1][g] = ZoneMinY[1][g]+random(250);
			ZoneMaxX[1][g] = ZoneMinX[1][g]+200; ZoneMaxY[1][g] = ZoneMinY[1][g]+150;
			Zone[1][g] = GangZoneCreate(ZoneMinX[1][g], ZoneMinY[1][g],ZoneMaxX[1][g], ZoneMaxY[1][g]);
			foreach(Player, i) {
			    if(g != GetPlayerVirtualWorld(i)) continue;
			    PlayerTextDrawColor(i, Indicators[i][8], -269461761);
			    TextDrawShowForPlayer(i,Offset[g]);
			    if(Player[i][pLanguageTD] == 0) PlayerTextDrawSetString(i, Indicators[i][8],"PROCEED_TO_THE_PLAYGROUND_AREA,_MARKED_ON_THE_MAP_FOR_30_SECONDS");
            	else PlayerTextDrawSetString(i, Indicators[i][8],FixText("ПРОСЛЕДУЙТЕ_В_ИГРОВУЮ_ОБЛАСТЬ,_ОТМЕЧЕННУЮ_НА_КАРТЕ_ЗА_30_СЕКУНД"));
            	PlayerTextDrawShow(i, Indicators[i][8]);
            	SetPVarInt(i,"ZoneOffset",8);
	    		GangZoneShowForPlayer(i,Zone[0][g],0xFFFFFF70);
	    		GangZoneShowForPlayer(i,Zone[1][g],0x4F64B170);
	    	}
	    }
	    case 1229: {
	        OffsetZone[g]--;
	        GangZoneDestroy(Zone[0][g]);
	        GangZoneDestroy(Zone[1][g]);
			Zone[0][g] = GangZoneCreate(ZoneMinX[0][g], ZoneMinY[0][g],ZoneMaxX[0][g], ZoneMaxY[0][g]);
			ZoneMinX[1][g] = ZoneMinX[1][g]+random(120); ZoneMinY[1][g] = ZoneMinY[1][g]+random(100);
			ZoneMaxX[1][g] = ZoneMinX[1][g]+80; ZoneMaxY[1][g] = ZoneMinY[1][g]+50;
			Zone[1][g] = GangZoneCreate(ZoneMinX[1][g], ZoneMinY[1][g],ZoneMaxX[1][g], ZoneMaxY[1][g]);
			foreach(Player, i) {
			    if(g != GetPlayerVirtualWorld(i)) continue;
			    PlayerTextDrawColor(i, Indicators[i][8], -269461761);
			    TextDrawShowForPlayer(i,Offset[g]);
			    if(Player[i][pLanguageTD] == 0) PlayerTextDrawSetString(i, Indicators[i][8],"PROCEED_TO_THE_PLAYGROUND_AREA,_MARKED_ON_THE_MAP_FOR_30_SECONDS");
            	else PlayerTextDrawSetString(i, Indicators[i][8],FixText("ПРОСЛЕДУЙТЕ_В_ИГРОВУЮ_ОБЛАСТЬ,_ОТМЕЧЕННУЮ_НА_КАРТЕ_ЗА_30_СЕКУНД"));
            	PlayerTextDrawShow(i, Indicators[i][8]);
            	SetPVarInt(i,"ZoneOffset",8);
	    		GangZoneShowForPlayer(i,Zone[0][g],0xFFFFFF70);
	    		GangZoneShowForPlayer(i,Zone[1][g],0x4F64B170);
	    	}
	    }
	    case 1..30: {
	        OffsetZone[g]--;
			foreach(Player, i) {
			    if(g != GetPlayerVirtualWorld(i)) continue;
			    PlayerTextDrawColor(i, Indicators[i][8], -1829653249);PlayerTextDrawColor(i, Indicators[i][9], -1829653249);
    			if(Player[i][pLanguageTD] == 0) PlayerTextDrawSetString(i, Indicators[i][8],"THE_MATCH_ENDS_VIA");
        		else PlayerTextDrawSetString(i, Indicators[i][8],FixText("Матч_закончится_через"));
        		PlayerTextDrawShow(i, Indicators[i][8]);
        		new str[4]; format(str,sizeof(str),"%d",OffsetZone[g]); PlayerTextDrawSetString(i,Indicators[i][9],str);
        		PlayerTextDrawShow(i, Indicators[i][9]);
        	}
        }
	    case 0: { StopGame(g); KillTimer(OffsetZoneTimer[g]); }
	    default: OffsetZone[g]--;
	}
	return true;
}
stock SCM(p,rustr[],enstr[]) {
	if(Player[p][pLanguage]==0) SendClientMessage(p,0xDFDFDFFF,enstr);
	else SendClientMessage(p,0xDFDFDFFF,rustr);
	return true;
}
stock ShowFatalScreen(p,win) {
	new str[10];
	TextDrawHideForPlayer(p,Offset[GetPlayerVirtualWorld(p)]);
	HideAllTextDraws(p);
	ResetPlayerWeapons(p);
	RemovePlayerMapIcon(p,0);
	PlayerTextDrawSetString(p,Killed[p][0],Player[p][pName]);
	Player[p][pPlayed]++;
	if(win==0) {
		if(Player[p][pLanguageTD] == 0) PlayerTextDrawSetString(p,Killed[p][1],"Better_luck_next_time");
		else PlayerTextDrawSetString(p,Killed[p][1],FixText("ПОВЕЗЁТ_В_СЛЕДУЮЩИЙ_РАЗ"));
		format(str,sizeof(str),"#%d",PlayersInGame[GetPlayerVirtualWorld(p)]+1); PlayerTextDrawSetString(p,Killed[p][6],str); PlayerTextDrawSetString(p,Killed[p][2],str);  }
	else {
		if(Player[p][pLanguageTD] == 0) PlayerTextDrawSetString(p,Killed[p][1],"WINNER_-_WINNER_CHICKEN_DINNER");
		else PlayerTextDrawSetString(p,Killed[p][1],FixText("ПОБЕДА_-_ПОБЕДА_ВМЕСТО_ОБЕДА"));
		Player[p][pWins]++;
		SetPlayerScore(p,Player[p][pWins]);
		PlayerTextDrawSetString(p,Killed[p][6],"#1"); PlayerTextDrawSetString(p,Killed[p][2],"#1"); }
	format(str,sizeof(str),"/%d",MaxPlayers[GetPlayerVirtualWorld(p)]); PlayerTextDrawSetString(p,Killed[p][5],str);
    format(str,sizeof(str),"%d",GetPVarInt(p,"pKills")); PlayerTextDrawSetString(p,Killed[p][3],str);
    new reward=0;
    if(MaxPlayers[GetPlayerVirtualWorld(p)]-(PlayersInGame[GetPlayerVirtualWorld(p)]+1) < 4) reward = 0;
    else {
    	reward = (MaxPlayers[GetPlayerVirtualWorld(p)]-(PlayersInGame[GetPlayerVirtualWorld(p)]+1))*10;
    	reward = reward+GetPVarInt(p,"pKills")*20;
   	}
    format(str,sizeof(str),"%d",reward); PlayerTextDrawSetString(p,Killed[p][4],str);
    Player[p][pCoins] += reward;
	for(new td=0;td<9;td++) TextDrawShowForPlayer(p, KilledT[td]);
	for(new td=0;td<8;td++) PlayerTextDrawShow(p, Killed[p][td]);
	if(GetPVarInt(p,"Team") == 1 && (GetPVarInt(GetPVarInt(p,"Teammate1"),"Location") == 10 ||  GetPVarInt(GetPVarInt(p,"Teammate1"),"Location") == 11 || GetPVarInt(GetPVarInt(p,"Teammate2"),"Location") == 10 || GetPVarInt(GetPVarInt(p,"Teammate2"),"Location") == 11 ||
	    GetPVarInt(GetPVarInt(p,"Teammate3"),"Location") == 10 || GetPVarInt(GetPVarInt(p,"Teammate3"),"Location") == 11 || GetPVarInt(GetPVarInt(p,"Teammate4"),"Location") == 10 || GetPVarInt(GetPVarInt(p,"Teammate4"),"Location") == 11)) {
	        TextDrawShowForPlayer(p, KilledT[9]); PlayerTextDrawShow(p, Killed[p][8]);
	    }
    for(new td=0;td<5;td++)  { PlayerTextDrawHide(p,HUD[p][td]); TextDrawHideForPlayer(p,HUDT[td]); }
	new Float:X,Float:Y,Float:Z;
	GetPlayerPos(p,X,Y,Z);
	TogglePlayerSpectating(p, 1);
	TogglePlayerControllable(p, false);
	InterpolateCameraPos(p, X,Y,Z, X+2,Y,Z+1, 3000);
	InterpolateCameraLookAt(p, X,Y,Z-1, X,Y,Z-1, 3000);
	SelectTextDraw(p, 0x15151550);
	return true;
}
publics Kickk(playerid) return Kick(playerid);
publics PlayerUpdate(playerid) {
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER && GetVehicleSpeed(GetPlayerVehicleID(playerid)) > 0) {
		for(new s=0;s<20;s++) {
			if(GetPlayerVehicleID(playerid) == Cars[GetPlayerVirtualWorld(playerid)][s]) {
			    if(CarsFuel[GetPlayerVirtualWorld(playerid)][s] <= 0) { SetVehicleParamsEx(GetPlayerVehicleID(playerid),0,0,0,0,0,0,0); break; }
				CarsFuel[GetPlayerVirtualWorld(playerid)][s]=CarsFuel[GetPlayerVirtualWorld(playerid)][s]-0.05;
				PlayerTextDrawTextSize(playerid, Speedometr[playerid][1], CarsFuel[GetPlayerVirtualWorld(playerid)][s], 5.000000);
				if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) PlayerTextDrawShow(playerid, Speedometr[playerid][1]);
			} } }
	if(GetPVarInt(playerid, "AntiCBug") == 1) DeletePVar(playerid, "AntiCBug");
	if(GetPVarInt(playerid,"LoadMenu") >= 1) { if(GetPVarInt(playerid,"LoadMenu") == 1 && GetPVarInt(playerid,"Location") > 2) {DeletePVar(playerid,"LoadMenu");LoadMenu(playerid);} else GivePVarInt(playerid,"LoadMenu",-1); }
    if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_USEJETPACK) AntiCheat(playerid,1,"A33");
	new Float:X,Float:Y,Float:Z; GetPlayerPos(playerid,X,Y,Z);
	if(GetPVarInt(playerid,"Location") == 11 || GetPVarInt(playerid,"Location") == 10 || GetPVarInt(playerid,"Location") == 9) {
		if(GetPVarInt(playerid,"AFK") >= 120) { SCM(playerid,"{AA3A3A}| {DFDFDF}Вы были кикнуты за афк в игре.","{AA3A3A}| {DFDFDF}You were kicked for AFK in the game."); kick(playerid); }
		if(GetPVarInt(playerid,"Team")== 1) {
			if(GetPVarInt(playerid,"Teammate2") != -1 && (GetPVarInt(GetPVarInt(playerid,"Teammate2"),"Location") == 11 || GetPVarInt(GetPVarInt(playerid,"Teammate2"),"Location") == 10)) SetPlayerMarkerForPlayer(playerid,GetPVarInt(playerid,"Teammate2"),0xB7AD3EFF);
			if(GetPVarInt(playerid,"Teammate3") != -1 && (GetPVarInt(GetPVarInt(playerid,"Teammate3"),"Location") == 11 || GetPVarInt(GetPVarInt(playerid,"Teammate3"),"Location") == 10)) SetPlayerMarkerForPlayer(playerid,GetPVarInt(playerid,"Teammate3"),0x57A444FF);
			if(GetPVarInt(playerid,"Teammate4") != -1 && (GetPVarInt(GetPVarInt(playerid,"Teammate4"),"Location") == 11 || GetPVarInt(GetPVarInt(playerid,"Teammate4"),"Location") == 10)) SetPlayerMarkerForPlayer(playerid,GetPVarInt(playerid,"Teammate4"),0x42719DFF);
			if(GetPVarInt(GetPVarInt(playerid,"Teammate1"),"Location") == 11 || GetPVarInt(GetPVarInt(playerid,"Teammate1"),"Location") == 10) {SetPlayerMarkerForPlayer(playerid,GetPVarInt(playerid,"Teammate1"),0xA44444FF);}
			new asd=-1;
			for(new tm=1;tm<5;tm++) {
			    asd++;
	       		new str[10]; format(str,sizeof(str),"Teammate%d",tm);
	       		if(GetPVarInt(playerid,str) != playerid && GetPVarInt(playerid,str) != -1) {
					if(GetPVarInt(GetPVarInt(playerid,str),"Location") == 11 || GetPVarInt(GetPVarInt(playerid,str),"Location") == 10) {
	       		        TextDrawShowForPlayer(playerid,TeamMatesT[asd]); TextDrawHideForPlayer(playerid,TeamMatesT[asd+3]);
	       		        PlayerTextDrawSetString(playerid,TeamMatesHP[playerid][asd],Player[GetPVarInt(playerid,str)][pName]); PlayerTextDrawShow(playerid,TeamMatesHP[playerid][asd]);
	       		        new Float:h=GetPVarFloat(GetPVarInt(playerid,str),"pHealth");
	       		        PlayerTextDrawTextSize(playerid, TeamMatesHP[playerid][asd+3],h/2,8.0); PlayerTextDrawShow(playerid,TeamMatesHP[playerid][asd+3]);
	       			}
	       			else {PlayerTextDrawHide(playerid,TeamMatesHP[playerid][asd+3]);TextDrawHideForPlayer(playerid,TeamMatesT[asd]); TextDrawShowForPlayer(playerid,TeamMatesT[asd+3]);}
   				} else asd--;
			}
   		}
	}
	if(GetPVarInt(playerid,"AntiFlood") > 0) { GivePVarInt(playerid,"AntiFlood",-1); if(GetPVarInt(playerid,"AntiFlood") == 1) DeletePVar(playerid,"AntiFlood"); }
    if(GetPVarInt(playerid,"AFKS") <= gettime()-2 || GetPVarInt(playerid,"AFKS") >= gettime()+2) { GivePVarInt(playerid,"AFK",1); if(GetPVarInt(playerid,"AFK") > 2400 && Player[playerid][pAdm] < 5) { SCM(playerid,"{AA3A3A}| {DFDFDF}Вы были кикнуты за долгое афк.","{AA3A3A}| {DFDFDF}You have been kicked for AFK to long."); kick(playerid); } }
    else DeletePVar(playerid,"AFK");
	if((GetPVarInt(playerid,"Location") == 11 || GetPVarInt(playerid,"Location") == 10 || GetPVarInt(playerid,"Location") == 8) && !IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) != PLAYER_STATE_SPECTATING) {
        if(GetPVarInt(playerid, "Position") <= gettime() && GetPlayerSurfingVehicleID(playerid) == INVALID_VEHICLE_ID) {
	        if(GetPlayerDistanceFromPoint(playerid, pos_x[playerid], pos_y[playerid], pos_z[playerid]) > 150.0 && pos_z[playerid] < Z && pos_z[playerid] > 0 && X != 0 && Z != 0 && X != 132 && GetPlayerPing(playerid) < 130) AntiCheat(playerid,2,"B16");
	        else if(GetPlayerDistanceFromPoint(playerid, pos_x[playerid], pos_y[playerid], pos_z[playerid]) > 17.0 && pos_z[playerid] < Z && GetPlayerPing(playerid) < 100) AntiCheat(playerid,1,"A16");//&& GetPlayerAnimationIndex(playerid) == 1189
	        else if(GetPlayerDistanceFromPoint(playerid, pos_x[playerid], pos_y[playerid], pos_z[playerid]) > 30.0 && pos_z[playerid] < Z) AntiCheat(playerid,1,"A16");
	        if(GetPlayerDistanceFromPoint(playerid, pos_x2[playerid], pos_y2[playerid], pos_z2[playerid]) > 17.0 && pos_z2[playerid] < Z) {
	        	new str[200],Float:px,Float:py,Float:pz; GetPlayerPos(playerid,px,py,pz);format(str,sizeof(str),"(%s[%d]) PlayerX: %f,PlayerY: %f,PlayerZ: %f | PosX: %f,PosY: %f,PosZ: %f",Player[playerid][pName],playerid,px,py,pz,pos_x2,pos_y2,pos_z2);
	    		WriteLog("AntiCheat","A17",str);
				AntiCheat(playerid,1,"A17"); }
	    }
     	//if(GetPlayerAnimationIndex(playerid) == 1224 || GetPlayerAnimationIndex(playerid) == 1257 || GetPlayerAnimationIndex(playerid) == 1159 || GetPlayerAnimationIndex(playerid) == 1196 || GetPlayerAnimationIndex(playerid) == 1195 || GetPlayerAnimationIndex(playerid) == 1197 || GetPlayerAnimationIndex(playerid) == 1198 || GetPlayerAnimationIndex(playerid) == 1146)
		if(GetPlayerAnimationIndex(playerid) != 1189 || GetPlayerSurfingVehicleID(playerid) == INVALID_VEHICLE_ID) GetPlayerPos(playerid, pos_x2[playerid], pos_y2[playerid], pos_z2[playerid]);
 		GetPlayerPos(playerid, pos_x[playerid], pos_y[playerid], pos_z[playerid]);
	}
	if(GetPVarInt(playerid,"KeyF") != 0) GivePVarInt(playerid,"KeyF",-1);
	if(GetPVarInt(playerid,"ClickTDD")>0) GivePVarInt(playerid,"ClickTDD",-1);
	if(GetPVarInt(playerid,"ClickTDD") == 1) { GivePVarInt(playerid,"ClickTDD",-1); TextDrawHideForPlayer(playerid, RewMenuT[7]);PlayerTextDrawHide(playerid,CharMenu[playerid][14]);PlayerTextDrawHide(playerid, RewMenu[playerid][4]);PlayerTextDrawHide(playerid, RewMenu[playerid][5]); }
    if((GetPVarInt(playerid,"Location") == 11 || GetPVarInt(playerid,"Location") == 10 || GetPVarInt(playerid,"Location") == 8) && GetPVarInt(playerid,"KeyF") == 0) {
        new Float: Health; GetPlayerHealth(playerid,Health);
		new Float: Armour; GetPlayerArmour(playerid,Armour); if(Armour > 0) AntiCheat(playerid,1,"A12");
        SetPlayerHealth(playerid,1000);
		new animlib[16], animname[16];
		GetAnimationName(GetPlayerAnimationIndex(playerid) , animlib, sizeof(animlib), animname, sizeof(animname));
		if(GetPlayerAnimationIndex(playerid) == -1 && Z > 0) ClearAnimations(playerid);
		if(!strcmp(animlib, "PED", true) && (!strcmp(animname, "FALL_fall", true) || !strcmp(animname, "FALL_back", true) || !strcmp(animname, "FALL_front", true)) && GetPlayerWeapon(playerid) != 46 && !IsPlayerInAnyVehicle(playerid) && GetPVarInt(playerid,"AFK") <= 6)  {
		    SetPVarFloat(playerid,"AntiPadZ",Z);
			GivePVarInt(playerid,"AntiPad",1); SetPVarInt(playerid,"AntiPade",2);
		}
		else { if(GetPVarInt(playerid,"AntiPad") >= 3) { if(GetPVarInt(playerid,"AntiPade") != 1) GivePVarInt(playerid,"AntiPade",-1); else { if(IsPlayerInWater(playerid) || GetPVarFloat(playerid,"AntiPadZ") < Z) {SetPVarInt(playerid,"AntiPad",0); SetPVarInt(playerid,"AntiPade",0); } else AntiCheat(playerid,1,"A13"); } } else {SetPVarInt(playerid,"AntiPad",0); DeletePVar(playerid,"AntiPadZ");SetPVarInt(playerid,"AntiPade",0); } }
		if(GetPVarInt(playerid,"Healing") > 0) {
		    if(GetPlayerSpeed(playerid) > 15) { PlayerTextDrawHide(playerid,TDProcess[playerid][0]); PlayerTextDrawHide(playerid,TDProcess[playerid][1]); DeletePVar(playerid,"Healing"); }
			else if(GetPVarFloat(playerid,"pHealth") > 123) { SetPVarFloat(playerid,"pHealth",125); PlayerTextDrawHide(playerid,TDProcess[playerid][0]); PlayerTextDrawHide(playerid,TDProcess[playerid][1]); DeletePVar(playerid,"Healing"); }
			else { GivePVarInt(playerid,"Healing",-1); SetPVarFloat(playerid,"pHealth", GetPVarFloat(playerid,"pHealth")+3); new str[3]; format(str,sizeof(str),"%d",GetPVarInt(playerid,"Healing")); PlayerTextDrawSetString(playerid,TDProcess[playerid][1],str); PlayerTextDrawShow(playerid,TDProcess[playerid][1]); }
			if(GetPVarInt(playerid,"Healing") == 0) { PlayerTextDrawHide(playerid,TDProcess[playerid][0]); PlayerTextDrawHide(playerid,TDProcess[playerid][1]); DeletePVar(playerid,"Healing"); }
			UpdateHealth(playerid);
		}
		if(GetPVarInt(playerid,"EnergyH") > 1) {
            if(GetPVarFloat(playerid,"pHealth")<124) SetPVarFloat(playerid,"pHealth",GetPVarFloat(playerid,"pHealth")+1);
            UpdateHealth(playerid);
            GivePVarInt(playerid,"EnergyH",-1);
            if(GetPVarInt(playerid,"EnergyH")>52) {TextDrawShowForPlayer(playerid,HUDT[1]);PlayerTextDrawTextSize(playerid,HUD[playerid][2],GetPVarInt(playerid,"EnergyH")-50,3.0);PlayerTextDrawShow(playerid,HUD[playerid][2]);}
            else if(GetPVarInt(playerid,"EnergyH")==50) {TextDrawHideForPlayer(playerid,HUDT[1]);PlayerTextDrawHide(playerid,HUD[playerid][2]);}
            else {if(GetPVarInt(playerid,"EnergyH")==46) TextDrawHideForPlayer(playerid,HUDT[2]); PlayerTextDrawTextSize(playerid,HUD[playerid][1],GetPVarInt(playerid,"EnergyH")/2,3.0);PlayerTextDrawShow(playerid,HUD[playerid][1]);}
		}
		else if(GetPVarInt(playerid,"EnergyH") == 1) { PlayerTextDrawHide(playerid,HUD[playerid][1]); PlayerTextDrawHide(playerid,HUD[playerid][2]); TextDrawHideForPlayer(playerid,HUDT[1]); TextDrawHideForPlayer(playerid,HUDT[2]); DeletePVar(playerid,"EnergyH"); }
	}
	if(GetPVarInt(playerid,"Location") == 11 && GetPVarInt(playerid,"EnergyH") < 1) {SetPVarFloat(playerid,"pHealth",GetPVarFloat(playerid,"pHealth")-1); UpdateHealth(playerid); }
	if(GetPVarInt(playerid,"ZoneOffset") > 0) { GivePVarInt(playerid,"ZoneOffset",-1); if(GetPVarInt(playerid,"ZoneOffset") == 0) PlayerTextDrawHide(playerid, Indicators[playerid][8]); }
	if(GetPVarInt(playerid,"KILL") > 0) { GivePVarInt(playerid,"KILL",-1); if(GetPVarInt(playerid,"KILL") == 0) {PlayerTextDrawHide(playerid, Indicators[playerid][9]); PlayerTextDrawHide(playerid, Indicators[playerid][10]);} }
	new weapon[13], ammo[13];
	if(GetPVarInt(playerid,"AntiB21") >= 1) return GivePVarInt(playerid,"AntiB21",-1);
	else DeletePVar(playerid,"AntiB21");
    for(new slot = 0; slot < 13; slot++) {
		GetPlayerWeaponData(playerid, slot, weapon[slot], ammo[slot]);
		if(slot==7 && GetPVarInt(playerid, "pGun1") == 14 && ammo[slot] == 0) {DeletePVar(playerid, "pGun1");UpdateWeapon(playerid);continue;}
		else if(slot==7 && GetPVarInt(playerid, "pGun2") == 14 && ammo[slot] == 0) {DeletePVar(playerid, "pGun2");UpdateWeapon(playerid);continue;}
		if(slot==8 && (GetPVarInt(playerid, "pGun5") == 11 || GetPVarInt(playerid, "pGun5") == 12 || GetPVarInt(playerid, "pGun5") == 13) && ammo[slot] == 0) {DeletePVar(playerid,"Grenades");DeletePVar(playerid, "pGun5");UpdateWeapon(playerid);continue;}
		else if(slot == 8 && (GetPVarInt(playerid, "pGun5") == 11 || GetPVarInt(playerid, "pGun5") == 12 || GetPVarInt(playerid, "pGun5") == 13) && ammo[slot] != GetPVarInt(playerid,"Grenades")) SetPVarInt(playerid,"Grenades",ammo[slot]);
 		if(weapon[slot] == 0) continue;
		switch(weapon[slot]) {
		    case 1..3,5..15,26..28,32,36..45: AntiCheat(playerid,2,"B21");
		    case 4: if(GetPVarInt(playerid, "pGun4") != 10) AntiCheat(playerid,1,"B21");
		    case 16: if(GetPVarInt(playerid, "pGun5") != 11) AntiCheat(playerid,1,"B21");
		    case 17: if(GetPVarInt(playerid, "pGun5") != 12) AntiCheat(playerid,1,"B21");
		    case 18: if(GetPVarInt(playerid, "pGun5") != 13) AntiCheat(playerid,1,"B21");
		    case 22: { if(GetPVarInt(playerid, "pGun3") != 7) AntiCheat(playerid,1,"B21"); if(ammo[slot] >= GetPVarInt(playerid,"pAmmo1")+2 && GetPlayerWeapon(playerid) == 22) UpdateWeapon(playerid); }
		    case 23: { if(GetPVarInt(playerid, "pGun3") != 8) AntiCheat(playerid,1,"B21"); if(ammo[slot] != GetPVarInt(playerid,"pAmmo1") && GetPlayerWeapon(playerid) == 23) UpdateWeapon(playerid); }
		    case 24: { if(GetPVarInt(playerid, "pGun3") != 9) AntiCheat(playerid,1,"B21"); if(ammo[slot] != GetPVarInt(playerid,"pAmmo2") && GetPlayerWeapon(playerid) == 24) UpdateWeapon(playerid); }
		    case 25: { if(GetPVarInt(playerid, "pGun1") != 5 && GetPVarInt(playerid, "pGun2") != 5) AntiCheat(playerid,1,"B21"); if(ammo[slot] != GetPVarInt(playerid,"pAmmo3") && GetPlayerWeapon(playerid) == 25) UpdateWeapon(playerid); }
		    case 29: { if(GetPVarInt(playerid, "pGun1") != 6 && GetPVarInt(playerid, "pGun2") != 6) AntiCheat(playerid,1,"B21"); if(ammo[slot] >= GetPVarInt(playerid,"pAmmo1")+2 && GetPlayerWeapon(playerid) == 29) UpdateWeapon(playerid); }
		    case 30: { if(GetPVarInt(playerid, "pGun1") != 1 && GetPVarInt(playerid, "pGun2") != 1) AntiCheat(playerid,1,"B21"); if(ammo[slot] >= GetPVarInt(playerid,"pAmmo5")+2 && GetPlayerWeapon(playerid) == 30) UpdateWeapon(playerid); }
		    case 31: { if(GetPVarInt(playerid, "pGun1") != 2 && GetPVarInt(playerid, "pGun2") != 2) AntiCheat(playerid,1,"B21"); if(ammo[slot] >= GetPVarInt(playerid,"pAmmo4")+2 && GetPlayerWeapon(playerid) == 31) UpdateWeapon(playerid); }
	    	case 33: { if(GetPVarInt(playerid, "pGun1") != 3 && GetPVarInt(playerid, "pGun2") != 3) AntiCheat(playerid,1,"B21"); if(ammo[slot] != GetPVarInt(playerid,"pAmmo6") && GetPlayerWeapon(playerid) == 33) UpdateWeapon(playerid); }
			case 34: { if(GetPVarInt(playerid, "pGun1") != 4 && GetPVarInt(playerid, "pGun2") != 4) AntiCheat(playerid,1,"B21"); if(ammo[slot] != GetPVarInt(playerid,"pAmmo6") && GetPlayerWeapon(playerid) == 34) UpdateWeapon(playerid); }
			case 35: { if(GetPVarInt(playerid, "pGun1") != 14 && GetPVarInt(playerid, "pGun2") != 14) AntiCheat(playerid,1,"B21"); }
		}
	}
	return true;
}
publics CheckBanIP(playerid) {
    new r,f;
    cache_get_data(r, f);
    if(r) {
        new unbandate = cache_get_field_content_int(0, "UnbanDate");
        if(gettime()-(13*3600) >= unbandate) {
            new string[70];
			GetPlayerIp(playerid, string, 16);
            mysql_format(mysql, string, sizeof(string), "DELETE FROM `Bans` WHERE `Nick` = '%e'",string);
            mysql_tquery(mysql, string, "","");
            return true;
        }
        else {
            new string[100];
		    HideAllTextDraws(playerid);
			TogglePlayerSpectating(playerid, 1);
		    InterpolateCameraPos(playerid, 2079.5432,1249.8418,716.6501, 2079.5432,1249.8418,716.6501, 1000);
			InterpolateCameraLookAt(playerid, 2071.2625,1245.6322,715.9300, 2071.2625,1245.6322,715.9300, 1000);
		    TextDrawShowForPlayer(playerid,RegistrationT[0]);
		    PlayerTextDrawSetString(playerid,Banned[playerid][1],"YOUR_IP_ARE_BANNED_ON_THIS_SERVER");
		    format(string,sizeof(string),"Date_of_ban:_%s",date("%dd/%mm/%yyyy in %hh:%ii:%ss",gettime()-(13*3600)));
		    PlayerTextDrawSetString(playerid,Banned[playerid][4],string);
		    format(string,sizeof(string),"Date_unban:_%s",date("%dd/%mm/%yyyy in %hh:%ii:%ss",unbandate));
		    PlayerTextDrawSetString(playerid,Banned[playerid][5],string);
		    for(new td=1;td<6;td++) PlayerTextDrawShow(playerid,Banned[playerid][td]);
		    kick(playerid);
        }
    }
    return true;
}
publics WaitRestart() {
	new online=0;
	foreach(Player,p) { online++; }
	if(online <= 40 && MAXFORSTART != 0 && MAXFORSTART != 5) MAXFORSTART = 5;
	else if(online > 40 && online < 100 && MAXFORSTART != 0 && MAXFORSTART != 10) MAXFORSTART = 10;
	else if(online >= 100 && MAXFORSTART != 0 && MAXFORSTART != 20) MAXFORSTART = 20;
	new h,m; gettime(h,m);
	new day; getdate(day,day,day);
	if(h == 2 && m == 0 && Restart == 0 && StartDay != day) { Restart = 1; SendRconCommand("hostname PUBG | SA:MP Edition Restarting"); }
	if(Restart == 0) return true;
	else {
	    for(new g=0;g<101;g++) if(Game[g] == 2) return true;
	    if(Restart != 2) {foreach(Player,p) SavePlayer(p); Restart = 2; return true;}
	    if(Restart == 2) {SendRconCommand("hostname PUBG | SA:MP Edition");SendRconCommand("gmx");}
	}
	return true;
}
publics CheckBan(playerid) {
    new r,f;
    cache_get_data(r, f);
    if(r) {
        new unbandate = cache_get_field_content_int(0, "UnbanDate");
        new Name[24], reason[40];
	    cache_get_field_content(0, "Banned", Name, mysql, 24);
    	cache_get_field_content(0, "Reason", reason, mysql, 40);
        if(gettime()-(13*3600) >= unbandate) {
            new string[70];
            mysql_format(mysql, string, sizeof(string), "DELETE FROM `Bans` WHERE `Nick` = '%e'",Player[playerid][pName]);
            mysql_tquery(mysql, string, "","");
            return true;
        }
        else {
            new string[100];
			TogglePlayerSpectating(playerid, 1);
		    InterpolateCameraPos(playerid, 2079.5432,1249.8418,716.6501, 2079.5432,1249.8418,716.6501, 1000);
			InterpolateCameraLookAt(playerid, 2071.2625,1245.6322,715.9300, 2071.2625,1245.6322,715.9300, 1000);
			HideAllTextDraws(playerid);
		    TextDrawShowForPlayer(playerid,RegistrationT[0]);
		    PlayerTextDrawSetString(playerid,Banned[playerid][1],"YOU_ARE_BANNED_ON_THIS_SERVER");
		    format(string,sizeof(string),"Date_of_ban:_%s",date("%dd/%mm/%yyyy in %hh:%ii:%ss",gettime()-(13*3600)));
		    PlayerTextDrawSetString(playerid,Banned[playerid][4],string);
		    format(string,sizeof(string),"Date_unban:_%s",date("%dd/%mm/%yyyy in %hh:%ii:%ss",unbandate));
		    PlayerTextDrawSetString(playerid,Banned[playerid][5],string);
		    format(string,sizeof(string),"Banned:_%s",Name);
		    PlayerTextDrawSetString(playerid,Banned[playerid][2],string);
		    format(string,sizeof(string),"Reason:_%s",reason);
		    PlayerTextDrawSetString(playerid,Banned[playerid][3],string);
		    for(new td=1;td<6;td++) PlayerTextDrawShow(playerid,Banned[playerid][td]);
		    kick(playerid);
        }
    }
    return true;
}
publics Unban(playerid, nick[]) {
    new r,f;
    cache_get_data(r, f);
    if(r) {
        new string[70],string2[70];
        mysql_format(mysql, string, sizeof(string), "DELETE FROM `Bans` WHERE `Nick` = '%e'",nick);
        mysql_tquery(mysql, string, "","");
        format(string2, sizeof(string2), "{FF6161}%s unban player/IP %s.",Player[playerid][pName],nick);
        format(string, sizeof(string), "{B1413D}%s разбанил игрока/IP %s.",Player[playerid][pName],nick);
		ASCM(string,string2);
    }
    else SCM(playerid,"{AA3A3A}| {DFDFDF}Игрок/IP не найден.","{AA3A3A}| {DFDFDF}Player/IP not found.");
    return true;
}
publics Report(p,str[]) {
    new string[200];
	if(strfind(str,"Привет",true) == 0 && strlen(str) < 10) string="Доброго времени суток!";
	else if(strfind(str,"qq",true) == 0 && strlen(str) < 3) string="Доброго времени суток!";
	else if(strfind(str,"Здарова",true) == 0 && strlen(str) < 10) string="Доброго времени суток!";
	else if(strfind(str,"Доброго времени суток!",true) == 0 && strlen(str) < 24) string="Доброго времени суток!";
	else if(strfind(str,"Как писать в чат",true) == 0) string="Никак. У нас нет общего чата, есть только личный (/pm).";
	else if(strfind(str,"Как юзать аптечку",true) == 0) string="Откройте инвентарь на клавишу H, нажмите на аптечку и потом на 'USE'.";
	else if(strfind(str,"Как использовать аптечку",true) == 0) string="Откройте инвентарь на клавишу H, нажмите на аптечку и потом на 'USE'.";
	else if(strfind(str,"Как открыть инвентарь",true) == 0) string="Данная информация имеется в /help.";
	else if(strfind(str,"Как включить инвентарь",true) == 0) string="Данная информация имеется в /help.";
	else if(strfind(str,"Как зайти в инвентарь",true) == 0) string="Данная информация имеется в /help.";
	else if(strfind(str,"как брать вещи",true) == 0) string="Данная информация имеется в /help.";
	else if(strfind(str,"как брать лут",true) == 0) string="Данная информация имеется в /help.";
	else if(strfind(str,"Give me admin please",true) == 0) string="No.";
	else if(strfind(str,"Как выкинуть оружие",true) == 0) string="Нажмите на него два раза в инвентаре.";
	else if(strfind(str,"Как выбросить оружие",true) == 0) string="Нажмите на него два раза в инвентаре.";
	else if(strfind(str,"Как подобрать оружие",true) == 0) string="Как и другой лут. Информация есть в /help.";
	else if(strfind(str,"Как взять оружие",true) == 0) string="Как и другой лут. Информация есть в /help.";
	else if(strfind(str,"почему армор не защищает",true) == 0) string="Защищает, только он теперь не отображается на HUD'e.";
	else if(strfind(str,"почему не действует броня",true) == 0) string="Действует, только она теперь не отображается на HUD'e.";
	else return true;
	if(Player[p][pLanguage] == 0) format(string,sizeof(string),"{516394}Auto answer{DFDFDF}: %s",string);
	else format(string,sizeof(string),"{516394}Автоответ{DFDFDF}: %s",string);
	SCM(p,string,string);
	format(string,sizeof(string),"{516394}%s {516394}(For %s[%d])",string,Player[p][pName],p);
	ASCM(string,string);
	return true;
}
publics CheckNickForDonate(playerid,inputtext[]) {
    new r, f;
	cache_get_data(r, f);
	if(!r) {
		Player[playerid][pDonate] -= 20;
		new save[200];
		mysql_format(mysql,save,sizeof(save),"UPDATE `users` SET `Name` = '%s' WHERE `Name` = '%s'",inputtext,Player[playerid][pName]);
		mysql_tquery(mysql,save, "", "");
		SetPlayerName(playerid,inputtext);
		GetPlayerName(playerid, Player[playerid][pName], MAX_PLAYER_NAME);
		return true; }
	else return SCM(playerid,"{AA3A3A}| {DFDFDF}Ник занят.","{AA3A3A}| {DFDFDF}Nick is busy.");
}
publics CheckReg(playerid) {
    new r, f;
	cache_get_data(r, f);
	if(!r) {
    	InterpolateCameraPos(playerid, 2079.5432,1249.8418,716.6501, 2079.5432,1249.8418,716.6501, 1000);
		InterpolateCameraLookAt(playerid, 2071.2625,1245.6322,715.9300, 2071.2625,1245.6322,715.9300, 1000);
	    SetPVarInt(playerid,"Location",1);
        PlayerTextDrawSetString(playerid,Registration[playerid][0],"REGISTRATION"); PlayerTextDrawSetString(playerid,Registration[playerid][1],"REGISTRATION");
        PlayerTextDrawSetString(playerid,Registration[playerid][3],"CREATE"); PlayerTextDrawSetString(playerid,Registration[playerid][2],"ENTER_PASSWORD");
	    for(new td=0;td<3;td++) TextDrawShowForPlayer(playerid,RegistrationT[td]);
	    for(new td=0;td<5;td++) PlayerTextDrawShow(playerid,Registration[playerid][td]);
	    for(new td=2;td<17;td++) if(td != 7 && td != 8) TextDrawShowForPlayer(playerid,LobbyMenuT[td]);
	    SelectTextDraw(playerid, 0x949494FF);
	}
	else {
    	InterpolateCameraPos(playerid, 2079.5432,1249.8418,716.6501, 2079.5432,1249.8418,716.6501, 1000);
		InterpolateCameraLookAt(playerid, 2071.2625,1245.6322,715.9300, 2071.2625,1245.6322,715.9300, 1000);
	    SetPVarInt(playerid,"Location",2);
	    Player[playerid][pLanguageTD] = cache_get_field_content_int(0, "LanguageTD");
	    if(Player[playerid][pLanguageTD] == 0) {
        	PlayerTextDrawSetString(playerid,Registration[playerid][0],"AUTHORIZATION"); PlayerTextDrawSetString(playerid,Registration[playerid][1],"AUTHORIZATION");
        	PlayerTextDrawSetString(playerid,Registration[playerid][3],"NEXT"); PlayerTextDrawSetString(playerid,Registration[playerid][2],"ENTER_PASSWORD");
		}
		else {
        	PlayerTextDrawSetString(playerid,Registration[playerid][0],FixText("АВТОРИЗАЦИЯ")); PlayerTextDrawSetString(playerid,Registration[playerid][1],FixText("АВТОРИЗАЦИЯ"));
        	PlayerTextDrawSetString(playerid,Registration[playerid][3],FixText("ДАЛЕЕ")); PlayerTextDrawSetString(playerid,Registration[playerid][2],FixText("ВВЕДИТЕ_ПАРОЛЬ"));
		}
	    for(new td=0;td<3;td++) TextDrawShowForPlayer(playerid,RegistrationT[td]);
	    for(new td=0;td<5;td++) PlayerTextDrawShow(playerid,Registration[playerid][td]);
	    for(new td=2;td<17;td++) if(td != 7 && td != 8) TextDrawShowForPlayer(playerid,LobbyMenuT[td]);
	    SelectTextDraw(playerid, 0x949494FF);
	}
    return true;
}
publics UpdateVehiclePos(vehicleid, type) {
	if(type == 1) BanCar[vehicleid] = false;
	GetVehiclePos(vehicleid, VehPos[vehicleid][0], VehPos[vehicleid][1], VehPos[vehicleid][2]);
	GetVehicleZAngle(vehicleid, VehPos[vehicleid][3]);
	return true;
}
publics OnUnoccupiedVehicleUpdate(vehicleid, playerid, passenger_seat) {
    new Float:Pos[3],Float:Count[2];
    GetVehiclePos(vehicleid, Pos[0], Pos[1], Pos[2]);
    Count[0] = Difference(Pos[0],VehPos[vehicleid][0]);
    Count[1] = Difference(Pos[1],VehPos[vehicleid][1]);
    switch(GetVehicleModel(vehicleid)) { case 435, 450, 584, 591, 606..608, 610..611: goto UPDATE; }
    if((Count[0] > 5 || Count[1] > 5) && !UseCar(vehicleid) && !BanCar[vehicleid])  {
        SetVehiclePos(vehicleid, VehPos[vehicleid][0], VehPos[vehicleid][1], VehPos[vehicleid][2]);
        SetVehicleZAngle(vehicleid, VehPos[vehicleid][3]); }
    else {
        UPDATE:
        UpdateVehiclePos(vehicleid, 0); }
    return true;
}
stock Difference(Float:Value1, Float:Value2) return floatround((Value1 > Value2) ? (Value1 - Value2) : (Value2 - Value1));
stock UseCar(carid) {
    foreach(Player,i) { if(!IsPlayerConnected(i)) continue; if(IsPlayerInVehicle(i, carid)) return true; }
    return false;
}
stock SetVehiclePosition(vehicleid, Float:X, Float:Y, Float:Z) { SetVehiclePos(vehicleid ,X,Y,Z); return UpdateVehiclePos(vehicleid, 0); }
stock IsPlayerNotAuth(p) {
	if(GetPVarInt(p,"Location") == 0 || GetPVarInt(p,"Location") == 1 || GetPVarInt(p,"Location") == 2) return true;
	else return false; }
stock getDay() { switch(((gettime()+3*3600)/86400)%7) { case 4: return true; } return false; }
stock StartTheGame(g) {
	new Float: plx, Float: ply;
	new Float: PlanX, Float: PlanY, Float: PlanR;
	switch(random(4)) {
	    case 0: {PlanY=0; PlanX=random(4000); ply=3500; plx=4000-PlanX; PlanR=135+(PlanX*0.0225);}
	    case 1: {PlanY=3500; PlanX=random(4000); ply=0; plx=4000-PlanX; PlanR=45-(PlanX*0.0225);}
	    case 2: {PlanX=0; PlanY=random(3500); plx=4000; ply=3500-PlanY; PlanR=135-(PlanY*0.02571428571); }
	    case 3: {PlanX=4000; PlanY=random(3500); plx=0; ply=3500-PlanY; PlanR=225+(PlanY*0.02571428571);}
	}
	SpawnLoot(g); SpawnCars(g);
	Plan[g] = CreateDynamicObject(14553,PlanX-1000,PlanY-3000,500.0,13.6,0.0,PlanR,g,-1,-1,500,500);
	SetDynamicObjectMaterial(Plan[g], 1, 19339, "coffin01", "coffin_top01", 0x00000000);
	SetDynamicObjectMaterial(Plan[g], 2, 19339, "coffin01", "coffin_top01", 0x00000000);
	MoveDynamicObject(Plan[g],plx-1000,ply-3000,500.0,65.0);
	ZoneMaxX[0][g] = 3000; ZoneMaxY[0][g] = 500; ZoneMinX[0][g] = -1000; ZoneMinY[0][g] = -3000;
	Zone[0][g] = GangZoneCreate(ZoneMinX[0][g], ZoneMinY[0][g],ZoneMaxX[0][g], ZoneMaxY[0][g]);
	if(PlanR<=225&&PlanR>=135) { PlanX=PlanX-130+(PlanX*0.065); PlanY=PlanY-130; plx=plx-130+(PlanX*0.065); ply=ply-130; }
	else if(PlanR>=-45&&PlanR<=45) { PlanX=PlanX-130+(PlanX*0.065); PlanY=PlanY+130; plx=plx-130+(PlanX*0.065); ply=ply+130; }
	else if(PlanR>=45&&PlanR<=135) { PlanY=PlanY-130+(PlanY*0.07428571429); PlanX=PlanX-130; ply=ply-130+(ply*0.07428571429); plx=plx-130; }
	else if(PlanR>=225&&PlanR<=315) { PlanY=PlanY-130+(PlanY*0.07428571429); PlanX=PlanX+130; ply=ply-130+(ply*0.07428571429); plx=plx+130; }
	new pil=0;
	Clock[g] = random(24);
	switch(random(20)) {
	    case 1,2:Weather[g]=15;
	    case 3,4:Weather[g]=13;
	    case 5:Weather[g]=19;
	    case 6:Weather[g]=15;
	    case 7:Weather[g]=18;
	    case 9:Weather[g]=18;
	    default:Weather[g]=0;
	}
    foreach(Player, i) {
        if(g == GetPlayerVirtualWorld(i) && GetPVarInt(i,"Location") < 99) {
            if(GetPVarInt(i,"AFK") > 40) {
				SCM(i,"{AA3A3A}| {DFDFDF}Игра была начата без Вас, так как Вы находились в АФК.","{AA3A3A}| {DFDFDF}Game was started without You because You were AFK.");
				PlayersInGame[g]--;	LoadMenu(i); continue; }
            SetPVarInt(i, "Position", gettime() + 8);
		    pil++;
			new str[4]; format(str,sizeof(str),"%d",PlayersInGame[GetPlayerVirtualWorld(i)]); PlayerTextDrawSetString(i,Indicators[i][5],str);
			TogglePlayerSpectating(i, true);
			new pl = CreatePlayerObject(i, 19300, PlanX-1000, PlanY-3000, 525, 0.0, 0.0, PlanR);
			MovePlayerObject(i,pl,plx-1000,ply-3000,525,65.0);
	    	HideAllTextDraws(i);
	    	SetPlayerTime(i,Clock[g],0);
	    	SetPlayerWeather(i,Weather[g]); 
	    	if(Player[i][pRadar] == 1) {
				for(new td=0;td<14;td++) TextDrawShowForPlayer(i,NWSET[td]);
				for(new td=0;td<13;td++) PlayerTextDrawShow(i,NWSE[i][td]);
			}
			if(Player[i][pLanguageTD] == 0) { PlayerTextDrawSetString(i,Indicators[i][7],"ALIVE"); PlayerTextDrawSetString(i,KeysF[i],"Eject"); TextDrawShowForPlayer(i,KeysFT[4]); }
			else { PlayerTextDrawSetString(i,Indicators[i][7],FixText("В_ЖИВЫХ")); PlayerTextDrawSetString(i,KeysF[i],FixText("КАТАПУЛЬТИРОВАТЬСЯ")); TextDrawShowForPlayer(i,KeysFT[3]); }
			PlayerTextDrawShow(i,KeysF[i]);
			TextDrawShowForPlayer(i,KeysFT[0]); TextDrawShowForPlayer(i,KeysFT[1]); TextDrawShowForPlayer(i,KeysFT[2]);
			PlayerTextDrawShow(i,Indicators[i][0]); PlayerTextDrawShow(i,Indicators[i][3]);
			PlayerTextDrawShow(i,Indicators[i][5]); PlayerTextDrawShow(i,Indicators[i][7]);
	    	GangZoneShowForPlayer(i,Zone[0][g],0xFFFFFF70);
	    	SetPlayerFacingAngle(i,PlanR+180);
			SetCameraBehindPlayer(i);
			TogglePlayerControllable(i, true);
			SetPVarInt(i,"Location",9);
			AttachCameraToPlayerObject(i, pl);
		}
	}
	if(PlayersInGame[g] != pil) {
		PlayersInGame[g] = pil;
		foreach(Player, i) { if(g == GetPlayerVirtualWorld(i) && GetPVarInt(i,"Location") < 99) { new str[4]; format(str,sizeof(str),"%d",PlayersInGame[g]); PlayerTextDrawSetString(i,Indicators[i][5],str); } }
	}
	MaxPlayers[g] = PlayersInGame[g];
	return true;
}
stock StopGame(g) {
	Game[g] = 0;
	ZoneMaxX[0][g] = 0; ZoneMaxY[0][g] = 0; ZoneMinX[0][g] = 0; ZoneMinY[0][g] = 0;
	GangZoneDestroy(Zone[0][g]);
	ZoneMaxX[1][g] = 0; ZoneMaxY[1][g] = 0; ZoneMinX[1][g] = 0; ZoneMinY[1][g] = 0;
	GangZoneDestroy(Zone[1][g]);
	KillTimer(OffsetZoneTimer[g]);
	MaxPlayers[g] = 0;
	KillTimer(WaitGame[g]);
	PlayersInGame[g]=0;
	AirDrop[g][aPos] = false;
	Delete3DTextLabel(AirDrop[g][a3dtext]);
	DestroyDynamicObject(AirDrop[g][aObj][1]); DestroyDynamicObject(AirDrop[g][aObj][0]);
	DestroyDynamicObject(AirDrop[g][aDoorObj][0]); DestroyDynamicObject(AirDrop[g][aDoorObj][1]); DestroyDynamicObject(AirDrop[g][aLookObj]);
	for(new i=0;i<20;i++) {
		DestroyVehicle(Cars[g][i]);
	}
	for(new i=0;i<100;i++) {
		DestroyDynamicObject(BoxObj[g][i]);
		for(new d=0;d<50;d++) { BoxLoot[g][i][d] = 0; BoxLootC[g][i][d] = 0; }
	}
	for(new i=0;i<4000;i++) {
		DestroyDynamicObject(LootObject[g][i]);
		LootC[g][i] = 0; LootID[g][i] = 0; LootObject[g][i]=0;
	}
	foreach(Player, i) {
	    if(GetPlayerVirtualWorld(i) == g) LoadMenu(i);
	}
	return true;
}
stock GetVehicleSpeed(vehicleid) {
    new Float:x, Float:y, Float:z;
    GetVehicleVelocity(vehicleid, x, y, z);
    return floatround(floatsqroot(x*x+y*y+z*z)*100);
}
stock GetPlayerSpeed(playerid) {
   	if(playerid == INVALID_PLAYER_ID) return INVALID_PLAYER_ID;
    new Float:Pos[3],Float:PS;
    GetPlayerVelocity(playerid, Pos[0], Pos[1], Pos[2]);
    PS = floatsqroot(Pos[0]*Pos[0] + Pos[1]*Pos[1] + Pos[2]*Pos[2])*200;
    return floatround(PS,floatround_round);
}
stock DropBox(p,g) {
	if(GetPVarInt(p,"Location") != 10 && GetPVarInt(p,"Location") != 11) return true;
	if(GetPVarInt(p,"pGun1") == 0 && GetPVarInt(p,"pGun2") == 0 && GetPVarInt(p,"pGun3") == 0 && GetPVarInt(p,"pGun4") == 0 && GetPVarInt(p,"pGun5") == 0 && Player[p][Slot][0] == 0 && GetPVarInt(p,"pArmour")<=0 && GetPVarInt(p,"pHelmet")<=0) return true;
	new Float:X,Float:Y,Float:Z;
	GetPlayerPos(p,X,Y,Z);
	BoxObj[g][PlayersInGame[g]] = CreateDynamicObject(2969,X,Y,Z-0.9,0,0,0,g);
	new gun[5],arm=0;
	for(new gg=0;gg<5;gg++) gun[gg]=0;
	for(new i=0;i<50;i++) {
		if(Player[p][Slot][i] != 0) { BoxLoot[g][PlayersInGame[g]][i] = Player[p][Slot][i]; BoxLootC[g][PlayersInGame[g]][i] = Player[p][SlotC][i]; continue; }
		if(arm == 0 && GetPVarInt(p,"pArmour") > 0 && GetPVarInt(p,"pArmour") < 101) { arm=1;BoxLoot[g][PlayersInGame[g]][i]=18; BoxLootC[g][PlayersInGame[g]][i] = GetPVarInt(p,"pArmour"); continue; }
		if(arm == 0 && GetPVarInt(p,"pArmour") > 100 && GetPVarInt(p,"pArmour") < 201) { arm=1;BoxLoot[g][PlayersInGame[g]][i]=19; BoxLootC[g][PlayersInGame[g]][i] = GetPVarInt(p,"pArmour"); continue; }
		if(arm == 0 && GetPVarInt(p,"pArmour") > 200 && GetPVarInt(p,"pArmour") < 301) { arm=1;BoxLoot[g][PlayersInGame[g]][i]=20; BoxLootC[g][PlayersInGame[g]][i] = GetPVarInt(p,"pArmour"); continue; }
		if(arm == 0 && GetPVarInt(p,"pHelmet") > 0 && GetPVarInt(p,"pHelmet") < 101) { arm=1;BoxLoot[g][PlayersInGame[g]][i]=12; BoxLootC[g][PlayersInGame[g]][i] = GetPVarInt(p,"pHelmet"); continue; }
		if(arm == 0 && GetPVarInt(p,"pHelmet") > 100 && GetPVarInt(p,"pHelmet") < 201) { arm=1;BoxLoot[g][PlayersInGame[g]][i]=13; BoxLootC[g][PlayersInGame[g]][i] = GetPVarInt(p,"pHelmet"); continue; }
		if(arm == 0 && GetPVarInt(p,"pHelmet") > 200 && GetPVarInt(p,"pHelmet") < 301) { arm=1;BoxLoot[g][PlayersInGame[g]][i]=14; BoxLootC[g][PlayersInGame[g]][i] = GetPVarInt(p,"pHelmet"); continue; }
		if(GetPVarInt(p,"pGun1") != 0 && gun[0] == 0) { BoxLoot[g][PlayersInGame[g]][i] = GetPVarInt(p,"pGun1")+20; BoxLootC[g][PlayersInGame[g]][i] = 1; gun[0]=1; continue; }
		if(GetPVarInt(p,"pGun2") != 0 && gun[1] == 0) { BoxLoot[g][PlayersInGame[g]][i] = GetPVarInt(p,"pGun2")+20; BoxLootC[g][PlayersInGame[g]][i] = 1; gun[1]=1; continue; }
		if(GetPVarInt(p,"pGun3") != 0 && gun[2] == 0) { BoxLoot[g][PlayersInGame[g]][i] = GetPVarInt(p,"pGun3")+20; BoxLootC[g][PlayersInGame[g]][i] = 1; gun[2]=1; continue; }
		if(GetPVarInt(p,"pGun4") != 0 && gun[3] == 0) { BoxLoot[g][PlayersInGame[g]][i] = GetPVarInt(p,"pGun4")+20; BoxLootC[g][PlayersInGame[g]][i] = 1; gun[3]=1; continue; }
		if(GetPVarInt(p,"pGun5") != 0 && gun[4] == 0) { BoxLoot[g][PlayersInGame[g]][i] = GetPVarInt(p,"pGun5")+20; BoxLootC[g][PlayersInGame[g]][i] = 1; gun[4]=1; continue; }
		break; }
	return true;
}
stock ShowInv(p) {
	if(Player[p][pBI] == 1) TextDrawShowForPlayer(p,RegistrationT[0]);
    SetPVarInt(p,"OpenInv",1);
	for(new d=0;d<50;d++) {
		if(Player[p][Slot][d] == 0) break;
		switch(Player[p][Slot][d]) {
		    case 6: Player[p][SlotC][d] = GetPVarInt(p,"pAmmo1");  case 7: Player[p][SlotC][d] = GetPVarInt(p,"pAmmo2"); case 8: Player[p][SlotC][d] = GetPVarInt(p,"pAmmo3");
		    case 9: Player[p][SlotC][d] = GetPVarInt(p,"pAmmo4"); case 10: Player[p][SlotC][d] = GetPVarInt(p,"pAmmo5"); case 11: Player[p][SlotC][d] = GetPVarInt(p,"pAmmo6");
		}
		if(Player[p][SlotC][d] < 0) { Player[p][SlotC][d] = 0; Player[p][Slot][d] = 0; }
    }
    SelectTextDraw(p,0xFFFFFF40);
    for(new td=15;td<20;td++) TextDrawShowForPlayer(p, InvGunT[td]);
    RaiseGun(p,GetPVarInt(p,"pGun1"),1); RaiseGun(p,GetPVarInt(p,"pGun2"),2); RaiseGun(p,GetPVarInt(p,"pGun3"),3); RaiseGun(p,GetPVarInt(p,"pGun4"),4); RaiseGun(p,GetPVarInt(p,"pGun5"),5);
    for(new d=0;d<10;d++) {
		if(Player[p][Slot][d] == 0) break;
		PlayerTextDrawSetPreviewModel(p, InvSlot[p][d+10], GetObjectID(Player[p][Slot][d]));
		TextDrawObjectRot(p, InvSlot[p][d+10],GetObjectID(Player[p][Slot][d]));
		PlayerTextDrawSetString(p,InvSlot[p][d+50],GetObjectName(p,Player[p][Slot][d]));
		new str[20];format(str,sizeof(str),"%d",Player[p][SlotC][d]);PlayerTextDrawSetString(p,InvSlot[p][d+70],str);
	    PlayerTextDrawShow(p, InvSlot[p][d+10]); PlayerTextDrawShow(p, InvSlot[p][d+30]);
	    PlayerTextDrawShow(p, InvSlot[p][d+50]); PlayerTextDrawShow(p, InvSlot[p][d+70]);
	}
	switch(GetPVarInt(p,"pBackpack")) {
	    case 0: { PlayerTextDrawTextSize(p, InvStat[p][7], 4.000000, GetPVarInt(p,"Slots")*-22); PlayerTextDrawSetPreviewModel(p, InvStat[p][4], 1649); PlayerTextDrawSetPreviewRot(p, InvStat[p][4], 90.000000, 0.000000, 0.000000, 1.000000); }
	    case 1: { PlayerTextDrawTextSize(p, InvStat[p][7], 4.000000, GetPVarInt(p,"Slots")*-11); PlayerTextDrawSetPreviewModel(p, InvStat[p][4], GetObjectID(15)); TextDrawObjectRot(p, InvStat[p][4],GetObjectID(15)); }
	    case 2: { PlayerTextDrawTextSize(p, InvStat[p][7], 4.000000, GetPVarInt(p,"Slots")*-5.5); PlayerTextDrawSetPreviewModel(p, InvStat[p][4], GetObjectID(16)); TextDrawObjectRot(p, InvStat[p][4],GetObjectID(16)); }
	    case 3: { PlayerTextDrawTextSize(p, InvStat[p][7], 4.000000, GetPVarInt(p,"Slots")*-3.66666666667); PlayerTextDrawSetPreviewModel(p, InvStat[p][4], GetObjectID(17)); TextDrawObjectRot(p, InvStat[p][4],GetObjectID(17)); }
	}
	switch(GetPVarInt(p,"pArmour")) {
		case 0: { PlayerTextDrawSetPreviewModel(p, InvStat[p][3], 1649); PlayerTextDrawSetPreviewRot(p, InvStat[p][3], 90.000000, 0.000000, 0.000000, 1.000000); }
		case 1..100: { PlayerTextDrawSetPreviewModel(p, InvStat[p][3], GetObjectID(18)); TextDrawObjectRot(p, InvStat[p][3],GetObjectID(18)); }
		case 101..200: { PlayerTextDrawSetPreviewModel(p, InvStat[p][3], GetObjectID(19)); TextDrawObjectRot(p, InvStat[p][3],GetObjectID(19)); }
		case 201..300: { PlayerTextDrawSetPreviewModel(p, InvStat[p][3], GetObjectID(20)); TextDrawObjectRot(p, InvStat[p][3],GetObjectID(20)); }
	}
	switch(GetPVarInt(p,"pHelmet")) {
		case 0: { PlayerTextDrawSetPreviewModel(p, InvStat[p][2], 1649); PlayerTextDrawSetPreviewRot(p, InvStat[p][2], 90.000000, 0.000000, 0.000000, 1.000000); }
		case 1..100: { PlayerTextDrawSetPreviewModel(p, InvStat[p][2], GetObjectID(12)); TextDrawObjectRot(p, InvStat[p][2],GetObjectID(12)); }
		case 101..200: { PlayerTextDrawSetPreviewModel(p, InvStat[p][2], GetObjectID(13)); TextDrawObjectRot(p, InvStat[p][2],GetObjectID(13)); }
		case 201..300: { PlayerTextDrawSetPreviewModel(p, InvStat[p][2], GetObjectID(14)); TextDrawObjectRot(p, InvStat[p][2],GetObjectID(14)); }
	}
    PlayerTextDrawSetString(p,InvStat[p][1],Player[p][pName]);
    if(GetPVarInt(p,"pArmour") > 0 && GetPVarInt(p,"pArmour") < 101) PlayerTextDrawTextSize(p, InvStat[p][9], 30.000000, -35.000000/100*(100-GetPVarInt(p,"pArmour")));
    else if(GetPVarInt(p,"pArmour") > 100 && GetPVarInt(p,"pArmour") < 201) PlayerTextDrawTextSize(p, InvStat[p][9], 30.000000, -35.000000/100*(200-GetPVarInt(p,"pArmour")));
    else if(GetPVarInt(p,"pArmour") > 200 && GetPVarInt(p,"pArmour") < 301) PlayerTextDrawTextSize(p, InvStat[p][9], 30.000000, -35.000000/100*(300-GetPVarInt(p,"pArmour")));
    else PlayerTextDrawTextSize(p, InvStat[p][9], 30.000000, 0);
    if(GetPVarInt(p,"pHelmet") > 0 && GetPVarInt(p,"pHelmet") < 101) PlayerTextDrawTextSize(p, InvStat[p][8], 30.000000, -35.000000/100*(100-GetPVarInt(p,"pHelmet")));
    else if(GetPVarInt(p,"pHelmet") > 100 && GetPVarInt(p,"pHelmet") < 201) PlayerTextDrawTextSize(p, InvStat[p][8], 30.000000, -35.000000/100*(200-GetPVarInt(p,"pHelmet")));
    else if(GetPVarInt(p,"pHelmet") > 200 && GetPVarInt(p,"pHelmet") < 301) PlayerTextDrawTextSize(p, InvStat[p][8], 30.000000, -35.000000/100*(300-GetPVarInt(p,"pHelmet")));
    else PlayerTextDrawTextSize(p, InvStat[p][8], 30.000000, 0);
	for(new td=0;td<10;td++) PlayerTextDrawShow(p, InvStat[p][td]);
    PlayerTextDrawShow(p, InvSlot[p][80]);
    for(new d=0;d<50;d++) { Player[p][SlotLoot][d] = 0;}
	for(new i=0;i<4000;i++) {
	    if(LootObject[GetPlayerVirtualWorld(p)][i] == 0) continue;
	    new Float:X,Float:Y,Float:Z;
		GetDynamicObjectPos(LootObject[GetPlayerVirtualWorld(p)][i],X,Y,Z);
		if(IsPlayerInRangeOfPoint(p,2,X,Y,Z)) {
		    for(new d=0;d<50;d++) {
				if(Player[p][SlotLoot][d] != 0) continue;
				if(d<10) {
					PlayerTextDrawSetPreviewModel(p, InvSlot[p][d], GetObjectID(LootID[GetPlayerVirtualWorld(p)][i]));
					TextDrawObjectRot(p, InvSlot[p][d],GetObjectID(LootID[GetPlayerVirtualWorld(p)][i]));
					PlayerTextDrawSetString(p,InvSlot[p][d+40],GetObjectName(p,LootID[GetPlayerVirtualWorld(p)][i]));
					new str[20]; format(str,sizeof(str),"%d",LootC[GetPlayerVirtualWorld(p)][i]);
					if(LootID[GetPlayerVirtualWorld(p)][i] == 19 || LootID[GetPlayerVirtualWorld(p)][i] == 13) format(str,sizeof(str),"%d",LootC[GetPlayerVirtualWorld(p)][i]-100);
					if(LootID[GetPlayerVirtualWorld(p)][i] == 20 || LootID[GetPlayerVirtualWorld(p)][i] == 14) format(str,sizeof(str),"%d",LootC[GetPlayerVirtualWorld(p)][i]-200);
					PlayerTextDrawSetString(p,InvSlot[p][d+60],str);
				    PlayerTextDrawShow(p, InvSlot[p][d]); PlayerTextDrawShow(p, InvSlot[p][d+20]);
				    PlayerTextDrawShow(p, InvSlot[p][d+40]); PlayerTextDrawShow(p, InvSlot[p][d+60]);
				}
				Player[p][SlotLoot][d] = i;
				break;
			}
		}
	}
    for(new i=0;i<100;i++) {
	    if(BoxObj[GetPlayerVirtualWorld(p)][i] == 0) continue;
	    new Float:X,Float:Y,Float:Z;
		GetDynamicObjectPos(BoxObj[GetPlayerVirtualWorld(p)][i],X,Y,Z);
		if(IsPlayerInRangeOfPoint(p,2,X,Y,Z)) {
		    for(new v=0;v<50;v++) {
				if(BoxLoot[GetPlayerVirtualWorld(p)][i][v] == 0) break;
			    for(new d=0;d<50;d++) {
					if(Player[p][SlotLoot][d] != 0) continue;
					if(d<10) {
						PlayerTextDrawSetPreviewModel(p, InvSlot[p][d], GetObjectID(BoxLoot[GetPlayerVirtualWorld(p)][i][v]));
						TextDrawObjectRot(p, InvSlot[p][d],GetObjectID(BoxLoot[GetPlayerVirtualWorld(p)][i][v]));
						PlayerTextDrawSetString(p,InvSlot[p][d+40],GetObjectName(p,BoxLoot[GetPlayerVirtualWorld(p)][i][v]));
						new str[20];format(str,sizeof(str),"%d",BoxLootC[GetPlayerVirtualWorld(p)][i][v]);
						if(BoxLoot[GetPlayerVirtualWorld(p)][i][v] == 19 || BoxLoot[GetPlayerVirtualWorld(p)][i][v] == 13) format(str,sizeof(str),"%d",BoxLootC[GetPlayerVirtualWorld(p)][i][v]-100);
						if(BoxLoot[GetPlayerVirtualWorld(p)][i][v] == 20 || BoxLoot[GetPlayerVirtualWorld(p)][i][v] == 14) format(str,sizeof(str),"%d",BoxLootC[GetPlayerVirtualWorld(p)][i][v]-200);
						PlayerTextDrawSetString(p,InvSlot[p][d+60],str);
					    PlayerTextDrawShow(p, InvSlot[p][d]); PlayerTextDrawShow(p, InvSlot[p][d+20]);
					    PlayerTextDrawShow(p, InvSlot[p][d+40]); PlayerTextDrawShow(p, InvSlot[p][d+60]);
					}
					Player[p][SlotLoot][d] = 4000+i;
					break;
				}
			}
		}
    }
    SetPVarInt(p,"SlidersInvLoot",0); SetPVarInt(p,"SlidersInv",0);
	ShowSliders(p);
	return true;
}
stock RaiseGun(p,id,d) {
	if(id<=0) return true;
    new str[15];
	switch(id) {
	    case 1: { PlayerTextDrawSetPreviewModel(p, InvGun[p][-1+d], 355); PlayerTextDrawSetString(p, InvGun[p][4+d], "AK-47"); format(str,sizeof(str),"7.62mm__%d",GetPVarInt(p,"pAmmo5")); }
	    case 2: { PlayerTextDrawSetPreviewModel(p, InvGun[p][-1+d], 356); PlayerTextDrawSetString(p, InvGun[p][4+d], "M4"); format(str,sizeof(str),"5.56mm__%d",GetPVarInt(p,"pAmmo4")); }
	    case 3: { PlayerTextDrawSetPreviewModel(p, InvGun[p][-1+d], 357); PlayerTextDrawSetString(p, InvGun[p][4+d], "Rifle");format(str,sizeof(str),"7.92mm__%d",GetPVarInt(p,"pAmmo6")); }
	    case 4: { PlayerTextDrawSetPreviewModel(p, InvGun[p][-1+d], 358); PlayerTextDrawSetString(p, InvGun[p][4+d], "Sniper_Rifle");format(str,sizeof(str),"7.92mm__%d",GetPVarInt(p,"pAmmo6")); }
	    case 5: { PlayerTextDrawSetPreviewModel(p, InvGun[p][-1+d], 349); PlayerTextDrawSetString(p, InvGun[p][4+d], "Shotgun");format(str,sizeof(str),"12Gauge__%d",GetPVarInt(p,"pAmmo3")); }
	    case 6: { PlayerTextDrawSetPreviewModel(p, InvGun[p][-1+d], 353); PlayerTextDrawSetString(p, InvGun[p][4+d], "MP5");format(str,sizeof(str),"9mm__%d",GetPVarInt(p,"pAmmo1")); }
	    case 7: { PlayerTextDrawSetPreviewModel(p, InvGun[p][-1+d], 346); PlayerTextDrawSetString(p, InvGun[p][4+d], "Colt45");format(str,sizeof(str),"9mm__%d",GetPVarInt(p,"pAmmo1")); }
	    case 8: { PlayerTextDrawSetPreviewModel(p, InvGun[p][-1+d], 347); PlayerTextDrawSetString(p, InvGun[p][4+d], "Silenced");format(str,sizeof(str),"9mm__%d",GetPVarInt(p,"pAmmo1")); }
	    case 9: { PlayerTextDrawSetPreviewModel(p, InvGun[p][-1+d], 348); PlayerTextDrawSetString(p, InvGun[p][4+d], "Desert_Eagle");format(str,sizeof(str),".50__%d",GetPVarInt(p,"pAmmo2"));}
	    case 10: { PlayerTextDrawSetPreviewModel(p, InvGun[p][-1+d], 335); PlayerTextDrawSetString(p, InvGun[p][4+d], "Knife");}
	    case 11: { PlayerTextDrawSetPreviewModel(p, InvGun[p][-1+d], 342); PlayerTextDrawSetString(p, InvGun[p][4+d], "Grenade");}
	    case 12: { PlayerTextDrawSetPreviewModel(p, InvGun[p][-1+d], 343); PlayerTextDrawSetString(p, InvGun[p][4+d], "Smoke");}
	    case 13: { PlayerTextDrawSetPreviewModel(p, InvGun[p][-1+d], 344); PlayerTextDrawSetString(p, InvGun[p][4+d], "Molotov");}
	    case 14: { PlayerTextDrawSetPreviewModel(p, InvGun[p][-1+d], 359); PlayerTextDrawSetString(p, InvGun[p][4+d], "RPG");}
 	}
	if(id != 10 && id != 11 && id != 12 && id != 13 && id != 14) { PlayerTextDrawSetString(p, InvGun[p][9+d], str); PlayerTextDrawShow(p, InvGun[p][9+d]);}
	if(id == 11 || id == 12 || id == 13) {if(GetPVarInt(p,"Grenades")>1) {format(str,sizeof(str),"x%d",GetPVarInt(p,"Grenades"));PlayerTextDrawSetString(p, InvGun[p][13], str); PlayerTextDrawShow(p, InvGun[p][13]);} }
	PlayerTextDrawShow(p, InvGun[p][-1+d]);PlayerTextDrawShow(p, InvGun[p][4+d]);
	TextDrawShowForPlayer(p, InvGunT[9+d]); TextDrawShowForPlayer(p, InvGunT[-1+d]);TextDrawShowForPlayer(p, InvGunT[4+d]);
	return true;
}
stock ShowSliders(p) {
	for(new td=0;td<10;td++) PlayerTextDrawDestroy(p, Sliders[p][td]);
	if(Player[p][SlotLoot][10] > 0) {
		new n=1;
		if(Player[p][SlotLoot][40] > 0) n=4;
		else if(Player[p][SlotLoot][30] > 0) n=3;
		else if(Player[p][SlotLoot][20] > 0) n=2;
		for(new i=n;i>=0;i--) {
	        Sliders[p][i] = CreatePlayerTextDraw(p, 128.594558, (103.216674-(332/(n+1)))+((332/(n+1))*(i+1)), "LD_SPAC:white");
			PlayerTextDrawLetterSize(p, Sliders[p][i], 0.000000, 0.000000);
			PlayerTextDrawTextSize(p, Sliders[p][i], 2.500000, 332/(n+1));
			PlayerTextDrawAlignment(p, Sliders[p][i], 1);
			if(i==GetPVarInt(p,"SlidersInvLoot")/10) PlayerTextDrawColor(p, Sliders[p][i], -1061109505);
			else PlayerTextDrawColor(p, Sliders[p][i], 353703935);
			PlayerTextDrawSetShadow(p, Sliders[p][i], 0);
			PlayerTextDrawSetOutline(p, Sliders[p][i], 0);
			PlayerTextDrawFont(p, Sliders[p][i], 4);
			PlayerTextDrawSetSelectable(p, Sliders[p][i], true);
	    	PlayerTextDrawShow(p, Sliders[p][i]);
		}
	}
	if(Player[p][Slot][10] > 0) {
		new n=1;
		if(Player[p][Slot][40] > 0) n=4;
		else if(Player[p][Slot][30] > 0) n=3;
		else if(Player[p][Slot][20] > 0) n=2;
		for(new i=n;i>=0;i--) {
	        Sliders[p][i+5] = CreatePlayerTextDraw(p, 237.727584, (103.216674-(332/(n+1)))+((332/(n+1))*(i+1)), "LD_SPAC:white");
			PlayerTextDrawLetterSize(p, Sliders[p][i+5], 0.000000, 0.000000);
			PlayerTextDrawTextSize(p, Sliders[p][i+5], 2.500000, 332/(n+1));
			PlayerTextDrawAlignment(p, Sliders[p][i+5], 1);
			if(i==GetPVarInt(p,"SlidersInv")/10) PlayerTextDrawColor(p, Sliders[p][i+5], -1061109505);
			else PlayerTextDrawColor(p, Sliders[p][i+5], 353703935);
			PlayerTextDrawSetShadow(p, Sliders[p][i+5], 0);
			PlayerTextDrawSetOutline(p, Sliders[p][i+5], 0);
			PlayerTextDrawFont(p, Sliders[p][i+5], 4);
			PlayerTextDrawSetSelectable(p, Sliders[p][i+5], true);
	    	PlayerTextDrawShow(p, Sliders[p][i+5]);
		}
	}
	return true;
}
stock RaiseItem(p,id,idc,s) {
    for(new td=0;td<50;td++) {
		if(Player[p][Slot][td] == id) {
			GivePVarInt(p,"Slots",s); Player[p][SlotC][td]=Player[p][SlotC][td]+idc;
			if(GetPVarInt(p,"OpenInv") == 1 && td-GetPVarInt(p,"SlidersInv") < 10 && td-GetPVarInt(p,"SlidersInv") >= 0) { new str[20];format(str,sizeof(str),"%d",Player[p][SlotC][td]);PlayerTextDrawSetString(p,InvSlot[p][td+70-GetPVarInt(p,"SlidersInv")],str); }
			break; }
		else if(Player[p][Slot][td] != 0) continue;
		else {
		    Player[p][Slot][td] = id; Player[p][SlotC][td] = idc;
		    GivePVarInt(p,"Slots",s);
		    if(GetPVarInt(p,"OpenInv") == 1 && td-GetPVarInt(p,"SlidersInv") < 10 && td-GetPVarInt(p,"SlidersInv") >= 0) {
				PlayerTextDrawSetPreviewModel(p, InvSlot[p][td+10-GetPVarInt(p,"SlidersInv")], GetObjectID(Player[p][Slot][td]));
				TextDrawObjectRot(p, InvSlot[p][td+10-GetPVarInt(p,"SlidersInv")],GetObjectID(Player[p][Slot][td]));
				PlayerTextDrawSetString(p,InvSlot[p][td+50-GetPVarInt(p,"SlidersInv")],GetObjectName(p,Player[p][Slot][td]));
				new str[20];format(str,sizeof(str),"%d",Player[p][SlotC][td]);
				if(Player[p][Slot][td] == 19 || Player[p][Slot][td] == 13) format(str,sizeof(str),"%d",Player[p][SlotC][td]-100);
				if(Player[p][Slot][td] == 20 || Player[p][Slot][td] == 14) format(str,sizeof(str),"%d",Player[p][SlotC][td]-200);
				PlayerTextDrawSetString(p,InvSlot[p][td+70-GetPVarInt(p,"SlidersInv")],str);
		    	PlayerTextDrawShow(p, InvSlot[p][td+10-GetPVarInt(p,"SlidersInv")]); PlayerTextDrawShow(p, InvSlot[p][td+30-GetPVarInt(p,"SlidersInv")]);
		    	PlayerTextDrawShow(p, InvSlot[p][td+50-GetPVarInt(p,"SlidersInv")]); PlayerTextDrawShow(p, InvSlot[p][td+70-GetPVarInt(p,"SlidersInv")]);
		    }
		    break; }
	}
	if(GetPVarInt(p,"OpenInv") != 1) return true;
	switch(GetPVarInt(p,"pBackpack")) {
	    case 0: { PlayerTextDrawTextSize(p, InvStat[p][7], 4.000000, GetPVarInt(p,"Slots")*-22); }
	    case 1: { PlayerTextDrawTextSize(p, InvStat[p][7], 4.000000, GetPVarInt(p,"Slots")*-11); }
	    case 2: { PlayerTextDrawTextSize(p, InvStat[p][7], 4.000000, GetPVarInt(p,"Slots")*-5.5); }
	    case 3: { PlayerTextDrawTextSize(p, InvStat[p][7], 4.000000, GetPVarInt(p,"Slots")*-3.66666666667); }
	}
	ShowSliders(p);
    PlayerTextDrawShow(p, InvStat[p][7]);
	return true;
}
stock MoveSlot(p,i,d) {
	if(d==1) {
    	for(new td=i;td<50;td++) {
    	    if(Player[p][Slot][td+1] == 0) {
				PlayerTextDrawHide(p, InvSlot[p][td+10]); PlayerTextDrawHide(p, InvSlot[p][td+30]);
				PlayerTextDrawHide(p, InvSlot[p][td+50]); PlayerTextDrawHide(p, InvSlot[p][td+70]);
				Player[p][Slot][td] = 0; Player[p][SlotC][td] = 0; break; }
	    	Player[p][Slot][td] = Player[p][Slot][td+1]; Player[p][SlotC][td] = Player[p][SlotC][td+1];
			Player[p][Slot][td+1] = 0; Player[p][SlotC][td+1] = 0;
			if(td-GetPVarInt(p,"SlidersInv") < 10 && td-GetPVarInt(p,"SlidersInv") >= 0) {
				PlayerTextDrawHide(p, InvSlot[p][td+10-GetPVarInt(p,"SlidersInv")]); PlayerTextDrawHide(p, InvSlot[p][td+30-GetPVarInt(p,"SlidersInv")]); PlayerTextDrawHide(p, InvSlot[p][td+50-GetPVarInt(p,"SlidersInv")]); PlayerTextDrawHide(p, InvSlot[p][td+70-GetPVarInt(p,"SlidersInv")]);
	        	PlayerTextDrawSetPreviewModel(p, InvSlot[p][td+10-GetPVarInt(p,"SlidersInv")], GetObjectID(Player[p][Slot][td]));
				TextDrawObjectRot(p, InvSlot[p][td+10-GetPVarInt(p,"SlidersInv")],GetObjectID(Player[p][Slot][td]));
				PlayerTextDrawSetString(p,InvSlot[p][td+50-GetPVarInt(p,"SlidersInv")],GetObjectName(p,Player[p][Slot][td]));
				new str[4];format(str,sizeof(str),"%d",Player[p][SlotC][td]);
				if(Player[p][Slot][td] == 19 || Player[p][Slot][td] == 13) format(str,sizeof(str),"%d",Player[p][SlotC][td]-100);
				if(Player[p][Slot][td] == 20 || Player[p][Slot][td] == 14) format(str,sizeof(str),"%d",Player[p][SlotC][td]-200);
				PlayerTextDrawSetString(p,InvSlot[p][td+70-GetPVarInt(p,"SlidersInv")],str);
		    	PlayerTextDrawShow(p, InvSlot[p][td+10-GetPVarInt(p,"SlidersInv")]); PlayerTextDrawShow(p, InvSlot[p][td+30-GetPVarInt(p,"SlidersInv")]);
		    	PlayerTextDrawShow(p, InvSlot[p][td+50-GetPVarInt(p,"SlidersInv")]); PlayerTextDrawShow(p, InvSlot[p][td+70-GetPVarInt(p,"SlidersInv")]);
	    	}
		}
		return true;
	}
    for(new td=i;td<50;td++) {
	    if(Player[p][SlotLoot][td+1] == 0) {
			PlayerTextDrawHide(p, InvSlot[p][td]); PlayerTextDrawHide(p, InvSlot[p][td+20]);
			PlayerTextDrawHide(p, InvSlot[p][td+40]); PlayerTextDrawHide(p, InvSlot[p][td+60]);
			Player[p][SlotLoot][td] = 0; break; }
    	Player[p][SlotLoot][td] = Player[p][SlotLoot][td+1];
    	Player[p][SlotLoot][td+1] = 0;
    	new id,idc;if(Player[p][SlotLoot][td]>=4000) { id=BoxLoot[GetPlayerVirtualWorld(p)][Player[p][SlotLoot][td]-4000][td]; idc = BoxLootC[GetPlayerVirtualWorld(p)][Player[p][SlotLoot][td]-4000][td]; }
    	else {id=LootID[GetPlayerVirtualWorld(p)][Player[p][SlotLoot][td]];idc=LootC[GetPlayerVirtualWorld(p)][Player[p][SlotLoot][td]];}
		if(td-GetPVarInt(p,"SlidersInvLoot") < 10 && td-GetPVarInt(p,"SlidersInvLoot") >= 0) {
			PlayerTextDrawHide(p, InvSlot[p][td-GetPVarInt(p,"SlidersInvLoot")]); PlayerTextDrawHide(p, InvSlot[p][td+20-GetPVarInt(p,"SlidersInvLoot")]); PlayerTextDrawHide(p, InvSlot[p][td+40-GetPVarInt(p,"SlidersInvLoot")]); PlayerTextDrawHide(p, InvSlot[p][td+60-GetPVarInt(p,"SlidersInvLoot")]);
    		PlayerTextDrawSetPreviewModel(p, InvSlot[p][td-GetPVarInt(p,"SlidersInvLoot")], GetObjectID(id));
			TextDrawObjectRot(p, InvSlot[p][td-GetPVarInt(p,"SlidersInvLoot")],GetObjectID(id));
			PlayerTextDrawSetString(p,InvSlot[p][td+40-GetPVarInt(p,"SlidersInvLoot")],GetObjectName(p,id));
			new str[4];format(str,sizeof(str),"%d",idc);
			if(id == 19 || id == 13) format(str,sizeof(str),"%d",idc-100);
			if(id == 20 || id == 14) format(str,sizeof(str),"%d",idc-200);
			PlayerTextDrawSetString(p,InvSlot[p][td+60-GetPVarInt(p,"SlidersInvLoot")],str);
    		PlayerTextDrawShow(p, InvSlot[p][td-GetPVarInt(p,"SlidersInvLoot")]); PlayerTextDrawShow(p, InvSlot[p][td+20-GetPVarInt(p,"SlidersInvLoot")]);
			PlayerTextDrawShow(p, InvSlot[p][td+40-GetPVarInt(p,"SlidersInvLoot")]); PlayerTextDrawShow(p, InvSlot[p][td+60-GetPVarInt(p,"SlidersInvLoot")]);
		}
	}
	return true;
}
stock RaiseLoot(p,i,d) {
	new s;
	new id,idc;
	if(i >= 4000) { id = BoxLoot[GetPlayerVirtualWorld(p)][i-4000][d]; idc = BoxLootC[GetPlayerVirtualWorld(p)][i-4000][d]; }
	else { id = LootID[GetPlayerVirtualWorld(p)][i]; idc = LootC[GetPlayerVirtualWorld(p)][i]; }
	switch(id) {
		case 1: { if(GetPVarInt(p,"pBackpack") > 0 && GetPVarInt(p,"Slots") > (GetPVarInt(p,"pBackpack")*10)-4) return false; else if(GetPVarInt(p,"pBackpack") <= 0 && GetPVarInt(p,"Slots") > 1) return false; s=4;}
		case 2: { if(GetPVarInt(p,"pBackpack") > 0 && GetPVarInt(p,"Slots") > (GetPVarInt(p,"pBackpack")*10)-3) return false; else if(GetPVarInt(p,"pBackpack") <= 0 && GetPVarInt(p,"Slots") > 2) return false; s=3;}
		case 3: { if(GetPVarInt(p,"pBackpack") > 0 && GetPVarInt(p,"Slots") > (GetPVarInt(p,"pBackpack")*10)-2) return false; else if(GetPVarInt(p,"pBackpack") <= 0 && GetPVarInt(p,"Slots") > 3) return false; s=2;}
		case 4,5: { if(GetPVarInt(p,"pBackpack") > 0 && GetPVarInt(p,"Slots") > (GetPVarInt(p,"pBackpack")*10)-1) return false; else if(GetPVarInt(p,"pBackpack") <= 0 && GetPVarInt(p,"Slots") > 4) return false; s=1;}
		case 12,13,14: {
		    switch(GetPVarInt(p,"pHelmet")) {
		        case 1..100: {
		            if(id == 12) { if(GetPVarInt(p,"pHelmet") == 100) return false; }
                    new Float:x,Float:y,Float:z; GetPlayerPos(p,x,y,z); DropLoot(p,12,x,y,z-1,GetPlayerVirtualWorld(p),GetPVarInt(p,"pHelmet"));SetPlayerPosACSE(p,x+0.001,y,z);
		        }
		    	case 101..200: {
		            if(id == 13) { if(GetPVarInt(p,"pHelmet") == 200) return false; }
		            new Float:x,Float:y,Float:z; GetPlayerPos(p,x,y,z); DropLoot(p,13,x,y,z-1,GetPlayerVirtualWorld(p),GetPVarInt(p,"pHelmet"));SetPlayerPosACSE(p,x+0.001,y,z);
				}
		    	case 201..300: {
		            if(id == 14) { if(GetPVarInt(p,"pHelmet") == 300) return false; }
		            new Float:x,Float:y,Float:z; GetPlayerPos(p,x,y,z); DropLoot(p,14,x,y,z-1,GetPlayerVirtualWorld(p),GetPVarInt(p,"pHelmet"));SetPlayerPosACSE(p,x+0.001,y,z);
				}
		    }
		}
		case 15,16,17: {
		    switch(GetPVarInt(p,"pBackPack")) {
		        case 1: {
		            if(id == 15)  return false;
		            new Float:x,Float:y,Float:z; GetPlayerPos(p,x,y,z); DropLoot(p,15,x,y,z-1,GetPlayerVirtualWorld(p),1);SetPlayerPosACSE(p,x+0.001,y,z);
		        }
		    	case 2: {
		            if(id == 15 || LootID[GetPlayerVirtualWorld(p)][i] == 16) return false;
					new Float:x,Float:y,Float:z; GetPlayerPos(p,x,y,z); DropLoot(p,16,x,y,z-1,GetPlayerVirtualWorld(p),1);SetPlayerPosACSE(p,x+0.001,y,z);
				}
		    	case 3: return false;
		    }
		}
		case 18,19,20: {
		    switch(GetPVarInt(p,"pArmour")) {
		        case 1..100: {
		            if(id == 18) { if(GetPVarInt(p,"pArmour") == 100) return false; }
		            new Float:x,Float:y,Float:z; GetPlayerPos(p,x,y,z); DropLoot(p,18,x,y,z-1,GetPlayerVirtualWorld(p),GetPVarInt(p,"pArmour"));SetPlayerPosACSE(p,x+0.001,y,z);
		        }
		    	case 101..200: {
		            if(id == 19) { if(GetPVarInt(p,"pArmour") == 200) return false; }
					new Float:x,Float:y,Float:z; GetPlayerPos(p,x,y,z); DropLoot(p,19,x,y,z-1,GetPlayerVirtualWorld(p),GetPVarInt(p,"pArmour"));SetPlayerPosACSE(p,x+0.001,y,z);
				}
		    	case 201..300: {
		            if(id == 20) { if(GetPVarInt(p,"pArmour") == 300) return false; }
					new Float:x,Float:y,Float:z; GetPlayerPos(p,x,y,z); DropLoot(p,20,x,y,z-1,GetPlayerVirtualWorld(p),GetPVarInt(p,"pArmour"));SetPlayerPosACSE(p,x+0.001,y,z);
				}
		    }
		}
		case 21,22: {
		    if(GetPVarInt(p,"pGun1") != 0 && GetPVarInt(p,"pGun2") != 0) return false;
		    if(GetPVarInt(p,"pGun1") == 1 || GetPVarInt(p,"pGun1") == 2 || GetPVarInt(p,"pGun2") == 1 || GetPVarInt(p,"pGun2") == 2) return false;}
		case 23,24: {
		    if(GetPVarInt(p,"pGun1") != 0 && GetPVarInt(p,"pGun2") != 0) return false;
		    if(GetPVarInt(p,"pGun1") == 3 || GetPVarInt(p,"pGun2") == 3 || GetPVarInt(p,"pGun1") == 4 || GetPVarInt(p,"pGun2") == 4) return false;}
		case 25: {
		    if(GetPVarInt(p,"pGun1") != 0 && GetPVarInt(p,"pGun2") != 0) return false;
		    if(GetPVarInt(p,"pGun1") == 5 || GetPVarInt(p,"pGun2") == 5) return false;}
		case 26: {
		    if(GetPVarInt(p,"pGun1") != 0 && GetPVarInt(p,"pGun2") != 0) return false;
		    if(GetPVarInt(p,"pGun1") == 6 || GetPVarInt(p,"pGun2") == 6) return false;}
		case 27,28,29: { if(GetPVarInt(p,"pGun3") != 0) return false; }
		case 30: { if(GetPVarInt(p,"pGun4") != 0) return false; }
		case 31: { if(GetPVarInt(p,"pGun5") == 12 || GetPVarInt(p,"pGun5") == 13) return false; }
		case 32: { if(GetPVarInt(p,"pGun5") == 11 || GetPVarInt(p,"pGun5") == 13) return false; }
		case 33: { if(GetPVarInt(p,"pGun5") == 11 || GetPVarInt(p,"pGun5") == 12) return false; }
		case 35: {
			if(GetPVarInt(p,"pGun1") != 0 && GetPVarInt(p,"pGun2") != 0) return false;
		    if(GetPVarInt(p,"pGun1") == 14 || GetPVarInt(p,"pGun2") == 14) return false; }
	}
	new Float:Xx,Float:Yy,Float:Zz;
	if(i >= 4000) GetDynamicObjectPos(BoxObj[GetPlayerVirtualWorld(p)][i-4000],Xx,Yy,Zz);
	else GetDynamicObjectPos(LootObject[GetPlayerVirtualWorld(p)][i],Xx,Yy,Zz);
	if(i >= 4000) {
    	BoxLoot[GetPlayerVirtualWorld(p)][i-4000][d] = 0;
    	BoxLootC[GetPlayerVirtualWorld(p)][i-4000][d] = 0;
    	for(new vv=0;vv<50;vv++) {
    	    if(BoxLoot[GetPlayerVirtualWorld(p)][i-4000][d+vv+1] != 0) {
		    	BoxLoot[GetPlayerVirtualWorld(p)][i-4000][d+vv] = BoxLoot[GetPlayerVirtualWorld(p)][i-4000][d+vv+1];
		    	BoxLootC[GetPlayerVirtualWorld(p)][i-4000][d+vv] = BoxLootC[GetPlayerVirtualWorld(p)][i-4000][d+vv+1];
				BoxLootC[GetPlayerVirtualWorld(p)][i-4000][d+vv+1] = 0; BoxLoot[GetPlayerVirtualWorld(p)][i-4000][d+vv+1] = 0; }
    	    else break;
    	}
		if(BoxLoot[GetPlayerVirtualWorld(p)][i-4000][0]==0) DestroyDynamicObject(BoxObj[GetPlayerVirtualWorld(p)][i-4000]);
	}
	else {
		DestroyDynamicObject(LootObject[GetPlayerVirtualWorld(p)][i]);
		LootC[GetPlayerVirtualWorld(p)][i] = 0; LootID[GetPlayerVirtualWorld(p)][i] = 0;
		LootObject[GetPlayerVirtualWorld(p)][i]=0;
	}
	foreach(Player, pl) {
		if(GetPlayerVirtualWorld(pl) == GetPlayerVirtualWorld(p) && GetPlayerDistanceFromPoint(pl, Xx, Yy, Zz) < 2.0 && GetPVarInt(pl,"OpenInv") == 1) MoveSlot(pl,d,0); }
	switch(id) {
	    case 1..5,34: RaiseItem(p,id,idc,s);
	    case 6: {
			GivePVarInt(p,"pAmmo1",idc); RaiseItem(p,id,idc,0);
			if(GetPVarInt(p,"pGun3") == 7) { UpdateWeapon(p); }
			if(GetPVarInt(p,"pGun3") == 8) { UpdateWeapon(p); }
		    if(GetPVarInt(p,"pGun1") == 6 || GetPVarInt(p,"pGun2") == 6) { UpdateWeapon(p); }
		}
	    case 7: { GivePVarInt(p,"pAmmo2",idc); RaiseItem(p,id,idc,0); if(GetPVarInt(p,"pGun3") == 9) { UpdateWeapon(p); } }
	    case 8: { GivePVarInt(p,"pAmmo3",idc); RaiseItem(p,id,idc,0); if(GetPVarInt(p,"pGun1") == 5 || GetPVarInt(p,"pGun2") == 5) { UpdateWeapon(p); } }
	    case 9: { GivePVarInt(p,"pAmmo4",idc); RaiseItem(p,id,idc,0); if(GetPVarInt(p,"pGun1") == 2 || GetPVarInt(p,"pGun2") == 2) { UpdateWeapon(p); } }
	    case 10: { GivePVarInt(p,"pAmmo5",idc); RaiseItem(p,id,idc,0); if(GetPVarInt(p,"pGun1") == 1 || GetPVarInt(p,"pGun2") == 1) { UpdateWeapon(p); } }
	    case 11: { GivePVarInt(p,"pAmmo6",idc); RaiseItem(p,id,idc,0); if(GetPVarInt(p,"pGun1") == 3 || GetPVarInt(p,"pGun2") == 3 || GetPVarInt(p,"pGun1") == 4 || GetPVarInt(p,"pGun2") == 4) { UpdateWeapon(p); } }
		case 12,13,14: {
		    if(GetPVarInt(p,"OpenInv") == 1) {
				PlayerTextDrawSetPreviewModel(p, InvStat[p][2], GetObjectID(id));
		    	TextDrawObjectRot(p, InvStat[p][2],GetObjectID(id));
		    	PlayerTextDrawShow(p, InvStat[p][2]);
			    if(idc > 0 && idc < 101) PlayerTextDrawTextSize(p, InvStat[p][8], 30.000000, -35.000000/100*(100-idc));
			    else if(idc > 100 && idc < 201) PlayerTextDrawTextSize(p, InvStat[p][8], 30.000000, -35.000000/100*(200-idc));
			    else if(idc > 200 && idc < 301) PlayerTextDrawTextSize(p, InvStat[p][8], 30.000000, -35.000000/100*(300-idc));
			    else PlayerTextDrawTextSize(p, InvStat[p][8], 30.000000, 0);
			    PlayerTextDrawShow(p,InvStat[p][8]);
		    }
		    new str[2];format(str,sizeof(str),"%d",id-11);PlayerTextDrawSetString(p, HUD[p][4],str);PlayerTextDrawShow(p, HUD[p][4]);TextDrawShowForPlayer(p, HUDT[4]);
		    SetPlayerAttachedObjectSkin(Player[p][pSkin],p,GetObjectID(id),0,0,0);
			SetPVarInt(p,"pHelmet",idc);
		}
		case 15,16,17: {
		    SetPlayerAttachedObjectSkin(Player[p][pSkin],p,GetObjectID(id),0,0,0);
			SetPVarInt(p,"pBackpack",id-14);
			if(GetPVarInt(p,"OpenInv") == 1) {
				PlayerTextDrawSetPreviewModel(p, InvStat[p][4], GetObjectID(id));
		    	TextDrawObjectRot(p, InvStat[p][4],GetObjectID(id));
		    	PlayerTextDrawShow(p, InvStat[p][4]);
				switch(GetPVarInt(p,"pBackpack")) {
				    case 0: { PlayerTextDrawTextSize(p, InvStat[p][7], 4.000000, GetPVarInt(p,"Slots")*-22); }
				    case 1: { PlayerTextDrawTextSize(p, InvStat[p][7], 4.000000, GetPVarInt(p,"Slots")*-11); }
				    case 2: { PlayerTextDrawTextSize(p, InvStat[p][7], 4.000000, GetPVarInt(p,"Slots")*-5.5); }
				    case 3: { PlayerTextDrawTextSize(p, InvStat[p][7], 4.000000, GetPVarInt(p,"Slots")*-3.66666666667); }
				}
			    PlayerTextDrawShow(p, InvStat[p][7]);
		    }
		}
		case 18,19,20: {
		    if(GetPVarInt(p,"OpenInv") == 1) {
				PlayerTextDrawSetPreviewModel(p, InvStat[p][3], GetObjectID(id));
		    	TextDrawObjectRot(p, InvStat[p][3],GetObjectID(id));
		    	PlayerTextDrawShow(p, InvStat[p][3]);
			    if(idc > 0 && idc < 101) PlayerTextDrawTextSize(p, InvStat[p][9], 30.000000, -35.000000/100*(100-idc));
			    else if(idc > 100 && idc < 201) PlayerTextDrawTextSize(p, InvStat[p][9], 30.000000, -35.000000/100*(200-idc));
			    else if(idc > 200 && idc < 301) PlayerTextDrawTextSize(p, InvStat[p][9], 30.000000, -35.000000/100*(300-idc));
			    else PlayerTextDrawTextSize(p, InvStat[p][9], 30.000000, 0);
			    PlayerTextDrawShow(p,InvStat[p][9]);
		    }
		    new str[2];format(str,sizeof(str),"%d",id-17);PlayerTextDrawSetString(p, HUD[p][3],str);PlayerTextDrawShow(p, HUD[p][3]);TextDrawShowForPlayer(p, HUDT[3]);
		    SetPlayerAttachedObjectSkin(Player[p][pSkin],p,GetObjectID(id),0,0,0);
			SetPVarInt(p,"pArmour",idc);
		}
		case 21,22: {
		    if(GetPVarInt(p,"pGun1") == 0) {SetPlayerAttachedObjectSkin(Player[p][pSkin],p,GetObjectID(id),1,0,0);SetPVarInt(p,"pGun1",id-20); if(GetPVarInt(p,"OpenInv") == 1) RaiseGun(p,id-20,1);}
		    else {SetPlayerAttachedObjectSkin(Player[p][pSkin],p,GetObjectID(id),2,0,0);SetPVarInt(p,"pGun2",id-20); if(GetPVarInt(p,"OpenInv") == 1) RaiseGun(p,id-20,2);}
		    if(id==21) { if(GetPVarInt(p,"pAmmo5") > 0) { UpdateWeapon(p); } }
		    else { if(GetPVarInt(p,"pAmmo4") > 0) UpdateWeapon(p); } }
		case 23: {
		    if(GetPVarInt(p,"pGun1") == 0) {SetPlayerAttachedObjectSkin(Player[p][pSkin],p,GetObjectID(id),1,0,0);SetPVarInt(p,"pGun1",3); if(GetPVarInt(p,"OpenInv") == 1) RaiseGun(p,3,1);}
		    else {SetPlayerAttachedObjectSkin(Player[p][pSkin],p,GetObjectID(id),2,0,0);SetPVarInt(p,"pGun2",3); if(GetPVarInt(p,"OpenInv") == 1) RaiseGun(p,3,2);}
		    if(GetPVarInt(p,"pAmmo6") > 0) UpdateWeapon(p); }
		case 24: {
		    if(GetPVarInt(p,"pGun1") == 0) {SetPlayerAttachedObjectSkin(Player[p][pSkin],p,GetObjectID(id),1,0,0);SetPVarInt(p,"pGun1",4); if(GetPVarInt(p,"OpenInv") == 1) RaiseGun(p,4,1);}
		    else {SetPlayerAttachedObjectSkin(Player[p][pSkin],p,GetObjectID(id),2,0,0);SetPVarInt(p,"pGun2",4); if(GetPVarInt(p,"OpenInv") == 1) RaiseGun(p,4,2);}
		    if(GetPVarInt(p,"pAmmo6") > 0) UpdateWeapon(p); }
		case 25: {
		    if(GetPVarInt(p,"pGun1") == 0) {SetPlayerAttachedObjectSkin(Player[p][pSkin],p,GetObjectID(id),1,0,0);SetPVarInt(p,"pGun1",5); if(GetPVarInt(p,"OpenInv") == 1) RaiseGun(p,5,1);}
		    else {SetPlayerAttachedObjectSkin(Player[p][pSkin],p,GetObjectID(id),2,0,0);SetPVarInt(p,"pGun2",5); if(GetPVarInt(p,"OpenInv") == 1) RaiseGun(p,5,2);}
		    if(GetPVarInt(p,"pAmmo3") > 0) UpdateWeapon(p); }
		case 26: {
		    if(GetPVarInt(p,"pGun1") == 0) {SetPlayerAttachedObjectSkin(Player[p][pSkin],p,GetObjectID(id),1,0,0);SetPVarInt(p,"pGun1",6); if(GetPVarInt(p,"OpenInv") == 1) RaiseGun(p,6,1);}
		    else {SetPlayerAttachedObjectSkin(Player[p][pSkin],p,GetObjectID(id),2,0,0); SetPVarInt(p,"pGun2",6); if(GetPVarInt(p,"OpenInv") == 1) RaiseGun(p,6,2);}
		    if(GetPVarInt(p,"pAmmo1") > 0) UpdateWeapon(p); }
		case 27,28: {SetPVarInt(p,"pGun3",id-20); if(GetPVarInt(p,"OpenInv") == 1) RaiseGun(p,id-20,3); if(GetPVarInt(p,"pAmmo1") > 0) UpdateWeapon(p); }
		case 29: { SetPVarInt(p,"pGun3",9); if(GetPVarInt(p,"OpenInv") == 1) RaiseGun(p,9,3); if(GetPVarInt(p,"pAmmo2") > 0) UpdateWeapon(p); }
		case 30: { SetPVarInt(p,"pGun4",10); if(GetPVarInt(p,"OpenInv") == 1) RaiseGun(p,10,4); GivePlayerWeapon(p, 4, 1); }
		case 31: { if(GetPVarInt(p,"pGun5") == 11) GivePVarInt(p,"Grenades",1); else SetPVarInt(p,"Grenades",1); SetPVarInt(p,"pGun5",11); if(GetPVarInt(p,"OpenInv") == 1) RaiseGun(p,11,5); UpdateWeapon(p); }
		case 32: { if(GetPVarInt(p,"pGun5") == 12) GivePVarInt(p,"Grenades",1); else SetPVarInt(p,"Grenades",1); SetPVarInt(p,"pGun5",12); if(GetPVarInt(p,"OpenInv") == 1) RaiseGun(p,12,5); UpdateWeapon(p);}
		case 33: { if(GetPVarInt(p,"pGun5") == 13) GivePVarInt(p,"Grenades",1); else SetPVarInt(p,"Grenades",1); SetPVarInt(p,"pGun5",13); if(GetPVarInt(p,"OpenInv") == 1) RaiseGun(p,13,5); UpdateWeapon(p); }
		case 35: {
		    if(GetPVarInt(p,"pGun1") == 0) {SetPlayerAttachedObjectSkin(Player[p][pSkin],p,GetObjectID(id),1,0,0);SetPVarInt(p,"pGun1",14); if(GetPVarInt(p,"OpenInv") == 1) RaiseGun(p,14,1);}
		    else {SetPlayerAttachedObjectSkin(Player[p][pSkin],p,GetObjectID(id),2,0,0); SetPVarInt(p,"pGun2",14); if(GetPVarInt(p,"OpenInv") == 1) RaiseGun(p,14,2);}
  			UpdateWeapon(p); }
	}
	return true;
}
stock UpdateWeapon(p) {
	SetPVarInt(p,"AntiB21",4);
    new wid = GetPlayerWeapon(p);
    ResetPlayerWeapons(p);
    switch(GetPVarInt(p,"pGun1")) {
        case 1: { if(wid != 30) GivePlayerWeapon(p, 30, GetPVarInt(p, "pAmmo5")); }
        case 2: { if(wid != 31) GivePlayerWeapon(p, 31, GetPVarInt(p, "pAmmo4")); }
        case 3: { if(wid != 33) GivePlayerWeapon(p, 33, GetPVarInt(p, "pAmmo6")); }
        case 4: { if(wid != 34) GivePlayerWeapon(p, 34, GetPVarInt(p, "pAmmo6")); }
        case 5: { if(wid != 25) GivePlayerWeapon(p, 25, GetPVarInt(p, "pAmmo3")); }
        case 6: { if(wid != 29) GivePlayerWeapon(p, 29, GetPVarInt(p, "pAmmo1")); }
        case 14: { if(wid != 35) GivePlayerWeapon(p, 35, 1); }
    }
    switch(GetPVarInt(p,"pGun2")) {
        case 1: { if(wid != 30) GivePlayerWeapon(p, 30, GetPVarInt(p, "pAmmo5")); }
        case 2: { if(wid != 31) GivePlayerWeapon(p, 31, GetPVarInt(p, "pAmmo4")); }
        case 3: { if(wid != 33) GivePlayerWeapon(p, 33, GetPVarInt(p, "pAmmo6")); }
        case 4: { if(wid != 34) GivePlayerWeapon(p, 34, GetPVarInt(p, "pAmmo6")); }
        case 5: { if(wid != 25) GivePlayerWeapon(p, 25, GetPVarInt(p, "pAmmo3")); }
        case 6: { if(wid != 29) GivePlayerWeapon(p, 29, GetPVarInt(p, "pAmmo1")); }
        case 14: { if(wid != 35) GivePlayerWeapon(p, 35, 1); }
    }
    switch(GetPVarInt(p,"pGun3")) {
        case 7: { if(wid != 22) GivePlayerWeapon(p, 22, GetPVarInt(p, "pAmmo1")); }
        case 8: { if(wid != 23) GivePlayerWeapon(p, 23, GetPVarInt(p, "pAmmo1")); }
        case 9: { if(wid != 24) GivePlayerWeapon(p, 24, GetPVarInt(p, "pAmmo2")); }
    }
    switch(GetPVarInt(p,"pGun4")) {
        case 10: { if(wid != 4) GivePlayerWeapon(p, 4, 1); }
    }
    switch(GetPVarInt(p,"pGun5")) {
        case 11: { if(wid != 16) GivePlayerWeapon(p, 16, GetPVarInt(p,"Grenades")); }
        case 12: { if(wid != 17) GivePlayerWeapon(p, 17, GetPVarInt(p,"Grenades")); }
        case 13: { if(wid != 18) GivePlayerWeapon(p, 18, GetPVarInt(p,"Grenades")); }
    }
    if(wid == 0) return SetPlayerArmedWeapon(p,0);
	switch(wid) {
	    case 30: { if(GetPVarInt(p,"pGun2") == 1 || GetPVarInt(p,"pGun1") == 1)  GivePlayerWeapon(p, wid, GetPVarInt(p, "pAmmo5")); }
	    case 31: { if(GetPVarInt(p,"pGun2") == 2 || GetPVarInt(p,"pGun1") == 2)  GivePlayerWeapon(p, wid, GetPVarInt(p, "pAmmo4")); }
	    case 33: { if(GetPVarInt(p,"pGun2") == 3 || GetPVarInt(p,"pGun1") == 3)  GivePlayerWeapon(p, wid, GetPVarInt(p, "pAmmo6")); }
	    case 34: { if(GetPVarInt(p,"pGun2") == 4 || GetPVarInt(p,"pGun1") == 4)  GivePlayerWeapon(p, wid, GetPVarInt(p, "pAmmo6")); }
	    case 35: { if(GetPVarInt(p,"pGun2") == 14 || GetPVarInt(p,"pGun1") == 14)  GivePlayerWeapon(p, wid, GetPVarInt(p, "pAmmo6")); }
	    case 25: { if(GetPVarInt(p,"pGun2") == 5 || GetPVarInt(p,"pGun1") == 5)  GivePlayerWeapon(p, wid, GetPVarInt(p, "pAmmo3")); }
	    case 29: { if(GetPVarInt(p,"pGun2") == 6 || GetPVarInt(p,"pGun1") == 6) GivePlayerWeapon(p, wid, GetPVarInt(p, "pAmmo1")); }
	    case 22: { if(GetPVarInt(p,"pGun3") == 7) GivePlayerWeapon(p, wid, GetPVarInt(p, "pAmmo1")); }
		case 23: { if(GetPVarInt(p,"pGun3") == 8) GivePlayerWeapon(p, wid, GetPVarInt(p, "pAmmo1")); }
		case 24: { if(GetPVarInt(p,"pGun3") == 9) GivePlayerWeapon(p, wid, GetPVarInt(p, "pAmmo2")); }
		case 4: { if(GetPVarInt(p,"pGun4") == 10) GivePlayerWeapon(p, 4, 1); }
		case 16: { if(GetPVarInt(p,"pGun5") == 11) GivePlayerWeapon(p, 16, GetPVarInt(p,"Grenades")); }
		case 17: { if(GetPVarInt(p,"pGun5") == 12) GivePlayerWeapon(p, 17, GetPVarInt(p,"Grenades")); }
		case 18: { if(GetPVarInt(p,"pGun5") == 13) GivePlayerWeapon(p, 18, GetPVarInt(p,"Grenades")); }
	}
    return true;
}
publics Top_10(playerid) {
    new r[2];
    cache_get_data(r[0], r[1]);
    if(r[0]) {
        new fulldialog[1000], str[100];
        fulldialog = "{ffffff}Место\t\t{ffffff}Побед\t\t{ffffff}Ник\n";
        for(new i = 0; i < r[0]; i++) {
            new name[MAX_PLAYER_NAME];
            cache_get_field_content(i, "Name", name, mysql, MAX_PLAYER_NAME);
            new id = GetPlayerID(name);
            if(IsPlayerConnected(id)) format(str, sizeof str, "{ffffff}%d\t\t %d\t\t %s\n",i+1, Player[id][pWins], name);
            else format(str, sizeof str, "{ffffff}%d\t\t %d\t\t %s\n",i+1, cache_get_field_content_int(i, "Wins"), name);
            strcat(fulldialog, str);
        }
        ShowPlayerDialog(playerid, 0, DIALOG_STYLE_TABLIST_HEADERS, "Топ 10", fulldialog, "Закрыть", "");
    }
    return true;
}
stock GetPlayerID(Names[]) {
	foreach(Player, i) { if(!strcmp(Names, Player[i][pName])) return i; }
	return -1;
}
#define fclamp360(%0) %0 += (%0 >= 360.0) ? -360.0 : ((%0 < 0.0) ? 360.0 : 0.0)
stock Float: ReturnZAngleToPoint(playerid, Float:x, Float:y) {
    new Float:P[4];
    GetPlayerPos(playerid,P[0],P[1],P[2]);
    P[3] = (180.0 - atan2(floatsub(P[0],x),floatsub(P[1],y)));
    fclamp360(P[3]);
    return P[3];
}
/*public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ) {
	SetPVarFloat(playerid,"MetkaX",fX);
	SetPVarFloat(playerid,"MetkaY",fY);
    new Float: Rotation;
    Rotation = ReturnZAngleToPoint(playerid, fX, fY);
    new str[30]; format(str,sizeof(str),"%f",Rotation); SCM(playerid,-1,str);
    NSWE(playerid,Rotation);
    return true;
}*/
stock NSWE(playerid,Float:r) {
	new a;
	if(r<=7.5 || r>=352.5) { for(new i=-6;i<7;i++) {if(i<0) a=24+i; else a=i; PlayerTextDrawSetString(playerid,NWSE[playerid][i+6],NSEW[a]);}}
	else if(r>=7.5 && r<=22.5) { for(new i=-5;i<8;i++) {if(i<0) a=24+i; else a=i; PlayerTextDrawSetString(playerid,NWSE[playerid][i+5],NSEW[a]);}}
	else if(r>=22.5 && r<=37.5) { for(new i=-4;i<9;i++) {if(i<0) a=24+i; else a=i; PlayerTextDrawSetString(playerid,NWSE[playerid][i+4],NSEW[a]);}}
	else if(r>=37.5 && r<=52.5) { for(new i=-3;i<10;i++) {if(i<0) a=24+i; else a=i; PlayerTextDrawSetString(playerid,NWSE[playerid][i+3],NSEW[a]);}}
	else if(r>=52.5 && r<=67.5) { for(new i=-2;i<11;i++) {if(i<0) a=24+i; else a=i; PlayerTextDrawSetString(playerid,NWSE[playerid][i+2],NSEW[a]);}}
	else if(r>=67.5 && r<=82.5) { for(new i=-1;i<12;i++) {if(i<0) a=24+i; else a=i; PlayerTextDrawSetString(playerid,NWSE[playerid][i+1],NSEW[a]);}}
	else if(r>=82.5 && r<=97.5) { for(new i=0;i<13;i++) PlayerTextDrawSetString(playerid,NWSE[playerid][i],NSEW[i]);}
	else if(r>=97.5 && r<=112.5) { for(new i=1;i<14;i++) PlayerTextDrawSetString(playerid,NWSE[playerid][i-1],NSEW[i]);}
	else if(r>=112.5 && r<=127.5) { for(new i=2;i<15;i++) PlayerTextDrawSetString(playerid,NWSE[playerid][i-2],NSEW[i]);}
	else if(r>=127.5 && r<=142.5) { for(new i=3;i<16;i++) PlayerTextDrawSetString(playerid,NWSE[playerid][i-3],NSEW[i]);}
	else if(r>=142.5 && r<=157.5) { for(new i=4;i<17;i++) PlayerTextDrawSetString(playerid,NWSE[playerid][i-4],NSEW[i]);}
	else if(r>=157.5 && r<=172.5) { for(new i=5;i<18;i++) PlayerTextDrawSetString(playerid,NWSE[playerid][i-5],NSEW[i]);}
	else if(r>=172.5 && r<=187.5) { for(new i=6;i<19;i++) PlayerTextDrawSetString(playerid,NWSE[playerid][i-6],NSEW[i]);}
	else if(r>=187.5 && r<=202.5) { for(new i=7;i<20;i++) PlayerTextDrawSetString(playerid,NWSE[playerid][i-7],NSEW[i]);}
	else if(r>=202.5 && r<=217.5) { for(new i=8;i<21;i++) PlayerTextDrawSetString(playerid,NWSE[playerid][i-8],NSEW[i]);}
	else if(r>=217.5 && r<=232.5) { for(new i=9;i<22;i++) PlayerTextDrawSetString(playerid,NWSE[playerid][i-9],NSEW[i]);}
	else if(r>=232.5 && r<=247.5) { for(new i=10;i<23;i++) PlayerTextDrawSetString(playerid,NWSE[playerid][i-10],NSEW[i]);}
	else if(r>=247.5 && r<=262.5) { for(new i=11;i<24;i++) {if(i>23) a=i-24; else a=i; PlayerTextDrawSetString(playerid,NWSE[playerid][i-11],NSEW[a]);}}
	else if(r>=262.5 && r<=277.5) { for(new i=12;i<25;i++) {if(i>23) a=i-24; else a=i; PlayerTextDrawSetString(playerid,NWSE[playerid][i-12],NSEW[a]);}}
	else if(r>=277.5 && r<=292.5) { for(new i=13;i<26;i++) {if(i>23) a=i-24; else a=i; PlayerTextDrawSetString(playerid,NWSE[playerid][i-13],NSEW[a]);}}
	else if(r>=292.5 && r<=307.5) { for(new i=14;i<27;i++) {if(i>23) a=i-24; else a=i; PlayerTextDrawSetString(playerid,NWSE[playerid][i-14],NSEW[a]);}}
	else if(r>=307.5 && r<=322.5) { for(new i=15;i<28;i++) {if(i>23) a=i-24; else a=i; PlayerTextDrawSetString(playerid,NWSE[playerid][i-15],NSEW[a]);}}
	else if(r>=322.5 && r<=337.5) { for(new i=16;i<29;i++) {if(i>23) a=i-24; else a=i; PlayerTextDrawSetString(playerid,NWSE[playerid][i-16],NSEW[a]);}}
	else if(r>=337.5 && r<=352.5) { for(new i=17;i<30;i++) {if(i>23) a=i-24; else a=i; PlayerTextDrawSetString(playerid,NWSE[playerid][i-17],NSEW[a]);}}
	return true;
}
stock LoadMenu(playerid) {
	SetPVarInt(playerid,"AntiPad",0); DeletePVar(playerid,"AntiPadZ");SetPVarInt(playerid,"AntiPade",0);
	SetPlayerVirtualWorld(playerid, playerid+1000);
	ResetPlayerWeapons(playerid);
	SetPlayerTime(playerid,12,0);
	SetPlayerWeather(playerid,0);
    HideAllTextDraws(playerid);
    TogglePlayerSpectating(playerid, 0);
	SpawnPlayer(playerid);
	TogglePlayerControllable(playerid, false);
	SetPlayerSkin(playerid,Player[playerid][pSkin]);
	if(Player[playerid][pSkin] == 0) {
		new string[80];
		format(string,sizeof(string),"У %s[%d] изменился скин с CJ на 1 id.",Player[playerid][pName],playerid);
	    WriteLog("Bugs","CJskin",string);
		Player[playerid][pSkin] = 1; SetPlayerSkin(playerid,1); }
	SetPlayerPosACSE(playerid,2076.57,1247.75,716.18);
	SetPlayerFacingAngle(playerid,289.8827);
    SetPlayerCameraPos(playerid, 2079.5432,1249.8418,716.6501);
	SetPlayerCameraLookAt(playerid, 2071.2625,1245.6322,715.9300);
	if(IsPlayerAttachedObjectSlotUsed(playerid,3)) RemovePlayerAttachedObject(playerid,3);
	if(IsPlayerAttachedObjectSlotUsed(playerid,4)) RemovePlayerAttachedObject(playerid,4);
	SetPVarInt(playerid,"Location",3);
	SetPVarInt(playerid,"Battlegrounds",0);
	for(new att=0;att<10;att++) if(IsPlayerAttachedObjectSlotUsed(playerid,att)) RemovePlayerAttachedObject(playerid,att);
	if(Player[playerid][pLanguageTD] == 0) {
        PlayerTextDrawSetString(playerid,LobbyMenu[playerid][0],"PLAY"); PlayerTextDrawSetString(playerid,LobbyMenu[playerid][1],"REWARDS");
        PlayerTextDrawSetString(playerid,LobbyMenu[playerid][2],"CHARACTER"); PlayerTextDrawSetString(playerid,LobbyMenu[playerid][3],"STATISTICS");
	}
	else {
	    PlayerTextDrawSetString(playerid,LobbyMenu[playerid][0],FixText("ИГРАТЬ")); PlayerTextDrawSetString(playerid,LobbyMenu[playerid][1],FixText("НАГРАДЫ"));
	    PlayerTextDrawSetString(playerid,LobbyMenu[playerid][2],FixText("ПЕРСОНАЖ")); PlayerTextDrawSetString(playerid,LobbyMenu[playerid][3],FixText("СТАТИСТИКА"));
	}
	PlayerTextDrawSetString(playerid,LobbyMenu[playerid][4],Player[playerid][pName]);
	new str[10]; format(str,sizeof(str),"%d",Player[playerid][pCoins]);
	PlayerTextDrawSetString(playerid,LobbyMenu[playerid][5],str);
 	for(new td=0;td<6;td++) PlayerTextDrawShow(playerid,LobbyMenu[playerid][td]);
 	for(new td=0;td<20;td++) TextDrawShowForPlayer(playerid,LobbyMenuT[td]);
	for(new td=0;td<3;td++) TextDrawShowForPlayer(playerid,TOP10[td]);
	SelectTextDraw(playerid, 0xFFFFFF50);
    if(Player[playerid][pChristmasHat] == 1) SetPlayerAttachedObject(playerid,0, 19066, 2, 0.13, 0.0, 0.0, 0.0, 80.0, 80.0);
    return true;
}
stock TextDrawObjectRot(playerid, PlayerText: td,id) {
	switch(id) {
		case 11738: PlayerTextDrawSetPreviewRot(playerid, td, -15.000000, 0.000000, 16.000000, 1.000000);
		case 11736: PlayerTextDrawSetPreviewRot(playerid, td, 90.000000, 0.000000, 16.000000, 1.000000);
		case 11747,1546,11748,2037,11708,3013: PlayerTextDrawSetPreviewRot(playerid, td, -30.000000, 0.000000, 16.000000, 1.000000);
		case 2043: PlayerTextDrawSetPreviewRot(playerid, td, -30.000000, 0.000000, 90.000000, 1.000000);
		case 18978: PlayerTextDrawSetPreviewRot(playerid, td, 15.000000, 0.000000, 70.000000, 1.000000);
		case 19200,19109: PlayerTextDrawSetPreviewRot(playerid, td, 5.000000, -85.000000, 70.000000, 1.000000);
		case 3026: PlayerTextDrawSetPreviewRot(playerid, td, 180.000000, 30.000000, 15.000000, 1.000000);
		case 371,19559: PlayerTextDrawSetPreviewRot(playerid, td, 0.000000, 0.000000, 180.000000, 1.000000);
		case 19142,19515: PlayerTextDrawSetPreviewRot(playerid, td, 0.000000, -90.000000, 15.000000, 1.000000);
		case 355,356,357,358,349,359: PlayerTextDrawSetPreviewRot(playerid, td, 0.000000, 0.000000, 0.000000, 3.000000);
		case 353,346,347,348: PlayerTextDrawSetPreviewRot(playerid, td, 0.000000, 0.000000, 0.000000, 2.000000);
		default: PlayerTextDrawSetPreviewRot(playerid, td, 0.000000, 0.000000, 0.000000, 1.000000);
	}
    return true;
}
stock GetObjectName(p,id) {
	new string[100];
	switch(id) {
		case 1: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"Large_first_aid_kit"); else format(string,sizeof(string),FixText("Большая_аптечка"));
		case 2: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"First_aid_kit"); else format(string,sizeof(string),FixText("Аптечка"));
		case 3: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"Bandage"); else format(string,sizeof(string),FixText("Бинт"));
		case 4: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"Energy"); else format(string,sizeof(string),FixText("Энергетик"));
		case 5: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"Painkiller"); else format(string,sizeof(string),FixText("Болеутоляющее"));
		case 6: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"Ammo,_9mm"); else format(string,sizeof(string),FixText("Патроны,_9mm"));
		case 7: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"Ammo,_.50"); else format(string,sizeof(string),FixText("Патроны,_.50"));
		case 8: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"Ammo,_12_gauge"); else format(string,sizeof(string),FixText("Патроны,_12_калибр"));
		case 9: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"Ammo,_5.56mm"); else format(string,sizeof(string),FixText("Патроны,_5.56mm"));
		case 10: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"Ammo,_7.62mm"); else format(string,sizeof(string),FixText("Патроны,_7.62mm"));
		case 11: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"Ammo,_7.92mm"); else format(string,sizeof(string),FixText("Патроны,_7.92mm"));
		case 12: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"Helmet_1_level"); else format(string,sizeof(string),FixText("Шлем_1-го_уровня"));
		case 13: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"Helmet_2nd_level"); else format(string,sizeof(string),FixText("Шлем_2-го_уровня"));
		case 14: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"Helmet_3rd_level"); else format(string,sizeof(string),FixText("Шлем_3-го_уровня"));
		case 15: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"Backpack_1_level"); else format(string,sizeof(string),FixText("Рюкзак_1-го_уровня"));
		case 16: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"Backpack_2nd_level"); else format(string,sizeof(string),FixText("Рюкзак_2-го_уровня"));
		case 17: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"Backpack_3rd_level"); else format(string,sizeof(string),FixText("Рюкзак_3-го_уровня"));
		case 18: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"Armor_1_level"); else format(string,sizeof(string),FixText("Броня_1-го_уровня"));
		case 19: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"Armor_2nd_level"); else format(string,sizeof(string),FixText("Броня_2-го_уровня"));
		case 20: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"Armor_3rd_level"); else format(string,sizeof(string),FixText("Броня_3-го_уровня"));
		case 21: format(string,sizeof(string),"AK-47"); case 22: format(string,sizeof(string),"M4");
		case 23: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"Rifle"); else format(string,sizeof(string),FixText("Винтовка"));
		case 24: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"Sniper_Rifle"); else format(string,sizeof(string),FixText("Снайперка"));
		case 25: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"Shotgun"); else format(string,sizeof(string),FixText("Дробовик"));
		case 26: format(string,sizeof(string),"MP5"); case 27: format(string,sizeof(string),"Colt45"); case 28: format(string,sizeof(string),"Silenced"); case 29: format(string,sizeof(string),"Desert_Eagle");
		case 30: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"Knife"); else format(string,sizeof(string),FixText("Нож"));
		case 31: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"Grenade"); else format(string,sizeof(string),FixText("Граната"));
		case 32: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"Smoke"); else format(string,sizeof(string),FixText("Дым"));
		case 33: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"Molotov"); else format(string,sizeof(string),FixText("Молотов"));
		case 34: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"Gift"); else format(string,sizeof(string),FixText("Подарок"));
		case 35: if(Player[p][pLanguageTD] == 0) format(string,sizeof(string),"RPG"); else format(string,sizeof(string),FixText("РПГ"));
	}
    return string;
}
stock GetObjectID(id) {
	new OID;
	switch(id) {
		case 1: OID = 11738;case 2: OID = 11736;case 3: OID = 11747;case 4: OID = 1546;case 5: OID = 11748;case 6: OID = 2037;case 7: OID = 11708;case 8: OID = 2043;case 9..11: OID = 3013;case 12: OID = 18978;case 13: OID = 19200;case 14: OID = 19109;case 15: OID = 3026;
		case 16: OID = 371;case 17: OID = 19559;case 18: OID = 1242;case 19: OID = 19142;case 20: OID = 19515;case 21: OID = 355;case 22: OID = 356;case 23: OID = 357;case 24: OID = 358;case 25: OID = 349;case 26: OID = 353;case 27: OID = 346;case 28: OID = 347;case 29: OID = 348;case 30: OID = 335;case 31: OID = 342;case 32: OID = 343;case 33: OID = 344;case 34: OID = 19054; case 35:  OID = 359;
	}
    return OID;
}
stock DropLoot(playerid,id,Float:x,Float:y,Float:z,g,count) {
	for(new i=0;i<4000;i++) {
	    if(LootObject[g][i] != 0) continue;
		LootC[g][i] = count; LootID[g][i] = id;
		foreach(Player, pl) {
			if(GetPlayerVirtualWorld(pl) == GetPlayerVirtualWorld(playerid) && GetPlayerDistanceFromPoint(pl, x, y, z) < 2.0 && GetPVarInt(pl,"OpenInv") == 1) {
		    	for(new d=0;d<50;d++) {
					if(Player[pl][SlotLoot][d] != 0) continue;
					if(d<10) {
						PlayerTextDrawSetPreviewModel(pl, InvSlot[pl][d], GetObjectID(LootID[GetPlayerVirtualWorld(pl)][i]));
						TextDrawObjectRot(pl, InvSlot[pl][d],GetObjectID(LootID[GetPlayerVirtualWorld(pl)][i]));
						PlayerTextDrawSetString(playerid,InvSlot[playerid][d+40],GetObjectName(pl,LootID[GetPlayerVirtualWorld(pl)][i]));
						new str[20];format(str,sizeof(str),"%d",LootC[GetPlayerVirtualWorld(pl)][i]);
						if(LootID[GetPlayerVirtualWorld(pl)][i] == 19 || LootID[GetPlayerVirtualWorld(pl)][i] == 13) format(str,sizeof(str),"%d",LootC[GetPlayerVirtualWorld(pl)][i]-100);
						if(LootID[GetPlayerVirtualWorld(pl)][i] == 20 || LootID[GetPlayerVirtualWorld(pl)][i] == 14) format(str,sizeof(str),"%d",LootC[GetPlayerVirtualWorld(pl)][i]-200);
						PlayerTextDrawSetString(pl,InvSlot[pl][d+60],str);
					    PlayerTextDrawShow(pl, InvSlot[pl][d]); PlayerTextDrawShow(pl, InvSlot[pl][d+20]);
					    PlayerTextDrawShow(pl, InvSlot[pl][d+40]); PlayerTextDrawShow(pl, InvSlot[pl][d+60]);
					}
					Player[pl][SlotLoot][d] = i;
					break;
				}
				ShowSliders(playerid);
			} }
		switch(id) {
			case 1..11: { LootObject[g][i] = CreateDynamicObject(GetObjectID(id),x,y,z,0.0,0.0,random(360),g); }
        	case 12: { LootObject[g][i] = CreateDynamicObject(18978,x,y,z+0.1,0.0,0.0,-30.0,g); }
        	case 13,14: { LootObject[g][i] = CreateDynamicObject(GetObjectID(id),x,y,z+0.1,0.0,-90.0,-30.0,g); }
        	case 15..17: { LootObject[g][i] = CreateDynamicObject(GetObjectID(id),x,y,z,-90.0,0.0,-30.0,g); }
        	case 18: { LootObject[g][i] = CreateDynamicObject(1242,x,y,z+0.2,0.0,0.0,-30.0,g); }
        	case 19,20: { LootObject[g][i] = CreateDynamicObject(GetObjectID(id),x,y,z+0.2,0.0,-90.0,-30.0,g); }
        	case 21..33,35: { LootObject[g][i] = CreateDynamicObject(GetObjectID(id),x,y,z,90.0,0.0,0.0,g); }
        	case 34: {
				LootObject[g][i] = CreateDynamicObject(3013,x,y,z+0.17,0.0,0.0,random(360),g);
				switch(random(3)) {
				    case 0: SetDynamicObjectMaterial(LootObject[g][i], 0, 19058, "xmasboxes", "wrappingpaper4-2", 0x00000000);
				    case 1: SetDynamicObjectMaterial(LootObject[g][i], 0, 19058, "xmasboxes", "wrappingpaper1", 0x00000000);
				    case 2: SetDynamicObjectMaterial(LootObject[g][i], 0, 19058, "xmasboxes", "wrappingpaper20", 0x00000000);
				}
			}
		}
		break;
	}
	return true;
}
stock SpawnCars(g) {
	for(new i=0;i<20;i++) {
	    new car; switch(random(8)) { case 0: car=401; case 1: car=404; case 2: car=422; case 3: car=439; case 4: car=531; case 5: car=543; case 6: car=568; case 7: {if(random(2) == 0) car=468; else car=586;}}
		if(i==1) car = 452;
		new d=0;
		switch(i) {
		    case 0: d=0+random(4); case 1: d=4+random(3); case 2: d=7+random(16); case 3: d=23+random(13); case 4: d=36+random(9);
		    case 5: d=45+random(5); case 6: d=50+random(7); case 7: d=57+random(9); case 8: d=66+random(18); case 9: d=84+random(14);
		    case 10: d=98+random(12); case 11: d=110+random(6); case 12: d=116+random(21); case 13: d=137+random(14); case 14: d=151+random(12);
		    case 15: d=163+random(3); case 16: d=166+random(3); case 17: d=169+random(10); case 18: d=179+random(11); case 19: d=190+random(7);
		}
		Cars[g][i] = CreateVehicle(car, CarSpawn[d][0], CarSpawn[d][1], CarSpawn[d][2], CarSpawn[d][3], random(2), random(2), -1);
		CarsFuel[g][i] = 53.0;
		SetVehicleVirtualWorld(Cars[g][i],g);
		SetVehicleNumberPlate(Cars[g][i], "PUBGSE");
	}
	return true;
}
stock SpawnLoot(g) {
	for(new i=0;i<2754;i++) {
		switch(random(9)) {
		    case 0..2: {
		        switch(random(5)) {
		        	case 0: DropLoot(-1,1,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,1); case 1: DropLoot(-1,2,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,1); case 2: DropLoot(-1,3,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,1);case 3: DropLoot(-1,4,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,1); case 4: DropLoot(-1,5,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,1); }
		    }
		    case 3: {
		        switch(random(6)) {
		        	case 0: DropLoot(-1,6,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,20); case 1: DropLoot(-1,7,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,20); case 2: DropLoot(-1,8,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,10);
					case 3: DropLoot(-1,9,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,30+random(21)); case 4: DropLoot(-1,10,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,30); case 5: DropLoot(-1,11,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,30);
		        }
		    }
		    case 4,5: {
		        switch(random(9)) {
		        	case 0: DropLoot(-1,12,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,100); case 1: DropLoot(-1,13,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,200); case 2: DropLoot(-1,14,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,300);
					case 3: DropLoot(-1,15,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,1); case 4: DropLoot(-1,16,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,1); case 5: DropLoot(-1,17,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,1);
					case 6: DropLoot(-1,18,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,100); case 7: DropLoot(-1,19,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,200); case 8: DropLoot(-1,20,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,300);
		        }
		    }
		    case 6,7,8: {
		        switch(random(12)) {
		        	case 0: { DropLoot(-1,21,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,1); DropLoot(-1,10,LootSpawn[i][0]+0.5,LootSpawn[i][1],LootSpawn[i][2],g,30); DropLoot(-1,10,LootSpawn[i][0]-0.5,LootSpawn[i][1],LootSpawn[i][2],g,30); }
					case 1: { DropLoot(-1,22,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,1); DropLoot(-1,9,LootSpawn[i][0]+0.5,LootSpawn[i][1],LootSpawn[i][2],g,30+random(21)); DropLoot(-1,9,LootSpawn[i][0]-0.5,LootSpawn[i][1],LootSpawn[i][2],g,30+random(21)); }
					case 2: { DropLoot(-1,23,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,1); DropLoot(-1,11,LootSpawn[i][0]+0.5,LootSpawn[i][1],LootSpawn[i][2],g,5+random(10)); DropLoot(-1,11,LootSpawn[i][0]-0.5,LootSpawn[i][1],LootSpawn[i][2],g,10+random(5)); }
					case 3: { DropLoot(-1,25,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,1); DropLoot(-1,8,LootSpawn[i][0]+0.5,LootSpawn[i][1],LootSpawn[i][2],g,10+random(5)); DropLoot(-1,8,LootSpawn[i][0]-0.5,LootSpawn[i][1],LootSpawn[i][2],g,10+random(5)); }
					case 4: { DropLoot(-1,26,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,1); DropLoot(-1,6,LootSpawn[i][0]+0.5,LootSpawn[i][1],LootSpawn[i][2],g,20+random(11)); DropLoot(-1,6,LootSpawn[i][0]-0.5,LootSpawn[i][1],LootSpawn[i][2],g,20+random(11)); }
					case 5: { DropLoot(-1,27,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,1); DropLoot(-1,6,LootSpawn[i][0]+0.5,LootSpawn[i][1],LootSpawn[i][2],g,20); DropLoot(-1,6,LootSpawn[i][0]-0.5,LootSpawn[i][1],LootSpawn[i][2],g,20); }
					case 6: { DropLoot(-1,28,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,1); DropLoot(-1,6,LootSpawn[i][0]+0.5,LootSpawn[i][1],LootSpawn[i][2],g,15+random(3)); DropLoot(-1,6,LootSpawn[i][0]-0.5,LootSpawn[i][1],LootSpawn[i][2],g,15+random(3)); }
					case 7: { DropLoot(-1,29,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,1); DropLoot(-1,7,LootSpawn[i][0]+0.5,LootSpawn[i][1],LootSpawn[i][2],g,7+random(8)); DropLoot(-1,7,LootSpawn[i][0]-0.5,LootSpawn[i][1],LootSpawn[i][2],g,7+random(8)); }
					case 8: { DropLoot(-1,30,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,1); }
					case 9: { DropLoot(-1,31,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,1); }
					case 10: { DropLoot(-1,32,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,1); }
					case 11: { DropLoot(-1,33,LootSpawn[i][0],LootSpawn[i][1],LootSpawn[i][2],g,1); }
	        	}
		    }
		}
	}
	return true;
}
stock SetPlayerPosACSE(p, Float: x, Float: y, Float: z) {
    SetPVarInt(p, "Position", gettime() + 8);
	SetPlayerPos(p,x,y,z);
    pos_x[p] = x; pos_y[p] = y; pos_z[p] = z;
    pos_x2[p] = x; pos_y2[p] = y; pos_z2[p] = z;
	return true;
}
stock IsPlayerInWater(playerid) {
	new animlib[16], animname[16];
	GetAnimationName(GetPlayerAnimationIndex(playerid) , animlib, sizeof(animlib), animname, sizeof(animname));
	if(!strcmp(animlib, "SWIM", true) || !strcmp(animname, "Swim_Tread", true)) return true;
	return false;
}
stock UpdateSearchTeammate(p) {
	new bool: est = false;
	for(new td=0;td<10;td++) {
	    if(SearchTeammate[td] < 0) continue;
	    new str[30]; format(str,sizeof(str),"%s(%d)",Player[SearchTeammate[td]][pName],SearchTeammate[td]);
	    TextDrawSetString(TeammateSearchT[td],str);
	    est=true;
	}
	if(est==false) return true;
    for(new td=0;td<10;td++) TextDrawShowForPlayer(p,TeammateSearchT[td]);
	if(Player[p][pLanguageTD]==0) PlayerTextDrawSetString(p,TeammateSearch[p],"PLAYERS_LOOKING FOR_TEAMS:");
	else PlayerTextDrawSetString(p,TeammateSearch[p],FixText("ИГРОКИ,_КОТОРЫЕ_ИЩУТ ИГРОКОВ_В_КОМАHДУ:"));
    PlayerTextDrawShow(p,TeammateSearch[p]);
	return true;
}
stock HideAllTextDraws(p) {
	for(new td=0;td<89;td++) {
	   	if(td<31) TextDrawHideForPlayer(p,LobbyMenuT[td]);
	   	if(td<25) PlayerTextDrawHide(p,CharMenu[p][td]);
	    if(td<20) TextDrawHideForPlayer(p,InvGunT[td]);
		if(td<19) {TextDrawHideForPlayer(p,SetMenuT[td]); }
	    if(td<14) { PlayerTextDrawHide(p,InvGun[p][td]); TextDrawHideForPlayer(p,NWSET[td]); PlayerTextDrawHide(p,NWSE[p][td]); }
		if(td<13) TextDrawHideForPlayer(p,TeammateSearchT[td]);
		if(td<11) PlayerTextDrawHide(p,StatMenu[p][td]);
	    if(td<10) { TextDrawHideForPlayer(p,KilledT[td]); PlayerTextDrawHide(p,Indicators[p][td]); PlayerTextDrawHide(p,LobbyMenu[p][td]); }
	    if(td<9) { TextDrawHideForPlayer(p,CharMenuT[td]); PlayerTextDrawHide(p,Killed[p][td]); }
	    if(td<8) { TextDrawHideForPlayer(p,RewMenuT[td]); PlayerTextDrawHide(p,InvStat[p][td]); }
	    if(td<7) { PlayerTextDrawHide(p,SetMenu[p][td]); TextDrawHideForPlayer(p,SpeedometrT[td]); }
	    if(td<6) { PlayerTextDrawHide(p,TeamMatesHP[p][td]); TextDrawHideForPlayer(p,TeamMatesT[td]); }
	    if(td<5) { PlayerTextDrawHide(p,HUD[p][td]); TextDrawHideForPlayer(p,HUDT[td]);PlayerTextDrawHide(p,Registration[p][td]); TextDrawHideForPlayer(p,RegistrationT[td]); TextDrawHideForPlayer(p,KeysFT[td]); }
	    if(td<6) PlayerTextDrawHide(p,RewMenu[p][td]);
	    if(td<3) { TextDrawHideForPlayer(p,TOP10[td]);}
	    if(td<2) { PlayerTextDrawHide(p,Speedometr[p][td]); PlayerTextDrawHide(p,TDProcess[p][td]); }
	    PlayerTextDrawHide(p,InvSlot[p][td]); }
    PlayerTextDrawHide(p,KeysF[p]);
    PlayerTextDrawHide(p,TeammateSearch[p]);
    return true;
}
stock PlayerToKvadrat(playerid,Float:min_x,Float:min_y,Float:max_x,Float:max_y) {
    new Float:X,Float:Y,Float:Z;
    GetPlayerPos(playerid, X, Y, Z);
    if((X <= max_x && X >= min_x) && (Y <= max_y && Y >= min_y)) return true;
    return false;
}
stock WriteLog(papka[],namelog[],string[]) {
    new text[256],log[50],computation1, computation2, computation3,File:LogFile,i;
    gettime(computation1, computation2, computation3);
    format(text, sizeof(text), "[%02d:%02d:%02d]%s\r\n",computation1,computation2,computation3,string);
    getdate(computation1, computation2, computation3);
    format(log,sizeof(log),"logs/%s/(%02d.%02d.%02d)%s.log",papka,computation3,computation2,computation1,namelog);
    LogFile = fopen(log, io_append);
    while (text[i] != EOS) { fputchar(LogFile, text[i], false); i++; }
    fclose(LogFile);
    return true;
}
stock FixText(string[]) {
	new result[256];
	for(new i=0;i<256;i++) {
		switch(string[i]) {
			case 'а':result[i] = 'a'; case 'А':result[i] = 'A'; case 'б':result[i] = '—'; case 'Б':result[i] = 'Ђ';
			case 'в':result[i] = 'ў'; case 'В':result[i] = '‹'; case 'г':result[i] = '™'; case 'Г':result[i] = '‚';
			case 'д':result[i] = 'љ'; case 'Д':result[i] = 'ѓ'; case 'е':result[i] = 'e'; case 'Е':result[i] = 'E';
			case 'ё':result[i] = 'e'; case 'Ё':result[i] = 'E';	case 'ж':result[i] = '›'; case 'Ж':result[i] = '„';
			case 'з':result[i] = 'џ'; case 'З':result[i] = '€';	case 'и':result[i] = 'њ'; case 'И':result[i] = '…';
			case 'й':result[i] = 'ќ'; case 'Й':result[i] = '…';	case 'к':result[i] = 'k'; case 'К':result[i] = 'K';
			case 'л':result[i] = 'ћ'; case 'Л':result[i] = '‡';	case 'м':result[i] = 'Ї'; case 'М':result[i] = 'M';
			case 'н':result[i] = '®'; case 'Н':result[i] = 'H';	case 'о':result[i] = 'o'; case 'О':result[i] = 'O';
			case 'п':result[i] = 'Ј'; case 'П':result[i] = 'Њ';	case 'р':result[i] = 'p'; case 'Р':result[i] = 'P';
			case 'с':result[i] = 'c'; case 'С':result[i] = 'C';	case 'т':result[i] = '¦'; case 'Т':result[i] = 'Џ';
			case 'у':result[i] = 'y'; case 'У':result[i] = 'Y';	case 'ф':result[i] = '?'; case 'Ф':result[i] = 'Ѓ';
			case 'х':result[i] = 'x'; case 'Х':result[i] = 'X';	case 'ц':result[i] = '$'; case 'Ц':result[i] = '‰';
			case 'ч':result[i] = '¤'; case 'Ч':result[i] = 'Ќ';	case 'ш':result[i] = 'Ґ'; case 'Ш':result[i] = 'Ћ';
			case 'щ':result[i] = 'Ў'; case 'Щ':result[i] = 'Љ';	case 'ь':result[i] = '©'; case 'Ь':result[i] = '’';
			case 'ъ':result[i] = 'ђ'; case 'Ъ':result[i] = '§';	case 'ы':result[i] = 'Ё'; case 'Ы':result[i] = '‘';
			case 'э':result[i] = 'Є'; case 'Э':result[i] = '“';	case 'ю':result[i] = '«'; case 'Ю':result[i] = '”';
			case 'я':result[i] = '¬'; case 'Я':result[i] = '•';	default:result[i]=string[i];
		}
	}
	return result;
}
stock SetPlayerAttachedObjectSkin(s,p,m,slot,mt1,mt2) {
	switch(s) {
		default: {
		    switch(m) {
		        case 18978: { SetPlayerAttachedObject(p,0,m,2,0.089999,0.0,0.0,0.0,90.0,90.0,1.0,1.0,1.0,mt1,mt2); }
		        case 19200: { SetPlayerAttachedObject(p,0,m,2,0.129999,0.015999,0.001999,0.0,-3.599991,-0.799989,1.0,1.050999,1.165999,mt1,mt2); }
		        case 19109: { SetPlayerAttachedObject(p,0,m,2,0.154999,0.0,-0.000999,0.0,1.8,0.799996,1.082000,1.066,1.154999,mt1,mt2); }
		        case 3026: { SetPlayerAttachedObject(p,1,m,1,-0.077999,-0.052000,-0.006999,0.0,-1.499994,0.300019,0.768999,1.706,0.778,mt1,mt2); }
		        case 371: { SetPlayerAttachedObject(p,1,m,1,0.054999,-0.096000,-0.004,0.0,90.0,5.10001,0.817999,1.0,0.816,mt1,mt2); }
		        case 19559: { SetPlayerAttachedObject(p,1,m,1,0.105,-0.018,-0.008,0.0,90.0,5.000002,0.908999,0.721,0.689,mt1,mt2); }
		        case 1242: { SetPlayerAttachedObject(p,2,m,1,0.095999,0.110999,-0.0,-65.000030,100.000007,62.700008,1.447,0.76,1.358,mt1,mt2); }
		        case 19142: { SetPlayerAttachedObject(p,2,m,1,0.069999,0.054999,-0.004,0.0,-1.700009,-0.4,1.0,1.084,1.117,mt1,mt2); }
		        case 19515: { SetPlayerAttachedObject(p,2,m,1,0.069999,0.054999,-0.004,0.0,-1.700009,-0.4,1.0,1.084,1.117,mt1,mt2); }
		        case 355,356,357,349,353: {
		            if(slot == 1) SetPlayerAttachedObject(p,3,m,1,0.278999,-0.227999,0.046,96.099975,-177.900024,5.600008,1.0,1.0,1.0,mt1,mt2);
		            else SetPlayerAttachedObject(p,4,m,1,0.241000,-0.244000,-0.178999,90.499969,-169.300018,4.400003,1.0,1.0,1.0,mt1,mt2);
		        }
		        case 359: {
		            if(slot == 1) SetPlayerAttachedObject(p,3,m,1,0.178999,-0.227999,0.046,96.099975,-177.900024,180.600008,1.0,1.0,1.0,mt1,mt2);
		            else SetPlayerAttachedObject(p,4,m,1,0.141000,-0.244000,-0.178999,90.499969,-169.300018,180.400003,1.0,1.0,1.0,mt1,mt2);
		        }
		    }
		}
	}
	return true;
}
stock PlayerBan(Name[],BanID,time,reason[]) {
    new string[200],string2[150],unbandate;
    unbandate = gettime()-(13*3600) + time*3600;
    mysql_format(mysql, string, sizeof(string), "INSERT INTO `Bans` (`Nick`, `UnbanDate`, `Banned`, `Reason`) VALUES ('%e', '%d', '%e', '%s')",Player[BanID][pName],unbandate,Name,reason);
    mysql_tquery(mysql, string, "","");
    HideAllTextDraws(BanID);
	TogglePlayerSpectating(BanID, 1);
    InterpolateCameraPos(BanID, 2079.5432,1249.8418,716.6501, 2079.5432,1249.8418,716.6501, 1000);
	InterpolateCameraLookAt(BanID, 2071.2625,1245.6322,715.9300, 2071.2625,1245.6322,715.9300, 1000);
    TextDrawShowForPlayer(BanID,RegistrationT[0]);
    PlayerTextDrawSetString(BanID,Banned[BanID][1],"YOU_ARE_BANNED_ON_THIS_SERVER");
    format(string,sizeof(string),"Date_of_ban:_%s",date("%dd/%mm/%yyyy in %hh:%ii:%ss",gettime()-(13*3600)));
    PlayerTextDrawSetString(BanID,Banned[BanID][4],string);
    format(string,sizeof(string),"Date_unban:_%s",date("%dd/%mm/%yyyy in %hh:%ii:%ss",unbandate));
    PlayerTextDrawSetString(BanID,Banned[BanID][5],string);
    format(string,sizeof(string),"Banned:_%s",Name);
    PlayerTextDrawSetString(BanID,Banned[BanID][2],string);
    format(string,sizeof(string),"Reason:_%s",reason);
    PlayerTextDrawSetString(BanID,Banned[BanID][3],string);
    for(new td=1;td<6;td++) PlayerTextDrawShow(BanID,Banned[BanID][td]);
    if(strcmp(Name,"ACSE",true)) TextDrawShowForPlayer(BanID,BannedT[4]);
    else { for(new td=0;td<5;td++) TextDrawShowForPlayer(BanID,BannedT[td]); PlayerTextDrawSetString(BanID,Banned[BanID][0],reason); PlayerTextDrawShow(BanID,Banned[BanID][0]); }
    switch(time) { case 1: string="час"; case 2..4: string="часа"; default: string="часов"; }
    switch(time) { case 1: string2="hour"; default: string2="hours"; }
    format(string, sizeof(string), "{B1413D}%s забанил игрока %s(%d) на %d %s. Причина: %s",Name,Player[BanID][pName],BanID,time,string,reason);
    format(string2, sizeof(string2), "{B1413D}%s banned player %s(%d) on %d %s. Reason: %s",Name,Player[BanID][pName],BanID,time,string2,reason);
    ASCM(string,string2);
	ExitTheGame(BanID,GetPlayerVirtualWorld(BanID),3);
	return true;
}
stock ExitTheGame(p,g,r) {
	new str[100],re[20];
	switch(r) {
	    case 1: re=" "; case 0: re=" (timeout) "; case 2: re=" (kick) "; case 3: re=" (ban) "; case 4: re=" (kickgame) "; case 5: re=" (/exit) ";
	}
	foreach(Player, i) {
	    if(i == p) continue;
        if(GetPlayerVirtualWorld(i) == g) {
			format(str,sizeof(str),"%d",PlayersInGame[g]); PlayerTextDrawSetString(i,Indicators[i][5],str);
			if(Player[i][pLanguage] == 0) {if(Player[i][pAdm]>=5) format(str,sizeof(str),"%s(%d) out%s{FFFFFF}- %d left",Player[p][pName],p,re,PlayersInGame[g]); else format(str,sizeof(str),"%s out%s{FFFFFF}- %d left",Player[p][pName],re,PlayersInGame[g]); }
			else {if(Player[i][pAdm]>=5) format(str,sizeof(str),"%s(%d) вышел%s{FFFFFF}- осталось %d",Player[p][pName],p,re,PlayersInGame[g]); else format(str,sizeof(str),"%s вышел%s{FFFFFF}- осталось %d",Player[p][pName],re,PlayersInGame[g]); }
			if(r != 6) SCM(i,str,str);
		}
		if(GetPVarInt(i,"Location") == p+1000){Spoff(i);LoadMenu(i);}
		else if(GetPVarInt(i,"Location") == p+2000) {
			for(new tm=1;tm<5;tm++) {
	       		format(str,sizeof(str),"Teammate%d",tm);
	       		if(GetPVarInt(p,str) == GetPVarInt(p,"Location")-2000) continue;
	       		if(GetPVarInt(p,str) == -1 ||  GetPVarInt(p,str) == p) continue;
	       		if(GetPVarInt(GetPVarInt(p,str),"Location") == 11 || GetPVarInt(GetPVarInt(p,str),"Location") == 10) {
					TogglePlayerSpectating(p, 0);
					SpawnPlayer(p);
					TogglePlayerControllable(p, false);
					SetPlayerVirtualWorld(p, GetPlayerVirtualWorld(GetPVarInt(p,str)));
					HideAllTextDraws(p);
					SetPVarInt(p,"Location",2000+GetPVarInt(p,str));
					CancelSelectTextDraw(p);
					TogglePlayerSpectating(p, true);
					TogglePlayerControllable(p, true);
					PlayerSpectatePlayer(p, GetPVarInt(p,str));
					continue; }
				LoadMenu(i);
			}
		}
	}
	return true;
}
stock PlayerBanIP(BanID,time) {
    new string[200],enstr[50],rustr[50],unbandate;
    unbandate = gettime()-(13*3600) + time*3600;
    GetPlayerIp(BanID,string,16);
    format(rustr, sizeof(rustr), "{B1413D}IP %s был забанен.",string);
    format(enstr, sizeof(enstr), "{B1413D}IP %s was banned.",string);
    ASCM(rustr,enstr);
    mysql_format(mysql, string, sizeof(string), "INSERT INTO `Bans` (`Nick`, `UnbanDate`) VALUES ('%e', '%d')",string,unbandate);
    mysql_tquery(mysql, string, "","");
    kick(BanID);
	return true;
}
stock AntiCheat(p,id,Reason[]) {
	if(GetPVarInt(p,"ACSEKick") == 1) return true;
	if(id == 1) {
 		SetPVarInt(p,"ACSEKick",1);
	    HideAllTextDraws(p);
		TogglePlayerSpectating(p, 1);
	    InterpolateCameraPos(p, 2079.5432,1249.8418,716.6501, 2079.5432,1249.8418,716.6501, 1000);
		InterpolateCameraLookAt(p, 2071.2625,1245.6322,715.9300, 2071.2625,1245.6322,715.9300, 1000);
	    TextDrawShowForPlayer(p,RegistrationT[0]);
	    PlayerTextDrawSetString(p,Banned[p][1],"You_kicked_from_the_server");
	    for(new td=0;td<6;td++) PlayerTextDrawShow(p,Banned[p][td]);
		PlayerTextDrawSetString(p,Banned[p][0],Reason);
	    for(new td=0;td<5;td++) TextDrawShowForPlayer(p,BannedT[td]);
   		TextDrawShowForPlayer(p,BannedT[4]);
   		new rustr[100], enstr[100];
   		format(rustr, sizeof(rustr), "{B1413D}ACSE кикнул игрока %s(%d). Причина: %s",Player[p][pName],p,Reason);
   		format(enstr, sizeof(enstr), "{B1413D}ACSE kicked player %s(%d). Reason: %s",Player[p][pName],p,Reason);
    	ASCM(rustr,enstr);
		kick(p);
	    return true;
	}
	else {SetPVarInt(p,"ACSEKick",1);PlayerBan("ACSE",p,3,Reason); PlayerBanIP(p,3); }
	return true;
}
stock ASCM(rustr[],enstr[]) {
	foreach(Player, i) { if(Player[i][pAdm] >= 5) SCM(i,rustr,enstr); }
	return true;
}
stock Spoff(p) {
	PlayerTextDrawShow(p,HUD[GetPVarInt(p,"Location")-1000][0]);
    GangZoneHideForPlayer(p,Zone[0][GetPlayerVirtualWorld(p)]);
    TextDrawHideForPlayer(p,Offset[GetPlayerVirtualWorld(p)]);
    PlayerTextDrawHide(p,HUD[p][0]); TextDrawHideForPlayer(p,HUDT[0]);
	PlayerTextDrawHide(p, AdmSystem[p][0]); PlayerTextDrawHide(p, AdmSystem[p][1]);
    TogglePlayerSpectating(p, false); LoadMenu(p);
	return true;
}
stock DonateShow(p) {
	new str[245];
	if(Player[p][pLanguage] == 0) format(str,sizeof(str),"{FFFFFF}Balance: %d RUB\n{FF9500}Update balance\n{FFFFFF}Information about the replenishment\nExchange to BP - {FF9500}1RUB=40BP\n{FFFFFF}Nickname change - {FF9500}20 RUB\n{FFFFFF}Buy/Remove Christmas hat - {FF9500}15 RUB/0 RUB",Player[p][pDonate]);
	else format(str,sizeof(str),"{FFFFFF}Баланс: %d RUB\n{FF9500}Обновить баланс\n{FFFFFF}Информация о пополнении\nОбменять на BP - {FF9500}1RUB=40BP\n{FFFFFF}Сменить ник - {FF9500}20 RUB\nКупить/Удалить новогоднюю шапку - {FF9500}15 RUB/0 RUB",Player[p][pDonate]);
	if(Player[p][pLanguage] == 0) SPD(p,13,DIALOG_STYLE_TABLIST_HEADERS,"{FFFFFF}Donat",str,"Enter","Close");
	else SPD(p,13,DIALOG_STYLE_TABLIST_HEADERS,"{FFFFFF}Донат",str,"Выбрать","Закрыть");
	return true;
}
/*stock SettingsPassShow(p) {
	new str[215];
	if(Player[p][pLanguage] == 0) format(str,sizeof(str),"{FFFFFF}Email {DFDFDF}[none]\n{FFFFFF}\n",Player[p][pDonate]);
	else format(str,sizeof(str),"{FFFFFF}Почта {DFDFDF}[не указана]\n{FFFFFF}\n",Player[p][pDonate]);
	if(Player[p][pLanguage] == 0) SPD(p,18,DIALOG_STYLE_TABLIST,"{FFFFFF}Settings","{FFFFFF}To change the password","Enter","Close");
	else SPD(p,18,DIALOG_STYLE_TABLIST,"{FFFFFF}Настройки","{FFFFFF}Сменить пароль","Выбрать","Закрыть");
	return true;
}*/
publics DonateUpd(p) {
	new f, r;
	cache_get_data(r,f);
	if(r) {
    	Player[p][pDonate]=Player[p][pDonate]+cache_get_field_content_int(0, "donate");
		SCM(p, "{95C283}| {DFDFDF}Счёт Вашего аккаунта был обновлён.","{95C283}| {DFDFDF}Your account has been updated.");
		new string[200];
		mysql_format(mysql, string, sizeof(string), "DELETE FROM `Donate` WHERE `name` = '%e'", Player[p][pName]);
		mysql_tquery(mysql, string, "", "");
		DonateShow(p);
        return true;
	}
	else {
	    DonateShow(p);
		return SCM(p, "{AA3A3A}| {DFDFDF}Пополнений на Ваш аккаунт не поступало.","{AA3A3A}| {DFDFDF}Deposits on your account is not received.");
	}
}
CMD:pubgse(playerid,params[]) {
    if(IsPlayerNotAuth(playerid)) return true;
	if(Player[playerid][pAdm] < 5) return true;
	if(sscanf(params,"s[180]",params[0])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Введите: /pubgse [Текст]","{AA3A3A}| {DFDFDF}Type: /pubgse [Text]");
	new str[180];
	format(str,sizeof(str),"{AAC5E3}PUBG SAMP EDITION: {DFDFDF}%s",params[0]);
	SendClientMessageToAll(0xDFDFDFFF,str);
    WriteLog("ChatLogs","PUBGSE",str);
	return true;
}
CMD:mm(playerid,params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
	if(Player[playerid][pLanguage] == 0) SPD(playerid, 0,DSM," ","{FF9500}Keys:{DFDFDF}\n  - Y(F): Raise the loot.\n  - H: Inventory.\n  - N: Minimap in the game.\n  - LMB: Minimap in the plane.\n{FF9500}Commands:{DFDFDF}\n  - /help - help\n  - /report - To file a complaint\n  - /pm (/pmon /pmoff) - Private messages\n  - /exit - Exit to menu from game\n  - /bug - To report a bug","CLOSE","");
	else SPD(playerid, 0,DSM," ","{D8B343}Клавиши:{DFDFDF}\n  - Y(F): Поднять лут.\n  - H: Инвентарь.\n  - N: Миникарта в игре\n  - ЛКМ: Миникарта в самолёте.\n{FF9500}Команды:{DFDFDF}\n  - /help - Помощь\n  - /report - Подать жалобу\n  - /pm (/pmon /pmoff) - Личные сообщения\n  - /exit - Выход в меню с игры\n  - /bug - Сообщить о баге","ЗАКРЫТЬ","");
	return true;
}
ALTX:mm("/mainmenu","/help");
CMD:pm(playerid,params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
	if(Player[playerid][pPM] == 0) return SCM(playerid, "{AA3A3A}| {DFDFDF}Личные сообщения отключены в настройках. {ACACAC}(/pmon - для включения)","{AA3A3A}| {DFDFDF}Private messages are disabled in the settings. {ACACAC}(/pmon - to enable)");
	if(sscanf(params,"is[160]",params[0],params[1])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Введите: /pm [ID Игрока] [Текст]","{AA3A3A}| {DFDFDF}Type: /pm [ID Player] [Text]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Игрок не найден.","{AA3A3A}| {DFDFDF}Player not found.");
	if(Player[params[0]][pPM] == 0) return SCM(playerid, "{AA3A3A}| {DFDFDF}Личные сообщения игрока отключены.","{AA3A3A}| {DFDFDF}Personal message the player turned off.");
	new string[200];
	if(Player[params[0]][pLanguage] == 0) format(string,sizeof(string),"{DEBA38}[PM] {D8C171}%s(%d) >> You:{DFDFDF} %s",Player[playerid][pName],playerid,params[1]);
	else format(string,sizeof(string),"{DEBA38}[ЛС] {D8C171}%s(%d) >> Вам:{DFDFDF} %s",Player[playerid][pName],playerid,params[1]);
	SCM(params[0], string,string);
	if(Player[playerid][pLanguage] == 0) format(string,sizeof(string),"{DEBA38}[PM] {D8C171}You >> %s(%d):{DFDFDF} %s",Player[params[0]][pName],params[0],params[1]);
	else format(string,sizeof(string),"{DEBA38}[ЛС] {D8C171}Вы >> %s(%d):{DFDFDF} %s",Player[params[0]][pName],params[0],params[1]);
	SCM(playerid, string,string);
	return true;
}
CMD:pmon(playerid,params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
	if(Player[playerid][pPM] == 1) return SCM(playerid, "{AA3A3A}| {DFDFDF}Личные сообщения уже включены.","{AA3A3A}| {DFDFDF}Private messages are already enabled.");
	Player[playerid][pPM] = 1;
	SCM(playerid, "{95C283}| {DFDFDF}Личные сообщения включены.","{95C283}| {DFDFDF}Private messages enabled.");
	if(GetPVarInt(playerid,"Location") == 7) TextDrawShowForPlayer(playerid,SetMenuT[16]);
	return true;
}
CMD:pmoff(playerid,params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
	if(Player[playerid][pPM] == 0) return SCM(playerid, "{AA3A3A}| {DFDFDF}Личные сообщения уже отключены.","{AA3A3A}| {DFDFDF}Private messages are already disabled.");
	Player[playerid][pPM] = 0;
	SCM(playerid, "{95C283}| {DFDFDF}Личные сообщения отключены.","{95C283}| {DFDFDF}Private messages disabled.");
	if(GetPVarInt(playerid,"Location") == 7) TextDrawHideForPlayer(playerid,SetMenuT[16]);
	return true;
}
CMD:ban(playerid, params[]) {
    if(IsPlayerNotAuth(playerid)) return true;
	if(Player[playerid][pAdm] < 5) return true;
    if(sscanf(params,"dds[99]",params[0],params[1],params[2])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Введите: /ban [ИД] [Кол-во часов] [Причина]","{AA3A3A}| {DFDFDF}Type: /ban [ID] [Count hours] [Reason]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Игрок не найден.","{AA3A3A}| {DFDFDF}Player not found.");
	if(params[1] <= 0) return SCM(playerid, "{AA3A3A}| {DFDFDF}Введите: /ban [ИД] {D55757}[Кол-во часов] {DFDFDF}[Причина]","{AA3A3A}| {DFDFDF}Type: /ban [ID] {D55757}[Count hours] {DFDFDF}[Reason]");
	if(Player[playerid][pAdm] < Player[params[0]][pAdm]) { new rustr[100],enstr[100]; format(rustr,sizeof(rustr),"{B1413D}%s попытался забанить администратора %s.",Player[playerid][pName],Player[params[0]][pName]); format(enstr,sizeof(enstr),"{B1413D}%s tried to ban the administrator %s.",Player[playerid][pName],Player[params[0]][pName]); ASCM(rustr,enstr); return true; }
    PlayerBan(Player[playerid][pName],params[0],params[1],params[2]);
    kick(params[0]);
    return true;
}
CMD:banip(playerid, params[]) {
    if(IsPlayerNotAuth(playerid)) return true;
	if(Player[playerid][pAdm] < 5) return true;
	if(sscanf(params,"dds[99]",params[0],params[1],params[2])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Введите: /banip [ИД] [Кол-во дней] [Причина]","{AA3A3A}| {DFDFDF}Type: /banip [ID] [Count days] [Reason]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Игрок не найден.","{AA3A3A}| {DFDFDF}Player not found.");
	if(params[1] <= 0 || params[1] > 90) return SCM(playerid, "{AA3A3A}| {DFDFDF}Введите: /banip [ИД] {D55757}[Кол-во дней] {DFDFDF}[Причина]","{AA3A3A}| {DFDFDF}Type: /banip [ID] {D55757}[Count days] {DFDFDF}[Reason]");
	if(Player[playerid][pAdm] < Player[params[0]][pAdm]) { new rustr[100],enstr[100]; format(rustr,sizeof(rustr),"{B1413D}%s попытался забанить администратора %s.",Player[playerid][pName],Player[params[0]][pName]); format(enstr,sizeof(enstr),"{B1413D}%s tried to ban the administrator %s.",Player[playerid][pName],Player[params[0]][pName]); ASCM(rustr,enstr); return true; }
	PlayerBan(Player[playerid][pName],params[0],params[1]*24,params[2]);
	PlayerBanIP(params[0],params[1]*24);
    return true;
}
CMD:offban(playerid, params[]) {
    if(IsPlayerNotAuth(playerid)) return true;
	if(Player[playerid][pAdm] < 5) return true;
	new PlayerName[MAX_PLAYER_NAME];
	if(sscanf(params,"s[24]ds[99]",PlayerName,params[0],params[1])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Введите: /offban [Имя игрока/IP] [Кол-во дней] [Причина]","{AA3A3A}| {DFDFDF}Type: /offban [Player name/IP] [Count days] [Reason]");
	if(params[0] <= 0 || params[0] > 90) return SCM(playerid, "{AA3A3A}| {DFDFDF}Введите: /offban [Имя игрока/IP] {D55757}[Кол-во дней] {DFDFDF}[Причина]","{AA3A3A}| {DFDFDF}Type: /offban [Player name/IP] {D55757}[Count days] {DFDFDF}[Reason]");
	new string[200],unbandate,eng[100];
    unbandate = gettime()-(13*3600) + params[0]*24*3600;
	mysql_format(mysql, string, sizeof(string), "INSERT INTO `Bans` (`Nick`, `UnbanDate`, `Banned`, `Reason`) VALUES ('%s', '%d', '%s', '%s')",PlayerName,unbandate,Player[playerid][pName],params[1]);
    mysql_tquery(mysql, string, "","");
    format(string, sizeof(string), "{B1413D}%s забанил %s на %d дней. Причина: %s",Player[playerid][pName],PlayerName,params[0],params[1]);
    format(eng, sizeof(eng), "{B1413D}%s gave offban %s on %d days. Reason: %s",Player[playerid][pName],PlayerName,params[0],params[1]);
    ASCM(string,eng);
    return true;
}
CMD:unban(playerid, params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
	if(Player[playerid][pAdm] < 5) return true;
	if(sscanf(params,"s[24]",params[0])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Введите: /unban [Имя игрока/IP]","{AA3A3A}| {DFDFDF}Type: /unban [Player name/IP]");
	new string[70];
	mysql_format(mysql, string,sizeof(string),"SELECT * FROM `Bans` WHERE `Nick` = '%e'", params[0]);
	mysql_tquery(mysql, string, "Unban", "ds",playerid, params[0]);
    return true;
}
CMD:report(playerid, params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
    if(sscanf(params,"s[160]",params[0])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Введите: /report [Текст]","{AA3A3A}| {DFDFDF}Type: /report [Text]");
	if(GetPVarInt(playerid,"AntiFlood") > 0) return SCM(playerid, "{AA3A3A}| {DFDFDF}Подождите перед отправкой следующего сообщения.","{AA3A3A}| {DFDFDF}Wait before sending the next message.");
	new string[250],string2[250];
	format(string,sizeof(string),"{516394}Вопрос от %s(%d){DFDFDF}: %s",Player[playerid][pName],playerid,params[0]);
	format(string2,sizeof(string2),"{516394}Question from %s(%d){DFDFDF}: %s",Player[playerid][pName],playerid,params[0]);
	ASCM(string,string2);
    WriteLog("ChatLogs","Report",string);
	if(Player[playerid][pLanguage] == 0) format(string,sizeof(string),"{516394}Your question was sent. {DFDFDF}(%s)",params[0]);
	else format(string,sizeof(string),"{516394}Ваш вопрос отправлен. {DFDFDF}(%s)",params[0]);
	SCM(playerid,string,string);
	Report(playerid,params[0]);
	SetPVarInt(playerid,"AntiFlood",20);
	return true;
}
CMD:bug(playerid, params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
    if(sscanf(params,"s[160]",params[0])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Введите: /bug [Описание бага(ошибки) сервера]","{AA3A3A}| {DFDFDF}Type: /bug [Description of bug(error) server]");
	if(GetPVarInt(playerid,"AntiFlood") > 0) return SCM(playerid, "{AA3A3A}| {DFDFDF}Подождите перед отправкой следующего сообщения.","{AA3A3A}| {DFDFDF}Wait before sending the next message.");
	new string[200],string2[200];
	format(string,sizeof(string),"{BE8917}%s(%d) сообщил о баге{DFDFDF}: %s",Player[playerid][pName],playerid,params[0]);
	format(string2,sizeof(string2),"{BE8917}%s(%d) reported the bug{DFDFDF}: %s",Player[playerid][pName],playerid,params[0]);
	ASCM(string,string2);
    WriteLog("Bugs","Bugs",string);
	SCM(playerid,"Ваше сообщение успешно отправлено.","Your message has been successfully sent.");
	SetPVarInt(playerid,"AntiFlood",20);
	return true;
}
ALTX:bug("/bag");
CMD:ans(playerid, params[]) {
    if(IsPlayerNotAuth(playerid)) return true;
	if(Player[playerid][pAdm] < 5) return true;
    if(sscanf(params,"ds[160]",params[0],params[1])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Введите: /ans(wer) [ID] [Текст]","{AA3A3A}| {DFDFDF}Type: /ans(wer) [ID] [Text]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Игрок не найден.","{AA3A3A}| {DFDFDF}Player not found.");
	new string[200];
	if(Player[params[0]][pLanguage] == 0) format(string,sizeof(string),"{516394}Answer{DFDFDF}: %s",params[1]);
	else format(string,sizeof(string),"{516394}Ответ{DFDFDF}: %s",params[1]);
	SCM(params[0], string, string);
	format(string,sizeof(string),"{516394}[%s] - [%s(%d)]{DFDFDF}: %s",Player[playerid][pName],Player[params[0]][pName],params[0],params[1]);
	ASCM(string,string);
    WriteLog("ChatLogs","Answer",string);
	return true;
}
ALTX:ans("/answer");
CMD:tc(playerid, params[]) {
    if(IsPlayerNotAuth(playerid)) return true;
	if(GetPVarInt(playerid,"Team") == 0) return true;
    if(sscanf(params,"s[160]",params[0])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Введите: /tc [Текст]","{AA3A3A}| {DFDFDF}Type: /tc [Text]");
	new string[200];
	if(GetPVarInt(playerid,"Teammate1") == playerid) format(string,sizeof(string),"{A44444}[T] {DFDFDF}%s(%d): %s",Player[playerid][pName],playerid,params[0]);
	else if(GetPVarInt(playerid,"Teammate2") == playerid) format(string,sizeof(string),"{B7AD3E}[T] {DFDFDF}%s(%d): %s",Player[playerid][pName],playerid,params[0]);
	else if(GetPVarInt(playerid,"Teammate3") == playerid) format(string,sizeof(string),"{57A444}[T] {DFDFDF}%s(%d): %s",Player[playerid][pName],playerid,params[0]);
	else if(GetPVarInt(playerid,"Teammate4") == playerid) format(string,sizeof(string),"{42719D}[T] {DFDFDF}%s(%d): %s",Player[playerid][pName],playerid,params[0]);
	SCM(GetPVarInt(playerid,"Teammate1"),string,string);
	if(GetPVarInt(GetPVarInt(playerid,"Teammate1"),"Teammate2")!=-1) SCM(GetPVarInt(GetPVarInt(playerid,"Teammate1"),"Teammate2"),string,string);
	if(GetPVarInt(GetPVarInt(playerid,"Teammate1"),"Teammate3")!=-1) SCM(GetPVarInt(GetPVarInt(playerid,"Teammate1"),"Teammate3"),string,string);
	if(GetPVarInt(GetPVarInt(playerid,"Teammate1"),"Teammate4")!=-1) SCM(GetPVarInt(GetPVarInt(playerid,"Teammate1"),"Teammate4"),string,string);
	return true;
}
ALTX:tc("/t");
CMD:a(playerid, params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
	if(Player[playerid][pAdm] < 5) return true;
    if(sscanf(params,"s[160]",params[0])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Введите: /a [Текст]","{AA3A3A}| {DFDFDF}Type: /a [Text]");
	new string[200];
	format(string,sizeof(string),"{EFFC8E}[A] %s[%d]: %s",Player[playerid][pName],playerid,params[0]);
	ASCM(string,string);
    WriteLog("ChatLogs","ALog",string);
	return true;
}
CMD:kick(playerid, params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
	if(Player[playerid][pAdm] < 5) return true;
	if(sscanf(params,"is[30]",params[0],params[1])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Введите: /kick [ID] [Причина]","{AA3A3A}| {DFDFDF}Type: /kick [ID] [Reason]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Игрок не найден.","{AA3A3A}| {DFDFDF}Player not found.");
	new rustr[150],enstr[150];
	format(rustr,sizeof(rustr),"{DFDFDF}Администратор %s кикнул Вас с сервера. Причина: %s",Player[playerid][pName],params[1]);
	format(enstr,sizeof(enstr),"{DFDFDF}Administrator %s kicked You from the server. Reason: %s",Player[playerid][pName],params[1]);
	SCM(params[0],rustr,enstr);
	format(rustr,sizeof(rustr),"{9A3C41}%s кикнул %s(%d) с сервера. Причина: %s",Player[playerid][pName],Player[params[0]][pName],params[0],params[1]);
	format(enstr,sizeof(enstr),"{9A3C41}%s kicked %s(%d) from the server. Reason: %s",Player[playerid][pName],Player[params[0]][pName],params[0],params[1]);
	ASCM(rustr,enstr);
	ExitTheGame(params[0],GetPlayerVirtualWorld(params[0]),2);
	kick(params[0]);
	return true;
}
CMD:kickgame(playerid, params[]) {
    if(IsPlayerNotAuth(playerid)) return true;
	if(Player[playerid][pAdm] < 5) return true;
    if(sscanf(params,"i",params[0],params[1])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Введите: /kickgame [ID] [Причина]","{AA3A3A}| {DFDFDF}Type: /kickgame [ID] [Reason]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Игрок не найден.","{AA3A3A}| {DFDFDF}Player not found.");
	if(GetPVarInt(params[0],"Location") == 8 || GetPVarInt(params[0],"Location") == 10 || GetPVarInt(params[0],"Location") == 11 || GetPVarInt(params[0],"Location") == 12) {
		new rustr[150],enstr[150];
		format(rustr,sizeof(rustr),"{DFDFDF}Администратор %s выкинул Вас в меню. Причина: %s",Player[playerid][pName],params[1]);
		format(enstr,sizeof(enstr),"{DFDFDF}Administrator %s kicked You in the menu. Reason: %s",Player[playerid][pName],params[1]);
		SCM(params[0],rustr,enstr);
		format(rustr,sizeof(rustr),"{9A3C41}%s выкинул %s(%d) в меню. Причина: %s",Player[playerid][pName],Player[params[0]][pName],params[0],params[1]);
		format(enstr,sizeof(enstr),"{9A3C41}%s kicked %s(%d) in the menu. Reason: %s",Player[playerid][pName],Player[params[0]][pName],params[0],params[1]);
		ASCM(rustr,enstr);
	    PlayersInGame[GetPlayerVirtualWorld(params[0])]--;
		ExitTheGame(params[0],GetPlayerVirtualWorld(params[0]),4);
		LoadMenu(params[0]);
	}
	else return SCM(playerid, "{AA3A3A}| {DFDFDF}Игрок не в игре.","{AA3A3A}| {DFDFDF}The player is not in the game.");
	return true;
}
CMD:sp(playerid, params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
	if(Player[playerid][pAdm] < 5) return true;
    if(sscanf(params,"d",params[0])) {
        if(GetPVarInt(playerid,"Location") > 99) return Spoff(playerid);
		return SCM(playerid, "{AA3A3A}| {DFDFDF}Введите: /sp [ID]","{AA3A3A}| {DFDFDF}Type: /sp [ID]"); }
	if(!IsPlayerConnected(params[0])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Игрок не найден.","{AA3A3A}| {DFDFDF}Player not found.");
	if(params[0] == playerid) return SCM(playerid, "{AA3A3A}| {DFDFDF}Вы не можете следить за собой","{AA3A3A}| {DFDFDF}You can't spectate after themselves");
	if(GetPVarInt(playerid,"Location") != 3 && GetPVarInt(playerid,"Location") < 99) return true;
	if(GetPVarInt(params[0],"Location") != 8 && GetPVarInt(params[0],"Location") != 10 && GetPVarInt(params[0],"Location") != 11) return SCM(playerid, "{AA3A3A}| {DFDFDF}Игрок не в игре.","{AA3A3A}| {DFDFDF}A player not in the game.");
	SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(params[0]));
	GangZoneShowForPlayer(playerid,Zone[0][GetPlayerVirtualWorld(params[0])],0xFFFFFF70);
	GangZoneShowForPlayer(playerid,Zone[1][GetPlayerVirtualWorld(params[0])],0x4F64B170);
	HideAllTextDraws(playerid);
	SetPVarInt(playerid,"Location",1000+params[0]);
	PlayerTextDrawShow(playerid,HUD[playerid][0]); TextDrawShowForPlayer(playerid,HUDT[0]);
	CancelSelectTextDraw(playerid);
	TogglePlayerSpectating(playerid, true);
	TogglePlayerControllable(playerid, true);
	if(GetPlayerVirtualWorld(params[0]) < 51) PlayerTextDrawSetString(playerid, AdmSystem[playerid][0],"MODE:_SOLO PING: SPEED: HP: ARM:");
	else PlayerTextDrawSetString(playerid, AdmSystem[playerid][0],"MODE:_SQUAD PING: SPEED: HP: ARM:");
	PlayerTextDrawShow(playerid, AdmSystem[playerid][0]); PlayerTextDrawShow(playerid, AdmSystem[playerid][1]);
	if(IsPlayerInAnyVehicle(params[0])) PlayerSpectateVehicle(playerid, GetPlayerVehicleID(params[0]));
	else PlayerSpectatePlayer(playerid, params[0]);
	new str[5];
	format(str,sizeof(str),"%d",GetPVarInt(params[0],"pKills"));PlayerTextDrawSetString(playerid,Indicators[playerid][4],str);PlayerTextDrawShow(playerid,Indicators[playerid][4]);
	PlayerTextDrawShow(playerid,Indicators[playerid][2]); PlayerTextDrawShow(playerid,Indicators[playerid][1]);
	if(Player[playerid][pLanguageTD] == 0) PlayerTextDrawSetString(playerid,Indicators[playerid][6],"Killed");
	else PlayerTextDrawSetString(playerid,Indicators[playerid][6],FixText("УБИТО"));
	PlayerTextDrawShow(playerid,Indicators[playerid][6]);
	if(Player[playerid][pLanguageTD] == 0) PlayerTextDrawSetString(playerid,Indicators[playerid][7],"IN_GAME");
	else PlayerTextDrawSetString(playerid,Indicators[playerid][7],FixText("В_ИГРЕ"));
    format(str,sizeof(str),"%d",PlayersInGame[GetPlayerVirtualWorld(params[0])]); PlayerTextDrawSetString(playerid,Indicators[playerid][5],str);
	PlayerTextDrawShow(playerid,Indicators[playerid][0]); PlayerTextDrawShow(playerid,Indicators[playerid][3]);
	PlayerTextDrawShow(playerid,Indicators[playerid][5]); PlayerTextDrawShow(playerid,Indicators[playerid][7]);
	return true;
}
CMD:spoff(playerid, params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
	if(Player[playerid][pAdm] < 5) return true;
	if(GetPVarInt(playerid,"Location") < 99) return true;
	Spoff(playerid);
	return true;
}
CMD:admins(playerid, params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
	if(Player[playerid][pAdm] < 5) return true;
	new string[200];
	new adm=0;
	foreach(Player, p) {
	    if(Player[p][pAdm] >= 1) { if(adm==0) format(string,sizeof(string),"%s[%d]",Player[p][pName],p); else format(string,sizeof(string),"%s, %s[%d]",string,Player[p][pName],p); adm=1; }
	}
	format(string,sizeof(string),"{9A3C41}Admins:{FFFFFF} %s",string);
	SCM(playerid,string,string);
	return true;
}
ALTX:admins("/adm");
CMD:ahelp(playerid,params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
	if(Player[playerid][pAdm] < 5) return true;
	if(Player[playerid][pLanguage] == 0) SPD(playerid, 0,DSM," ","{D8B343}Commands:{DFDFDF}\n  - /ban\n  - /banip\n  - /ans\n  - /kick\n  - /kickgame\n  - /sp(/spoff)\n  - /stats\n  - /gunstats\n  - /freeze(/unfreeze)\n  - /slap\n  - /updatelobby\n  - /checklobby","CLOSE","");
	else SPD(playerid, 0,DSM," ","{D8B343}Команды:{DFDFDF}\n  - /ban\n  - /banip\n  - /ans\n  - /kick\n  - /kickgame\n  - /sp(/spoff)\n  - /stats\n  - /gunstats\n  - /freeze(/unfreeze)\n  - /slap\n  - /updatelobby\n  - /checklobby","ЗАКРЫТЬ","");
	return true;
}
CMD:freeze(playerid,params[]) {
   	if(IsPlayerNotAuth(playerid)) return true;
	if(Player[playerid][pAdm] < 5) return true;
    if(sscanf(params,"d",params[0])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Введите: /freeze [ID]","{AA3A3A}| {DFDFDF}Type: /freeze [ID]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Игрок не найден.","{AA3A3A}| {DFDFDF}Player not found.");
    TogglePlayerControllable(params[0], false);
	return true;
}
CMD:unfreeze(playerid,params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
	if(Player[playerid][pAdm] < 5) return true;
    if(sscanf(params,"d",params[0])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Введите: /unfreeze [ID]","{AA3A3A}| {DFDFDF}Type: /unfreeze [ID]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Игрок не найден.","{AA3A3A}| {DFDFDF}Player not found.");
    TogglePlayerControllable(params[0], true);
	return true;
}
CMD:slap(playerid,params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
	if(Player[playerid][pAdm] < 5) return true;
    if(sscanf(params,"d",params[0])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Введите: /slap [ID]","{AA3A3A}| {DFDFDF}Type: /slap [ID]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Игрок не найден.","{AA3A3A}| {DFDFDF}Player not found.");
	new Float:X,Float:Y,Float:Z;
	GetPlayerPos(params[0],X,Y,Z);
	SetPlayerPosACSE(params[0],X,Y,Z+5);
	return true;
}
CMD:exit(playerid, params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
	if(GetPVarInt(playerid,"Location") >= 2000) return LoadMenu(playerid);
	if(GetPVarInt(playerid,"Location") == 8 || GetPVarInt(playerid,"Location") == 10 || GetPVarInt(playerid,"Location") == 11) {
		TextDrawHideForPlayer(playerid,Offset[GetPlayerVirtualWorld(playerid)]);
	    PlayersInGame[GetPlayerVirtualWorld(playerid)]--;
		DropBox(playerid,GetPlayerVirtualWorld(playerid));
		if(GetPVarInt(playerid,"GiftCar") > -1) { SetPVarInt(playerid,"GiftCar",-1);DestroyVehicle(GetPVarInt(playerid,"GiftCar")); }
        ExitTheGame(playerid,GetPlayerVirtualWorld(playerid),5);
		LoadMenu(playerid);
	}
	return true;
}
CMD:id(playerid, params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
    if(sscanf(params,"s[24]",params[0])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Введите: /id [Имя]","{AA3A3A}| {DFDFDF}Type: /id [Name]");
	new ids = 0;
	foreach(Player, p) {
	    new idname[MAX_PLAYER_NAME+10];
	    GetPlayerName(p, idname, sizeof(idname));
	    if(ids >= 5)  return SCM(playerid, "{95C283}| {DFDFDF}Показаны 5 совпадений.","{95C283}| {DFDFDF}Shown 5 matches.");
	    if(strfind(idname, params[0], true) !=-1) {
	        ids++;
	        format(idname, sizeof(idname), "%s(%d)",idname,p);
	        SCM(playerid, idname, idname);
	    }
	}
    if(ids == 0) return SCM(playerid, "{AA3A3A}| {DFDFDF}Совпадений не найдено.","{AA3A3A}| {DFDFDF}No matches found.");
	return true;
}
CMD:donate(playerid, params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
	DonateShow(playerid);
	return true;
}
CMD:object(playerid, params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
    if(strcmp(Player[playerid][pName],"Alex_Dyson",true)) return true;
 	if(sscanf(params,"iii",params[0],params[1],params[2])) return SCM(playerid, "{bdb600}| {FFFFFF}Введите: /object [id] [индекс] [Часть тела]","{bdb600}| {FFFFFF}Введите: /object [id] [индекс] [Часть тела]");
 	SetPlayerAttachedObject(playerid,params[1], params[0], params[2], 0.13, 0.0, 0.0, 0.0, 90.0, 90.0);
	return true;
}
CMD:editobject(playerid, params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
    if(strcmp(Player[playerid][pName],"Alex_Dyson",true)) return true;
 	if(sscanf(params,"i",params[0])) return SCM(playerid, "{bdb600}| {FFFFFF}Введите: /editobject [индекс]","{bdb600}| {FFFFFF}Введите: /editobject [индекс]");
 	EditAttachedObject(playerid,params[0]);
	return true;
}
CMD:restart(playerid, params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
    if(strcmp(Player[playerid][pName],"Alex_Dyson",true)) return true;
	if(Restart == 1) Restart = 0;
    else { Restart = 1; SendRconCommand("hostname PUBG | SA:MP Edition Restarting"); }
    return true;
}
CMD:number(playerid, params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
    if(strcmp(Player[playerid][pName],"Alex_Dyson",true)) return true;
	new str[100]; format(str,sizeof(str),"%d",GetPlayerVirtualWorld(playerid));
	SCM(playerid,str,str);
	return true;
}
CMD:updatelobby(playerid, params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
	if(GetPVarInt(playerid,"Location") != 10) return true;
    new pil = 0;
    foreach(Player, p) {
        if(GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(p) && GetPVarInt(p,"Location") != 12 && GetPVarInt(p,"Location") < 99) { pil++; }
    }
    PlayersInGame[GetPlayerVirtualWorld(playerid)] = pil;
	foreach(Player, i) { if(GetPlayerVirtualWorld(i) == GetPlayerVirtualWorld(playerid)) { new str[4]; format(str,sizeof(str),"%d",PlayersInGame[GetPlayerVirtualWorld(i)]); PlayerTextDrawSetString(i,Indicators[i][5],str); } }
	return true;
}
ALTX:updatelobby("/ul");
CMD:checklobby(playerid, params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
	if(Player[playerid][pAdm] < 5) return true;
    foreach(Player, p) {
        if(GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(p)) { new str[30]; format(str,sizeof(str),"%s(%d)",Player[p][pName],p);SCM(playerid,str,str); }
    }
	return true;
}
CMD:stats(playerid,params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
	if(Player[playerid][pAdm] < 5) return true;
    if(sscanf(params,"d",params[0])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Введите: /stats [ID]","{AA3A3A}| {DFDFDF}Type: /stats [ID]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Игрок не найден.","{AA3A3A}| {DFDFDF}Player not found.");
	new string[400],str[35];
	format(str,sizeof(str),"{FFFFFF}Статистика %s",Player[params[0]][pName]);
	format(string,sizeof(string),"{FFFFFF}Убийства:\n\tРУКАМИ: %d\n\tDESERT_EAGLE: %d\n\t9mm: %d\n\tSILENCED_9mm: %d\n\tSHOTGUN: %d\n\tM4: %d\n\tAK-47: %d\n\tCOUNTRY_RIFLE: %d\n\tГРАНАТОЙ: %d\n\
		Смерти:\n\tРУКАМИ: %d\n\tDESERT_EAGLE: %d\n\t9mm: %d\n\tSILENCED_9mm: %d\n\tSHOTGUN: %d\n\tM4: %d\n\tAK-47: %d\n\tCOUNTRY_RIFLE: %d\n\tГРАНАТОЙ: %d\n\tОСТАЛЬНОЕ: %d\nПОБЕД: %d/%d",
    	Player[params[0]][pMHands],Player[params[0]][pMDE],Player[params[0]][pM9mm],Player[params[0]][pMS9mm],Player[params[0]][pMSG],Player[params[0]][pMM4],Player[params[0]][pMAK47],Player[params[0]][pMCR],Player[params[0]][pMGrenade],
 		Player[params[0]][pDHands],Player[params[0]][pDDE],Player[params[0]][pD9mm],Player[params[0]][pDS9mm],Player[params[0]][pDSG],Player[params[0]][pDM4],Player[params[0]][pDAK47],Player[params[0]][pDCR],Player[params[0]][pDGrenade],Player[params[0]][pDOTHER],Player[params[0]][pWins],Player[params[0]][pPlayed]);
    SPD(playerid,0,DSM,str,string,"Закрыть","");
	return true;
}
CMD:gunstats(playerid,params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
	if(Player[playerid][pAdm] < 5) return true;
    if(sscanf(params,"d",params[0])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Введите: /gunstats [ID]","{AA3A3A}| {DFDFDF}Type: /gunstats [ID]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Игрок не найден.","{AA3A3A}| {DFDFDF}Player not found.");
	new string[400],str[55];
	format(str,sizeof(str),"{FFFFFF}Статистика выстрелов %s",Player[params[0]][pName]);
	format(string,sizeof(string),"{FFFFFF}Игрок произвёл за игру %d выстрелов:\nВ автомобиль попал %d раз.\nВ игрока попал %d раз:\n\t{DFDFDF}Торс:%d\n\tПах:%d\n\tЛ.Рука:%d\n\tП.Рука:%d\n\tЛ.Нога:%d\n\tП.Нога:%d\n\tГолова:%d\n{FFFFFF}Мимо:%d",
	    GetPVarInt(params[0],"Shots"),GetPVarInt(params[0],"ShotsAuto"),GetPVarInt(params[0],"ShotsPlayer"),GetPVarInt(params[0],"Shots3"),GetPVarInt(params[0],"Shots4"),GetPVarInt(params[0],"Shots5"),GetPVarInt(params[0],"Shots6"),GetPVarInt(params[0],"Shots7"),GetPVarInt(params[0],"Shots8"),GetPVarInt(params[0],"Shots9"),
	    GetPVarInt(params[0],"Shots")-(GetPVarInt(params[0],"ShotsAuto")+GetPVarInt(params[0],"ShotsPlayer")));
	SPD(playerid,0,DSM,str,string,"Закрыть","");
	return true;
}
CMD:aims(playerid,params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
	if(Player[playerid][pAdm] < 5) return true;
	foreach(Player,p) {
	    if(GetPVarInt(p,"Shots") >= 5) {
	        if(GetPVarInt(p,"Shots")-(GetPVarInt(p,"ShotsAuto")+GetPVarInt(p,"ShotsPlayer")) <= 1) {
	            new str[30];
				format(str,sizeof(str),"%s(%d) Aim",Player[p][pName],p);
	            SCM(playerid,str,str);
	        }
	    }
	}
	return true;
}
CMD:maxforstart(playerid, params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
	if(Player[playerid][pAdm] < 5) return true;
    if(sscanf(params,"d",params[0])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Введите: /maxforstart [Count]","{AA3A3A}| {DFDFDF}Type: /maxforstart [Count]");
	if(params[0] < 0 || params[0] > 100) return true;
	if(Player[playerid][pAdm] == 5) { if(params[0] < 5 || params[0] > 30) return true; }
	MAXFORSTART = params[0];
	return true;
}
CMD:giveadm(playerid, params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
    if(strcmp(Player[playerid][pName],"Alex_Dyson",true)) return true;
    if(sscanf(params,"dd",params[0],params[1])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Введите: /giveadm [ID] [Count]","{AA3A3A}| {DFDFDF}Type: /giveadm [ID] [Count]");
	Player[params[0]][pAdm] = params[1];
	return true;
}
CMD:givecoins(playerid, params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
    //if(strcmp(Player[playerid][pName],"Alex_Dyson",true)) return true;
	if(Player[playerid][pAdm] < 5) return true;
    if(sscanf(params,"dd",params[0],params[1])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Введите: /givecoins [ID] [Count]","{AA3A3A}| {DFDFDF}Type: /givecoins [ID] [Count]");
	Player[params[0]][pCoins] += params[1];
	return true;
}
CMD:asd(playerid, params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
    Player[params[0]][pDonate] += 20;
	return true;
}
CMD:stop(playerid, params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
    if(strcmp(Player[playerid][pName],"Alex_Dyson",true)) return true;
    OffsetZone[GetPlayerVirtualWorld(playerid)]=61;
	//StopGame(GetPlayerVirtualWorld(playerid));
	return true;
}
CMD:res(playerid, params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
    if(strcmp(Player[playerid][pName],"Alex_Dyson",true)) return true;
	for(new s=0;s<282;s++) { Player[playerid][pSkins][s] = 0; }
	return true;
}
CMD:skin(playerid, params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
    //if(!strcmp(Player[playerid][pName],"Alex_Dyson") || !strcmp(Player[playerid][pName],"Skidd")) {
	if(Player[playerid][pAdm] < 5) return true;
    if(sscanf(params,"dd",params[0],params[1])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Введите: /skin [ID] [Скин]","{AA3A3A}| {DFDFDF}Type: /skin [ID] [Skin]");
	SetPlayerSkin(params[0],params[1]);
	Player[params[0]][pSkin] = params[1];
	//}
   	return true;
}
CMD:createloot(playerid, params[]) {
	if(IsPlayerNotAuth(playerid)) return true;
	//if(strcmp(Player[playerid][pName],"Alex_Dyson",true)) return true;
	if(Player[playerid][pAdm] < 5) return true;
	if(sscanf(params,"dd",params[0],params[1])) return SCM(playerid, "{AA3A3A}| {DFDFDF}Введите: /createloot [ID] [Кол-во]","{AA3A3A}| {DFDFDF}Type: /createloot [ID] [Count]");
	if(GetPVarInt(playerid,"Location") != 10 && GetPVarInt(playerid,"Location") != 11) return SCM(playerid, "{AA3A3A}| {DFDFDF}Вы не в игре.","{AA3A3A}| {DFDFDF}You are not in the game.");
	new Float:x,Float:y,Float:z;GetPlayerPos(playerid,x,y,z);
	DropLoot(playerid,params[0],x,y,z-1,GetPlayerVirtualWorld(playerid),params[1]);
	SetPlayerPosACSE(playerid,x+0.001,y,z);
	return true;
}
