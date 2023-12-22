//================================== HE THONG SUNG DAN =============================

// Kiem : pGun
pAmmo[9],
// Kiem them :
Gun11

// Add
	SavePlayerInteger(query, GetPlayerSQLId(playerid), "Ammo1", PlayerInfo[playerid][pAmmo][1]);
    SavePlayerInteger(query, GetPlayerSQLId(playerid), "Ammo2", PlayerInfo[playerid][pAmmo][2]);
    SavePlayerInteger(query, GetPlayerSQLId(playerid), "Ammo3", PlayerInfo[playerid][pAmmo][3]);
    SavePlayerInteger(query, GetPlayerSQLId(playerid), "Ammo4", PlayerInfo[playerid][pAmmo][4]);
    SavePlayerInteger(query, GetPlayerSQLId(playerid), "Ammo5", PlayerInfo[playerid][pAmmo][5]);
    SavePlayerInteger(query, GetPlayerSQLId(playerid), "Ammo6", PlayerInfo[playerid][pAmmo][6]);
    SavePlayerInteger(query, GetPlayerSQLId(playerid), "Ammo7", PlayerInfo[playerid][pAmmo][7]);
    SavePlayerInteger(query, GetPlayerSQLId(playerid), "Ammo8", PlayerInfo[playerid][pAmmo][8]);

// Kiem Gun%D

                    for(new i = 1; i < 9; i++)
					{
						format(szField, sizeof(szField), "Ammo%d", i);
						cache_get_field_content(row,  szField, szResult, MainPipeline);
						PlayerInfo[extraid][pAmmo][i] = strval(szResult);
					}

// B2 : lam theo cai nay , noi chung de~ lam'
stock GetWeaponSlot(weaponid)
{
	switch( weaponid )
	{
		case 0, 1: // none
		{
			return 0;
		}
		case 2, 3, 4, 5, 6, 7, 8, 9: // can chien
		{
			return 1;
		}
		case 22, 23, 24: // 9mm, sdpistol, deagle - Ammo1
		{
			return 2;
		}
		case 25, 26, 27: // shotgun, spas12, spawn-off -Ammo2
		{
			return 3;
		}
		case 28, 29, 32: // mp5,uzi.. Ammo3
		{
			return 4;
		}
		case 30, 31: // ak47 m4a1 Ammo4
		{
			return 5;
		}
		case 33, 34: // sniper rifle Ammo5
		{
			return 6;
		}
		case 35, 36, 37, 38: // baroka, minigun, laucher.. Ammo6
		{
			return 7;
		}
		case 16, 17, 18, 39, 40: // boom Ammo7
		{
			return 8;
		}
		case 41, 42, 43: // spraycan, camera... Ammo8
		{
			return 9;
		}
		case 10, 11, 12, 13, 14, 15: // sex toy bla bla
		{
			return 10;
		}
		case 44, 45, 46: // none
		{
			return 11;
		}
	}
	return -1;
}

///
RemovePlayerWeapon(playerid, weaponid)
{
	ResetPlayerWeapons(playerid);
	PlayerInfo[playerid][pGuns][GetWeaponSlot(weaponid)] = 0;
	PlayerInfo[playerid][pAmmo][GetWeaponSlot(weaponid)-1] = 0;
	SetPlayerWeaponsEx(playerid);
	return 1;
}
forward OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ);
public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
    if(GetPVarInt(playerid, "IsInArena") == -1)
    {
        if(GetPVarInt( playerid, "EventToken") == 0)
        {
            switch(weaponid)
            {
                case 16, 17, 18, 39: // SATCHEL, GRENADE, TEARGAS, MOLTOV
                {
                    if(PlayerInfo[playerid][pAmmo][ 7 ] > 0)
                    {
                        PlayerInfo[playerid][pAmmo][ 7 ] -= 1;

                    }
                }
                case 22, 23, 24: // 9mm, sdpid, DE
                {
                    if(PlayerInfo[playerid][pAmmo][ 1 ] > 0)
                    {
                        PlayerInfo[playerid][pAmmo][ 1 ] -= 1;
                    }
                }
                case 25,26,27: // Shotgun, spawn-off, combat shotgun
                {
                    if(PlayerInfo[playerid][pAmmo][ 2 ] > 0)
                    {
                        PlayerInfo[playerid][pAmmo][ 2 ] -= 1;
                    }
                }
                case 28,29,32: // Uzi, Tec9, Mp5
                {
                    if(PlayerInfo[playerid][pAmmo][ 3 ] > 0)
                    {
                        PlayerInfo[playerid][pAmmo][ 3 ] -= 1;
                    }
                }
                case 30,31: // M4, Ak 47
                {
                    if(PlayerInfo[playerid][pAmmo][ 4 ] > 0)
                    {
                        PlayerInfo[playerid][pAmmo][ 4 ] -= 1;
                    }
                }
                case 33,34: // rifle, sniper
                {
                    if(PlayerInfo[playerid][pAmmo][ 5 ] > 0)
                    {
                        PlayerInfo[playerid][pAmmo][ 5 ] -= 1;
                    }
                }
                case 35,36,37,38: // Bazoka, RPG, Firegun, minigun
                {
                    if(PlayerInfo[playerid][pAmmo][ 6 ] > 0)
                    {
                        PlayerInfo[playerid][pAmmo][ 6 ] -= 1;
                    }
                }
                case 40,41,42,43: // SPRAYCAN, FIREEXTINGUISHER, CAMERA
                {
                    if(PlayerInfo[playerid][pAmmo][ 8 ] > 0)
                    {
                        PlayerInfo[playerid][pAmmo][ 8 ] -= 1;
                    }
                }
            }
        }
    }
    return 1;
}

