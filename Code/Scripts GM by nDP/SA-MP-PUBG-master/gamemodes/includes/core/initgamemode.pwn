/*
//--------------------------------[INITGAMEMODE.PWN]--------------------------------
*/

InitiateGamemode()
{
	ShowPlayerMarkers(PLAYER_MARKERS_MODE_GLOBAL);
	
	MapAndreas_Init(MAP_ANDREAS_MODE_FULL);
	FCNPC_InitMapAndreas(MapAndreas_GetAddress());

	SetGameModeText(SERVER_GM_TEXT);
	SetNameTagDrawDistance(25.0);
	DisableInteriorEnterExits();
	EnableStuntBonusForAll(0);

	AntiDeAMX();

	print("\n-------------------------------------------");
	print("SA-MP-PUBG");
	print("Gamemode by Aktah");
	print("-------------------------------------------\n");
	print("Successfully initiated the gamemode...");
}
