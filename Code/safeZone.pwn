=============================== CODE KHU AN TOAN BY @thangminh999==========================                                                              =
// Tich Hop Faction Cam Sung Khu An Toan                                                           =
// Tich Hop No Sung Trong Khu An Toan Jail 2P                                                       =
====================================================================================================



//=============================================================================


===============ENUM=================
enum sfInfo
{
	 Float:szPosX,
	 Float:szPosY,
	 Float:szPosZ,
	 szSize,
	 szPickupID,
	 Text3D: szTextID,
};
new SafeZoneInfo[MAX_SZ][sfInfo];

===================================

============ADD NEW================

new Loaded[MAX_PLAYERS];

===================================

// ==================tìm g_mysql_LoadMOTD(); - add ben tren no

LoadSafeZones();

// ================== tìm stock SaveHouses() - add bên dưới nó

stock SaveSafeZones()
{
	new
		szFileStr[1024],
		File: fHandle = fopen("SafeZones.cfg", io_write);

	for(new iIndex; iIndex < MAX_SZ; iIndex++)
	{
		format(szFileStr, sizeof(szFileStr), "%f|%f|%f|%d|%d\r\n",
		SafeZoneInfo[iIndex][szPosX],
		SafeZoneInfo[iIndex][szPosY],
		SafeZoneInfo[iIndex][szPosZ],
		SafeZoneInfo[iIndex][szSize],
		SafeZoneInfo[iIndex][szPickupID]);
		fwrite(fHandle, szFileStr);
	}
 	return fclose(fHandle);
}

stock LoadSafeZones()
{
    if(!fexist("SafeZones.cfg")) return 1;

	new string[128],
		szFileStr[128],
  		File: iFileHandle = fopen("SafeZones.cfg", io_read),
  		iIndex;

	while(iIndex < sizeof(SafeZoneInfo) && fread(iFileHandle, szFileStr))
	{
		sscanf(szFileStr, "p<|>fffii",
		SafeZoneInfo[iIndex][szPosX],
   		SafeZoneInfo[iIndex][szPosY],
		SafeZoneInfo[iIndex][szPosZ],
		SafeZoneInfo[iIndex][szSize],
		SafeZoneInfo[iIndex][szPickupID]);

  		format(string, sizeof(string), "{FFB6C1}KHU VUC AN TOAN(ID: %d)\n{FED8B1}PHAM VI: %d Met \n{90EE90}LUU Y: XA SUNG TRONG KHU AN TOAN SE BI JAIL 10P",iIndex,SafeZoneInfo[iIndex][szSize]);

        if(SafeZoneInfo[iIndex][szPosX] != 0.0)
  		{
   			SafeZoneInfo[iIndex][szPickupID] = CreateDynamicPickup(1254, 23, SafeZoneInfo[iIndex][szPosX], SafeZoneInfo[iIndex][szPosY], SafeZoneInfo[iIndex][szPosZ]);
   			SafeZoneInfo[iIndex][szTextID] = CreateDynamic3DTextLabel(string, -1, SafeZoneInfo[iIndex][szPosX], SafeZoneInfo[iIndex][szPosY], SafeZoneInfo[iIndex][szPosZ]+0.5,30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1,  -1, 30.0);
  		}
  		++iIndex;
	}
 	return fclose(iFileHandle);
}

forward LoadPlayerZone();
public LoadPlayerZone()
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			TogglePlayerControllable(i,true);
		}
	}
}

//============== tim OnPlayerWeaponShot add trong no=========================

