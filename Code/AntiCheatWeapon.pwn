forward OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ);
public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	new string[128];
	if(PlayerInfo[playerid][pGuns][GetWeaponSlot(weaponid)] != weaponid)
	{
        if(PlayerInfo[playerid][pAGuns][GetWeaponSlot(weaponid)] == weaponid) return 1;
		TogglePlayerControllable(playerid, 0);
		foreach(new i: Player)
		{
			if(PlayerInfo[i][pAdmin] > 2)
			{
				format(string, sizeof(string), "[{AA3333}CANH BAO{FFFFFF}] Nguoi choi %s co dau hieu hack vu khi (%s). Admin vui long (/spec %i) de kiem tra.", GetPlayerNameEx(playerid), GetWeaponNameEx(weaponid), playerid);
				return SendClientMessage(i, -1, string);
			}
		}
	}
	return 1;
}