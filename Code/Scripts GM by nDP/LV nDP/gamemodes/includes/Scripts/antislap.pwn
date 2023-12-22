#include <YSI\y_hooks>
// anti slap + surfly
hook OnPlayerUpdate(playerid)
{
 	if(PlayerInfo[playerid][pAdmin] < 2 && GetPVarInt(playerid, "spam1") == 0)
    {
		new string[128];
		new Float:Pos_x,Float:Pos_y,Float:Pos_z;
		new anim = GetPlayerAnimationIndex(playerid);
		GetPlayerVelocity(playerid,Pos_x,Pos_y,Pos_z);
		if(Pos_x <= -0.8  || Pos_y <= -0.8 || Pos_y <= -0.9 && anim != 0)
       	if(GetPlayerSurfingVehicleID(playerid) ==  INVALID_VEHICLE_ID)
		{
			format(string,sizeof(string),"{AA3333}NTzBot{FFFF00}: %s (ID: %d) co the dang su dung slap hack hoac surfly onfoot.",GetPlayerNameEx(playerid), playerid);
			ABroadCast(COLOR_YELLOW , string, 2);
			SetTimerEx("spam2", 5000, 0, "d", playerid);
			SetPVarInt( playerid, "spam1", 1 );
		}
	}
	return 1;
}
forward spam2(playerid);
public spam2(playerid)
{
    DeletePVar(playerid, "spam1");
    return 1;
}

