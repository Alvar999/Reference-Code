// define
#define 		DIALOG_ACTORJOB				(5091)

// public OnDialogResponse
    if(dialogid == DIALOG_ACTORJOB && response)
	{
		switch(listitem)
		{
			case 0:
			{
				if(PlayerInfo[playerid][pDonateRank] == 0)
				{
					if(PlayerInfo[playerid][pJob] != 0 || PlayerInfo[playerid][pJob2] != 0)
					{
						SendClientMessage(playerid, -1, "[{AA3333}!{FFFFFF}] Ban dang co mot cong viec, su dung /nghiviec de thoat khoi cong viec hien tai.");
						SendClientMessage(playerid, -1, "[{AA3333}!{FFFFFF}] Chi VIP/Famed moi co the nhan duoc hai cong viec cung mot luc.");
						return 1;
					}
				}
				else if(PlayerInfo[playerid][pJob] != 0 && PlayerInfo[playerid][pJob2] != 0) return SendClientMessage(playerid, -1, "[{AA3333}!{FFFFFF}] Ban dang co 2 cong viec, su dung /nghiviec de thoat khoi cong viec.");
				for(new i = 0; i < 14; i++)
				{
					if(IsPlayerInRangeOfPoint(playerid, 3.0, ActorPos[i][0], ActorPos[i][1], ActorPos[i][2]))
					{
						if(i == 12)
						{
							PlayerInfo[playerid][pModel] = 155;
							SetPlayerSkin(playerid, 155);
						}
						if(PlayerInfo[playerid][pJob] == 0) PlayerInfo[playerid][pJob] = floatround(ActorPos[i][5]);
						else if(PlayerInfo[playerid][pJob2] == 0) PlayerInfo[playerid][pJob2] = floatround(ActorPos[i][5]);
					}
				}
				SendClientMessage(playerid, -1, "[{FFFF00}+{FFFFFF}] Chuc mung ban da vao lam viec, hay co gang nhe.");
			}
			case 1: cmd_nghiviec(playerid, "1");
			case 2: cmd_nghiviec(playerid, "2");
			case 3:
			{
				if(PlayerInfo[playerid][pJob] != 21 && PlayerInfo[playerid][pJob2] != 21) SendClientMessageEx(playerid, -1, "[{AA3333}!{FFFFFF}] Ban khong phai la Pizza Boy.");
				else if(GetPlayerSkin(playerid) != 155) SendClientMessageEx(playerid, -1, "[{AA3333}!{FFFFFF}] Ban phai mac trang phuc Pizza Boy.");
				else if(GetPVarType(playerid, "Pizza")) SendClientMessageEx(playerid, -1, "[{AA3333}!{FFFFFF}] Ban dang cung cap banh pizza.");
				else {
					new rand = random(MAX_HOUSES - 1), i;
					while(!(HouseInfo[rand][hOwned] && HouseInfo[rand][hExteriorZ] <= 100 && HouseInfo[rand][hExteriorX] > 159.6704 && HouseInfo[rand][hExteriorX] < 2881.3550 && HouseInfo[rand][hExteriorY] < -1221.3380 && HouseInfo[rand][hExteriorY] > -1766.5830)) {
						if(++rand >= MAX_HOUSES) {
							rand = 0;
						}
						if (i++ > MAX_HOUSES) return 1;
					}

					new iDist = floatround(GetPlayerDistanceFromPoint(playerid, HouseInfo[rand][hExteriorX], HouseInfo[rand][hExteriorY], HouseInfo[rand][hExteriorZ])), szMessage[86];

					SetPVarInt(playerid, "tpPizzaTimer", iDist / 80);
					SetPVarInt(playerid, "pizzaTotal", iDist / 10);
					SetPVarInt(playerid, "pizzaTimer", iDist / 10);
					SetPVarInt(playerid, "Pizza", rand);

					SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_TPPIZZARUNTIMER);
					SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_PIZZATIMER);

					format(szMessage, sizeof(szMessage), "Ban cung cap pizza cho %s. Ban co %d giay de cung cap no!", StripUnderscore(HouseInfo[rand][hOwnerName]), iDist / 10);
					SendClientMessageEx(playerid, COLOR_WHITE, szMessage);

					SetPlayerCheckpoint(playerid, HouseInfo[rand][hExteriorX], HouseInfo[rand][hExteriorY], HouseInfo[rand][hExteriorZ], 5);
				}
			}
		}
	}
    // Replace
    if(dialogid == TIMVIECLAM)
	{
	    if(response)
	    {
			switch(listitem)
			{
				case 0: SetPlayerCheckpoint(playerid, 1484.7949, -1772.1487, 18.7958, 3.0);
				case 1: SetPlayerCheckpoint(playerid, 1477.2034, -1772.1694, 18.7958, 3.0);
				case 2: SetPlayerCheckpoint(playerid, 2201.3364, -1152.2860, 25.8642, 3.0);
				case 3: SetPlayerCheckpoint(playerid, 2354.4209, -1170.4022, 28.0628, 3.0);
				case 4: SetPlayerCheckpoint(playerid, 1100.4431, -1508.9874, 15.7969, 3.0);
				case 5: SetPlayerCheckpoint(playerid, 2072.1482, -1835.9261, 13.5545, 3.0);
				case 6: SetPlayerCheckpoint(playerid, 1367.0730, -1275.0608, 13.5469, 3.0);
				case 7: SetPlayerCheckpoint(playerid, 2228.2373, -1715.7900, 13.5672, 3.0);
				case 8: SetPlayerCheckpoint(playerid, 1749.2762, -1863.5751, 13.5749, 3.0);
				case 9: SetPlayerCheckpoint(playerid, 2162.2832, -1677.2603, 15.0859, 3.0);
				case 10: SetPlayerCheckpoint(playerid, 2197.5793, -1972.6517, 13.5585, 3.0);
				case 11: SetPlayerCheckpoint(playerid, 1836.7712, -1676.7598, 13.3340, 3.0);
				case 12: SetPlayerCheckpoint(playerid, 2105.2930, -1804.1295, 13.5547, 3.0);
				case 13: SetPlayerCheckpoint(playerid, 2181.8381, -2252.6411, 14.7734, 3.0);
			}
			PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
	       	CP[playerid] = 252000;
		}
	}

