///
new PlayerText:HUDStatus[MAX_PLAYERS][8];

// enum pInfo
    pThirsty,
	pThirstyTimer,
	pThirstyDeathTimer

// case LOADUSERDATA_THREAD:
					cache_get_field_content(row,  "Thirsty", szResult, MainPipeline); PlayerInfo[extraid][pThirsty] = strval(szResult);
					cache_get_field_content(row,  "ThirstyTimer", szResult, MainPipeline); PlayerInfo[extraid][pThirstyTimer] = strval(szResult);
					cache_get_field_content(row,  "ThirstyDeathTimer", szResult, MainPipeline); PlayerInfo[extraid][pThirstyDeathTimer] = strval(szResult);

// stock g_mysql_SaveAccount
	SavePlayerInteger(query, GetPlayerSQLId(playerid), "Thirsty", PlayerInfo[playerid][pThirsty]);
	SavePlayerInteger(query, GetPlayerSQLId(playerid), "ThirstyTimer", PlayerInfo[playerid][pThirstyTimer]);
	SavePlayerInteger(query, GetPlayerSQLId(playerid), "ThirstyDeathTimer", PlayerInfo[playerid][pThirstyDeathTimer]);

// public OnPlayerLoad
	HUD_StatusPlayer(playerid);

// task ServerHeartbeat (Fix)
        if (PlayerInfo[i][pHospital] == 0 && GetPVarInt(i, "Injured") != 1 && GetPVarInt(i, "IsFrozen") == 0 && GetPVarInt(i, "PlayerCuffed") == 0)
		{
			if (++PlayerInfo[i][pHungerTimer] >= 1800 && PlayerInfo[i][pHunger] > 0) // 30 minutes
			{
				PlayerInfo[i][pHungerTimer] = 0;
				PlayerInfo[i][pHunger] -= 8;
				if (PlayerInfo[i][pHunger] < 0) PlayerInfo[i][pHunger] = 0;

				if (PlayerInfo[i][pHunger] == 0)
				{
					SendClientMessageEx(i, COLOR_RED, "Ban dang doi bung - ban can phai an!");
				}
			}
			if(++PlayerInfo[i][pThirstyTimer] >= 1800 && PlayerInfo[i][pThirsty] > 0) // 30 minutes
			{
				PlayerInfo[i][pThirstyTimer] = 0;
				PlayerInfo[i][pThirsty] -= 8;
				if (PlayerInfo[i][pThirsty] < 0) PlayerInfo[i][pThirsty] = 0;

				if (PlayerInfo[i][pThirsty] == 0) SendClientMessageEx(i, COLOR_RED, "Ban dang khat nuoc - ban can phai uong nuoc!");
			}

			if(PlayerCuffed[i] == 0)
			{
				if (PlayerInfo[i][pHunger] == 0 && ++PlayerInfo[i][pHungerDeathTimer] >= 600) // 10 minutes
				{
					SendClientMessageEx(i, COLOR_RED, "Ban dang bi bat tinh vi doi bung");
					SetPlayerHealth(i, 0);
					PlayerInfo[i][pHungerDeathTimer] = 0;
				}
				if (PlayerInfo[i][pThirsty] == 0 && ++PlayerInfo[i][pThirstyDeathTimer] >= 600) // 10 minutes
				{
					SendClientMessageEx(i, COLOR_RED, "Ban dang bi bat tinh vi khat nuoc");
					SetPlayerHealth(i, 0);
					PlayerInfo[i][pThirstyDeathTimer] = 0;
				}
			}
			PlayerTextDrawTextSize(i, HUDStatus[i][6], PlayerInfo[i][pHunger]*0.59, 1.000000);
			PlayerTextDrawTextSize(i, HUDStatus[i][7], PlayerInfo[i][pThirsty]*0.59, 1.000000);
			for(new d = 6; d < 8; d++) PlayerTextDrawShow(i, HUDStatus[i][d]);
		}

// CMD:setstat
        case 49:
        {
            if(amount <= 0) amount = 1, PlayerInfo[playerid][pThirstyTimer] = 1799;
            else if(amount > 100) amount = 100;
            PlayerInfo[playerid][pThirstyDeathTimer] = 0;
            PlayerInfo[giveplayerid][pThirsty] = amount, namecode = "Thirsty";
        }

