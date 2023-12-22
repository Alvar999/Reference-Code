



// add new
new PhiensoTai[MAX_PLAYERS];
new PhiensoXiu[MAX_PLAYERS];
new bool:TaiXiu_Used = true;

//enum pinfo
	pTai,
    pXiu,

//enum

enum txInfo {
	Tai,
	Xiu,
	Phienso,
	SonguoiTai,
	SonguoiXiu,
	PhiensoTaiz,
	PhiensoXiuz,
};
new TaiXiu[txInfo];

//tim SetTimer("WarmupLock", 15000, 0); add ben duoi
SetTimer("NgauNhienTaiXiu", 60000, true);

// 	CMD
//taixiu
CMD:taixiu(playerid, params[])
{
	new itemid, amount, string[128];
	if(!TaiXiu_Used) return SendClientMessage(playerid, -1, "[{AA3333}!{FFFFFF}] {FFFF00}TAI XIU{FFFFFF} Hien Tai Chua Mo."); 
	if(!IsPlayerConnected(playerid))
	{
        SendClientMessageEx(playerid, COLOR_GREY, " Ban chua dang nhap.");
        return 1;
    }
    if(PlayerInfo[playerid][pLevel] < 3)
    {
        SendClientMessageEx(playerid, COLOR_LIGHTRED, "[{AA3333}!{FFFFFF}]: Ban Khong Du Level De Choi {FFFF00}TAI XIU{FFFFFF} [ Level 3 ]");
        return 1;
    }
	if(sscanf(params, "dd", itemid, amount) || (itemid < 1 || itemid > 5))
	{
		SendClientMessageEx(playerid, -1, "{929EB0}SU DUNG{FFFFFF}: {FFFF00}/taixiu{929EB0} [ID] [So Tien]");
		SendClientMessageEx(playerid, -1, "{929EB0}CHON: 1.{00FF00}TAI{FFFFFF} - 2.{FF0000}XIU");
		return 1;
	}

	if(amount < 10000) return SendClientMessageEx(playerid, COLOR_LIGHTRED, "Ban khong the dat cuoc thap hon 10.000 SAD.");
	if(amount > 5000000) return SendClientMessageEx(playerid, COLOR_LIGHTRED, "Ban khong the dat cuoc vuot qua 5.000.000 SAD");
	if(PlayerInfo[playerid][pCash] < amount)
	{
          SendClientMessageEx(playerid, -1, "[{AA3333}!{FFFFFF}] BAN KHONG DU TIEN DAT CUOC.");
          return 1;
    }
	if(PlayerInfo[playerid][pTai] == 0 && PlayerInfo[playerid][pXiu] == 0)
	{
		switch(itemid)
		{
			case 1: // Tai
			{
				PlayerInfo[playerid][pCash] -= amount;
				PlayerInfo[playerid][pTai] = amount;
				format(string, sizeof(string), "[{FFFF00}TAI XIU{FFFFFF}]: Ban Da Dat Cuoc So Tien $%s Vao {00FF00}Tai{FFFFFF} O Phien So [ {00FF00}%d{FFFFFF} ]", number_format(amount), TaiXiu[Phienso]);
				SendClientMessageEx(playerid, -1, string);
                TaiXiu[Tai] += amount;
                PhiensoTai[playerid] = 1;
                TaiXiu[PhiensoTaiz] += 1;
                TaiXiu[SonguoiTai] += 1;
			} 
			case 2: // Xiu
			{

				PlayerInfo[playerid][pCash] -= amount;
				PlayerInfo[playerid][pXiu] = amount;
				format(string, sizeof(string), "[{FFFF00}TAI XIU{FFFFFF}]: Ban Da Dat Cuoc So Tien $%s Vao {FF0000}Xiu{FFFFFF} O Phien So [ {00FF00}%d{FFFFFF} ]", number_format(amount), TaiXiu[Phienso]);
				SendClientMessageEx(playerid, COLOR_WHITE, string);
				PhiensoXiu[playerid] = 1;
                TaiXiu[Xiu] += amount;
                TaiXiu[PhiensoXiuz] += 1;
                TaiXiu[SonguoiXiu] += 1;
			}
		}
	}
	else
	{
        SendClientMessageEx(playerid, COLOR_WHITE, "[{AA3333}!{FFFFFF}] Ban Da Dat Duoc Vao Phien {FFFF00}TAI XIU{FFFFFF} Nay Roi!");
    }
	return 1;
}

