#include <YSI\y_hooks>

hook OnPlayerUpdate(playerid)
{
	new AnimLib[30], AnimName[30], string[128];
	GetAnimationName(GetPlayerAnimationIndex(playerid), AnimLib, sizeof(AnimLib), AnimName, sizeof(AnimName));
	if(GetPlayerSpeed(playerid) > 60 && strcmp(AnimLib, "PARACHUTE", true) == 0 && strcmp(AnimName, "FALL_SKYDIVE_ACCEL", true) == 0)
	{
	    format(string, sizeof(string), "{AA3333}Admin{FFFF00}: %s da bi kick khoi may chu, ly do: Fly.", GetPlayerNameEx(playerid));
		SendClientMessageToAllEx(COLOR_YELLOW, string, 2);
	    SetTimerEx("KickEx", 1000, 0, "i", playerid);
	}
	return 1;
}