///
stock HUD_StatusPlayer(playerid)
{
	HUDStatus[playerid][0] = CreatePlayerTextDraw(playerid, 541.500000, 389.937500, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, HUDStatus[playerid][0], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, HUDStatus[playerid][0], 86.000000, 44.000000);
	PlayerTextDrawAlignment(playerid, HUDStatus[playerid][0], 1);
	PlayerTextDrawColor(playerid, HUDStatus[playerid][0], 255);
	PlayerTextDrawSetShadow(playerid, HUDStatus[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, HUDStatus[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, HUDStatus[playerid][0], 255);
	PlayerTextDrawFont(playerid, HUDStatus[playerid][0], 4);
	PlayerTextDrawSetProportional(playerid, HUDStatus[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, HUDStatus[playerid][0], 0);

	HUDStatus[playerid][1] = CreatePlayerTextDraw(playerid, 525.006286, 389.700012, "LD_POOL:ball");
	PlayerTextDrawLetterSize(playerid, HUDStatus[playerid][1], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, HUDStatus[playerid][1], 36.000000, 45.000000);
	PlayerTextDrawAlignment(playerid, HUDStatus[playerid][1], 1);
	PlayerTextDrawColor(playerid, HUDStatus[playerid][1], 255);
	PlayerTextDrawSetShadow(playerid, HUDStatus[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, HUDStatus[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, HUDStatus[playerid][1], 255);
	PlayerTextDrawFont(playerid, HUDStatus[playerid][1], 4);
	PlayerTextDrawSetProportional(playerid, HUDStatus[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, HUDStatus[playerid][1], 0);

	HUDStatus[playerid][2] = CreatePlayerTextDraw(playerid, 543.699584, 389.962341, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, HUDStatus[playerid][2], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, HUDStatus[playerid][2], 1.000000, 43.889682);
	PlayerTextDrawAlignment(playerid, HUDStatus[playerid][2], 1);
	PlayerTextDrawColor(playerid, HUDStatus[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, HUDStatus[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, HUDStatus[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, HUDStatus[playerid][2], 255);
	PlayerTextDrawFont(playerid, HUDStatus[playerid][2], 4);
	PlayerTextDrawSetProportional(playerid, HUDStatus[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, HUDStatus[playerid][2], 0);

	HUDStatus[playerid][3] = CreatePlayerTextDraw(playerid, 528.500000, 405.250000, "HUD:radar_gangN");
	PlayerTextDrawLetterSize(playerid, HUDStatus[playerid][3], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, HUDStatus[playerid][3], 13.000000, 14.000000);
	PlayerTextDrawAlignment(playerid, HUDStatus[playerid][3], 1);
	PlayerTextDrawColor(playerid, HUDStatus[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, HUDStatus[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, HUDStatus[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, HUDStatus[playerid][3], 255);
	PlayerTextDrawFont(playerid, HUDStatus[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, HUDStatus[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, HUDStatus[playerid][3], 0);

	HUDStatus[playerid][4] = CreatePlayerTextDraw(playerid, 548.500000, 396.937500, "HUD:radar_burgershot");
	PlayerTextDrawLetterSize(playerid, HUDStatus[playerid][4], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, HUDStatus[playerid][4], 10.000000, 11.000000);
	PlayerTextDrawAlignment(playerid, HUDStatus[playerid][4], 1);
	PlayerTextDrawColor(playerid, HUDStatus[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, HUDStatus[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, HUDStatus[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, HUDStatus[playerid][4], 255);
	PlayerTextDrawFont(playerid, HUDStatus[playerid][4], 4);
	PlayerTextDrawSetProportional(playerid, HUDStatus[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, HUDStatus[playerid][4], 0);

	HUDStatus[playerid][5] = CreatePlayerTextDraw(playerid, 548.500000, 414.938598, "HUD:radar_centre");
	PlayerTextDrawLetterSize(playerid, HUDStatus[playerid][5], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, HUDStatus[playerid][5], 10.000000, 11.000000);
	PlayerTextDrawAlignment(playerid, HUDStatus[playerid][5], 1);
	PlayerTextDrawColor(playerid, HUDStatus[playerid][5], 947976191);
	PlayerTextDrawSetShadow(playerid, HUDStatus[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, HUDStatus[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, HUDStatus[playerid][5], 255);
	PlayerTextDrawFont(playerid, HUDStatus[playerid][5], 4);
	PlayerTextDrawSetProportional(playerid, HUDStatus[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, HUDStatus[playerid][5], 0);

	HUDStatus[playerid][6] = CreatePlayerTextDraw(playerid, 563.500000, 402.187500, "LD_SPAC:white"); // Hunger
	PlayerTextDrawLetterSize(playerid, HUDStatus[playerid][6], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, HUDStatus[playerid][6], 59.000000, 1.000000);
	PlayerTextDrawAlignment(playerid, HUDStatus[playerid][6], 1);
	PlayerTextDrawColor(playerid, HUDStatus[playerid][6], -9961217);
	PlayerTextDrawSetShadow(playerid, HUDStatus[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, HUDStatus[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, HUDStatus[playerid][6], 255);
	PlayerTextDrawFont(playerid, HUDStatus[playerid][6], 4);
	PlayerTextDrawSetProportional(playerid, HUDStatus[playerid][6], 0);
	PlayerTextDrawSetShadow(playerid, HUDStatus[playerid][6], 0);

	HUDStatus[playerid][7] = CreatePlayerTextDraw(playerid, 563.500000, 420.888641, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, HUDStatus[playerid][7], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, HUDStatus[playerid][7], 59.000000, 1.000000);
	PlayerTextDrawAlignment(playerid, HUDStatus[playerid][7], 1);
	PlayerTextDrawColor(playerid, HUDStatus[playerid][7], 16765439);
	PlayerTextDrawSetShadow(playerid, HUDStatus[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, HUDStatus[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, HUDStatus[playerid][7], 255);
	PlayerTextDrawFont(playerid, HUDStatus[playerid][7], 4);
	PlayerTextDrawSetProportional(playerid, HUDStatus[playerid][7], 0);
	PlayerTextDrawSetShadow(playerid, HUDStatus[playerid][7], 0);

	for(new i = 0; i < 8; i++) PlayerTextDrawShow(playerid, HUDStatus[playerid][i]);
	PlayerTextDrawTextSize(playerid, HUDStatus[playerid][6], PlayerInfo[playerid][pHunger]*0.59, 1.000000);
	PlayerTextDrawTextSize(playerid, HUDStatus[playerid][7], PlayerInfo[playerid][pThirsty]*0.59, 1.000000);
	for(new i = 6; i < 8; i++) PlayerTextDrawShow(playerid, HUDStatus[playerid][i]);
	return 1;
}

// Query SQL
ALTER TABLE `accounts` ADD COLUMN `Thirsty` int(11) DEFAULT 0 NOT NULL;
ALTER TABLE `accounts` ADD COLUMN `ThirstyTimer` int(11) DEFAULT 0 NOT NULL;
ALTER TABLE `accounts` ADD COLUMN `ThirstyDeathTimer` int(11) DEFAULT 0 NOT NULL;