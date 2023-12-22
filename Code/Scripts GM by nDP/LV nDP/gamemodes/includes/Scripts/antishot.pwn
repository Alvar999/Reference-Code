#include <YSI\y_hooks>

new shotTime[MAX_PLAYERS];
new shot[MAX_PLAYERS];

hook OnPlayerConnect(playerid)
{
	shotTime[playerid] = 0;
	shot[playerid] = 0;
	return 1;
}

hook OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	if(weaponid != 38)
	{
	    if((gettime() - shotTime[playerid]) < 1)
	{
	shot[playerid]+=1;
    }
	else
	{
	   shot[playerid]=0;
	}
	if(shot[playerid] > 15)
	{
	    Kick(playerid);
	}
	    shotTime[playerid] = gettime();
	}
	return 1;
}
