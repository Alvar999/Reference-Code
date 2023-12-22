#define         GANGLOCKER          (9901)
#define         GANGLOCKER2         (9902)
#define         GANGLOCKER3         (9903)
#define         GANGLOCKER4         (9904)
#define         GANGLOCKER5         (9905)
#define         GANGLOCKER6         (9906)
#define         GANGLOCKER7         (9907)
#define         GANGLOCKER8         (9908)
#define         GANGLOCKER9         (9909)
#define         GANGLOCKER10        (9910)
#define         GANGLOCKER11        (9911)
#define         GANGLOCKER12        (9912)
#define         GANGLOCKER13        (9913)
#define         GANGVUKHI           (9914)

CMD:glocker(playerid, params[])
{
	new string[128];
	if(PlayerInfo[playerid][pConnectHours] < 2 || PlayerInfo[playerid][pWRestricted] > 0) return SendClientMessageEx(playerid, COLOR_GRAD2, "You cannot use this as you are currently restricted from possessing weapons!");

	new family;
	if(PlayerInfo[playerid][pFMember] < INVALID_FAMILY_ID) family = PlayerInfo[playerid][pFMember];
	else return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong o trong family.");
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_GRAD2, "You can not get weapons from a vehicle!");

	if (GetPVarInt(playerid, "GiveWeaponTimer") > 0)
	{
		format(string, sizeof(string), "   Ban phai doi  %d giay before getting another weapon.", GetPVarInt(playerid, "GiveWeaponTimer"));
		return SendClientMessageEx(playerid,COLOR_GREY,string);
	}
	if(IsPlayerInRangeOfPoint(playerid, 3.0, FamilyInfo[family][FamilySafe][0], FamilyInfo[family][FamilySafe][1], FamilyInfo[family][FamilySafe][2]) && GetPlayerVirtualWorld(playerid) == FamilyInfo[family][FamilySafeVW] && GetPlayerInterior(playerid) == FamilyInfo[family][FamilySafeInt])
	{
        ShowPlayerDialog(playerid, GANGLOCKER, DIALOG_STYLE_LIST, "{FFFFFF}Tu do", "{FFFFFF}Tien\nTrang Phuc\nVu Khi\nVat Lieu\nPot\nCrack", "Chon", "Huy bo");
	}
	else
	{
		return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong o gan locker");
	}
	return 1;
}