//code nay no sung trong khu an toan bi vao tu
for(new Sz; Sz < MAX_SZ; Sz++)
 	{
  		if(IsPlayerInRangeOfPoint(playerid, SafeZoneInfo[Sz][szSize], SafeZoneInfo[Sz][szPosX], SafeZoneInfo[Sz][szPosY], SafeZoneInfo[Sz][szPosZ]))
  		{
  		    if(PlayerInfo[playerid][pMember] < 0)
			{
	  		    if(PlayerInfo[playerid][pWated2] >= 3)
				{
					new string[120];
				    format(string, sizeof(string), "{AA3333}SysTems{FFFF00}: %s Da Bi Phat Tu Boi SysTem Voi {FFFF00}Ly Do{FFFF00}: Su Dung Sung Trong Khu An Toan.", GetPlayerNameEx(playerid));
					SendClientMessageToAll( COLOR_YELLOW,string);
				    SetPlayerPos(playerid, -294.8476, 1879.5048, 34.5785);
				    //SetPlayerColor(playerid,COLOR_RED);
				    SetPlayerColor(playerid, 0x805b00);
				    PlayerInfo[playerid][pJailTime] += 600;
				    PlayerInfo[playerid][pWated2] = 0;
				    Log("logs/SystemsJail.log", string);
				}
				else
				{
	            	PlayerInfo[playerid][pWated2] += 1;
	            }
	        }
  		}
 	}
	if(GetPVarInt(playerid, "IsInArena") == -1) if(GetPVarInt( playerid, "EventToken") == 0) if(PlayerInfo[playerid][pAmmo][GetAmmoSlot(weaponid)] > 0) PlayerInfo[playerid][pAmmo][GetAmmoSlot(weaponid)]--;
	return 1;
}

// tìm public OnPlayerUpdate(playerid) - add ( thay the het new pCurWeap ) ==========================

for(new Sz; Sz < MAX_SZ; Sz++)
 	{
  		if(IsPlayerInRangeOfPoint(playerid, SafeZoneInfo[Sz][szSize], SafeZoneInfo[Sz][szPosX], SafeZoneInfo[Sz][szPosY], SafeZoneInfo[Sz][szPosZ]))
  		{
  		    if(PlayerInfo[playerid][pAdmin] < 2 || !IsACop(playerid) || IsAHitman(playerid))
			{
   				SetPlayerArmedWeapon(playerid, 0);
			}
  		}
 	}
	new pCurWeap = GetPlayerWeapon(playerid);
    OnPlayerChangeWeapon(playerid, pCurWeap);
    pCurrentWeapon{playerid} = pCurWeap;

//tìm public OnPlayerGiveDamage - add trong nó

for(new Sz; Sz < MAX_SZ; Sz++)
    {
    	new Float:php;
		if(IsPlayerInRangeOfPoint(playerid, SafeZoneInfo[Sz][szSize], SafeZoneInfo[Sz][szPosX], SafeZoneInfo[Sz][szPosY], SafeZoneInfo[Sz][szPosZ]))
		{
			if(PlayerInfo[playerid][pAdmin] < 2 || !IsACop(playerid) || IsAHitman(playerid))
			{
	     		GameTextForPlayer(playerid, "~r~Khu vuc an toan", 2000, 3);
	      		TogglePlayerControllable(playerid, 0);
	      		SetTimer("LoadPlayerZone", 2000, false);
				GetPlayerHealth(playerid,php);
				SetPlayerHealth(playerid,php-amount*2);
			}
  		}
  		if(!IsPlayerInRangeOfPoint(playerid, SafeZoneInfo[Sz][szSize], SafeZoneInfo[Sz][szPosX], SafeZoneInfo[Sz][szPosY], SafeZoneInfo[Sz][szPosZ]))
		{
  			if(IsPlayerInRangeOfPoint(damagedid, SafeZoneInfo[Sz][szSize], SafeZoneInfo[Sz][szPosX], SafeZoneInfo[Sz][szPosY], SafeZoneInfo[Sz][szPosZ]))
  			{
  			    if(PlayerInfo[playerid][pAdmin] < 2 || !IsACop(playerid) || IsAHitman(playerid))
  			    {
	       			GameTextForPlayer(playerid, " ", 2000, 3);
			       	TogglePlayerControllable(playerid, 0);
			       	SetTimer("LoadPlayerZone", 2000, false);
				    GetPlayerHealth(playerid,php);
				    SetPlayerHealth(playerid,php-70);
				}
 			}
  		}
 	}


// add cuối gamemodes ================================================

//safezone
forward LoadPlayer();
public LoadPlayer()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if(IsPlayerConnected(i))
        {
            if(Loaded[i] == 1)
            {
                TogglePlayerControllable(i,true);
                Loaded[i] = 0;
            }
        }
    }
}

