//SAFE ZONE SIMPLE
#include <a_samp>
#include <zcmd>
#include <sscanf2>
#include <streamer>
#define MAX_SZ 100 // MAX SAFE ZONE
enum szInfo
{
Float:szPosX,
Float:szPosY,
Float:szPosZ,
szSize,
szPickupID,
Text3D: szTextID,
};
new SafeZoneInfo[MAX_SZ][szInfo];
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

while(iIndex < sizeof(SafeZoneInfo) && fread(iFileHandle, szFileStr)) {
sscanf(szFileStr, "p<|>fffii",
SafeZoneInfo[iIndex][szPosX],
SafeZoneInfo[iIndex][szPosY],
SafeZoneInfo[iIndex][szPosZ],
SafeZoneInfo[iIndex][szSize],
SafeZoneInfo[iIndex][szPickupID]
);

format(string, sizeof(string), "{FFFFFF}Khu vuc an toan! (ID: %d)\n{24D12F}Khoang cach: %d\n{FF0000}Khong tan cong!",iIndex,SafeZoneInfo[iIndex][szSize]);

if(SafeZoneInfo[iIndex][szPosX] != 0.0)
{
SafeZoneInfo[iIndex][szPickupID] = CreateDynamicPickup(1254, 23, SafeZoneInfo[iIndex][szPosX], SafeZoneInfo[iIndex][szPosY], SafeZoneInfo[iIndex][szPosZ]);
SafeZoneInfo[iIndex][szTextID] = CreateDynamic3DTextLabel(string, -1, SafeZoneInfo[iIndex][szPosX], SafeZoneInfo[iIndex][szPosY], SafeZoneInfo[iIndex][szPosZ]+0.5,30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 30.0);
}
++iIndex;
}
return fclose(iFileHandle);
}
public OnFilterScriptInit()
{
print("\n--------------------------------------");
print("Khu vuc an toan");
print("--------------------------------------\n");
LoadSafeZones();
return 1;
}

public OnFilterScriptExit()
{
return 1;
}