//
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == GANGLOCKER)
	{
	    if(response)
	    {
			new string[128];
			switch(listitem)
			{
			    case 0: //Money
			    {
			       new family;
			       if(PlayerInfo[playerid][pFMember] < INVALID_FAMILY_ID) family = PlayerInfo[playerid][pFMember];
			       format(string, sizeof(string), "Tien: %s", number_format(FamilyInfo[family][FamilyCash]));
			       ShowPlayerDialog(playerid,GANGLOCKER2,DIALOG_STYLE_LIST,string,"Cat tien\nLay tien","Lua Chon","Thoat");
			    }
			    case 1: //Trang phuc
			    {
			       ShowPlayerDialog(playerid, 3497, DIALOG_STYLE_INPUT, "Lua chon skin ","Vui long nhap mot ID skin!\n\nNote: Cho Phep Su Dung Tat Ca Skin.", "Thay doi", "Huy bo" );
			    }
			    case 2: // VU khi
			    {
			       //SendClientMessageEx(playerid, COLOR_WHITE, "He thong dang duoc cap nhat vui long thu lai sau");
			       ShowPlayerDialog(playerid, GANGVUKHI, DIALOG_STYLE_LIST, "GANG VU KHI", "Desert Eagle\nMP5\nShotGun\nBaseball Bat\nKatana\nBrass Knuckles", "Dong y", "Huy bo");
			    }
			    case 3: //Vat lieu
			    {
			       new family;
			       if(PlayerInfo[playerid][pFMember] < INVALID_FAMILY_ID) family = PlayerInfo[playerid][pFMember];
			       format(string, sizeof(string), "Vat Lieu: %s", number_format(FamilyInfo[family][FamilyMats]));
			       ShowPlayerDialog(playerid,GANGLOCKER5,DIALOG_STYLE_LIST,string,"Cat Vat Lieu\nLay Vat Lieu","Lua Chon","Thoat");
			    }
			    case 4: // Pot
			    {
			       new family;
			       if(PlayerInfo[playerid][pFMember] < INVALID_FAMILY_ID) family = PlayerInfo[playerid][pFMember];
			       format(string, sizeof(string), "Pot: %s", number_format(FamilyInfo[family][FamilyPot]));
			       ShowPlayerDialog(playerid,GANGLOCKER8,DIALOG_STYLE_LIST,string,"Cat Pot\nLay Pot","Lua Chon","Thoat");
			    }
			    case 5: //Crack
			    {
			       new family;
			       if(PlayerInfo[playerid][pFMember] < INVALID_FAMILY_ID) family = PlayerInfo[playerid][pFMember];
			       format(string, sizeof(string), "Crack: %s", number_format(FamilyInfo[family][FamilyCrack]));
			       ShowPlayerDialog(playerid,GANGLOCKER11,DIALOG_STYLE_LIST,string,"Cat Crack\nLay Crack","Lua Chon","Thoat");
			    }
             }
         }
    }
    //Desert Eagle\nMP5\nShotGun\nBaseball Bat\nKatana\nBrass Knuckles
    if(dialogid == GANGVUKHI)
    {
        if(response) // If they clicked 'Select' or double-clicked a weapon
        {
            // Give them the weapon
            switch(listitem)
            {
                case 0: //Cat tien
			    {
			       GivePlayerWeapon(playerid, 24, 60000);
			    }
			    case 1: //Lay tien
			    {
			        GivePlayerWeapon(playerid, 29, 60000);
			    }
			    case 2: //Lay tien
			    {
			        GivePlayerWeapon(playerid, 25, 60000);
			    }
			    case 3: //Lay tien
			    {
			        GivePlayerWeapon(playerid, 5, 60000);
			    }
			    case 4: //Lay tien
			    {
			        GivePlayerWeapon(playerid, 8, 60000);
			    }
			    case 5: //Lay tien
			    {
			        GivePlayerWeapon(playerid, 1, 60000);
			    }
            }
        }
        return 1; // We handled a dialog, so return 1. Just like OnPlayerCommandText.
    }
	//
	if(dialogid == GANGLOCKER2)
	{
	    if(response)
	    {
			new string[128];
			switch(listitem)
			{
			    case 0: //Cat tien
			    {
			       new family;
			       if(PlayerInfo[playerid][pFMember] < INVALID_FAMILY_ID) family = PlayerInfo[playerid][pFMember];
			       format(string, sizeof(string), "Tien: %s", number_format(FamilyInfo[family][FamilyCash]));
			       ShowPlayerDialog(playerid,GANGLOCKER3,DIALOG_STYLE_INPUT,string," Nhap so tien ban muon bo vao ben trong","Bo vao","Thoat");
			    }
			    case 1: //Lay tien
			    {
			        new family;
			        if(PlayerInfo[playerid][pFMember] < INVALID_FAMILY_ID) family = PlayerInfo[playerid][pFMember];
			        format(string, sizeof(string), "Tien: %s", number_format(FamilyInfo[family][FamilyCash]));
			        ShowPlayerDialog(playerid, GANGLOCKER4, DIALOG_STYLE_INPUT, string, "Nhap so tien ban muon rut tu tu do", "Rut tien", "Huy bo");
			    }
			}
		}
	}

	if (dialogid == GANGLOCKER3)
    {
	    new family;
	    new string[128];
	    if(PlayerInfo[playerid][pFMember] < INVALID_FAMILY_ID) family = PlayerInfo[playerid][pFMember];
	    if(strfind(inputtext, "%", true) != -1) {
			return ShowPlayerDialog(playerid,GANGLOCKER2,DIALOG_STYLE_INPUT,"Tu do"," Nhap so tien ban muon bo vao ben trong","Bo vao","Thoat");
		}
		if(strfind(inputtext, "c", true) != -1) {
			return ShowPlayerDialog(playerid,GANGLOCKER2,DIALOG_STYLE_INPUT,"Tu do"," Nhap so tien ban muon bo vao ben trong","Bo vao","Thoat");
		}
		new amount = strval(inputtext);
		if (amount > GetPlayerCash(playerid) || amount < 1)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "{FFFFFF}Ban khong du tien de gui vao tu do.");
			return 1;
		}
		PlayerInfo[playerid][pCash] -= amount;
		FamilyInfo[family][FamilyCash] += amount;
		format(string, sizeof(string), "Ban da bo $%s vao tu do.", number_format(amount));
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "%s da bo $%sSAD vao tu do cua team %s.", GetPlayerNameEx(playerid), number_format(amount), FamilyInfo[family][FamilyName]);
		Log("logs/iteam.log", string);
		OnPlayerStatsUpdate(playerid);
		SaveFamily(family);
	}

	if (dialogid == GANGLOCKER4)
    {
	    new family;
	    new string[128];
	    if(PlayerInfo[playerid][pFMember] < INVALID_FAMILY_ID) family = PlayerInfo[playerid][pFMember];
	    if(strfind(inputtext, "%", true) != -1) {
			return ShowPlayerDialog(playerid,GANGLOCKER2,DIALOG_STYLE_INPUT,"Tu do"," Nhap so tien ban muon bo vao ben trong","Bo vao","Thoat");
		}
		if(strfind(inputtext, "c", true) != -1) {
			return ShowPlayerDialog(playerid,GANGLOCKER2,DIALOG_STYLE_INPUT,"Tu do"," Nhap so tien ban muon bo vao ben trong","Bo vao","Thoat");
		}
		new amount = strval(inputtext);
		if(FamilyInfo[family][FamilyCash] < amount)
		{
                  SendClientMessageEx(playerid, COLOR_WHITE, "So tien trong locker khong du voi so tien ban yeu cau");
                  return 1;
                }
		if(PlayerInfo[playerid][pRank] < 2)
		{
		      SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong du quyen han.");
		      return 1;
		}
		PlayerInfo[playerid][pCash] += amount;
		FamilyInfo[family][FamilyCash] -= amount;
		format(string, sizeof(string), "Ban da lay $%s ra khoi tu do.", number_format(amount));
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "%s da lay $%sSAD ra khoi tu do cua team %s.", GetPlayerNameEx(playerid), number_format(amount), FamilyInfo[family][FamilyName]);
		Log("logs/iteam.log", string);
		OnPlayerStatsUpdate(playerid);
		SaveFamily(family);
	}

	if(dialogid == GANGLOCKER5)
	{
	    if(response)
	    {
            new string[128];
	        switch(listitem)
			{
			    case 0: //Cat vat lieu
			    {
			       new family;
			       if(PlayerInfo[playerid][pFMember] < INVALID_FAMILY_ID) family = PlayerInfo[playerid][pFMember];
			       format(string, sizeof(string), "Vat Lieu: %s", number_format(FamilyInfo[family][FamilyMats]));
			       ShowPlayerDialog(playerid,GANGLOCKER6,DIALOG_STYLE_INPUT,string,"Nhap so vat lieu ma ban muon cat vao trong tu do","Bo vao","Thoat");
			    }
			    case 1: //Lay vat lieu
			    {
			       new family;
			       if(PlayerInfo[playerid][pFMember] < INVALID_FAMILY_ID) family = PlayerInfo[playerid][pFMember];
			       format(string, sizeof(string), "Vat Lieu: %s", number_format(FamilyInfo[family][FamilyMats]));
			       ShowPlayerDialog(playerid, GANGLOCKER7, DIALOG_STYLE_INPUT, string, "Nhap so vat lieu ma ban muon lay ra trong tu do", "Lay ra", "Huy bo");
			    }
			}
		}
	}

	if (dialogid == GANGLOCKER6)
    {
	    new family;
	    new string[128];
	    if(PlayerInfo[playerid][pFMember] < INVALID_FAMILY_ID) family = PlayerInfo[playerid][pFMember];
	    if(strfind(inputtext, "%", true) != -1) {
			return ShowPlayerDialog(playerid,GANGLOCKER6,DIALOG_STYLE_INPUT,"Tu do","Nhap so vat lieu ma ban muon cat vao ben trong","Bo vao","Thoat");
		}
		if(strfind(inputtext, "c", true) != -1) {
			return ShowPlayerDialog(playerid,GANGLOCKER6,DIALOG_STYLE_INPUT,"Tu do"," Nhap so vat lieu ban muon bo vao ben trong","Bo vao","Thoat");
		}
		new amount = strval(inputtext);
		/*if (FamilyInfo[family][FamilyLevel] < 2)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "Team cua ban chua du quyen han.");
			return 1;
		}*/
		if (PlayerInfo[playerid][pMats] < amount)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "{FFFFFF}Ban khong du vat lieu de gui vao tu do.");
			return 1;
		}
		PlayerInfo[playerid][pMats] -= amount;
		FamilyInfo[family][FamilyMats] += amount;
		format(string, sizeof(string), "Ban da bo %s vat lieu vao tu do.", number_format(amount));
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "%s da bo %s vat lieu vao tu do cua team %s.", GetPlayerNameEx(playerid), number_format(amount), FamilyInfo[family][FamilyName]);
		Log("logs/iteam.log", string);
		OnPlayerStatsUpdate(playerid);
		SaveFamily(family);
	}

	if (dialogid == GANGLOCKER7)
    {
	    new family;
	    new string[128];
	    if(PlayerInfo[playerid][pFMember] < INVALID_FAMILY_ID) family = PlayerInfo[playerid][pFMember];
	    if(strfind(inputtext, "%", true) != -1) {
			return ShowPlayerDialog(playerid,GANGLOCKER7,DIALOG_STYLE_INPUT,"Tu do","Nhap so vat lieu ban muon lay ra khoi tu do","Lay ra","Thoat");
		}
		if(strfind(inputtext, "c", true) != -1) {
			return ShowPlayerDialog(playerid,GANGLOCKER7,DIALOG_STYLE_INPUT,"Tu do","Nhap so vat lieu ban muon lay ra khoi tu do","Lay ra","Thoat");
		}
		new amount = strval(inputtext);
		/*if (FamilyInfo[family][FamilyLevel] < 2)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "Team cua ban chua du quyen han.");
			return 1;
		}*/
		if (FamilyInfo[family][FamilyMats] < amount)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "{FFFFFF}Trong tu do khong du so vat lieu ban yeu cau.");
			return 1;
		}
		if(PlayerInfo[playerid][pRank] < 2)
		{
		      SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong du quyen han.");
		      return 1;
		}
		PlayerInfo[playerid][pMats] += amount;
		FamilyInfo[family][FamilyMats] -= amount;
		format(string, sizeof(string), "Ban da lay %s vat lieu ra khoi tu do.", number_format(amount));
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "%s da lay %s vat lieu ra khoi tu do cua team %s.", GetPlayerNameEx(playerid), number_format(amount), FamilyInfo[family][FamilyName]);
		Log("logs/iteam.log", string);
		OnPlayerStatsUpdate(playerid);
		SaveFamily(family);
	}

	if(dialogid == GANGLOCKER8)
	{
	    if(response)
	    {
            new string[128];
			switch(listitem)
			{
			    case 0: //Cat POT
			    {
			       new family;
			       if(PlayerInfo[playerid][pFMember] < INVALID_FAMILY_ID) family = PlayerInfo[playerid][pFMember];
			       format(string, sizeof(string), "Pot: %s", number_format(FamilyInfo[family][FamilyPot]));
			       ShowPlayerDialog(playerid,GANGLOCKER9,DIALOG_STYLE_INPUT,string,"Nhap so Pot ma ban muon cat vao trong tu do","Bo vao","Thoat");
			    }
			    case 1: //Lay POT
			    {
			       new family;
			       if(PlayerInfo[playerid][pFMember] < INVALID_FAMILY_ID) family = PlayerInfo[playerid][pFMember];
			       format(string, sizeof(string), "Pot: %s", number_format(FamilyInfo[family][FamilyPot]));
			       ShowPlayerDialog(playerid, GANGLOCKER10, DIALOG_STYLE_INPUT, string, "Nhap so Pot ma ban muon lay ra trong tu do", "Lay ra", "Huy bo");
			    }
			}
		}
	}

	if (dialogid == GANGLOCKER9)
    {
	    new family;
	    new string[128];
	    if(PlayerInfo[playerid][pFMember] < INVALID_FAMILY_ID) family = PlayerInfo[playerid][pFMember];
	    if(strfind(inputtext, "%", true) != -1) {
			return ShowPlayerDialog(playerid,GANGLOCKER9,DIALOG_STYLE_INPUT,"Tu do","Nhap so Pot ma ban muon cat vao ben trong","Bo vao","Thoat");
		}
		if(strfind(inputtext, "c", true) != -1) {
			return ShowPlayerDialog(playerid,GANGLOCKER9,DIALOG_STYLE_INPUT,"Tu do"," Nhap so Pot ban muon bo vao ben trong","Bo vao","Thoat");
		}
		new amount = strval(inputtext);
		/*if (FamilyInfo[family][FamilyLevel] < 2)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "Team cua ban chua du quyen han.");
			return 1;
		}*/
		if (PlayerInfo[playerid][pPot] < amount)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "{FFFFFF}Ban khong du Pot de gui vao tu do.");
			return 1;
		}
		PlayerInfo[playerid][pPot] -= amount;
		FamilyInfo[family][FamilyPot] += amount;
		format(string, sizeof(string), "Ban da bo %s Pot vao tu do.", number_format(amount));
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "%s da bo %s ma tuy (Pot) vao tu do cua team %s.", GetPlayerNameEx(playerid), number_format(amount), FamilyInfo[family][FamilyName]);
		Log("logs/iteam.log", string);
		OnPlayerStatsUpdate(playerid);
		SaveFamily(family);
	}

	if (dialogid == GANGLOCKER10)
    {
	    new family;
	    new string[128];
	    if(PlayerInfo[playerid][pFMember] < INVALID_FAMILY_ID) family = PlayerInfo[playerid][pFMember];
	    if(strfind(inputtext, "%", true) != -1) {
			return ShowPlayerDialog(playerid,GANGLOCKER10,DIALOG_STYLE_INPUT,"Tu do","Nhap so Pot ban muon lay ra khoi tu do","Lay ra","Thoat");
		}
		if(strfind(inputtext, "c", true) != -1) {
			return ShowPlayerDialog(playerid,GANGLOCKER10,DIALOG_STYLE_INPUT,"Tu do","Nhap so Pot ban muon lay ra khoi tu do","Lay ra","Thoat");
		}
		new amount = strval(inputtext);
		/*if (FamilyInfo[family][FamilyLevel] < 2)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "Team cua ban chua du quyen han.");
			return 1;
		}*/
		if (FamilyInfo[family][FamilyPot] < amount)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "{FFFFFF}Trong tu do khong du so Pot ban yeu cau.");
			return 1;
		}
		if(PlayerInfo[playerid][pRank] < 2)
		{
		      SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong du quyen han.");
		      return 1;
		}
		PlayerInfo[playerid][pPot] += amount;
		FamilyInfo[family][FamilyPot] -= amount;
		format(string, sizeof(string), "Ban da lay %s Pot ra khoi tu do.", number_format(amount));
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "%s da lay $%s ma tuy (Pot) ra khoi tu do cua team %s.", GetPlayerNameEx(playerid), number_format(amount), FamilyInfo[family][FamilyName]);
		Log("logs/iteam.log", string);
		OnPlayerStatsUpdate(playerid);
		SaveFamily(family);
	}

	if(dialogid == GANGLOCKER11)
	{
	    if(response)
	    {
            new string[128];
			switch(listitem)
			{
			    case 0: //Cat Crack
			    {
			       new family;
			       if(PlayerInfo[playerid][pFMember] < INVALID_FAMILY_ID) family = PlayerInfo[playerid][pFMember];
			       format(string, sizeof(string), "Crack: %s", number_format(FamilyInfo[family][FamilyCrack]));
			       ShowPlayerDialog(playerid,GANGLOCKER12,DIALOG_STYLE_INPUT,string,"Nhap so Crack ma ban muon cat vao trong tu do","Bo vao","Thoat");
			    }
			    case 1: //Lay Crack
			    {
			       new family;
			       if(PlayerInfo[playerid][pFMember] < INVALID_FAMILY_ID) family = PlayerInfo[playerid][pFMember];
			       format(string, sizeof(string), "Crack: %s", number_format(FamilyInfo[family][FamilyCrack]));
			       ShowPlayerDialog(playerid, GANGLOCKER13, DIALOG_STYLE_INPUT, string, "Nhap so Crack ma ban muon lay ra trong tu do", "Lay ra", "Huy bo");
			    }
			}
		}
	}

	if (dialogid == GANGLOCKER12)
    {
	    new family;
	    new string[128];
	    if(PlayerInfo[playerid][pFMember] < INVALID_FAMILY_ID) family = PlayerInfo[playerid][pFMember];
	    if(strfind(inputtext, "%", true) != -1) {
			return ShowPlayerDialog(playerid,GANGLOCKER12,DIALOG_STYLE_INPUT,"Tu do","Nhap so Pot ma ban muon cat vao ben trong","Bo vao","Thoat");
		}
		if(strfind(inputtext, "c", true) != -1) {
			return ShowPlayerDialog(playerid,GANGLOCKER12,DIALOG_STYLE_INPUT,"Tu do"," Nhap so Pot ban muon bo vao ben trong","Bo vao","Thoat");
		}
		new amount = strval(inputtext);
		/*if (FamilyInfo[family][FamilyLevel] < 2)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "Team cua ban chua du quyen han.");
			return 1;
		}*/
		if (PlayerInfo[playerid][pCrack] < amount)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "{FFFFFF}Ban khong du Crack de gui vao tu do.");
			return 1;
		}
		PlayerInfo[playerid][pCrack] -= amount;
		FamilyInfo[family][FamilyCrack] += amount;
		format(string, sizeof(string), "Ban da bo %s Crack vao tu do.", number_format(amount));
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "%s da bo %s ma tuy (Crack) vao tu do cua team %s.", GetPlayerNameEx(playerid), number_format(amount), FamilyInfo[family][FamilyName]);
		Log("logs/iteam.log", string);
		OnPlayerStatsUpdate(playerid);
		SaveFamily(family);
	}

	if (dialogid == GANGLOCKER13)
    {
	    new family;
	    new string[128];
	    if(PlayerInfo[playerid][pFMember] < INVALID_FAMILY_ID) family = PlayerInfo[playerid][pFMember];
	    if(strfind(inputtext, "%", true) != -1) {
			return ShowPlayerDialog(playerid,GANGLOCKER13,DIALOG_STYLE_INPUT,"Tu do","Nhap so Crack ban muon lay ra khoi tu do","Lay ra","Thoat");
		}
		if(strfind(inputtext, "c", true) != -1) {
			return ShowPlayerDialog(playerid,GANGLOCKER13,DIALOG_STYLE_INPUT,"Tu do","Nhap so Crack ban muon lay ra khoi tu do","Lay ra","Thoat");
		}
		new amount = strval(inputtext);
		/*if (FamilyInfo[family][FamilyLevel] < 2)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "Team cua ban chua du quyen han.");
			return 1;
		}*/
		if (FamilyInfo[family][FamilyCrack] < amount)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "{FFFFFF}Trong tu do khong du so Crack ban yeu cau.");
			return 1;
		}
		if(PlayerInfo[playerid][pRank] < 2)
		{
		      SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong du quyen han.");
		      return 1;
		}
		PlayerInfo[playerid][pPot] += amount;
		FamilyInfo[family][FamilyPot] -= amount;
		format(string, sizeof(string), "Ban da lay %s Crack ra khoi tu do.", number_format(amount));
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "%s da lay %s ma tuy (Crack) ra khoi tu do cua team %s.", GetPlayerNameEx(playerid), number_format(amount), FamilyInfo[family][FamilyName]);
		Log("logs/iteam.log", string);
		OnPlayerStatsUpdate(playerid);
		SaveFamily(family);
	}
	return 1;
}