CMD:gotosz(playerid, params[])
{
 	if(PlayerInfo[playerid][pAdmin] >= 99999)
 	{
  		new housenum;
  		if(sscanf(params, "d", housenum)) return SendClientMessage(playerid, -1, "USAGE: /gotosz [ID Khu An Toan]");

  		SetPlayerPos(playerid,SafeZoneInfo[housenum][szPosX],SafeZoneInfo[housenum][szPosY],SafeZoneInfo[housenum][szPosZ]);
  		SetPlayerInterior(playerid, 0);
 	}
 	return 1;
}
CMD:szedit(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 99999)
 	{
  		SendClientMessage(playerid, -1, "You can not use this commands`.");
  		return 1;
 	}

	new string[128], choice[32], szid, amount;
 	if(sscanf(params, "s[32]dd", choice, szid, amount))
 	{
  		SendClientMessage(playerid, -1, "USAGE: /szedit [name] [SafeZone ID] [Amount]");
  		SendClientMessage(playerid, -1, "Name: location, size");
  		return 1;
 	}
	if(strcmp(choice, "location", true) == 0)
 	{
  		GetPlayerPos(playerid, SafeZoneInfo[szid][szPosX], SafeZoneInfo[szid][szPosY], SafeZoneInfo[szid][szPosZ]);
  		SendClientMessage( playerid, -1, "You have edit location Safe Zone!" );
  		DestroyPickup(SafeZoneInfo[szid][szPickupID]);
  		SaveSafeZones();


  		DestroyPickup(SafeZoneInfo[szid][szPickupID]);
  		DestroyDynamic3DTextLabel(SafeZoneInfo[szid][szTextID]);
  		format(string, sizeof(string), "{ffb6c1}KHU VUC AN TOAN(ID: %d)\n{fed8b1}PHAM VI: %d Met \n{90ee90}LUU Y: XA SUNG TRONG KHU AN TOAN SE BI JAIL 10P",szid,SafeZoneInfo[szid][szSize]);
  		SafeZoneInfo[szid][szTextID] = CreateDynamic3DTextLabel( string, -1, SafeZoneInfo[szid][szPosX], SafeZoneInfo[szid][szPosY], SafeZoneInfo[szid][szPosZ]+0.5,10.0, .testlos = 1, .streamdistance = 10.0);
  		SafeZoneInfo[szid][szPickupID] = CreatePickup(1254, 23, SafeZoneInfo[szid][szPosX], SafeZoneInfo[szid][szPosY], SafeZoneInfo[szid][szPosZ]);
 	}
 	else if(strcmp(choice, "size", true) == 0)
 	{
     	SafeZoneInfo[szid][szSize] = amount;
  		SendClientMessage( playerid, -1, "You have edit size Safe Zone!" );
  		SaveSafeZones();

  		DestroyDynamic3DTextLabel(SafeZoneInfo[szid][szTextID]);
  		format(string, sizeof(string), "{ffb6c1}KHU VUC AN TOAN(ID: %d)\n{fed8b1}PHAM VI: %d Met \n{90ee90}LUU Y: XA SUNG TRONG KHU AN TOAN SE BI JAIL 10P",szid,SafeZoneInfo[szid][szSize]);
  		SafeZoneInfo[szid][szTextID] = CreateDynamic3DTextLabel( string, -1, SafeZoneInfo[szid][szPosX], SafeZoneInfo[szid][szPosY], SafeZoneInfo[szid][szPosZ]+0.5,10.0, .testlos = 1, .streamdistance = 10.0);
 	}
	SaveSafeZones();
 	return 1;
}
CMD:szdelete(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 99999)
 	{
  		SendClientMessage(playerid, -2, "You can not use this commands`!");
  		return 1;
 	}
 	new h, string[128];
 	if(sscanf(params,"d",h)) return SendClientMessage(playerid, -1,"USAGE: /szdelete [SafeZone ID]");
 	if(!IsValidDynamicPickup(SafeZoneInfo[h][szPickupID])) return SendClientMessage(playerid, -1,"Wrong ID Safe Zone.");

	SafeZoneInfo[h][szPosX] = 0;
	SafeZoneInfo[h][szPosY] = 0;
 	SafeZoneInfo[h][szPosZ] = 0;
 	DestroyDynamicPickup(SafeZoneInfo[h][szPickupID]);
 	DestroyDynamic3DTextLabel(SafeZoneInfo[h][szTextID]);
 	SaveSafeZones();
 	format(string, sizeof(string), "You have delete Safe Zone (ID %d).", h);
 	SendClientMessage(playerid, -1, string);
 	return 1;
}
