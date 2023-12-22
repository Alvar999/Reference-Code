#include <a_samp>
#pragma tabsize 0

#undef MAX_PLAYERS
#define MAX_PLAYERS 700


public OnFilterScriptInit() {

    print("RemoveBuilding Filterscript Initiated");
}

public OnPlayerConnect(playerid)
{
	// VIP LV
	RemoveBuildingForPlayer(playerid, 710, 2025.910, 993.039, 25.304, 0.250);
	RemoveBuildingForPlayer(playerid, 710, 2025.910, 1022.979, 25.304, 0.250);
    return 1;
}


