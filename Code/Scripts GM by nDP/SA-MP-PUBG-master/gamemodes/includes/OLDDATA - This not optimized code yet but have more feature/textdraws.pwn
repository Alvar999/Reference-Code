//--------------------------------[TEXTDRAWS.PWN]--------------------------------

Global_Textdraw() {

	td__compass_dir = TextDrawCreate(310.000091, 9.955528, "~d~");
	TextDrawLetterSize(td__compass_dir, 0.337998, 0.783640);
	TextDrawTextSize(td__compass_dir, -0.000014, -0.000011);
	TextDrawAlignment(td__compass_dir, 1);
	TextDrawColor(td__compass_dir, 255);
	TextDrawSetShadow(td__compass_dir, -63);
	TextDrawSetOutline(td__compass_dir, 0);
	TextDrawBackgroundColor(td__compass_dir, 255);
	TextDrawFont(td__compass_dir, 0);
	TextDrawSetProportional(td__compass_dir, 1);
	
	BGHealthBar = TextDrawCreate(245.199996, 415.746551, "LD_SPAC:white");
	TextDrawLetterSize(BGHealthBar, 0.000000, 0.000000);
	TextDrawTextSize(BGHealthBar, 150.0, 15.0);
	TextDrawAlignment(BGHealthBar, 2);
	TextDrawColor(BGHealthBar, 0x00000050);
	TextDrawBoxColor(BGHealthBar, 0x00000050);
	TextDrawSetShadow(BGHealthBar, 0);
	TextDrawSetOutline(BGHealthBar, 0);
	TextDrawFont(BGHealthBar, 4);
	
	RuningBar = TextDrawCreate(114.0, 314.104461, "usebox");
	TextDrawLetterSize(RuningBar, 0.000000, -0.120123);
	TextDrawTextSize(RuningBar, 27.199998, 0.000000);
	TextDrawAlignment(RuningBar, 1);
	TextDrawColor(RuningBar, 0);
	TextDrawUseBox(RuningBar, true);
	TextDrawBoxColor(RuningBar, 102);

	KillText = TextDrawCreate(495.799987, 3.488882, " Killed");
	TextDrawLetterSize(KillText, 0.260399, 1.719465);
	TextDrawTextSize(KillText, 537.199462, -20.906669);
	TextDrawAlignment(KillText, 1);
	TextDrawColor(KillText, -1);
	TextDrawUseBox(KillText, true);
	TextDrawBoxColor(KillText, 170);
	TextDrawSetShadow(KillText, 0);
	TextDrawSetOutline(KillText, 1);
	TextDrawBackgroundColor(KillText, 12);
	TextDrawFont(KillText, 2);
	TextDrawSetProportional(KillText, 1);
	
	/*TDBackground = TextDrawCreate(641.599975, 1.500000, "usebox");
	TextDrawLetterSize(TDBackground, 0.000000, 49.405799);
	TextDrawTextSize(TDBackground, -2.000000, 0.000000);
	TextDrawAlignment(TDBackground, 1);
	TextDrawColor(TDBackground, -103);
	TextDrawUseBox(TDBackground, true);
	TextDrawBoxColor(TDBackground, -103);
	TextDrawSetShadow(TDBackground, 0);
	TextDrawSetOutline(TDBackground, 0);
	TextDrawFont(TDBackground, 0);*/

	TDBackground_Map = TextDrawCreate(170.000000, 70.000000, "samaps:map");
	TextDrawLetterSize(TDBackground_Map, 0.000000, 0.000000);
	TextDrawTextSize(TDBackground_Map, 300.000000, 300.000000);
	TextDrawAlignment(TDBackground_Map, 1);
	TextDrawColor(TDBackground_Map, -103);
	TextDrawSetShadow(TDBackground_Map, 0);
	TextDrawSetOutline(TDBackground_Map, 0);
	TextDrawFont(TDBackground_Map, 4);

	TDBayside = TextDrawCreate(195.599914, 84.622207, "BaySide~n~Marina");
	TextDrawLetterSize(TDBayside, 0.253199, 1.057422);
	TextDrawAlignment(TDBayside, 2);
	TextDrawColor(TDBayside, -437918209);
	TextDrawUseBox(TDBayside, true);
	TextDrawBoxColor(TDBayside, 0);
	TextDrawSetShadow(TDBayside, 0);
	TextDrawSetOutline(TDBayside, 1);
	TextDrawBackgroundColor(TDBayside, 51);
	TextDrawFont(TDBayside, 2);
	TextDrawSetProportional(TDBayside, 1);

	TDSF = TextDrawCreate(205.000000, 188.662231, "SAN~n~Fierro");
	TextDrawLetterSize(TDSF, 0.359598, 1.814043);
	TextDrawTextSize(TDSF, -0.000003, 0.497774);
	TextDrawAlignment(TDSF, 2);
	TextDrawColor(TDSF, -437918209);
	TextDrawUseBox(TDSF, true);
	TextDrawBoxColor(TDSF, 0);
	TextDrawSetShadow(TDSF, 0);
	TextDrawSetOutline(TDSF, 1);
	TextDrawBackgroundColor(TDSF, 51);
	TextDrawFont(TDSF, 2);
	TextDrawSetProportional(TDSF, 1);

	TDArea = TextDrawCreate(329.399841, 115.488891, "Area~n~51");
	TextDrawLetterSize(TDArea, 0.225600, 0.947910);
	TextDrawAlignment(TDArea, 2);
	TextDrawColor(TDArea, -437918209);
	TextDrawUseBox(TDArea, true);
	TextDrawBoxColor(TDArea, 0);
	TextDrawSetShadow(TDArea, 0);
	TextDrawSetOutline(TDArea, 1);
	TextDrawBackgroundColor(TDArea, 51);
	TextDrawFont(TDArea, 2);
	TextDrawSetProportional(TDArea, 1);

	TDLS = TextDrawCreate(404.399841, 284.239990, "Los Santos");
	TextDrawLetterSize(TDLS, 0.359598, 1.814043);
	TextDrawTextSize(TDLS, -0.000003, 0.497774);
	TextDrawAlignment(TDLS, 2);
	TextDrawColor(TDLS, -437918209);
	TextDrawSetShadow(TDLS, 0);
	TextDrawSetOutline(TDLS, 1);
	TextDrawBackgroundColor(TDLS, 51);
	TextDrawFont(TDLS, 2);
	TextDrawSetProportional(TDLS, 1);

	TDLV = TextDrawCreate(411.799926, 119.479942, "Las Venturas");
	TextDrawLetterSize(TDLV, 0.359598, 1.814043);
	TextDrawTextSize(TDLV, -0.000003, 0.497774);
	TextDrawAlignment(TDLV, 2);
	TextDrawColor(TDLV, -437918209);
	TextDrawSetShadow(TDLV, 0);
	TextDrawSetOutline(TDLV, 1);
	TextDrawBackgroundColor(TDLV, 51);
	TextDrawFont(TDLV, 2);
	TextDrawSetProportional(TDLV, 1);

	TDAirport = TextDrawCreate(405.599822, 335.511047, "Airport");
	TextDrawLetterSize(TDAirport, 0.225600, 0.947910);
	TextDrawAlignment(TDAirport, 2);
	TextDrawColor(TDAirport, -437918209);
	TextDrawUseBox(TDAirport, true);
	TextDrawBoxColor(TDAirport, 0);
	TextDrawSetShadow(TDAirport, 0);
	TextDrawSetOutline(TDAirport, 1);
	TextDrawBackgroundColor(TDAirport, 51);
	TextDrawFont(TDAirport, 2);
	TextDrawSetProportional(TDAirport, 1);

	TDAngel = TextDrawCreate(211.799850, 330.537750, "Angel~n~Pine");
	TextDrawLetterSize(TDAngel, 0.225600, 0.947910);
	TextDrawAlignment(TDAngel, 2);
	TextDrawColor(TDAngel, -437918209);
	TextDrawSetShadow(TDAngel, 0);
	TextDrawSetOutline(TDAngel, 1);
	TextDrawBackgroundColor(TDAngel, 51);
	TextDrawFont(TDAngel, 2);
	TextDrawSetProportional(TDAngel, 1);

	TDMount = TextDrawCreate(197.599929, 286.737823, "Mount~n~Chilliad");
	TextDrawLetterSize(TDMount, 0.246000, 1.142042);
	TextDrawAlignment(TDMount, 2);
	TextDrawColor(TDMount, -437918209);
	TextDrawSetShadow(TDMount, 0);
	TextDrawSetOutline(TDMount, 1);
	TextDrawBackgroundColor(TDMount, 51);
	TextDrawFont(TDMount, 2);
	TextDrawSetProportional(TDMount, 1);
		
	WhiteBox = TextDrawCreate(116.600074, 314.108795, "usebox");
	TextDrawLetterSize(WhiteBox, 0.000000, -0.120123);
	TextDrawTextSize(WhiteBox, 111.200019, 0.000000);
	TextDrawAlignment(WhiteBox, 1);
	TextDrawColor(WhiteBox, -1);
	TextDrawUseBox(WhiteBox, true);
	TextDrawBoxColor(WhiteBox, -1);
	TextDrawSetShadow(WhiteBox, 0);
	TextDrawSetOutline(WhiteBox, 0);
	TextDrawFont(WhiteBox, 0);
	
	
	EndingBackground = TextDrawCreate(641.599975, 1.500000, "usebox");
	TextDrawLetterSize(EndingBackground, 0.000000, 49.405799);
	TextDrawTextSize(EndingBackground, -2.000000, 0.000000);
	TextDrawAlignment(EndingBackground, 1);
	TextDrawColor(EndingBackground, 0);
	TextDrawUseBox(EndingBackground, true);
	TextDrawBoxColor(EndingBackground, 128);
	TextDrawSetShadow(EndingBackground, 0);
	TextDrawSetOutline(EndingBackground, 0);
	TextDrawFont(EndingBackground, 0);

	EndingPointText = TextDrawCreate(225.399581, 126.933250, "RANK POINTS~n~KILL POINTS~n~HIT POINTS");
	TextDrawLetterSize(EndingPointText, 0.198399, 1.256533);
	TextDrawAlignment(EndingPointText, 1);
	TextDrawColor(EndingPointText, -1734500097);
	TextDrawSetShadow(EndingPointText, 0);
	TextDrawSetOutline(EndingPointText, 0);
	TextDrawBackgroundColor(EndingPointText, 51);
	TextDrawFont(EndingPointText, 2);
	TextDrawSetProportional(EndingPointText, 1);

	EndingPlayer = TextDrawCreate(191.000106, 104.039901, "players");
	TextDrawLetterSize(EndingPlayer, 0.201600, 1.226667);
	TextDrawAlignment(EndingPlayer, 1);
	TextDrawColor(EndingPlayer, -1734500097);
	TextDrawUseBox(EndingPlayer, true);
	TextDrawBoxColor(EndingPlayer, 0);
	TextDrawSetShadow(EndingPlayer, 0);
	TextDrawSetOutline(EndingPlayer, 0);
	TextDrawBackgroundColor(EndingPlayer, 51);
	TextDrawFont(EndingPlayer, 1);
	TextDrawSetProportional(EndingPlayer, 1);

	EndingLobby = TextDrawCreate(527.600158, 375.324279, "EXIT TO LOBBY");
	TextDrawLetterSize(EndingLobby, 0.295998, 2.311820);
	TextDrawTextSize(EndingLobby, 21.600000, 109.511199);
	TextDrawAlignment(EndingLobby, 2);
	TextDrawColor(EndingLobby, -1);
	TextDrawUseBox(EndingLobby, true);
	TextDrawBoxColor(EndingLobby, 80);
	TextDrawSetShadow(EndingLobby, 0);
	TextDrawSetOutline(EndingLobby, 0);
	TextDrawBackgroundColor(EndingLobby, 80);
	TextDrawFont(EndingLobby, 2);
	TextDrawSetProportional(EndingLobby, 1);
	TextDrawSetSelectable(EndingLobby, true);
}