public OnPlayerGiveDamage(playerid, damagedid, Float: amount, weaponid)
{
new Float:php;
for(new Sz; Sz < MAX_SZ; Sz++)
{
if(IsPlayerInRangeOfPoint(playerid, SafeZoneInfo[Sz][szSize], SafeZoneInfo[Sz][szPosX], SafeZoneInfo[Sz][szPosY], SafeZoneInfo[Sz][szPosZ]))
{// If Player In Safe Zone
if(!IsPlayerAdmin(playerid))
{
GameTextForPlayer(playerid, "~r~Khong duoc tan cong trong khu an toan!", 5000, 3);
TogglePlayerControllable(playerid, 0);
SetTimer("LoadPlayer", 5000, false);
GetPlayerHealth(playerid,php);
SetPlayerHealth(playerid,php-amount*2);
Kick(playerid);

}
}
if(!IsPlayerInRangeOfPoint(playerid, SafeZoneInfo[Sz][szSize], SafeZoneInfo[Sz][szPosX], SafeZoneInfo[Sz][szPosY], SafeZoneInfo[Sz][szPosZ]))
{//if Player outside safe zone and damagedid inside safe zone
if(IsPlayerInRangeOfPoint(damagedid, SafeZoneInfo[Sz][szSize], SafeZoneInfo[Sz][szPosX], SafeZoneInfo[Sz][szPosY], SafeZoneInfo[Sz][szPosZ]))
{
if(!IsPlayerAdmin(playerid))
{
GameTextForPlayer(playerid, "~r~Khong duoc tan cong trong khu an toan!", 5000, 3);
TogglePlayerControllable(playerid, 0);
SetTimer("LoadPlayer", 5000, false);
GetPlayerHealth(playerid,php);
SetPlayerHealth(playerid,php-70);
Kick(playerid);
}
}
}
}
return 1;
}
forward LoadPlayer(playerid);
public LoadPlayer(playerid)
{
TogglePlayerControllable(playerid,1);
return 1;
}
CMD:gotosz(playerid, params[])
{
if(IsPlayerAdmin(playerid))
{
new housenum;
if(sscanf(params, "d", housenum)) return SendClientMessage(playerid, -1, "USAGE: /gotosz [ID Khu An Toan]");

SetPlayerPos(playerid,SafeZoneInfo[housenum][szPosX],SafeZoneInfo[housenum][szPosY],SafeZoneInfo[housenum][szPosZ]);
SetPlayerInterior(playerid, 0);
}
return 1;
}
CMD:taosz(playerid, params[])
{
if(!IsPlayerAdmin(playerid))
{
SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay.");
return 1;
}

new string[128], choice[32], szid, amount;
if(sscanf(params, "s[32]dd", choice, szid, amount))
{
SendClientMessage(playerid, -1, "USAGE: /taosz [ Ten ] [ ID Khuantoan ] [ So tien ]");
SendClientMessage(playerid, -1, "Name: Khuantoan, Kichthuoc");
return 1;
}
if(strcmp(choice, "khuantoan", true) == 0)
{
GetPlayerPos(playerid, SafeZoneInfo[szid][szPosX], SafeZoneInfo[szid][szPosY], SafeZoneInfo[szid][szPosZ]);
SendClientMessage( playerid, -1, "Ban co the chinh sua vi tri khu vuc an toan!" );
DestroyPickup(SafeZoneInfo[szid][szPickupID]);
SaveSafeZones();


DestroyPickup(SafeZoneInfo[szid][szPickupID]);
DestroyDynamic3DTextLabel(SafeZoneInfo[szid][szTextID]);
format(string, sizeof(string), "{FFFFFF}Khu vuc an toan! (ID: %d)\n{24D12F}Khoang cach: %d\n{FF0000}Khong tan cong!",szid,SafeZoneInfo[szid][szSize]);
SafeZoneInfo[szid][szTextID] = CreateDynamic3DTextLabel( string, -1, SafeZoneInfo[szid][szPosX], SafeZoneInfo[szid][szPosY], SafeZoneInfo[szid][szPosZ]+0.5,10.0, .testlos = 1, .streamdistance = 10.0);
SafeZoneInfo[szid][szPickupID] = CreatePickup(1254, 23, SafeZoneInfo[szid][szPosX], SafeZoneInfo[szid][szPosY], SafeZoneInfo[szid][szPosZ]);
}
else if(strcmp(choice, "kichthuoc", true) == 0)
{
SafeZoneInfo[szid][szSize] = amount;
SendClientMessage( playerid, -1, "Ban co the chinh sua vi tri khu vuc an toan!" );
SaveSafeZones();

DestroyDynamic3DTextLabel(SafeZoneInfo[szid][szTextID]);
format(string, sizeof(string), "{FFFFFF}Khu vuc an toan! (ID: %d)\n{24D12F}Khoang cach: %d\n{FF0000}Khong tan cong!",szid,SafeZoneInfo[szid][szSize]);
SafeZoneInfo[szid][szTextID] = CreateDynamic3DTextLabel( string, -1, SafeZoneInfo[szid][szPosX], SafeZoneInfo[szid][szPosY], SafeZoneInfo[szid][szPosZ]+0.5,10.0, .testlos = 1, .streamdistance = 10.0);
}
SaveSafeZones();
return 1;
}
CMD:xoasz(playerid, params[])
{
if(!IsPlayerAdmin(playerid))
{
SendClientMessage(playerid, -2, "Ban khong the su dung lenh nay!");
return 1;
}
new h, string[128];
if(sscanf(params,"d",h)) return SendClientMessage(playerid, -1,"Su dung: /xoasz [ID Khuantoan]");
if(!IsValidDynamicPickup(SafeZoneInfo[h][szPickupID])) return SendClientMessage(playerid, -1,"Sai ID khu an toan.");
SafeZoneInfo[h][szPosX] = 0;
SafeZoneInfo[h][szPosY] = 0;
SafeZoneInfo[h][szPosZ] = 0;
DestroyDynamicPickup(SafeZoneInfo[h][szPickupID]);
DestroyDynamic3DTextLabel(SafeZoneInfo[h][szTextID]);
SaveSafeZones();
format(string, sizeof(string), "Ban da xoa khu vuc an toan (ID %d).", h);
SendClientMessage(playerid, -1, string);
return 1;
}

public OnPlayerUpdate(playerid)
{
for(new Sz; Sz < MAX_SZ; Sz++)
{
if(IsPlayerInRangeOfPoint(playerid, SafeZoneInfo[Sz][szSize], SafeZoneInfo[Sz][szPosX], SafeZoneInfo[Sz][szPosY], SafeZoneInfo[Sz][szPosZ]))
{
SetPlayerArmedWeapon(playerid, 0);
}
}
return 1;
}
