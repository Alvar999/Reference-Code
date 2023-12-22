
#include <YSI\y_hooks>

new bool:InfoDame[MAX_PLAYERS] = true;
hook OnPlayerConnect(playerid)
{
    InfoDame[playerid] = true;
	return 1;
}


CMD:toglichsu(playerid, params[])
{
    if(InfoDame[playerid] == false)
    {
        SendClientMessage(playerid, COLOR_WHITE, "Ban da bat lich su chien dau.");
        InfoDame[playerid] = true;
    }
    else
    {
        SendClientMessage(playerid, COLOR_WHITE, "Ban da tat lich su chien dau.");
        InfoDame[playerid] = false;
    }
    return 1;
}

hook OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid)
{
    if(InfoDame[playerid] == true)
 	{
       if(issuerid != INVALID_PLAYER_ID)
       {
        new
            infoString[128],
            weaponName[24],
            victimName[MAX_PLAYER_NAME],
            attackerName[MAX_PLAYER_NAME];
        GetPlayerName(playerid, victimName, sizeof (victimName));
        GetPlayerName(issuerid, attackerName, sizeof (attackerName));
        GetWeaponName(weaponid, weaponName, sizeof (weaponName));
        format(infoString, sizeof(infoString), "[CHIEN DAU] {990000}-%.02fHP {FFFFFF}[{3333CC}%s{FFFFFF}] [{FF9933}%s{FFFFFF}]", amount, weaponName, attackerName);
        SendClientMessage(playerid, 0xFFFFFFFF, infoString);
        }
    }
    return 1;
}
hook OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid)//add vao OnPlayerGiveDamage
{
	if(InfoDame[playerid] == true)
    {
 	new string[128], victim[MAX_PLAYER_NAME], attacker[MAX_PLAYER_NAME];
    new weaponname[24];


    GetPlayerName(playerid, attacker, sizeof (attacker));
    GetPlayerName(damagedid, victim, sizeof (victim));
    GetWeaponName(weaponid, weaponname, sizeof (weaponname));

    new Float:health, Float:armor;
    GetPlayerHealth(damagedid, health);
	GetPlayerArmour(damagedid, armor);

    format(string, sizeof(string), "[CHIEN DAU] {33FF33}+%.02fHP{FFFFFF} [{FFCC33}%s{FFFFFF}] [{339966}%s{FFFFFF}]", amount, weaponname, victim);
    SendClientMessage(playerid, -1, string);
    }
    return 1;
}