Player_Textdraw(playerid) {

	//Player Textdraws:
	emptytext[playerid] = CreatePlayerTextDraw(playerid, 0.0, 0.0, "_");
	PlayerTextDrawLetterSize(playerid, emptytext[playerid], 1.0, 1.0);
	PlayerTextDrawTextSize(playerid, emptytext[playerid], 597.000000, 0.119998);
	PlayerTextDrawAlignment(playerid, emptytext[playerid], 1);
	PlayerTextDrawColor(playerid, emptytext[playerid], -1);
	PlayerTextDrawUseBox(playerid, emptytext[playerid], 1);
	PlayerTextDrawBoxColor(playerid, emptytext[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, emptytext[playerid], 255);
	PlayerTextDrawFont(playerid, emptytext[playerid], 0);
	PlayerTextDrawSetProportional(playerid, emptytext[playerid], 1);
	
	td_compass[playerid][0] = CreatePlayerTextDraw(playerid, 216.400024, 21.902231, "l");
	PlayerTextDrawLetterSize(playerid, td_compass[playerid][0], 0.146797, 0.649240);
	PlayerTextDrawAlignment(playerid, td_compass[playerid][0], 2);
	PlayerTextDrawColor(playerid, td_compass[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, td_compass[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, td_compass[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, td_compass[playerid][0], 51);
	PlayerTextDrawFont(playerid, td_compass[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, td_compass[playerid][0], 1);

	td_uicompass[playerid][0] = CreatePlayerTextDraw(playerid, 216.400024, 30.364458, "150");
	PlayerTextDrawLetterSize(playerid, td_uicompass[playerid][0], 0.183200, 0.903110);
	PlayerTextDrawAlignment(playerid, td_uicompass[playerid][0], 2);
	PlayerTextDrawColor(playerid, td_uicompass[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, td_uicompass[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, td_uicompass[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, td_uicompass[playerid][0], 51);
	PlayerTextDrawFont(playerid, td_uicompass[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, td_uicompass[playerid][0], 1);
	
	td_compass[playerid][1] = CreatePlayerTextDraw(playerid, 248.400024, 21.902231, "l");
	PlayerTextDrawLetterSize(playerid, td_compass[playerid][1], 0.146797, 0.649240);
	PlayerTextDrawAlignment(playerid, td_compass[playerid][1], 2);
	PlayerTextDrawColor(playerid, td_compass[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, td_compass[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, td_compass[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, td_compass[playerid][1], 51);
	PlayerTextDrawFont(playerid, td_compass[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, td_compass[playerid][1], 1);

	td_uicompass[playerid][1] = CreatePlayerTextDraw(playerid, 248.400024, 30.364458, "150");
	PlayerTextDrawLetterSize(playerid, td_uicompass[playerid][1], 0.183200, 0.903110);
	PlayerTextDrawAlignment(playerid, td_uicompass[playerid][1], 2);
	PlayerTextDrawColor(playerid, td_uicompass[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, td_uicompass[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, td_uicompass[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, td_uicompass[playerid][1], 51);
	PlayerTextDrawFont(playerid, td_uicompass[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, td_uicompass[playerid][1], 1);
	
	td_compass[playerid][2] = CreatePlayerTextDraw(playerid, 280.400024, 21.902231, "l");
	PlayerTextDrawLetterSize(playerid, td_compass[playerid][2], 0.146797, 0.649240);
	PlayerTextDrawAlignment(playerid, td_compass[playerid][2], 2);
	PlayerTextDrawColor(playerid, td_compass[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, td_compass[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, td_compass[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, td_compass[playerid][2], 51);
	PlayerTextDrawFont(playerid, td_compass[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, td_compass[playerid][2], 1);

	td_uicompass[playerid][2] = CreatePlayerTextDraw(playerid, 280.400024, 30.364458, "150");
	PlayerTextDrawLetterSize(playerid, td_uicompass[playerid][2], 0.183200, 0.903110);
	PlayerTextDrawAlignment(playerid, td_uicompass[playerid][2], 2);
	PlayerTextDrawColor(playerid, td_uicompass[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, td_uicompass[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, td_uicompass[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, td_uicompass[playerid][2], 51);
	PlayerTextDrawFont(playerid, td_uicompass[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, td_uicompass[playerid][2], 1);
	
	td_compass[playerid][3] = CreatePlayerTextDraw(playerid, 312.400024, 21.902231, "l");
	PlayerTextDrawLetterSize(playerid, td_compass[playerid][3], 0.146797, 0.649240);
	PlayerTextDrawAlignment(playerid, td_compass[playerid][3], 2);
	PlayerTextDrawColor(playerid, td_compass[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, td_compass[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, td_compass[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, td_compass[playerid][3], 51);
	PlayerTextDrawFont(playerid, td_compass[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, td_compass[playerid][3], 1);

	td_uicompass[playerid][3] = CreatePlayerTextDraw(playerid, 312.400024, 30.364458, "150");
	PlayerTextDrawLetterSize(playerid, td_uicompass[playerid][3], 0.183200, 0.903110);
	PlayerTextDrawAlignment(playerid, td_uicompass[playerid][3], 2);
	PlayerTextDrawColor(playerid, td_uicompass[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, td_uicompass[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, td_uicompass[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, td_uicompass[playerid][3], 51);
	PlayerTextDrawFont(playerid, td_uicompass[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, td_uicompass[playerid][3], 1);

	td_compass[playerid][4] = CreatePlayerTextDraw(playerid, 344.400024, 21.902231, "l");
	PlayerTextDrawLetterSize(playerid, td_compass[playerid][4], 0.146797, 0.649240);
	PlayerTextDrawAlignment(playerid, td_compass[playerid][4], 2);
	PlayerTextDrawColor(playerid, td_compass[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, td_compass[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, td_compass[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, td_compass[playerid][4], 51);
	PlayerTextDrawFont(playerid, td_compass[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, td_compass[playerid][4], 1);

	td_uicompass[playerid][4] = CreatePlayerTextDraw(playerid, 344.400024, 30.364458, "150");
	PlayerTextDrawLetterSize(playerid, td_uicompass[playerid][4], 0.183200, 0.903110);
	PlayerTextDrawAlignment(playerid, td_uicompass[playerid][4], 2);
	PlayerTextDrawColor(playerid, td_uicompass[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, td_uicompass[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, td_uicompass[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, td_uicompass[playerid][4], 51);
	PlayerTextDrawFont(playerid, td_uicompass[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, td_uicompass[playerid][4], 1);

	td_compass[playerid][5] = CreatePlayerTextDraw(playerid, 376.400024, 21.902231, "l");
	PlayerTextDrawLetterSize(playerid, td_compass[playerid][5], 0.146797, 0.649240);
	PlayerTextDrawAlignment(playerid, td_compass[playerid][5], 2);
	PlayerTextDrawColor(playerid, td_compass[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, td_compass[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, td_compass[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, td_compass[playerid][5], 51);
	PlayerTextDrawFont(playerid, td_compass[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, td_compass[playerid][5], 1);

	td_uicompass[playerid][5] = CreatePlayerTextDraw(playerid, 376.400024, 30.364458, "150");
	PlayerTextDrawLetterSize(playerid, td_uicompass[playerid][5], 0.183200, 0.903110);
	PlayerTextDrawAlignment(playerid, td_uicompass[playerid][5], 2);
	PlayerTextDrawColor(playerid, td_uicompass[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, td_uicompass[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, td_uicompass[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, td_uicompass[playerid][5], 51);
	PlayerTextDrawFont(playerid, td_uicompass[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, td_uicompass[playerid][5], 1);
	
	td_compass[playerid][6] = CreatePlayerTextDraw(playerid, 408.400024, 21.902231, "l");
	PlayerTextDrawLetterSize(playerid, td_compass[playerid][6], 0.146797, 0.649240);
	PlayerTextDrawAlignment(playerid, td_compass[playerid][6], 2);
	PlayerTextDrawColor(playerid, td_compass[playerid][6], -1);
	PlayerTextDrawSetShadow(playerid, td_compass[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, td_compass[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, td_compass[playerid][6], 51);
	PlayerTextDrawFont(playerid, td_compass[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, td_compass[playerid][6], 1);

	td_uicompass[playerid][6] = CreatePlayerTextDraw(playerid, 408.400024, 30.364458, "150");
	PlayerTextDrawLetterSize(playerid, td_uicompass[playerid][6], 0.183200, 0.903110);
	PlayerTextDrawAlignment(playerid, td_uicompass[playerid][6], 2);
	PlayerTextDrawColor(playerid, td_uicompass[playerid][6], -1);
	PlayerTextDrawSetShadow(playerid, td_uicompass[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, td_uicompass[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, td_uicompass[playerid][6], 51);
	PlayerTextDrawFont(playerid, td_uicompass[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, td_uicompass[playerid][6], 1);


	HealthBar[playerid] = CreatePlayerTextDraw(playerid, 245.199996, 415.746551, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, HealthBar[playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, HealthBar[playerid], 0.1, 15.0); //150.399887, 18.915540
	PlayerTextDrawAlignment(playerid, HealthBar[playerid], 2);
	PlayerTextDrawColor(playerid, HealthBar[playerid], 0xFFFFFFFF);//-57636865
	PlayerTextDrawSetShadow(playerid, HealthBar[playerid], 0);
	PlayerTextDrawSetOutline(playerid, HealthBar[playerid], 0);
	PlayerTextDrawFont(playerid, HealthBar[playerid], 4);
	
	NameAndVersion[playerid] = CreatePlayerTextDraw(playerid, 318.399993, 433.066711, "- - -");
	PlayerTextDrawLetterSize(playerid, NameAndVersion[playerid], 0.174799, 0.823466);
	PlayerTextDrawTextSize(playerid, NameAndVersion[playerid], -255.199996, 632.675598);
	PlayerTextDrawAlignment(playerid, NameAndVersion[playerid], 2);
	PlayerTextDrawColor(playerid, NameAndVersion[playerid], -1);
	PlayerTextDrawSetShadow(playerid, NameAndVersion[playerid], 0);
	PlayerTextDrawSetOutline(playerid, NameAndVersion[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, NameAndVersion[playerid], 51);
	PlayerTextDrawFont(playerid, NameAndVersion[playerid], 1);
	PlayerTextDrawSetProportional(playerid, NameAndVersion[playerid], 1);

	KillScore[playerid] = CreatePlayerTextDraw(playerid, 472.400238, 3.488882, "  0");
	PlayerTextDrawLetterSize(playerid, KillScore[playerid], 0.260399, 1.719465);
	PlayerTextDrawTextSize(playerid, KillScore[playerid], 494.398223, -10.951098);
	PlayerTextDrawAlignment(playerid, KillScore[playerid], 1);
	PlayerTextDrawColor(playerid, KillScore[playerid], -1);
	PlayerTextDrawUseBox(playerid, KillScore[playerid], true);
	PlayerTextDrawBoxColor(playerid, KillScore[playerid], 128);
	PlayerTextDrawSetShadow(playerid, KillScore[playerid], 0);
	PlayerTextDrawSetOutline(playerid, KillScore[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, KillScore[playerid], 51);
	PlayerTextDrawFont(playerid, KillScore[playerid], 2);
	PlayerTextDrawSetProportional(playerid, KillScore[playerid], 1);	
	/*Runing[playerid] = CreatePlayerTextDraw(playerid, 34.0, 314.104461, "usebox");
	PlayerTextDrawLetterSize(playerid, Runing[playerid], 0.000000, -0.120123);
	PlayerTextDrawTextSize(playerid, Runing[playerid], 27.199998, 0.000000);
	PlayerTextDrawAlignment(playerid, Runing[playerid], 1);
	PlayerTextDrawColor(playerid, Runing[playerid], 0);
	PlayerTextDrawUseBox(playerid, Runing[playerid], true);
	PlayerTextDrawBoxColor(playerid, Runing[playerid], 9232895);*/

	RuningIcon[playerid] = CreatePlayerTextDraw(playerid, 19.8, 287.720001, "ld_shtr:ship");
	PlayerTextDrawLetterSize(playerid,RuningIcon[playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,RuningIcon[playerid], 22.400007, 25.386661);
	PlayerTextDrawAlignment(playerid,RuningIcon[playerid], 1);
	PlayerTextDrawColor(playerid,RuningIcon[playerid], -1);
	PlayerTextDrawSetShadow(playerid,RuningIcon[playerid], 0);
	PlayerTextDrawSetOutline(playerid,RuningIcon[playerid], 0);
	PlayerTextDrawFont(playerid,RuningIcon[playerid], 4);
	
	LobbyStart[playerid] = CreatePlayerTextDraw(playerid,70.400009, 387.768890, "START");
	PlayerTextDrawLetterSize(playerid,LobbyStart[playerid], 0.372799, 3.192887);
	PlayerTextDrawTextSize(playerid,LobbyStart[playerid], 54.000019, 82.133338);
	PlayerTextDrawAlignment(playerid,LobbyStart[playerid], 2);
	PlayerTextDrawColor(playerid,LobbyStart[playerid], -1);
	PlayerTextDrawUseBox(playerid,LobbyStart[playerid], true);
	PlayerTextDrawBoxColor(playerid,LobbyStart[playerid], -726921840);
	PlayerTextDrawSetShadow(playerid,LobbyStart[playerid], 0);
	PlayerTextDrawSetOutline(playerid,LobbyStart[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid,LobbyStart[playerid], 255);
	PlayerTextDrawFont(playerid,LobbyStart[playerid], 2);
	PlayerTextDrawSetProportional(playerid,LobbyStart[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,LobbyStart[playerid], true);

	Lobby1[playerid] = CreatePlayerTextDraw(playerid,27.999984, 373.333404, "Play solo in third-person perspective");
	PlayerTextDrawLetterSize(playerid,Lobby1[playerid], 0.179600, 1.107201);
	PlayerTextDrawTextSize(playerid,Lobby1[playerid], 193.599975, -3.982222);
	PlayerTextDrawAlignment(playerid,Lobby1[playerid], 1);
	PlayerTextDrawColor(playerid,Lobby1[playerid], -1);
	PlayerTextDrawSetShadow(playerid,Lobby1[playerid], 0);
	PlayerTextDrawSetOutline(playerid,Lobby1[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid,Lobby1[playerid], 51);
	PlayerTextDrawFont(playerid,Lobby1[playerid], 1);
	PlayerTextDrawSetProportional(playerid,Lobby1[playerid], 1);

	Lobby2[playerid] = CreatePlayerTextDraw(playerid,28.400020, 217.030975, "TEAM");
	PlayerTextDrawLetterSize(playerid,Lobby2[playerid], 0.160400, 1.117155);
	PlayerTextDrawAlignment(playerid,Lobby2[playerid], 1);
	PlayerTextDrawColor(playerid,Lobby2[playerid], -1);
	PlayerTextDrawSetShadow(playerid,Lobby2[playerid], 0);
	PlayerTextDrawSetOutline(playerid,Lobby2[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid,Lobby2[playerid], 51);
	PlayerTextDrawFont(playerid,Lobby2[playerid], 2);
	PlayerTextDrawSetProportional(playerid,Lobby2[playerid], 1);

	Lobby3[playerid] = CreatePlayerTextDraw(playerid,115.199996, 230.477859, "usebox");
	PlayerTextDrawLetterSize(playerid,Lobby3[playerid], 0.000000, 6.547530);
	PlayerTextDrawTextSize(playerid,Lobby3[playerid], 26.399999, 0.000000);
	PlayerTextDrawAlignment(playerid,Lobby3[playerid], 1);
	PlayerTextDrawColor(playerid,Lobby3[playerid], 0);
	PlayerTextDrawUseBox(playerid,Lobby3[playerid], true);
	PlayerTextDrawBoxColor(playerid,Lobby3[playerid], 102);
	PlayerTextDrawSetShadow(playerid,Lobby3[playerid], 0);
	PlayerTextDrawSetOutline(playerid,Lobby3[playerid], 0);
	PlayerTextDrawFont(playerid,Lobby3[playerid], 0);

	Lobby4[playerid] = CreatePlayerTextDraw(playerid,30.000011, 230.968917, "Solo");
	PlayerTextDrawLetterSize(playerid,Lobby4[playerid], 0.231199, 1.311288);
	PlayerTextDrawTextSize(playerid,Lobby4[playerid], 112.399993, 8.995555);
	PlayerTextDrawAlignment(playerid,Lobby4[playerid], 1);
	PlayerTextDrawColor(playerid,Lobby4[playerid], -726921729);
	PlayerTextDrawUseBox(playerid,Lobby4[playerid], true);
	PlayerTextDrawBoxColor(playerid,Lobby4[playerid], 128);
	PlayerTextDrawSetShadow(playerid,Lobby4[playerid], 0);
	PlayerTextDrawSetOutline(playerid,Lobby4[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid,Lobby4[playerid], 51);
	PlayerTextDrawFont(playerid,Lobby4[playerid], 2);
	PlayerTextDrawSetProportional(playerid,Lobby4[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,Lobby4[playerid], true);

	Lobby5[playerid] = CreatePlayerTextDraw(playerid,29.400011, 246.902435, "Duo");
	PlayerTextDrawLetterSize(playerid,Lobby5[playerid], 0.231199, 1.311288);
	PlayerTextDrawTextSize(playerid,Lobby5[playerid], 112.399993, 8.995555);
	PlayerTextDrawAlignment(playerid,Lobby5[playerid], 1);
	PlayerTextDrawColor(playerid,Lobby5[playerid], -1);
	PlayerTextDrawUseBox(playerid,Lobby5[playerid], true);
	PlayerTextDrawBoxColor(playerid,Lobby5[playerid], 32);
	PlayerTextDrawSetShadow(playerid,Lobby5[playerid], 0);
	PlayerTextDrawSetOutline(playerid,Lobby5[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid,Lobby5[playerid], 51);
	PlayerTextDrawFont(playerid,Lobby5[playerid], 2);
	PlayerTextDrawSetProportional(playerid,Lobby5[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,Lobby5[playerid], true);

	Lobby6[playerid] = CreatePlayerTextDraw(playerid,29.600015, 261.840362, "SQUAD");
	PlayerTextDrawLetterSize(playerid,Lobby6[playerid], 0.231199, 1.311288);
	PlayerTextDrawTextSize(playerid,Lobby6[playerid], 112.399993, 8.995555);
	PlayerTextDrawAlignment(playerid,Lobby6[playerid], 1);
	PlayerTextDrawColor(playerid,Lobby6[playerid], -1);
	PlayerTextDrawUseBox(playerid,Lobby6[playerid], true);
	PlayerTextDrawBoxColor(playerid,Lobby6[playerid], 32);
	PlayerTextDrawSetShadow(playerid,Lobby6[playerid], 0);
	PlayerTextDrawSetOutline(playerid,Lobby6[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid,Lobby6[playerid], 51);
	PlayerTextDrawFont(playerid,Lobby6[playerid], 2);
	PlayerTextDrawSetProportional(playerid,Lobby6[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,Lobby6[playerid], true);

	Lobby7[playerid] = CreatePlayerTextDraw(playerid,29.800012, 276.778045, "1-man squad");
	PlayerTextDrawLetterSize(playerid,Lobby7[playerid], 0.231199, 1.311288);
	PlayerTextDrawTextSize(playerid,Lobby7[playerid], 112.399993, 8.995555);
	PlayerTextDrawAlignment(playerid,Lobby7[playerid], 1);
	PlayerTextDrawColor(playerid,Lobby7[playerid], -1);
	PlayerTextDrawUseBox(playerid,Lobby7[playerid], true);
	PlayerTextDrawBoxColor(playerid,Lobby7[playerid], 32);
	PlayerTextDrawSetShadow(playerid,Lobby7[playerid], 0);
	PlayerTextDrawSetOutline(playerid,Lobby7[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid,Lobby7[playerid], 51);
	PlayerTextDrawFont(playerid,Lobby7[playerid], 2);
	PlayerTextDrawSetProportional(playerid,Lobby7[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,Lobby7[playerid], true);

	Lobby8[playerid] = CreatePlayerTextDraw(playerid,28.600019, 305.639831, "PERSPECTIVE");
	PlayerTextDrawLetterSize(playerid,Lobby8[playerid], 0.160400, 1.117155);
	PlayerTextDrawAlignment(playerid,Lobby8[playerid], 1);
	PlayerTextDrawColor(playerid,Lobby8[playerid], -1);
	PlayerTextDrawUseBox(playerid,Lobby8[playerid], true);
	PlayerTextDrawBoxColor(playerid,Lobby8[playerid], 0);
	PlayerTextDrawSetShadow(playerid,Lobby8[playerid], 0);
	PlayerTextDrawSetOutline(playerid,Lobby8[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid,Lobby8[playerid], 51);
	PlayerTextDrawFont(playerid,Lobby8[playerid], 2);
	PlayerTextDrawSetProportional(playerid,Lobby8[playerid], 1);

	Lobby9[playerid] = CreatePlayerTextDraw(playerid,115.799987, 319.087036, "usebox");
	PlayerTextDrawLetterSize(playerid,Lobby9[playerid], 0.000000, 3.067533);
	PlayerTextDrawTextSize(playerid,Lobby9[playerid], 26.400001, 0.000000);
	PlayerTextDrawAlignment(playerid,Lobby9[playerid], 1);
	PlayerTextDrawColor(playerid,Lobby9[playerid], 0);
	PlayerTextDrawUseBox(playerid,Lobby9[playerid], true);
	PlayerTextDrawBoxColor(playerid,Lobby9[playerid], 102);
	PlayerTextDrawSetShadow(playerid,Lobby9[playerid], 0);
	PlayerTextDrawSetOutline(playerid,Lobby9[playerid], 0);
	PlayerTextDrawFont(playerid,Lobby9[playerid], 1);

	Lobby10[playerid] = CreatePlayerTextDraw(playerid,30.000020, 319.093688, "TPP");
	PlayerTextDrawLetterSize(playerid,Lobby10[playerid], 0.231199, 1.311288);
	PlayerTextDrawTextSize(playerid,Lobby10[playerid], 112.399993, 5.995555);
	PlayerTextDrawAlignment(playerid,Lobby10[playerid], 1);
	PlayerTextDrawColor(playerid,Lobby10[playerid], -726921729);
	PlayerTextDrawUseBox(playerid,Lobby10[playerid], true);
	PlayerTextDrawBoxColor(playerid,Lobby10[playerid], 128);
	PlayerTextDrawSetShadow(playerid,Lobby10[playerid], 0);
	PlayerTextDrawSetOutline(playerid,Lobby10[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid,Lobby10[playerid], 51);
	PlayerTextDrawFont(playerid,Lobby10[playerid], 2);
	PlayerTextDrawSetProportional(playerid,Lobby10[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,Lobby10[playerid], true);

	Lobby11[playerid] = CreatePlayerTextDraw(playerid,29.400011, 334.528869, "FPP");
	PlayerTextDrawLetterSize(playerid,Lobby11[playerid], 0.231199, 1.311288);
	PlayerTextDrawTextSize(playerid,Lobby11[playerid], 112.399993, 5.995555);
	PlayerTextDrawAlignment(playerid,Lobby11[playerid], 1);
	PlayerTextDrawColor(playerid,Lobby11[playerid], -1);
	PlayerTextDrawUseBox(playerid,Lobby11[playerid], true);
	PlayerTextDrawBoxColor(playerid,Lobby11[playerid], 32);
	PlayerTextDrawSetShadow(playerid,Lobby11[playerid], 0);
	PlayerTextDrawSetOutline(playerid,Lobby11[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid,Lobby11[playerid], 51);
	PlayerTextDrawFont(playerid,Lobby11[playerid], 2);
	PlayerTextDrawSetProportional(playerid,Lobby11[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,Lobby11[playerid], true);
	
	PlayerKillText[playerid] = CreatePlayerTextDraw(playerid, 317.600036, 291.808929, "_"); // YOU killed Hercrozis with Micro UZI
	PlayerTextDrawLetterSize(playerid, PlayerKillText[playerid], 0.225997, 1.142042);
	PlayerTextDrawAlignment(playerid, PlayerKillText[playerid], 2);
	PlayerTextDrawColor(playerid, PlayerKillText[playerid], -1);
	PlayerTextDrawSetShadow(playerid, PlayerKillText[playerid], 0);
	PlayerTextDrawSetOutline(playerid, PlayerKillText[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, PlayerKillText[playerid], 51);
	PlayerTextDrawFont(playerid, PlayerKillText[playerid], 1);
	PlayerTextDrawSetProportional(playerid, PlayerKillText[playerid], 1);

	EndingName[playerid] = CreatePlayerTextDraw(playerid, 11.999979, 17.919965, "Sarah_Randy");
	PlayerTextDrawLetterSize(playerid, EndingName[playerid], 0.469599, 2.580621);
	PlayerTextDrawTextSize(playerid, EndingName[playerid], 383.199920, -12.942218);
	PlayerTextDrawAlignment(playerid, EndingName[playerid], 1);
	PlayerTextDrawColor(playerid, EndingName[playerid], -1);
	PlayerTextDrawSetShadow(playerid, EndingName[playerid], 0);
	PlayerTextDrawSetOutline(playerid, EndingName[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, EndingName[playerid], 51);
	PlayerTextDrawFont(playerid, EndingName[playerid], 1);
	PlayerTextDrawSetProportional(playerid, EndingName[playerid], 1);

	EndingText[playerid] = CreatePlayerTextDraw(playerid, 12.999979, 47.293273, "WINNER WINNER CHICKEN DINNER!");
	PlayerTextDrawLetterSize(playerid, EndingText[playerid], 0.604399, 4.118759);
	PlayerTextDrawTextSize(playerid, EndingText[playerid], 455.199920, -16.924448);
	PlayerTextDrawAlignment(playerid, EndingText[playerid], 1);
	PlayerTextDrawColor(playerid, EndingText[playerid], -4062977);
	PlayerTextDrawSetShadow(playerid, EndingText[playerid], 0);
	PlayerTextDrawSetOutline(playerid, EndingText[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, EndingText[playerid], 51);
	PlayerTextDrawFont(playerid, EndingText[playerid], 1);
	PlayerTextDrawSetProportional(playerid, EndingText[playerid], 1);

	EndingKill[playerid] = CreatePlayerTextDraw(playerid, 139.199844, 94.500000, "KILL 66");
	PlayerTextDrawLetterSize(playerid, EndingKill[playerid], 0.405600, 2.570662);
	PlayerTextDrawTextSize(playerid, EndingKill[playerid], 201.999984, -46.791152);
	PlayerTextDrawAlignment(playerid, EndingKill[playerid], 1);
	PlayerTextDrawColor(playerid, EndingKill[playerid], -1);
	PlayerTextDrawSetShadow(playerid, EndingKill[playerid], 0);
	PlayerTextDrawSetOutline(playerid, EndingKill[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, EndingKill[playerid], 51);
	PlayerTextDrawFont(playerid, EndingKill[playerid], 1);
	PlayerTextDrawSetProportional(playerid, EndingKill[playerid], 1);

	EndingRank[playerid] = CreatePlayerTextDraw(playerid, 72.199943, 94.500000, "TEAM_RANK_#99");
	PlayerTextDrawLetterSize(playerid, EndingRank[playerid], 0.405600, 2.570662);
	PlayerTextDrawTextSize(playerid, EndingRank[playerid], 119.199958, -143.857833);
	PlayerTextDrawAlignment(playerid, EndingRank[playerid], 2);
	PlayerTextDrawColor(playerid, EndingRank[playerid], -1);
	PlayerTextDrawSetShadow(playerid, EndingRank[playerid], 0);
	PlayerTextDrawSetOutline(playerid, EndingRank[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, EndingRank[playerid], 51);
	PlayerTextDrawFont(playerid, EndingRank[playerid], 1);
	PlayerTextDrawSetProportional(playerid, EndingRank[playerid], 1);

	EndingReward[playerid] = CreatePlayerTextDraw(playerid, 225.399581, 94.500000, "REWARD_____0");
	PlayerTextDrawLetterSize(playerid, EndingReward[playerid], 0.405600, 2.570662);
	PlayerTextDrawTextSize(playerid, EndingReward[playerid], 201.999984, -46.791152);
	PlayerTextDrawAlignment(playerid, EndingReward[playerid], 1);
	PlayerTextDrawColor(playerid, EndingReward[playerid], -1);
	PlayerTextDrawSetShadow(playerid, EndingReward[playerid], 0);
	PlayerTextDrawSetOutline(playerid, EndingReward[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, EndingReward[playerid], 51);
	PlayerTextDrawFont(playerid, EndingReward[playerid], 1);
	PlayerTextDrawSetProportional(playerid, EndingReward[playerid], 1);

	EndingRankPoint[playerid] = CreatePlayerTextDraw(playerid, 334.399719, 126.933319, "0");
	PlayerTextDrawLetterSize(playerid, EndingRankPoint[playerid], 0.273999, 1.390933);
	PlayerTextDrawAlignment(playerid, EndingRankPoint[playerid], 3);
	PlayerTextDrawColor(playerid, EndingRankPoint[playerid], -1);
	PlayerTextDrawSetShadow(playerid, EndingRankPoint[playerid], 0);
	PlayerTextDrawSetOutline(playerid, EndingRankPoint[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, EndingRankPoint[playerid], 51);
	PlayerTextDrawFont(playerid, EndingRankPoint[playerid], 2);
	PlayerTextDrawSetProportional(playerid, EndingRankPoint[playerid], 1);

	EndingKillPoint[playerid] = CreatePlayerTextDraw(playerid, 334.399719, 138.386581, "0");
	PlayerTextDrawLetterSize(playerid, EndingKillPoint[playerid], 0.273999, 1.390933);
	PlayerTextDrawAlignment(playerid, EndingKillPoint[playerid], 3);
	PlayerTextDrawColor(playerid, EndingKillPoint[playerid], -1);
	PlayerTextDrawSetShadow(playerid, EndingKillPoint[playerid], 0);
	PlayerTextDrawSetOutline(playerid, EndingKillPoint[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, EndingKillPoint[playerid], 51);
	PlayerTextDrawFont(playerid, EndingKillPoint[playerid], 2);
	PlayerTextDrawSetProportional(playerid, EndingKillPoint[playerid], 1);

	EndingHitPoint[playerid] = CreatePlayerTextDraw(playerid, 334.399719, 149.342163, "0");
	PlayerTextDrawLetterSize(playerid, EndingHitPoint[playerid], 0.273999, 1.390933);
	PlayerTextDrawAlignment(playerid, EndingHitPoint[playerid], 3);
	PlayerTextDrawColor(playerid, EndingHitPoint[playerid], -1);
	PlayerTextDrawSetShadow(playerid, EndingHitPoint[playerid], 0);
	PlayerTextDrawSetOutline(playerid, EndingHitPoint[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, EndingHitPoint[playerid], 51);
	PlayerTextDrawFont(playerid, EndingHitPoint[playerid], 2);
	PlayerTextDrawSetProportional(playerid, EndingHitPoint[playerid], 1);

	EndingLast[playerid] = CreatePlayerTextDraw(playerid, 485.600311, 3.493263, "~y~#0~w~/0");
	PlayerTextDrawLetterSize(playerid, EndingLast[playerid], 0.990399, 6.109870);
	PlayerTextDrawTextSize(playerid, EndingLast[playerid], 601.999816, 10.924448);
	PlayerTextDrawAlignment(playerid, EndingLast[playerid], 1);
	PlayerTextDrawColor(playerid, EndingLast[playerid], -4062977);
	PlayerTextDrawSetShadow(playerid, EndingLast[playerid], 0);
	PlayerTextDrawSetOutline(playerid, EndingLast[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, EndingLast[playerid], 51);
	PlayerTextDrawFont(playerid, EndingLast[playerid], 1);
	PlayerTextDrawSetProportional(playerid, EndingLast[playerid], 1);
	
	OnKill[playerid] = CreatePlayerTextDraw(playerid, 320.151123, 300.760131, "0 kills");
	PlayerTextDrawLetterSize(playerid, OnKill[playerid], 0.349999, 2.137598);
	PlayerTextDrawAlignment(playerid, OnKill[playerid], 2);
	PlayerTextDrawColor(playerid, OnKill[playerid], -1069995009);
	PlayerTextDrawSetShadow(playerid, OnKill[playerid], 0);
	PlayerTextDrawSetOutline(playerid, OnKill[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, OnKill[playerid], 51);
	PlayerTextDrawFont(playerid, OnKill[playerid], 1);
	PlayerTextDrawSetProportional(playerid, OnKill[playerid], 1);
	
	
}