////////
stock GivePlayerValidWeapon( playerid, WeaponID, Ammo )
{
    #if defined zombiemode
   	if(zombieevent == 1 && GetPVarType(playerid, "pIsZombie")) return SendClientMessageEx(playerid, COLOR_GREY, "Zombies can't have guns.");
	#endif
	switch( WeaponID )
	{
  		case 0, 1:
		{
			PlayerInfo[playerid][pGuns][ 0 ] = WeaponID;
			GivePlayerWeapon( playerid, WeaponID, Ammo );
		}
		case 2, 3, 4, 5, 6, 7, 8, 9:
		{
			PlayerInfo[playerid][pGuns][ 1 ] = WeaponID;
			GivePlayerWeapon( playerid, WeaponID, Ammo );
		}
		case 22, 23, 24:
		{
			PlayerInfo[playerid][pGuns][ 2 ] = WeaponID;
			PlayerInfo[playerid][pAmmo][ 1 ] = Ammo;
			GivePlayerWeapon( playerid, WeaponID, Ammo );
		}
		case 25, 26, 27:
		{
			PlayerInfo[playerid][pGuns][ 3 ] = WeaponID;
			PlayerInfo[playerid][pAmmo][ 2 ] = Ammo;
			GivePlayerWeapon( playerid, WeaponID, Ammo );
		}
		case 28, 29, 32:
		{
			PlayerInfo[playerid][pGuns][ 4 ] = WeaponID;
			PlayerInfo[playerid][pAmmo][ 3 ] = Ammo;
			GivePlayerWeapon( playerid, WeaponID, Ammo );
		}
		case 30, 31:
		{
			PlayerInfo[playerid][pGuns][ 5 ] = WeaponID;
			PlayerInfo[playerid][pAmmo][ 4 ] = Ammo;
			GivePlayerWeapon( playerid, WeaponID, Ammo );
		}
		case 33, 34:
		{
			PlayerInfo[playerid][pGuns][ 6 ] = WeaponID;
			PlayerInfo[playerid][pAmmo][ 5 ] = Ammo;
			GivePlayerWeapon( playerid, WeaponID, Ammo );
		}
		case 35, 36, 37, 38:
		{
			PlayerInfo[playerid][pGuns][ 7 ] = WeaponID;
			PlayerInfo[playerid][pAmmo][ 6 ] = Ammo;
			GivePlayerWeapon( playerid, WeaponID, Ammo );
		}
		case 16, 17, 18, 39, 40:
		{
			PlayerInfo[playerid][pGuns][ 8 ] = WeaponID;
			PlayerInfo[playerid][pAmmo][ 7 ] = Ammo;
			GivePlayerWeapon( playerid, WeaponID, Ammo );
		}
		case 41, 42, 43:
		{
			PlayerInfo[playerid][pGuns][ 9 ] = WeaponID;
			PlayerInfo[playerid][pAmmo][ 8 ] = Ammo;
			GivePlayerWeapon( playerid, WeaponID, Ammo );
		}
		case 10, 11, 12, 13, 14, 15:
		{
			PlayerInfo[playerid][pGuns][ 10 ] = WeaponID;
			GivePlayerWeapon( playerid, WeaponID, Ammo );
		}
		case 44, 45, 46:
		{
			PlayerInfo[playerid][pGuns][ 11 ] = WeaponID;
			GivePlayerWeapon( playerid, WeaponID, Ammo );
		}
	}
	return 1;
}

