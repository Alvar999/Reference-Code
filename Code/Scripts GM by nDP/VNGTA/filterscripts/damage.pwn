// Name: 		HidBar
// Author:      Hiddos
// Date: 		21st March 2011
// Version:     1.1
// Don't re-release without permission.

#include <a_samp>
#define HITCOLOR 0xFF0000FF
#define MAX_HEALTH_LENGTH 2

new Float:old_hp[MAX_PLAYERS];
new Float:old_ap[MAX_PLAYERS];

public OnPlayerUpdate(playerid)
{
	new Float:new_hp, Float:new_ap;
	GetPlayerArmour(playerid, new_ap);
	GetPlayerHealth(playerid, new_hp);
	if(new_hp >= old_hp[playerid] && new_ap >= old_ap[playerid])
	{
		old_hp[playerid] = new_hp;
		old_ap[playerid] = new_ap;
		return 1;
	}
	new Text3D:hitbar;
	new Float:Pos[3];
	new diff = floatround( (old_hp[playerid] - new_hp) + (old_ap[playerid] - new_ap) );
	new string[MAX_HEALTH_LENGTH + 1];
	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	format(string, sizeof string, "%i", diff);
	hitbar = Create3DTextLabel(string, HITCOLOR, Pos[0], Pos[1], Pos[2] + 0.6, 30.0, 0);
	SetTimerEx("UpdateHitBar", 66, 0, "iifffii", _:hitbar, diff, Pos[0], Pos[1], Pos[2] + 0.8, 16, HITCOLOR);
	old_hp[playerid] = new_hp;
	old_ap[playerid] = new_ap;
	return 1;
}

public OnFilterScriptInit()
{
	for(new i; i < MAX_PLAYERS; i++)
	{
		GetPlayerHealth(i, old_hp[i]);
		GetPlayerArmour(i, old_ap[i]);
	}
	return 1;
}

public OnPlayerConnect(playerid)
{
	old_hp[playerid] = 100.0;
	old_ap[playerid] = 0.0;
	return 1;
}

forward UpdateHitBar(Text3D:hitbar, hp, Float:x, Float:y, Float:z, update_no, color);
public UpdateHitBar(Text3D:hitbar, hp, Float:x, Float:y, Float:z, update_no, color)
{
	Delete3DTextLabel(hitbar);
	update_no--;
	if(!update_no) return;

	new string[MAX_HEALTH_LENGTH + 1];
	z += 0.05;
	color -= 12;
	format(string, sizeof string, "%i", hp);
	hitbar = Create3DTextLabel(string, color, x, y, z, 30.0, 0);
	SetTimerEx("UpdateHitBar", 66, 0, "iifffii", _:hitbar, hp, x, y, z, update_no, color);
}
