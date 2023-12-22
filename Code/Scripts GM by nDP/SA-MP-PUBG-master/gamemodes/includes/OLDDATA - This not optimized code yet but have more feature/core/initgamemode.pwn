/*
//--------------------------------[INITGAMEMODE.PWN]--------------------------------
*/

InitiateGamemode()
{
	MapAndreas_Init(MAP_ANDREAS_MODE_FULL);
	FCNPC_InitMapAndreas(MapAndreas_GetAddress());
	UsePlayerPedAnims();
	SetGameModeText(SERVER_GM_TEXT);
	
	SetNameTagDrawDistance(25.0);
	//ManualVehicleEngineAndLights();
	DisableInteriorEnterExits();
	EnableStuntBonusForAll(0);
	
	Global_Textdraw();
	AntiDeAMX();

	print("\n-------------------------------------------");
	print("SA-MP-PUBG");
	print("Gamemode by SarapoaJunG");
	print("-------------------------------------------\n");
	print("Successfully initiated the gamemode...");
}