stock SetPlayerWeapons(playerid)
{
	if(HungerPlayerInfo[playerid][hgInEvent] == 1) { return 1;}
    if(GetPVarInt(playerid, "IsInArena") >= 0) { return 1; }
	ResetPlayerWeapons(playerid);
	{
		if(PlayerInfo[playerid][pGuns][0] > 0 && PlayerInfo[playerid][pAGuns][0] == 0)
		{
			GivePlayerValidWeapon(playerid, PlayerInfo[playerid][pGuns][0], 60000);
		}
		if(PlayerInfo[playerid][pGuns][1] > 0 && PlayerInfo[playerid][pAGuns][1] == 0)
		{
			GivePlayerValidWeapon(playerid, PlayerInfo[playerid][pGuns][1], 60000);
		}
		if(PlayerInfo[playerid][pGuns][2] > 0 && PlayerInfo[playerid][pAGuns][2] == 0 && PlayerInfo[playerid][pAmmo][1] > 0)
		{
			GivePlayerValidWeapon(playerid, PlayerInfo[playerid][pGuns][2], PlayerInfo[playerid][pAmmo][1]);
		}
		if(PlayerInfo[playerid][pGuns][3] > 0 && PlayerInfo[playerid][pAGuns][3] == 0 && PlayerInfo[playerid][pAmmo][2] > 0)
		{
			GivePlayerValidWeapon(playerid, PlayerInfo[playerid][pGuns][3], PlayerInfo[playerid][pAmmo][2]);
		}
		if(PlayerInfo[playerid][pGuns][4] > 0 && PlayerInfo[playerid][pAGuns][4] == 0 && PlayerInfo[playerid][pAmmo][3] > 0)
		{
			GivePlayerValidWeapon(playerid, PlayerInfo[playerid][pGuns][4], PlayerInfo[playerid][pAmmo][3]);
		}
		if(PlayerInfo[playerid][pGuns][5] > 0 && PlayerInfo[playerid][pAGuns][5] == 0 && PlayerInfo[playerid][pAmmo][4] > 0)
		{
			GivePlayerValidWeapon(playerid, PlayerInfo[playerid][pGuns][5], PlayerInfo[playerid][pAmmo][4]);
		}
		if(PlayerInfo[playerid][pGuns][6] > 0 && PlayerInfo[playerid][pAGuns][6] == 0 && PlayerInfo[playerid][pAmmo][5] > 0)
		{
			GivePlayerValidWeapon(playerid, PlayerInfo[playerid][pGuns][6], PlayerInfo[playerid][pAmmo][5]);
		}
		if(PlayerInfo[playerid][pGuns][7] > 0 && PlayerInfo[playerid][pAGuns][7] == 0 && PlayerInfo[playerid][pAmmo][6] > 0)
		{
			GivePlayerValidWeapon(playerid, PlayerInfo[playerid][pGuns][7], PlayerInfo[playerid][pAmmo][6]);
		}
		if(PlayerInfo[playerid][pGuns][8] > 0 && PlayerInfo[playerid][pAGuns][8] == 0 && PlayerInfo[playerid][pAmmo][7] > 0)
		{
			GivePlayerValidWeapon(playerid, PlayerInfo[playerid][pGuns][8], PlayerInfo[playerid][pAmmo][7]);
		}
		if(PlayerInfo[playerid][pGuns][9] > 0 && PlayerInfo[playerid][pAGuns][9] == 0 && PlayerInfo[playerid][pAmmo][8] > 0)
		{
			GivePlayerValidWeapon(playerid, PlayerInfo[playerid][pGuns][9], PlayerInfo[playerid][pAmmo][8]);
		}
		if(PlayerInfo[playerid][pGuns][10] > 0 && PlayerInfo[playerid][pAGuns][10] == 0)
		{
			GivePlayerValidWeapon(playerid, PlayerInfo[playerid][pGuns][10], 60000);
		}
		if(PlayerInfo[playerid][pGuns][11] > 0 && PlayerInfo[playerid][pAGuns][11] == 0)
		{
			GivePlayerValidWeapon(playerid, PlayerInfo[playerid][pGuns][11], 60000);
		}
	}
	return 1;
}