// public OnPlayerKeyStateChange
    if(newkeys == KEY_YES)
	{
		for(new i = 0; i < 14; i++)
		{
			if(i == 12) continue;
			if(IsPlayerInRangeOfPoint(playerid, 3.0, ActorPos[i][0], ActorPos[i][1], ActorPos[i][2])) return ShowPlayerDialog(playerid, DIALOG_ACTORJOB, DIALOG_STYLE_LIST, "[{FFFF00}SVG-RP.CF - Xin Viec{FFFFFF}]", "Xin viec\nTu bo cong viec 1\nTu bo cong viec 2", "Dong y", "Khong");
		}
		if(IsPlayerInRangeOfPoint(playerid, 3.0, ActorPos[12][0], ActorPos[12][1], ActorPos[12][2]))
		{
			if(PlayerInfo[playerid][pJob] == 21 || PlayerInfo[playerid][pJob2] == 21) return ShowPlayerDialog(playerid, DIALOG_ACTORJOB, DIALOG_STYLE_LIST, "[{FFFF00}SVG-RP.CF - Xin Viec{FFFFFF}]", "Xin viec\nTu bo cong viec 1\nTu bo cong viec 2\nLay Banh", "Dong y", "Khong");
			else return ShowPlayerDialog(playerid, DIALOG_ACTORJOB, DIALOG_STYLE_LIST, "[{FFFF00}SVG-RP.CF - Xin Viec{FFFFFF}]", "Xin viec\nTu bo cong viec 1\nTu bo cong viec 2", "Dong y", "Khong");
		}
	}

///
new ActorJob[14];
new Float:ActorPos[14][6] = {
    {1484.7949, -1772.1487, 18.7958, 355.7666, 303.0, 1.0}, // Tham Tu
    {1477.2034, -1772.1694, 18.7958, 356.9156, 295.0, 2.0}, // Luat Su
    {2201.3364, -1152.2860, 25.8642, 269.9933, 263.0, 3.0}, // Gai Diem
    {2354.4209, -1170.4022, 28.0628, 359.6075, 269.0, 14.0}, // Buon Lau Ma Tuy
    {1100.4431, -1508.9874, 15.7969, 288.4409, 228.0, 8.0}, // Ve Si
    {2072.1482, -1835.9261, 13.5545, 268.2203, 217.0, 7.0}, // Sua Xe
    {1367.0730, -1275.0608, 13.5469, 84.6261, 188.0, 9.0}, // Vu Khi
    {2228.2373, -1715.7900, 13.5672, 83.3128, 49.0, 12.0},  // Vo Si
    {1749.2762, -1863.5751, 13.5749, 355.9963, 61.0, 17.0}, // Taxi
    {2162.2832, -1677.2603, 15.0859, 220.1962, 271.0, 4.0}, // Ban Thuoc Phien
    {2197.5793, -1972.6517, 13.5585, 170.7932, 60.0, 18.0},  // Tho Thu Cong
    {1836.7712, -1676.7598, 13.3340, 94.0465, 171.0, 10.0}, // Bartender
    {2105.2930, -1804.1295, 13.5547, 87.4480, 155.0, 21.0}, // Pizza Boy
    {2181.8381, -2252.6411, 14.7734, 219.9006, 153.0, 20.0}  // Trucker
};

// public LoadStreamerDynamicObjects
    for(new i = 0; i < 14; i++)
	{
		ActorJob[i] = CreateActor(floatround(ActorPos[i][4]), ActorPos[i][0], ActorPos[i][1], ActorPos[i][2], ActorPos[i][3]);
		ApplyActorAnimation(ActorJob[i], "CARRY","crry_prtial", 4.0, 0, 0, 0, 0, 1);
	}

// public LoadStreamerDynamic3DTextLabels
    for(new i = 0; i < 14; i++) CreateDynamic3DTextLabel("[{33CCFF}XIN VIEC LAM{FFFFFF}]\n\nAn nut Y de xin viec", -1, ActorPos[i][0], ActorPos[i][1], ActorPos[i][2]+1.3, 15);