CMD:taixiuinfo(playerid, params[])
{
	if(!TaiXiu_Used) return SendClientMessage(playerid, -1, "[{AA3333}!{FFFFFF}] {FFFF00}TAI XIU{FFFFFF} Hien Tai Chua Mo.");
	new string[1028], stringc[128], stringz[128], strings[128];
    foreach(new i: Player)
	{
		 if(PlayerInfo[playerid][pCash] > 1)
		 {
               format(strings, sizeof(strings), "{FFFFCC}________(TAI XIU)(Con %d giay)________", GetPVarInt(playerid, "Taixiutime") - gettime());
               SendClientMessageEx(playerid, COLOR_WHITE, strings);
               format(stringc, sizeof(stringc), "So Nguoi Dat {00FF00}Tai{FFFFFF}({FFFF00}%d{FFFFFF} Nguoi) - So Nguoi Dat {FF0000}Xiu{FFFFFF}({FFFF00}%d{FFFFFF} Nguoi)", TaiXiu[SonguoiTai], TaiXiu[SonguoiXiu]);
               SendClientMessageEx(playerid, -1, stringc);
               format(stringz, sizeof(stringz), "Tong So Tien ~{00FF00}Tai{FFFFFF}~ ( ${FFFF00}%d{FFFFFF} ) - Tong So Tien ~{FF0000}Xiu{FFFFFF}~ ( ${FFFF00}%d{FFFFFF} )", TaiXiu[Tai], TaiXiu[Xiu]);
               SendClientMessageEx(playerid, -1, stringz);
               if(PhiensoTai[playerid] == 1)
               {
                    format(string, sizeof(string), "[{00FF00}!{FFFFFF}] Ban Da Dat Cuoc Vao {00FF00}Tai{FFFFFF} - So tien: [ ${FFFF00}%d{FFFFFF} ]", PlayerInfo[playerid][pTai]);
                    SendClientMessageEx(playerid, COLOR_WHITE, string);
                    return 1;
               }
               if(PhiensoXiu[playerid] == 1)
               {
                    format(string, sizeof(string), "[{00FF00}!{FFFFFF}] Ban dat cuoc vao {FF0000}Xiu{FFFFFF} - So tien: [ ${FFFF00}%d{FFFFFF} ]", PlayerInfo[playerid][pXiu]);
                    SendClientMessageEx(playerid, COLOR_WHITE, string);
                    return 1;
               }
         }
         return 1;
    }
	return 1;
}

forward NgauNhienTaiXiu();
public NgauNhienTaiXiu()
{
	new string[1028];
	if(!TaiXiu_Used) return 1;
    switch(random(2))
    {
        case 0: // Tai
		{
			new tongsotienz = TaiXiu[Tai];
            format(string, sizeof(string), "{FFFF00}[TAI XIU]{FFFFFF}: PHIEN TAI XIU SO [ {00FF00}%d{FFFFFF} ] : {00FF00}TAI{FFFFFF} CHIEN THANG (( Tong so tien: ${00FF00}%s{FFFFFF} ))", TaiXiu[Phienso], number_format(tongsotienz*2));
			OOCOff(-1, string);
            foreach(new i: Player)
	        {
			    if(PhiensoTai[i] == 1)
			    {
                    new amount = PlayerInfo[i][pTai];
					PlayerInfo[i][pCash] += amount*2;
					format(string, sizeof(string), "[{00FF00}!{FFFFFF}] Ban Da Chien Thang o Phien {FFFF00}Tai-Xiu{FFFFFF} So [ {00FF00}%d{FFFFFF} ] Va Nhan Duoc ${00FF00}%s", TaiXiu[Phienso], number_format(amount*2));
					SendClientMessageEx(i, COLOR_WHITE, string);
			    }
		    }
		}
		case 1:
		{
			new tongsotien = TaiXiu[Xiu];
            format(string, sizeof(string), "{FFFF00}[TAI XIU]{FFFFFF}: PHIEN TAI XIU SO [ {00FF00}%d{FFFFFF} ] : {FF0000}XIU{FFFFFF} CHIEN THANG (( Tong so tien: ${00FF00}%s{FFFFFF} ))", TaiXiu[Phienso], number_format(tongsotien*2));
			OOCOff(COLOR_WHITE, string);
			foreach(new i: Player)
	        {
			    if(PhiensoXiu[i] == 1)
			    {
                    new amountz = PlayerInfo[i][pXiu];
					PlayerInfo[i][pCash] += amountz*2;
					format(string, sizeof(string), "[{00FF00}!{FFFFFF}] Ban Da Chien Thang o Phien {FFFF00}Tai-Xiu{FFFFFF} So [ {00FF00}%d{FFFFFF} ] Va Nhan Duoc ${00FF00}%s", TaiXiu[Phienso], number_format(amountz*2));
					SendClientMessageEx(i, COLOR_WHITE, string);
			    }
		    }
	    }
	}
	SetTimer("ResetTaiXiu", 1000, 0);
	return 1;
}

forward ResetTaiXiu();
public ResetTaiXiu()
{
    TaiXiu[Phienso] += 1;
	TaiXiu[Tai] = 0;
	TaiXiu[Xiu] = 0;
	TaiXiu[SonguoiTai] = 0;
	TaiXiu[SonguoiXiu] = 0;
	TaiXiu[PhiensoTaiz] = 0;
	TaiXiu[PhiensoXiuz] = 0;
	SetTimer("HoanThanhTaiXiu", 1000, 0);
}

forward HoanThanhTaiXiu();
public HoanThanhTaiXiu()
{
    foreach(new i: Player)
	{
	    SetPVarInt(i, "Taixiutime", gettime() + 180);
	    PlayerInfo[i][pTai] = 0;
	    PlayerInfo[i][pXiu] = 0;
	    PhiensoXiu[i] = 0;
        PhiensoTai[i] = 0;
	    SendClientMessageEx(i, COLOR_WHITE, "[{FFFF00}TAI XIU{FFFFFF}]: Bay Gio Ban Da Co The Dat Cuoc.");
	}
}

CMD:khoatx(playerid)
{
	if(PlayerInfo[playerid][pAdmin] < 9999) return SendClientMessage(playerid, -1, "[{AA3333}!{FFFFFF}] Ban khong duoc phep su dung lenh nay.");
	if(TaiXiu_Used)
	{
		TaiXiu_Used = false;
		SendClientMessage(playerid, -1, "[{33CCFF}+{FFFFFF}] Ban da {FF0000}Tat{FFFFFF} Tai xiu.");
	}
	else
	{
		TaiXiu_Used = true;
		SendClientMessage(playerid, -1, "[{33CCFF}+{FFFFFF}] Ban da {00FF00}Bat{FFFFFF} Tai xiu.");
	}
	return 1;
}