stock SetPlayerWeaponsEx(playerid)
{
	ResetPlayerWeapons(playerid);
	{
		if(PlayerInfo[playerid][pGuns][0] > 0 && PlayerInfo[playerid][pAGuns][0] == 0)
		{
			GivePlayerValidWeapon(playerid, PlayerInfo[playerid][pGuns][0], 60000);
		}
		if(PlayerInfo[playerid][pGuns][1] > 0 && PlayerInfo[playerid][pAGuns][1] == 0)
		{
			GivePlayerValidWeapon(playerid, PlayerInfo[playerid][pGuns][1], 60000);
		}
		if(PlayerInfo[playerid][pGuns][2] > 0 && PlayerInfo[playerid][pAGuns][2] == 0 && PlayerInfo[playerid][pAmmo][1] > 0)
		{
			GivePlayerValidWeapon(playerid, PlayerInfo[playerid][pGuns][2], PlayerInfo[playerid][pAmmo][1]);
		}
		if(PlayerInfo[playerid][pGuns][3] > 0 && PlayerInfo[playerid][pAGuns][3] == 0 && PlayerInfo[playerid][pAmmo][2] > 0)
		{
			GivePlayerValidWeapon(playerid, PlayerInfo[playerid][pGuns][3], PlayerInfo[playerid][pAmmo][2]);
		}
		if(PlayerInfo[playerid][pGuns][4] > 0 && PlayerInfo[playerid][pAGuns][4] == 0 && PlayerInfo[playerid][pAmmo][3] > 0)
		{
			GivePlayerValidWeapon(playerid, PlayerInfo[playerid][pGuns][4], PlayerInfo[playerid][pAmmo][3]);
		}
		if(PlayerInfo[playerid][pGuns][5] > 0 && PlayerInfo[playerid][pAGuns][5] == 0 && PlayerInfo[playerid][pAmmo][4] > 0)
		{
			GivePlayerValidWeapon(playerid, PlayerInfo[playerid][pGuns][5], PlayerInfo[playerid][pAmmo][4]);
		}
		if(PlayerInfo[playerid][pGuns][6] > 0 && PlayerInfo[playerid][pAGuns][6] == 0 && PlayerInfo[playerid][pAmmo][5] > 0)
		{
			GivePlayerValidWeapon(playerid, PlayerInfo[playerid][pGuns][6], PlayerInfo[playerid][pAmmo][5]);
		}
		if(PlayerInfo[playerid][pGuns][7] > 0 && PlayerInfo[playerid][pAGuns][7] == 0 && PlayerInfo[playerid][pAmmo][6] > 0)
		{
			GivePlayerValidWeapon(playerid, PlayerInfo[playerid][pGuns][7], PlayerInfo[playerid][pAmmo][6]);
		}
		if(PlayerInfo[playerid][pGuns][8] > 0 && PlayerInfo[playerid][pAGuns][8] == 0 && PlayerInfo[playerid][pAmmo][7] > 0)
		{
			GivePlayerValidWeapon(playerid, PlayerInfo[playerid][pGuns][8], PlayerInfo[playerid][pAmmo][7]);
		}
		if(PlayerInfo[playerid][pGuns][9] > 0 && PlayerInfo[playerid][pAGuns][9] == 0 && PlayerInfo[playerid][pAmmo][8] > 0)
		{
			GivePlayerValidWeapon(playerid, PlayerInfo[playerid][pGuns][9], PlayerInfo[playerid][pAmmo][8]);
		}
		if(PlayerInfo[playerid][pGuns][10] > 0 && PlayerInfo[playerid][pAGuns][10] == 0)
		{
			GivePlayerValidWeapon(playerid, PlayerInfo[playerid][pGuns][10], 60000);
		}
		if(PlayerInfo[playerid][pGuns][11] > 0 && PlayerInfo[playerid][pAGuns][11] == 0)
		{
			GivePlayerValidWeapon(playerid, PlayerInfo[playerid][pGuns][11], 60000);
		}
	}
	SetPlayerArmedWeapon(playerid, GetPVarInt(playerid, "LastWeapon"));
}
