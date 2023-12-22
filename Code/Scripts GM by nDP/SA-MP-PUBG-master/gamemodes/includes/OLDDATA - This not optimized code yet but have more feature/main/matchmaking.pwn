#include <YSI\y_hooks>

new Text:TDJump;
new Text:bloodFaderTextDraw = Text:INVALID_TEXT_DRAW;
new bool:leftRedArea[MAX_PLAYERS];

new PlayerKillTextTimer[MAX_PLAYERS];

#define FADE_FROM_COLOR \
	((0x2E64FEFF & ~0xFF) | 15)
	
#define FADE_TO_COLOR \
	((0x2E64FEFF & ~0xFF) | 45)

#define MAX_PLAYER_PER_MATCH	100 //ตั้งค่าจำนวนผู้เล่นสูงสุดในแต่ละ Matching
#define MAX_MATCHMAKING 	5 //จำนวนห้อง Matching
#define MIN_MATCHING 		1 // ตั้งค่าผู้เล่นอย่างน้อยในการ Matching
#define START_TIME_PREPARE	120 // Waiting Start first circle 120
#define WAIT_TIME_GAME		60 // Waiting Join 60
#define MATCH_TIME_FINISHED 20

#define MAX_GAS_OBJECT		10 // MAX 20
#define GAS_AREA_DISTANCE	600.0
#define MAX_CAR_SPAWN		200

#define GZ_AMOUNT_OF_SQUARE 102
#define GZ_SQUARE_SIZE		1

enum {
	STATE_WAITING,
	STATE_PREPARE,
	STATE_START,
	STATE_BLUE_SHRINK,
	STATE_FINISHED
};

enum matchData {
	bool:m_EXIST,
	m_STATE, // 
	m_Timer, // 
	m_WShrink,
	m_BShrink,
	m_Type, // Solo, Duo, Squad
	Float:m_WRad,
	Float:m_BRad,
	Float:m_WX,
	Float:m_WY,
	Float:m_BX,
	Float:m_BY,
	m_ShrinkID,
	m_DynamicShrink,
	m_DynamicGas[MAX_GAS_OBJECT],
	
	Float:m_DecreaseBShrink,
	m_Alive,
	m_max_team,
	
	m_Pilot,
	m_Plane,
	
	//Car
	m_Car[MAX_CAR_SPAWN],
	
	//TD
	Text:m_TDStartTime,
	Text:m_TDTime,
	Text:m_TDFadeText,
	Text:m_TDAliveText,
	Text:m_TDAliveScore,
};

new MatchMaking[MAX_MATCHMAKING][matchData];

new const Motorcycle[] = {
	581,581,522,586,586,461,461,463,463,509,509,468,468
};

new const GeneralVehicle[] = {
	401,404,404,422,475,475,483,500
};

new const Float:CarRandomSpawn[][4] = {
{-2552.3411,1128.2025,55.4335,260.3718},
{-2400.9233,985.9723,45.0310,0.5083},
{-2401.2156,-587.1760,132.3832,304.5902},
{2417.0801,2736.1528,10.4776,135.1768},
{2269.5396,2507.7771,10.4763,90.0866},
{2365.4619,2240.1208,10.5498,294.3910},
{2591.4529,1840.1925,10.5548,269.6147},
{2611.2751,1684.7042,10.5547,89.6050},
{2532.7905,1265.9857,10.4739,180.9095},
{2264.0186,1415.6143,11.3479,88.9364},
{1713.9868,1138.5928,10.4736,89.9680},
{953.0992,1710.1084,8.3814,91.3209},
{1012.9250,1885.2277,10.4765,0.5911},
{1299.4596,2058.7893,10.4780,270.1770},
{1572.6816,2031.1157,10.4762,184.1203},
{2804.8159,928.0099,10.4840,0.1862},
{2713.2983,837.6830,10.5581,178.2428},
{2142.3486,1019.3722,10.5533,89.5970},
{2179.3857,987.6536,10.5541,179.1715},
{1866.9005,1179.3973,10.5705,359.5224},
{1844.6403,1235.2346,10.5633,89.1186},
{2217.7124,1879.0164,10.5548,0.4004},
{1901.1337,1989.3286,7.3292,0.8472},
{1947.2566,1707.5709,10.4782,90.5224},
{1718.9727,1572.9930,10.4329,175.5984},
{1692.0360,1306.4500,10.5545,178.9325},
{1675.8326,1267.7753,10.4727,91.6088},
{979.7595,1071.9497,10.5474,359.3576},
{736.7148,1118.0432,27.9848,106.1471},
{329.6022,1106.3712,12.2760,30.8382},
{46.9830,1179.2972,18.3983,92.4582},
{-86.6293,1152.3285,19.3859,90.4600},
{-212.0396,1132.4615,19.4773,89.4688},
{-300.8733,1777.5100,42.4213,89.7335},
{64.1144,1916.9818,17.2828,310.8714},
{44.0415,2077.3552,17.3621,274.7009},
{14.7977,2306.6855,23.5915,91.6166},
{-528.1204,2579.0115,53.1484,269.1673},
{-1311.5911,2707.3760,49.7941,5.7378},
{-1490.3246,2640.4790,55.4882,181.4311},
{-1525.6018,2525.5706,55.4928,180.1344},
{-1453.4009,1854.1777,32.9382,274.2217},
{-1202.0747,1815.7538,41.4528,224.6279},
{-742.5764,1581.5758,26.6933,216.8577},
{-2450.6091,2304.9639,4.7127,88.8400},
{-2528.8059,2265.9998,4.7204,65.2692},
{-2464.5408,2438.8967,15.1243,277.8862},
{2528.2798,83.4009,26.1403,180.2334},
{2370.1267,-22.6041,26.1414,90.4719},
{1508.0771,100.4089,29.5333,122.6832},
{1252.0493,248.6900,19.2886,64.9840},
{1319.5636,467.5826,19.7847,242.6451},
{745.7794,295.0771,19.8758,96.6768},
{238.2811,-13.8607,1.2338,182.1659},
{92.6644,-153.5220,2.3138,87.1061},
{-258.1006,-239.5011,1.0529,340.4820},
{-2021.4581,-44.4206,35.0823,179.5052},
{-2076.6807,-84.1846,34.8980,0.8273},
{-2266.4409,105.0587,34.9049,270.6763},
{-2274.7754,716.1659,49.0970,1.5422},
{-1913.1768,1186.1697,45.1022,270.2731},
{-1652.1208,412.1906,6.8346,135.6557},
{-1950.1964,585.3878,34.8567,359.5167},
{-2032.9607,179.0183,28.5722,89.0110},
{-1967.1106,-708.7875,31.8605,76.4829},
{-2125.1868,-962.1061,31.7588,88.8500},
{-2133.5784,-885.6088,31.7565,268.5665},
{-74.4493,-1153.7242,1.4828,332.0506},
{-50.3924,-1519.9259,1.6270,256.8536},
{619.6019,-1101.4015,46.4862,304.9435},
{998.0134,-918.8865,41.9106,7.0494},
{1129.6667,-931.7566,42.7748,185.2106},
{1156.8065,-1107.5179,24.5046,179.0853},
{863.4619,-1134.6163,23.5729,74.9883},
{789.9381,-1417.3997,13.2778,197.0975},
{1085.5443,-1367.5116,13.5117,359.2756},
{1267.8979,-1099.2653,25.4994,359.9360},
{1314.0155,-1286.4619,13.1926,271.7883},
{1460.0310,-1506.9233,13.2793,238.7035},
{2907.9014,-1581.2618,10.7348,177.6100},
{2503.7200,-1681.1393,13.1923,312.1495},
{2160.1062,-1792.7415,13.0898,90.2826},
{2118.0894,-1781.9569,13.1233,179.2837},
{1967.2286,-1773.7555,13.1957,181.4573},
{1766.6553,-1819.5333,13.1982,76.8783},
{1451.3975,-1737.7286,13.1919,89.8598},
{1337.7546,-1569.5009,13.1625,72.6472},
{1279.6112,-1389.9977,13.0935,88.6516},
{1167.4889,-1286.2767,13.2054,90.7398},
{1002.5153,-1306.6243,13.1152,179.1064},
{723.1278,-1411.1898,13.1725,90.5276},
{435.0950,-1724.6528,9.5218,86.4655},
{648.8801,-1728.7483,13.6180,257.8024},
{1098.0295,-1769.7513,13.0847,269.0372},
{1359.5562,-1751.7029,13.1044,178.8951},
{2268.3984,-1888.9044,13.1364,271.7872},
{2438.4131,-2002.2843,13.2768,63.5448},
{1617.4858,-2314.0049,-3.0381,271.2250},
{1777.4359,-2248.6318,3.9682,270.5174},
{-77.0365,-1603.4720,2.4280,118.1619},
{-722.2672,-2375.2869,48.1619,163.5148},
{-2232.3694,-2529.1731,31.1707,320.8154},
{-2173.4580,-2306.3088,30.2782,52.2475},
{-2090.5776,-2238.9150,30.7509,227.7060},
{-2398.2581,-2186.5867,33.0238,84.1738},
{-2312.4165,-1678.2694,482.0858,212.5450},
{-1854.5272,-1544.7062,21.4818,56.6187},
{1982.4497,750.0675,10.4936,181.8450},
{2175.5591,707.6159,10.4759,268.2805},
{2364.5129,1652.7008,10.5552,91.0906}, 
{2116.7290,1988.3422,10.4677,0.8528}, 
{2103.7725,2082.3606,10.5508,269.9569}, 
{1913.7877,2158.8386,10.5536,1.1645}, 
{1712.0785,2188.6047,10.5514,179.2805}, 
{1612.7634,2200.3152,10.5543,268.6715}, 
{874.5134,1998.4960,10.5572,88.6590}, 
{782.2516,1873.4944,4.6085,89.2176}, 
{696.6345,1946.6844,5.2729,0.9262}, 
{1058.1382,2278.9480,10.5493,89.9804}
};


hook OnPlayerSpawn(playerid) {
	TextDrawStopBoxFadeForPlayer(playerid, bloodFaderTextDraw);
	return 1;
}

public OnTextDrawFade(Text:text, forplayerid, bool:isbox, newcolor, finalcolor)
{
	if (text == bloodFaderTextDraw)
	{
		new i = PlayerInMatching[forplayerid];
		if(i != -1 && MatchMaking[i][m_STATE] != STATE_FINISHED) {

			if (newcolor == FADE_TO_COLOR)
			{
				new Float:damages = CircleDamage[MatchMaking[i][m_ShrinkID]];
				if(PlayerData[forplayerid][pHealth] - damages > 0.0) {
					SetPlayerHealthEx(forplayerid, PlayerData[forplayerid][pHealth] - damages);
				}
				else {
					OnPlayerDeathEx(forplayerid, INVALID_PLAYER_ID, DEATH_PLAYZONE);
				}
				TextDrawFadeBoxForPlayer(forplayerid, bloodFaderTextDraw, FADE_TO_COLOR, FADE_FROM_COLOR);
			}
			else if (newcolor == FADE_FROM_COLOR)
			{
				new Float:damages = CircleDamage[MatchMaking[i][m_ShrinkID]];
				if(PlayerData[forplayerid][pHealth] - damages > 0.0) {
					SetPlayerHealthEx(forplayerid, PlayerData[forplayerid][pHealth] - damages);
				}
				else {
					OnPlayerDeathEx(forplayerid, INVALID_PLAYER_ID, DEATH_PLAYZONE);
				}
				TextDrawFadeBoxForPlayer(forplayerid, bloodFaderTextDraw, FADE_FROM_COLOR, FADE_TO_COLOR);
			}
		}
	}
}

hook OnPlayerDisconnect(playerid, reason) {
	if(PlayerInMatching[playerid] != -1) {
	
		new matchid = PlayerInMatching[playerid];

		if(InGame{playerid}) {
			if(!PlayerData[playerid][pIsDead]) {
				foreach(new x : Player) {
					if(PlayerInMatching[x] == matchid) {
						if(MatchMaking[matchid][m_Alive]-1>1) {
							SendClientMessageEx(x, -1, "%s ได้ออกจากเซิร์ฟเวอร์ - คงเหลือ %d", ReturnName(playerid), MatchMaking[matchid][m_Alive]-1);
						}
						else SendClientMessageEx(x, -1, "%s ได้ออกจากเซิร์ฟเวอร์ - จบการแข่งขัน", ReturnName(playerid)); 
					}
				}
			}
			PlayerData[playerid][pDeaths]++;
			CheckWinner(matchid);
		}
		ResetPlayerToLobby(playerid);
	}
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys) 
{ 
    if(Pressed(KEY_SECONDARY_ATTACK))
    { 
        cmd_jump(playerid);
    } 
	if(Pressed(KEY_LOOK_BEHIND) || Pressed(KEY_LOOK_LEFT) || Pressed(KEY_SUBMISSION)) {
		cmd_map(playerid);
	}
    return 1; 
}

hook OnPlayerEnterDynamicArea(playerid, areaid)
{
	for(new i=0;i!=MAX_MATCHMAKING;i++) if(MatchMaking[i][m_EXIST])
	{
		if (areaid == MatchMaking[i][m_DynamicShrink])
		{
			if (leftRedArea[playerid])
			{
				if (GetPlayerState(playerid) != PLAYER_STATE_WASTED)
				{
					TextDrawColor(bloodFaderTextDraw, 0);
					TextDrawHideForPlayer(playerid, bloodFaderTextDraw);
					TextDrawStopBoxFadeForPlayer(playerid, bloodFaderTextDraw);
					leftRedArea[playerid] = false;
				}
			}
		}
	}
}

hook OnPlayerLeaveDynamicArea(playerid, areaid)
{
	for(new i=0;i!=MAX_MATCHMAKING;i++) if(MatchMaking[i][m_EXIST])
	{
		if (areaid == MatchMaking[i][m_DynamicShrink])
		{
			if (GetPlayerState(playerid) != PLAYER_STATE_WASTED)
			{
				TextDrawFadeBoxForPlayer(playerid, bloodFaderTextDraw, FADE_FROM_COLOR, FADE_TO_COLOR);
				leftRedArea[playerid] = true;
			}
		}
	}
}

hook OnGameModeInit() {
	new count;
	for(new i=0;i!=MAX_MATCHMAKING;i++) {
	
		if(IsValidDynamicArea(MatchMaking[i][m_DynamicShrink]))
			DestroyDynamicArea(MatchMaking[i][m_DynamicShrink]);		

		MatchMaking[i][m_WShrink] = INVALID_GZ_SHAPE_ID;
		MatchMaking[i][m_BShrink] = INVALID_GZ_SHAPE_ID;

		MatchMaking[i][m_Alive]=
		MatchMaking[i][m_Timer]=
		MatchMaking[i][m_ShrinkID]=0;
		
		MatchMaking[i][m_DecreaseBShrink]=
		MatchMaking[i][m_WRad]=
		MatchMaking[i][m_BRad]=
		MatchMaking[i][m_WX]=
		MatchMaking[i][m_WY]=
		MatchMaking[i][m_BX]=
		MatchMaking[i][m_BY]=0.0;
		
		new PilotName[MAX_PLAYER_NAME];
		format(PilotName, MAX_PLAYER_NAME, "pilot_%d", i);
		MatchMaking[i][m_Pilot] = FCNPC_Create(PilotName);
		FCNPC_Spawn(MatchMaking[i][m_Pilot], 61, 0, 0, 3);
		FCNPC_SetVirtualWorld(MatchMaking[i][m_Pilot], i+1);
	
		MatchMaking[i][m_Plane] = CreateVehicle(519, 0, 0, 3, 0, -1, -1, -1);
		SetVehicleVirtualWorld(MatchMaking[i][m_Plane], i+1);
		
		MatchMaking[i][m_EXIST]=false;
		MatchMaking[i][m_STATE]=STATE_WAITING;
		count++;
	}
	printf("Loading %d Matchmaking Server", count);
	return 1;
}
/*
task GameUpdateTimer[1000]()
{
	//new str[128];
	
	for(new i=0;i!=MAX_MATCHMAKING;i++) {
	
	}
	return 1;
}
*/
task MatchMakingTimer[1000]()
{
	//new str[128];
	
	for(new i=0;i!=MAX_MATCHMAKING;i++) {
		
			
		if(MatchMaking[i][m_EXIST]) {

			printf("[MM] ID:%d [%s] players:%d state:%d type:%s", i, MatchMaking[i][m_EXIST] ? ("ON") : ("OFF"), MatchMaking[i][m_Alive], MatchMaking[i][m_STATE], MatchMaking[i][m_Type]==0 ? ("Solo") : MatchMaking[i][m_Type]==1 ? ("Duo") : ("Squad"));
		
			foreach(new x : Player) {

				if(!InGame{x} && MatchMaking[i][m_STATE] == STATE_WAITING) {
					new str[128];
					if(MatchMaking[i][m_Timer] == -1) {
						format(str, 128, "เซิร์ฟเวอร์ %d ผู้เล่น: %d โหมด: %s ต้องการผู้เล่นอีก: %d", i+1, MatchMaking[i][m_Alive], MatchMaking[i][m_Type]==0 ? ("Solo") : MatchMaking[i][m_Type]==1 ? ("Duo") : ("Squad"), MIN_MATCHING - MatchMaking[i][m_Alive]);
					}
					else {
						format(str, 128, "เซิร์ฟเวอร์ %d ผู้เล่น: %d โหมด: %s จะเริ่มในอีก %d", i+1, MatchMaking[i][m_Alive], MatchMaking[i][m_Type]==0 ? ("Solo") : MatchMaking[i][m_Type]==1 ? ("Duo") : ("Squad"), MatchMaking[i][m_Timer]);
					}
					SendClientMessage(x, -1, str);
				}

				if(PlayerInMatching[x] == i && InGame{x} && MatchMaking[i][m_STATE] != STATE_FINISHED) {
				
					ShowMarkers(x);
		
					//UICompassTimer(x);
					UpdatePlayerMap(x);
		
					if(MatchMaking[i][m_WShrink] != INVALID_GZ_SHAPE_ID) GZ_ShapeShowForPlayer(x, MatchMaking[i][m_WShrink], 0xFFFFFF77);
					if(MatchMaking[i][m_BShrink] != INVALID_GZ_SHAPE_ID) GZ_ShapeShowForPlayer(x, MatchMaking[i][m_BShrink], 0x2E64FE95);
					
					if(MatchMaking[i][m_STATE] != STATE_WAITING) {
						UpdatePlayerTimeUI(x);
						PlayerData[x][pServivalTime]++;
						
						/*new temp_state = GetPlayerState(x);
						if(temp_state == PLAYER_STATE_ONFOOT && temp_state != PLAYER_STATE_WASTED) {
							GetPlayerPos(x, PlayerData[x][pPosX], PlayerData[x][pPosY], PlayerData[x][pPosZ]);
							GetPlayerFacingAngle(x, PlayerData[x][pPosA]);
						}*/
					}
					
				}
			}

		
			/*if(MatchMaking[i][m_Alive] <= 0 && MatchMaking[i][m_STATE] != STATE_FINISHED) {
				MatchMaking[i][m_Timer] = MATCH_TIME_FINISHED;
				MatchMaking[i][m_STATE] = STATE_FINISHED;
			}*/
			
			switch(MatchMaking[i][m_STATE]) {
				case STATE_FINISHED: {
					if(MatchMaking[i][m_Timer]) {
						MatchMaking[i][m_Timer]--;
						
						/*if(MatchMaking[i][m_Alive] > 1) {
							MatchMaking[i][m_STATE]=STATE_WAITING;
							MatchMaking[i][m_Timer]=WAIT_TIME_GAME;
						}*/
					}
					else {

						foreach(new x : Player) {
							if(PlayerInMatching[x]==i) {
								ResetPlayerToLobby(x);
							}
						}
						ResetMatchmaking(i);
					}
				}
				case STATE_WAITING: {
				
					if(MatchMaking[i][m_Timer] == -1) {
						if(MatchMaking[i][m_Alive] >= MIN_MATCHING) {
							MatchMaking[i][m_Timer] = WAIT_TIME_GAME;
						}
						foreach(new x : Player) {
							if(PlayerInMatching[x] == i) TextDrawHideForPlayer(x, MatchMaking[i][m_TDStartTime]);
						}
					}
					else {
						new str[128];
						
						format(str, 128, "MATCH STARTS IN~n~%s", ConvertTimePUBG(MatchMaking[i][m_Timer]));
						
						TextDrawSetString(MatchMaking[i][m_TDStartTime], str);   

						//printf("m_Alive %d", MatchMaking[i][m_Alive]);	

						foreach(new x : Player) {
	
							if(PlayerInMatching[x] == i) {
	
								if(InGame{x}) {
									if(!openMap{x}) TextDrawShowForPlayer(x, MatchMaking[i][m_TDStartTime]);
								}
							}
						}
	
						
						if(MatchMaking[i][m_Timer]) {
							MatchMaking[i][m_Timer]--;
							
						}
						else {
							// STATE PREPARE
							MatchMaking[i][m_Timer]=START_TIME_PREPARE; // 2 
							MatchMaking[i][m_STATE]=STATE_PREPARE;
							
							// นั่งเครื่องบิน
							new Float:rd_flight_x, Float:rd_flight_y, Float:rd_des_x, Float:rd_des_y;
							
							if(random(10)%2) {
							
								if(random(10)%2) {
									rd_flight_x = 3000; 
									rd_des_x = -3000;
								}
								else {
									rd_flight_x = -3000;
									rd_des_x = 3000;
								}
								
								if(random(10)%2) {
									rd_flight_y = random(3000);
									rd_des_y = -3000 + random(3000);
								}
								else {
									rd_flight_y = - random(3000);
									rd_des_y = 3000 - random(3000);
								}
							
							}
							else {
							
								if(random(10)%2) {
									rd_flight_x = 3000; 
									rd_des_x = -3000;
								}
								else {
									rd_flight_x = -3000;
									rd_des_x = 3000;
								}
								if(random(10)%2) {
									rd_flight_y = random(3000);
									rd_des_y = -3000 + random(3000);
								}
								else {
									rd_flight_y = - random(3000);
									rd_des_y = 3000 - random(3000);
								}
							}					
							
							//printf("%f %f | %f %f", rd_des_x, rd_des_y, rd_flight_x, rd_flight_y);
							
							SetVehiclePos(MatchMaking[i][m_Plane], rd_flight_x, rd_flight_y, 1000);
							FCNPC_PutInVehicle(MatchMaking[i][m_Pilot], MatchMaking[i][m_Plane], 0);
							FCNPC_GoTo(MatchMaking[i][m_Pilot], rd_des_x, rd_des_y, 1000, FCNPC_MOVE_TYPE_AUTO, 8.0); //FCNPC_MOVE_SPEED_AUTO
							
	
							foreach(new x : Player) {
								if(PlayerInMatching[x] == i && InGame{x}) {
									TogglePlayerSpectating(x, true);
									PlayerSpectateVehicle(x, MatchMaking[i][m_Plane], SPECTATE_MODE_NORMAL);
									
									TextDrawShowForPlayer(x, TDJump);
									InPlane{x} = true;
									
									SendClientMessage(x, -1, "[In-Game] กดปุ{FFEC00}่ม NU{FFFFFF}M1 ห{FFEC00}รือ{FFFFFF} MMB เพื่อเปิดแผนที่");
								}
							}
	
							TextDrawDestroy(MatchMaking[i][m_TDStartTime]);
							
							MatchMaking[i][m_max_team] = MatchMaking[i][m_Alive];
						}
						UpdateAliveText(i);
					}
				}
				case STATE_PREPARE: {
				
					//printf("STATE_PREPARE %d", MatchMaking[i][m_Timer]);	
					
					if(MatchMaking[i][m_Timer]) {
						MatchMaking[i][m_Timer]--;
	
						if(MatchMaking[i][m_Timer] < 30) {
							foreach(new x : Player) {
								if(PlayerInMatching[x] == i && InGame{x} && InPlane{x}) {
									cmd_jump(x);
								}
							}
						}
					}
					else {
						// STATE START
						new temp_shrink_id = MatchMaking[i][m_ShrinkID];
						
						MatchMaking[i][m_WRad]=CircleData[temp_shrink_id][CIRCLEDATA_SIZE];
						MatchMaking[i][m_BRad]=MAP_SIZE_LIMIT;
						
						if(random(2)==0) MatchMaking[i][m_WX] = random(floatround(MatchMaking[i][m_BRad]-1000.0-MatchMaking[i][m_WRad]));
						else MatchMaking[i][m_WX] = -(random(floatround(MatchMaking[i][m_BRad]-1000.0-MatchMaking[i][m_WRad])));
						if(random(2)==0) MatchMaking[i][m_WY] = random(floatround(MatchMaking[i][m_BRad]-1000.0-MatchMaking[i][m_WRad]));
						else MatchMaking[i][m_WY] = -(random(floatround(MatchMaking[i][m_BRad]-1000.0-MatchMaking[i][m_WRad])));
						
						
						//printf("%f %f", MatchMaking[i][m_WX], MatchMaking[i][m_WY]);
						
						if(MatchMaking[i][m_WShrink] != INVALID_GZ_SHAPE_ID) GZ_ShapeDestroy(MatchMaking[i][m_WShrink]);
						MatchMaking[i][m_WShrink] = GZ_ShapeCreate(CIRCUMFERENCE, MatchMaking[i][m_WX], MatchMaking[i][m_WY], MatchMaking[i][m_WRad], GZ_AMOUNT_OF_SQUARE, GZ_SQUARE_SIZE);

						if(IsValidDynamicArea(MatchMaking[i][m_DynamicShrink])) DestroyDynamicArea(MatchMaking[i][m_DynamicShrink]);
						MatchMaking[i][m_DynamicShrink] = CreateDynamicCircle(MatchMaking[i][m_BX], MatchMaking[i][m_BY], MAP_SIZE_LIMIT, i+1);			
						
						/*new Float:Zang;
						MapAndreas_FindZ_For2DCoord(MatchMaking[i][m_BX], MatchMaking[i][m_BY], Zang);*/

						new Float:temp_gas = -14.4;		

						for(new x=0;x!=MAX_GAS_OBJECT;x++) {
							MatchMaking[i][m_DynamicGas][x] = Object_CreateCircle(10444, MatchMaking[i][m_BX], MatchMaking[i][m_BY], temp_gas, 0.0, 90.0, 0.0, MatchMaking[i][m_BRad], 1.448, i+1, -1, GAS_AREA_DISTANCE, GAS_AREA_DISTANCE); 
							//Object_SetCircleTexture(MatchMaking[i][m_DynamicGas][x], 0, 3947, "rczero_track", "waterclear256", 0xFFFFFF45);
							//for(new z; z< 10; z++) Object_SetCircleTexture(MatchMaking[i][m_DynamicGas][x], z, 0, "hotelbackpool_sfs", "ws_glass_balustrade", 0xFFFFFFFF);
							temp_gas += 14.4;
						}
						/*MatchMaking[i][m_DynamicGas] = Object_CreateCircle(10444, MatchMaking[i][m_BX], MatchMaking[i][m_BY], 0, 0.0, 90.0, 0.0, MatchMaking[i][m_BRad], 1, i+1); 
						MatchMaking[i][m_DynamicGas2] = Object_CreateCircle(10444, MatchMaking[i][m_BX], MatchMaking[i][m_BY], 14.4, 0.0, 90.0, 0.0, MatchMaking[i][m_BRad], 1, i+1); 
						MatchMaking[i][m_DynamicGas3] = Object_CreateCircle(10444, MatchMaking[i][m_BX], MatchMaking[i][m_BY], 28.8, 0.0, 90.0, 0.0, MatchMaking[i][m_BRad], 1, i+1); 
						MatchMaking[i][m_DynamicGas4] = Object_CreateCircle(10444, MatchMaking[i][m_BX], MatchMaking[i][m_BY], 43.2, 0.0, 90.0, 0.0, MatchMaking[i][m_BRad], 1, i+1); */

						
						MatchMaking[i][m_Timer]=CircleData[temp_shrink_id][CIRCLEDATA_WHITETIME];
						
						MatchMaking[i][m_DecreaseBShrink] = (MatchMaking[i][m_BRad]-MatchMaking[i][m_WRad])/CircleData[temp_shrink_id][CIRCLEDATA_BLUETIME];
						
						//printf("Circle White first %f", MatchMaking[i][m_WRad]);
						
						MatchMaking[i][m_TDTime] = TextDrawCreate(28.400007, 314.595428, ConvertTimePUBG(MatchMaking[i][m_Timer]));
						TextDrawLetterSize(MatchMaking[i][m_TDTime], 0.132399, 0.898134);
						TextDrawAlignment(MatchMaking[i][m_TDTime], 1);
						TextDrawColor(MatchMaking[i][m_TDTime], -1);
						TextDrawUseBox(MatchMaking[i][m_TDTime], true);
						TextDrawBoxColor(MatchMaking[i][m_TDTime], 0);
						TextDrawSetShadow(MatchMaking[i][m_TDTime], 0);
						TextDrawSetOutline(MatchMaking[i][m_TDTime], 0);
						TextDrawBackgroundColor(MatchMaking[i][m_TDTime], 51);
						TextDrawFont(MatchMaking[i][m_TDTime], 2);
						TextDrawSetProportional(MatchMaking[i][m_TDTime], 1);
						
						MatchMaking[i][m_TDFadeText] = TextDrawCreate(318.782257, 239.928848, "_");
						TextDrawLetterSize(MatchMaking[i][m_TDFadeText], 0.288399, 2.605513);
						TextDrawTextSize(MatchMaking[i][m_TDFadeText], 658.178405, 640.142272);
						TextDrawAlignment(MatchMaking[i][m_TDFadeText], 2);
						TextDrawColor(MatchMaking[i][m_TDFadeText], -136548353);
						TextDrawSetShadow(MatchMaking[i][m_TDFadeText], 0);
						TextDrawSetOutline(MatchMaking[i][m_TDFadeText], 1);
						TextDrawBackgroundColor(MatchMaking[i][m_TDFadeText], 51);
						TextDrawFont(MatchMaking[i][m_TDFadeText], 2);
						TextDrawSetProportional(MatchMaking[i][m_TDFadeText], 1);
						
						new str[128], minutes, seconds = MatchMaking[i][m_Timer];
						format(str, 128, "proceed to play area marked on the map in %s!", ConvertTime(seconds, minutes));
						TextDrawSetString(MatchMaking[i][m_TDFadeText], str);
						
						MatchMaking[i][m_STATE]=STATE_START;
						
						foreach(new x : Player) {
							if(PlayerInMatching[x] == i && InGame{x}) {
								seconds = MatchMaking[i][m_Timer];
								SendClientMessageEx(x, COLOR_YELLOW, "ไปยังพื้นที่การเล่นที่ทำเครื่องหมายไว้บนแผนที่ภายใน %s!", ConvertTimeTH(seconds, minutes));
								GZ_ShapeShowForPlayer(x, MatchMaking[i][m_WShrink], 0xFFFFFF77); 
		
								TextDrawShowForPlayer(x, MatchMaking[i][m_TDFadeText]);
								SetTimerEx("HideFadeText", 4000, false, "dd", x, i);
								
								PlayerTimeUI(x, true);
								
								if(IsPlayerInDynamicArea(x, MatchMaking[i][m_DynamicShrink], true)) {
									TextDrawColor(bloodFaderTextDraw, 0);
									TextDrawHideForPlayer(x, bloodFaderTextDraw);
									TextDrawStopBoxFadeForPlayer(x, bloodFaderTextDraw);
									leftRedArea[x] = false;
								}
								else {
									leftRedArea[x]=true;
									TextDrawFadeBoxForPlayer(x, bloodFaderTextDraw, FADE_FROM_COLOR, FADE_TO_COLOR);
									leftRedArea[x] = true;
								}
							}
						}
					}
				}
				case STATE_START: {
					// UPDATE TIME & MONKEY UI HERE !!
					//printf("STATE_START %d", MatchMaking[i][m_Timer]);	
					if(MatchMaking[i][m_Timer]) {

						TextDrawColor(MatchMaking[i][m_TDTime], -1);
						TextDrawSetString(MatchMaking[i][m_TDTime], ConvertTimePUBG(MatchMaking[i][m_Timer]));

						
						if(MatchMaking[i][m_Timer] == 30) SendMatchMessage(i, COLOR_YELLOW, "กำลังจะจำกัดพื้นที่การเล่นในอีก 30 วินาที!"), TextDrawSetString(MatchMaking[i][m_TDFadeText], "RESTRICTING THE PLAY AREA IN 30 SECONDS!");
						else if(MatchMaking[i][m_Timer] == 10) SendMatchMessage(i, COLOR_YELLOW, "กำลังจะจำกัดพื้นที่การเล่นในอีก 10 วินาที!"), TextDrawSetString(MatchMaking[i][m_TDFadeText], "RESTRICTING THE PLAY AREA IN 10 SECONDS!");
						else if(MatchMaking[i][m_Timer] == 5) SendMatchMessage(i, COLOR_YELLOW, "กำลังจะจำกัดพื้นที่การเล่นในอีก 5 วินาที!"), TextDrawSetString(MatchMaking[i][m_TDFadeText], "RESTRICTING THE PLAY AREA IN 5 SECONDS!");
						else if(MatchMaking[i][m_Timer] == 1) SendMatchMessage(i, COLOR_YELLOW, "กำลังกำจัดพื้นที่การเล่น!"), TextDrawSetString(MatchMaking[i][m_TDFadeText], "RESTRICTING PLAY AREA!");
						
						foreach(new x : Player) {
							if(PlayerInMatching[x] == i && InGame{x}) {
								if(TimeUI{x}) TextDrawShowForPlayer(x, MatchMaking[i][m_TDTime]);
								
								if(MatchMaking[i][m_Timer] == 30 || MatchMaking[i][m_Timer] == 10 || MatchMaking[i][m_Timer] == 5 || MatchMaking[i][m_Timer] == 1) 
								{
									TextDrawShowForPlayer(x, MatchMaking[i][m_TDFadeText]);
									SetTimerEx("HideFadeText", 2000, false, "dd", x, i);
								}
							}
						}
						
						MatchMaking[i][m_Timer]--;
						
					}
					else {
						//เริ่มบีบวงน้ำเงิน
						new temp_shrink_id = MatchMaking[i][m_ShrinkID];
						
						MatchMaking[i][m_Timer]=CircleData[temp_shrink_id][CIRCLEDATA_BLUETIME];
						MatchMaking[i][m_STATE]=STATE_BLUE_SHRINK;

					}
				}
				case STATE_BLUE_SHRINK: {
					// UPDATE TIME & MONKEY UI HERE !!

					if(MatchMaking[i][m_Timer]) {
						
						if(MatchMaking[i][m_BX] < MatchMaking[i][m_WX]) MatchMaking[i][m_BX] += (MatchMaking[i][m_WX]-MatchMaking[i][m_BX])/MatchMaking[i][m_Timer];
						else MatchMaking[i][m_BX] -= (MatchMaking[i][m_BX]-MatchMaking[i][m_WX])/MatchMaking[i][m_Timer];
						
						if(MatchMaking[i][m_BY] < MatchMaking[i][m_WY]) MatchMaking[i][m_BY] += (MatchMaking[i][m_WY]-MatchMaking[i][m_BY])/MatchMaking[i][m_Timer];
						else MatchMaking[i][m_BY] -= (MatchMaking[i][m_BY]-MatchMaking[i][m_WY])/MatchMaking[i][m_Timer];
						
						MatchMaking[i][m_BRad]-=MatchMaking[i][m_DecreaseBShrink];

						if(MatchMaking[i][m_BShrink] != INVALID_GZ_SHAPE_ID) GZ_ShapeDestroy(MatchMaking[i][m_BShrink]);
						MatchMaking[i][m_BShrink] = GZ_ShapeCreate(EMPTY_CIRCLE, MatchMaking[i][m_BX], MatchMaking[i][m_BY], MatchMaking[i][m_BRad], GZ_AMOUNT_OF_SQUARE, GZ_SQUARE_SIZE);
						
						/*if(IsValidDynamicArea(MatchMaking[i][m_DynamicShrink])) DestroyDynamicArea(MatchMaking[i][m_DynamicShrink]);
						MatchMaking[i][m_DynamicShrink] = CreateDynamicCircle(MatchMaking[i][m_BX], MatchMaking[i][m_BY], MatchMaking[i][m_BRad]);*/
						Streamer_SetFloatData(STREAMER_TYPE_AREA, MatchMaking[i][m_DynamicShrink], E_STREAMER_X, MatchMaking[i][m_BX]);
						Streamer_SetFloatData(STREAMER_TYPE_AREA, MatchMaking[i][m_DynamicShrink], E_STREAMER_Y, MatchMaking[i][m_BY]);
						Streamer_SetFloatData(STREAMER_TYPE_AREA, MatchMaking[i][m_DynamicShrink], E_STREAMER_SIZE, MatchMaking[i][m_BRad]);
						//Streamer_SetIntData(STREAMER_TYPE_AREA, MatchMaking[i][m_DynamicShrink], E_STREAMER_WORLD_ID, i+1);
					
						new Float:temp_gas = -14.4;		
						for(new x=0;x!=MAX_GAS_OBJECT;x++) {
							Object_SetCirclePos(MatchMaking[i][m_DynamicGas][x], MatchMaking[i][m_BX], MatchMaking[i][m_BY], temp_gas);
							Object_SetCircleModel(MatchMaking[i][m_DynamicGas][x], 10444, MatchMaking[i][m_BRad], 1.448);
							temp_gas += 14.4;
						}

						MatchMaking[i][m_Timer]--;

						TextDrawColor(MatchMaking[i][m_TDTime], (MatchMaking[i][m_Timer]%2) ? -16776961 : -1);
						TextDrawSetString(MatchMaking[i][m_TDTime], "!");
		
						foreach(new x : Player) {
							if(PlayerInMatching[x] == i && InGame{x}) {
								if(TimeUI{x}) TextDrawShowForPlayer(x, MatchMaking[i][m_TDTime]);
								GZ_ShapeShowForPlayer(x, MatchMaking[i][m_BShrink], 0x2E64FE95);
								Streamer_Update(x, STREAMER_TYPE_AREA);
							}
						}
					}

					else {
						if(MatchMaking[i][m_ShrinkID]+1 < sizeof(CircleData)) {
						
							MatchMaking[i][m_ShrinkID]++;
						
							new temp_shrink_id = MatchMaking[i][m_ShrinkID];
							if(temp_shrink_id < sizeof(CircleData)) {
								MatchMaking[i][m_WRad] = CircleData[temp_shrink_id][CIRCLEDATA_SIZE];
					
								new Float:distFromCenter = MatchMaking[i][m_WRad] + 1 * (MatchMaking[i][m_BRad] - MatchMaking[i][m_WRad] * 2);
								new Float:p2 = 3.141592 * 2;
								new Float:angle = float(random(10))/10.0 * p2;
								
								MatchMaking[i][m_WX] = MatchMaking[i][m_BX] + distFromCenter * floatcos(angle, radian);
								MatchMaking[i][m_WY] = MatchMaking[i][m_BY] + distFromCenter * floatsin(angle, radian);
								
								if(MatchMaking[i][m_WShrink] != INVALID_GZ_SHAPE_ID) GZ_ShapeDestroy(MatchMaking[i][m_WShrink]);
								MatchMaking[i][m_WShrink] = GZ_ShapeCreate(CIRCUMFERENCE, MatchMaking[i][m_WX], MatchMaking[i][m_WY], MatchMaking[i][m_WRad], GZ_AMOUNT_OF_SQUARE, GZ_SQUARE_SIZE);
								
								MatchMaking[i][m_Timer] = CircleData[temp_shrink_id][CIRCLEDATA_WHITETIME];

								MatchMaking[i][m_DecreaseBShrink] = (MatchMaking[i][m_BRad]-MatchMaking[i][m_WRad])/CircleData[temp_shrink_id][CIRCLEDATA_BLUETIME];
								
								
								new str[128], minutes, seconds = MatchMaking[i][m_Timer];
								format(str, 128, "proceed to play area marked on the map in %s!", ConvertTime(seconds, minutes));
								TextDrawSetString(MatchMaking[i][m_TDFadeText], str);
									
								foreach(new x : Player) {
									if(PlayerInMatching[x] == i && InGame{x}) {
									
										seconds = MatchMaking[i][m_Timer];
										SendClientMessageEx(x, COLOR_YELLOW, "ไปยังพื้นที่การเล่นที่ทำเครื่องหมายไว้บนแผนที่ภายใน %s!", ConvertTimeTH(seconds, minutes));
										GZ_ShapeShowForPlayer(x, MatchMaking[i][m_WShrink], 0xFFFFFF77); 
										
										TextDrawShowForPlayer(x, MatchMaking[i][m_TDFadeText]);
										SetTimerEx("HideFadeText", 4000, false, "dd", x, i);
										
									}
								}

								MatchMaking[i][m_STATE]=STATE_START;
							}
						}
					}
				}
			}
		}
	}
	return 1;
}

forward MatchmakingSearch(playerid, type);
public MatchmakingSearch(playerid, type) {

	new bool:founder, str[128];
	new partyid = GetPlayerParty(playerid);
	
	for(new i=0;i!=MAX_MATCHMAKING;i++) {
		if(MatchMaking[i][m_EXIST] && MatchMaking[i][m_STATE] == STATE_WAITING && MatchMaking[i][m_Type] == type) {

			if(partyid != -1 && PartyInfo[partyid][pExists]) {
				new count_player = PartyCount(playerid);
				if(MatchMaking[i][m_Alive] + count_player <= MAX_PLAYER_PER_MATCH) {
					for(new m=0;m!=4;m++) {
						if(PartyInfo[partyid][pMember][m] != INVALID_PLAYER_ID) {
							new x = PartyInfo[partyid][pMember][m];
							
							MatchMaking[i][m_Alive]++;
							
							PlayerInMatching[x]=i;
							
							InGame{x} = true;
							PlayerReady{x} = false;
							
							HideLobbyMenu(x);
							CancelSelectTextDraw(x);
							
							GameTextForPlayer(x, "_", 1000, 3);
							
							TogglePlayerControllable(x, true);
							
							PlayerData[x][pIsDead] = false;
			
							format(str, 128,  "%s - %s", ReturnName(x), SERVER_GM_TEXT);
							PlayerTextDrawSetString(x, NameAndVersion[x], str);
							PlayerTextDrawShow(x, NameAndVersion[x]);
							TextDrawShowForPlayer(x,BGHealthBar);
			
							//PlayerCompass(x, true);
							leftRedArea[x]=true;
							
							SetPlayerHealthEx(x, 100);
							SetPlayerVirtualWorld(x, i+1);
			
							SetPlayerPos(x, 353.4516, 2501.5515, 16);
							SetCameraBehindPlayer(x);
							
							ShowMarkers(x);
							SetPartyBox(x, true);
							UpdatePartyBox(InParty[x], true);
							
						}
					}
					founder=true;
				}
			}
			else {
				if(MatchMaking[i][m_Alive]+1 <= MAX_PLAYER_PER_MATCH) {
					MatchMaking[i][m_Alive]++;
					PlayerInMatching[playerid]=i;
					InGame{playerid} = true;
					PlayerReady{playerid} = false;
					
					HideLobbyMenu(playerid);
					CancelSelectTextDraw(playerid);
					
					GameTextForPlayer(playerid, "_", 1000, 3);
					
					TogglePlayerControllable(playerid, true);
					
					PlayerData[playerid][pIsDead] = false;
	
					format(str, 128,  "%s - %s", ReturnName(playerid), SERVER_GM_TEXT);
					PlayerTextDrawSetString(playerid, NameAndVersion[playerid], str);
					PlayerTextDrawShow(playerid, NameAndVersion[playerid]);
					TextDrawShowForPlayer(playerid,BGHealthBar);
	
					//PlayerCompass(playerid, true);
					leftRedArea[playerid]=true;
					
					SetPlayerHealthEx(playerid, 100);
					SetPlayerVirtualWorld(playerid, i+1);
	
					SetPlayerPos(playerid, 353.4516, 2501.5515, 16);
					SetCameraBehindPlayer(playerid);
					
					founder=true;
				}
			}
			break;
		}
	}
	
	if(!founder) {
		for(new i=0;i!=MAX_MATCHMAKING;i++) {
			if(!MatchMaking[i][m_EXIST]) {
			
				MatchMaking[i][m_EXIST]=true;
				
				//printf("MATCH %d B %d", i, MatchMaking[i][m_Alive]);
			
				MatchMaking[i][m_Type] = type;
				
				MatchMaking[i][m_WShrink]=INVALID_GZ_SHAPE_ID;
				MatchMaking[i][m_BShrink]=INVALID_GZ_SHAPE_ID;
		
				MatchMaking[i][m_STATE]=STATE_WAITING;
				MatchMaking[i][m_Timer]=-1;
				
				// Create Car
				new carid;
				for(new x=0;x!=sizeof(CarRandomSpawn);x++) {
					if(random(20) > 0) {
						new model_rd;
						
						if(random(5) == 0) { // Motorcycle
							model_rd = random(sizeof(Motorcycle));
							MatchMaking[i][m_Car][carid] = CreateVehicle(Motorcycle[model_rd], CarRandomSpawn[x][0], CarRandomSpawn[x][1], CarRandomSpawn[x][2], CarRandomSpawn[x][3], -1, -1, -1);
						}
						else {
							model_rd = random(sizeof(GeneralVehicle));
							MatchMaking[i][m_Car][carid] = CreateVehicle(GeneralVehicle[model_rd], CarRandomSpawn[x][0], CarRandomSpawn[x][1], CarRandomSpawn[x][2], CarRandomSpawn[x][3], -1, -1, -1);
						}
						
						SetVehicleVirtualWorld(MatchMaking[i][m_Car][carid], i+1);
						//printf("Car %d in virtual world %d", MatchMaking[i][m_Car][carid], i+1);
						carid++;
					}
				}
				
				// Create TD
				MatchMaking[i][m_TDStartTime] = TextDrawCreate(318.982330, 193.639953, "MATCH STARTS IN~n~1:00");
				TextDrawLetterSize(MatchMaking[i][m_TDStartTime], 0.417600, 1.968357);
				TextDrawTextSize(MatchMaking[i][m_TDStartTime], 658.178405, 640.142272);
				TextDrawAlignment(MatchMaking[i][m_TDStartTime], 2);
				TextDrawColor(MatchMaking[i][m_TDStartTime], -855711745);
				TextDrawSetShadow(MatchMaking[i][m_TDStartTime], 2);
				TextDrawSetOutline(MatchMaking[i][m_TDStartTime], 0);
				TextDrawBackgroundColor(MatchMaking[i][m_TDStartTime], 51);
				TextDrawFont(MatchMaking[i][m_TDStartTime], 2);
				TextDrawSetProportional(MatchMaking[i][m_TDStartTime], 1);
				TextDrawHideForAll(MatchMaking[i][m_TDStartTime]);
				
				MatchMaking[i][m_TDAliveText] = TextDrawCreate(570.800170, 3.488882, " ALIVE");
				TextDrawLetterSize(MatchMaking[i][m_TDAliveText], 0.260399, 1.719465);
				TextDrawTextSize(MatchMaking[i][m_TDAliveText], 613.999938, -16.924446);
				TextDrawAlignment(MatchMaking[i][m_TDAliveText], 1);
				TextDrawColor(MatchMaking[i][m_TDAliveText], -1);
				TextDrawUseBox(MatchMaking[i][m_TDAliveText], true);
				TextDrawBoxColor(MatchMaking[i][m_TDAliveText], 170);
				TextDrawSetShadow(MatchMaking[i][m_TDAliveText], 0);
				TextDrawSetOutline(MatchMaking[i][m_TDAliveText], 1);
				TextDrawBackgroundColor(MatchMaking[i][m_TDAliveText], 12);
				TextDrawFont(MatchMaking[i][m_TDAliveText], 2);
				TextDrawSetProportional(MatchMaking[i][m_TDAliveText], 1);
				
				MatchMaking[i][m_TDAliveScore] = TextDrawCreate(547.800109, 3.488882, "  0");
				TextDrawLetterSize(MatchMaking[i][m_TDAliveScore], 0.260399, 1.719465);
				TextDrawTextSize(MatchMaking[i][m_TDAliveScore], 569.199279, -3.484430);
				TextDrawAlignment(MatchMaking[i][m_TDAliveScore], 1);
				TextDrawColor(MatchMaking[i][m_TDAliveScore], -1);
				TextDrawUseBox(MatchMaking[i][m_TDAliveScore], true);
				TextDrawBoxColor(MatchMaking[i][m_TDAliveScore], 128);
				TextDrawSetShadow(MatchMaking[i][m_TDAliveScore], 0);
				TextDrawSetOutline(MatchMaking[i][m_TDAliveScore], 0);
				TextDrawBackgroundColor(MatchMaking[i][m_TDAliveScore], 51);
				TextDrawFont(MatchMaking[i][m_TDAliveScore], 2);
				TextDrawSetProportional(MatchMaking[i][m_TDAliveScore], 1);
		
		
				if(partyid != -1 && PartyInfo[partyid][pExists]) {
					new count_player = PartyCount(playerid);
					if(MatchMaking[i][m_Alive] + count_player <= MAX_PLAYER_PER_MATCH) {
						for(new m=0;m!=4;m++) {
							if(PartyInfo[partyid][pMember][m] != INVALID_PLAYER_ID) {
								new x = PartyInfo[partyid][pMember][m];
								
								MatchMaking[i][m_Alive]++;
								
								PlayerInMatching[x]=i;
								
								InGame{x} = true;
								PlayerReady{x} = false;
								
								HideLobbyMenu(x);
								CancelSelectTextDraw(x);
								
								GameTextForPlayer(x, "_", 1000, 3);
								
								TogglePlayerControllable(x, true);
								
								PlayerData[x][pIsDead] = false;
				
								format(str, 128,  "%s - %s", ReturnName(x), SERVER_GM_TEXT);
								PlayerTextDrawSetString(x, NameAndVersion[x], str);
								PlayerTextDrawShow(x, NameAndVersion[x]);
								TextDrawShowForPlayer(x,BGHealthBar);
				
								//PlayerCompass(x, true);
								leftRedArea[x]=true;
								
								SetPlayerHealthEx(x, 100);
								SetPlayerVirtualWorld(x, i+1);
				
								SetPlayerPos(x, 353.4516, 2501.5515, 16);
								SetCameraBehindPlayer(x);
								
								ShowMarkers(x);
								SetPartyBox(x, true);
								UpdatePartyBox(InParty[x], true);
								
							}
						}
						founder=true;
					}
				}
				else {
					if(MatchMaking[i][m_Alive]+1 <= MAX_PLAYER_PER_MATCH) {
						MatchMaking[i][m_Alive]++;
						PlayerInMatching[playerid]=i;
						InGame{playerid} = true;
						PlayerReady{playerid} = false;
						
						HideLobbyMenu(playerid);
						CancelSelectTextDraw(playerid);
						
						GameTextForPlayer(playerid, "_", 1000, 3);
						
						TogglePlayerControllable(playerid, true);
						
						PlayerData[playerid][pIsDead] = false;
		
						format(str, 128,  "%s - %s", ReturnName(playerid), SERVER_GM_TEXT);
						PlayerTextDrawSetString(playerid, NameAndVersion[playerid], str);
						PlayerTextDrawShow(playerid, NameAndVersion[playerid]);
						TextDrawShowForPlayer(playerid,BGHealthBar);
		
						//PlayerCompass(playerid, true);
						leftRedArea[playerid]=true;
						
						SetPlayerHealthEx(playerid, 100);
						SetPlayerVirtualWorld(playerid, i+1);
		
						SetPlayerPos(playerid, 353.4516, 2501.5515, 16);
						SetCameraBehindPlayer(playerid);
						
						founder=true;
					}
				}
				
				founder=true;
				break;
			}
		}
	}
	// Create if one
	
	if(founder) {
		new count;
		for(new i=0;i!=MAX_MATCHMAKING;i++) {
			if(MatchMaking[i][m_EXIST]) {
				count++;
			}
		}
		if(count == 1) {
			bloodFaderTextDraw = TextDrawCreate(0.0, 0.0, "~r~");
			TextDrawTextSize(bloodFaderTextDraw, 640.0, 480.0);
			TextDrawLetterSize(bloodFaderTextDraw, 0.0, 50.0);
			TextDrawUseBox(bloodFaderTextDraw, 1);
		
			TDJump = TextDrawCreate(318.799926, 383.786682, "Press 'F' to jump off the plane");
			TextDrawLetterSize(TDJump, 0.449999, 1.600000);
			TextDrawAlignment(TDJump, 2);
			TextDrawColor(TDJump, -1);
			TextDrawSetShadow(TDJump, 0);
			TextDrawSetOutline(TDJump, 0);
			TextDrawBackgroundColor(TDJump, 51);
			TextDrawFont(TDJump, 2);
			TextDrawSetProportional(TDJump, 1);
		}
	}
	else {
		if(partyid != -1) {
			PartyPlayerText(partyid, "Ready");
			PartyReady(partyid, false);
			PartyPlayerGameText(partyid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~Servers are too busy", 2000);
		}
		else {
			GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~Servers are too busy", 2000, 3);
			PlayerTextDrawSetString(playerid, LobbyStart[playerid], "Start");
		}
	}
	return 1;
}

forward HideFadeText(playerid, matchid);
public HideFadeText(playerid, matchid) {
	return TextDrawHideForPlayer(playerid, MatchMaking[matchid][m_TDFadeText]);
}

forward UpdateAliveText(matchid);
public UpdateAliveText(matchid) {
	new str[128];
	if(MatchMaking[matchid][m_STATE] == STATE_WAITING) {
		TextDrawSetString(MatchMaking[matchid][m_TDAliveText], " JOINED");   
	}
	else {
		TextDrawSetString(MatchMaking[matchid][m_TDAliveText], " ALIVE");
	}
	
	format(str, 128, "%s%d", MatchMaking[matchid][m_Alive] < 10 ? ("  ") : MatchMaking[matchid][m_Alive] < 100 ? (" ") : (""), MatchMaking[matchid][m_Alive]);
	TextDrawSetString(MatchMaking[matchid][m_TDAliveScore], str); 
	
	foreach(new x : Player) {
		if(PlayerInMatching[x] == matchid && InGame{x}) {
			TextDrawShowForPlayer(x, MatchMaking[matchid][m_TDAliveText]);
			TextDrawShowForPlayer(x, MatchMaking[matchid][m_TDAliveScore]);
		}
	}
	return 1;
}

forward ShowKillText(playerid);
public ShowKillText(playerid) {
	
	TextDrawShowForPlayer(playerid, KillText);
	
	new str[64];
	format(str, 64, "%s%d", PlayerData[playerid][pKillScore] < 10 ? ("  ") : PlayerData[playerid][pKillScore] < 100 ? (" ") : (""), PlayerData[playerid][pKillScore]);
	PlayerTextDrawSetString(playerid, KillScore[playerid], str); 
	
	PlayerTextDrawShow(playerid, KillScore[playerid]);
	return 1;
}

forward HideKillText(playerid);
public HideKillText(playerid) {
	
	TextDrawHideForPlayer(playerid, KillText);
	PlayerTextDrawHide(playerid, KillScore[playerid]);
	return 1;
}

ResetMatchmaking(matchid) {

	if(IsValidDynamicArea(MatchMaking[matchid][m_DynamicShrink]))
		DestroyDynamicArea(MatchMaking[matchid][m_DynamicShrink]);

	if(MatchMaking[matchid][m_WShrink] != INVALID_GZ_SHAPE_ID) 
		GZ_ShapeDestroy(MatchMaking[matchid][m_WShrink]);
		
	if(MatchMaking[matchid][m_BShrink] != INVALID_GZ_SHAPE_ID) 
		GZ_ShapeDestroy(MatchMaking[matchid][m_BShrink]);		

	for(new i=0;i!=MAX_GAS_OBJECT;i++) {
		Object_DestroyCircle(MatchMaking[matchid][m_DynamicGas][i]);
	}

	for(new x=0;x!=MAX_CAR_SPAWN;x++) {
		if(MatchMaking[matchid][m_Car][x] && MatchMaking[matchid][m_Car][x] != INVALID_VEHICLE_ID) {
			DestroyVehicle(MatchMaking[matchid][m_Car][x]);
		}
	}
	
	MatchMaking[matchid][m_WShrink] = INVALID_GZ_SHAPE_ID;
	MatchMaking[matchid][m_BShrink] = INVALID_GZ_SHAPE_ID;
	
	MatchMaking[matchid][m_Alive]=
	MatchMaking[matchid][m_Timer]=
	MatchMaking[matchid][m_ShrinkID]=0;
	
	MatchMaking[matchid][m_DecreaseBShrink]=
	MatchMaking[matchid][m_WRad]=
	MatchMaking[matchid][m_BRad]=
	MatchMaking[matchid][m_WX]=
	MatchMaking[matchid][m_WY]=
	MatchMaking[matchid][m_BX]=
	MatchMaking[matchid][m_BY]=0.0;
	
	//DestroyVehicle(MatchMaking[matchid][m_Plane]);
	//FCNPC_Destroy(MatchMaking[matchid][m_Pilot]);
	
	MatchMaking[matchid][m_EXIST]=false;
	MatchMaking[matchid][m_STATE]=STATE_WAITING;
	
	TextDrawDestroy(MatchMaking[matchid][m_TDAliveText]);
	TextDrawDestroy(MatchMaking[matchid][m_TDAliveScore]);
	TextDrawDestroy(MatchMaking[matchid][m_TDFadeText]);
	TextDrawDestroy(MatchMaking[matchid][m_TDStartTime]);
	TextDrawDestroy(MatchMaking[matchid][m_TDTime]);

	// Create if one
	new count;
	for(new i=0;i!=MAX_MATCHMAKING;i++) {
		if(MatchMaking[i][m_EXIST]) {
			count++;
		}
	}
	if(count == 0) {
		foreach (new i : Player)
		{
			TextDrawStopBoxFadeForPlayer(i, bloodFaderTextDraw);
			TextDrawHideForPlayer(i, TDJump);
			HidePlayerPartyBox(i);
		}
		TextDrawDestroy(bloodFaderTextDraw);
		TextDrawDestroy(TDJump);
		bloodFaderTextDraw =
		TDJump = Text:INVALID_TEXT_DRAW;
	}
}

ResetPlayerToLobby(playerid) {

	new matchid = PlayerInMatching[playerid];
	if(matchid != -1) {
		if(!PlayerData[playerid][pIsDead]) {
			MatchMaking[matchid][m_Alive]--;
			if(MatchMaking[matchid][m_Alive] <= 0) ResetMatchmaking(matchid);
			else UpdateAliveText(matchid);
		}
		TextDrawHideForPlayer(playerid, MatchMaking[matchid][m_TDFadeText]);
		TextDrawHideForPlayer(playerid, MatchMaking[matchid][m_TDTime]);
		TextDrawHideForPlayer(playerid, MatchMaking[matchid][m_TDStartTime]);
		TextDrawHideForPlayer(playerid, MatchMaking[matchid][m_TDAliveText]);
		TextDrawHideForPlayer(playerid, MatchMaking[matchid][m_TDAliveScore]);
		
	}
	if(InPlane{playerid} || PlayerData[playerid][pIsDead]) TogglePlayerSpectating(playerid, false);
	
	InGame{playerid} = false;
	InPlane{playerid} = false;
	PlayerInMatching[playerid] = -1;

	PlayerMap(playerid, false);
	HidePlayerPartyBox(playerid);
	/*TogglePlayerSpectating(playerid, true);
	TogglePlayerControllable(playerid, false);
	defer AccountCheck(playerid);*/
	RemoveMarkers(playerid);
	ResetPlayerWeapons(playerid);
	LeaveParty(playerid);
	AccountCheck(playerid);
	
	PlayerTextDrawHide(playerid, NameAndVersion[playerid]);
	PlayerTextDrawHide(playerid, HealthBar[playerid]);
	TextDrawHideForPlayer(playerid, BGHealthBar);
	//UpdateKillText(playerid);
	
	TextDrawHideForPlayer(playerid, KillText);
	PlayerTextDrawHide(playerid, KillScore[playerid]);
	PlayerTextDrawDestroy(playerid, Runing[playerid]);
	PlayerTextDrawDestroy(playerid, RuningIcon[playerid]);
	TextDrawHideForPlayer(playerid, RuningBar);
	TextDrawHideForPlayer(playerid, WhiteBox);
	TextDrawHideForPlayer(playerid, TDJump);

	TextDrawHideForPlayer(playerid, EndingBackground);
	TextDrawHideForPlayer(playerid, EndingPointText);
	TextDrawHideForPlayer(playerid, EndingPlayer);
	TextDrawHideForPlayer(playerid, EndingLobby);

	PlayerTextDrawHide(playerid, EndingName[playerid]);
	PlayerTextDrawHide(playerid, EndingText[playerid]);
	PlayerTextDrawHide(playerid, EndingKill[playerid]);
	PlayerTextDrawHide(playerid, EndingRank[playerid]);
	PlayerTextDrawHide(playerid, EndingRankPoint[playerid]);
	PlayerTextDrawHide(playerid, EndingKillPoint[playerid]);
	PlayerTextDrawHide(playerid, EndingHitPoint[playerid]);
	PlayerTextDrawHide(playerid, EndingReward[playerid]);
	PlayerTextDrawHide(playerid, EndingLast[playerid]);
	
	TextDrawStopBoxFadeForPlayer(playerid, bloodFaderTextDraw);

	//PlayerCompass(playerid, false);
	
	if(TD_IsCircleCreated(playerid)) {
		TD_DestroyCircle(playerid);
	}
	
	PlayerData[playerid][pServivalTime]=0;
	PlayerData[playerid][pKillScore]=0;
	
}

forward PlayerMap(playerid, bool:on);
public PlayerMap(playerid, bool:on) {
	if(on) {
		openMap{playerid} = true;
		//TextDrawShowForPlayer(playerid, TDBackground);
		TextDrawShowForPlayer(playerid, TDBackground_Map);
		TextDrawShowForPlayer(playerid, TDBayside);
		TextDrawShowForPlayer(playerid, TDSF);
		TextDrawShowForPlayer(playerid, TDArea);
		TextDrawShowForPlayer(playerid, TDLS);
		TextDrawShowForPlayer(playerid, TDLV);
		TextDrawShowForPlayer(playerid, TDAirport);
		TextDrawShowForPlayer(playerid, TDAngel);
		TextDrawShowForPlayer(playerid, TDMount);
		
		PlayerTextDrawDestroy(playerid, PlayerMapIcon[playerid][0]);
		PlayerTextDrawDestroy(playerid, PlayerMapIcon[playerid][1]);
		PlayerTextDrawDestroy(playerid, PlayerMapIcon[playerid][2]);
		PlayerTextDrawDestroy(playerid, PlayerMapIcon[playerid][3]);
		PlayerTextDrawDestroy(playerid, PlayerMapName[playerid][0]);
		PlayerTextDrawDestroy(playerid, PlayerMapName[playerid][1]);
		PlayerTextDrawDestroy(playerid, PlayerMapName[playerid][2]);
		PlayerTextDrawDestroy(playerid, PlayerMapName[playerid][3]);		
		
		
		ShowKillText(playerid);
		//PlayerCompass(playerid, false);
		PlayerTextDrawHide(playerid, NameAndVersion[playerid]);
		PlayerTextDrawHide(playerid, HealthBar[playerid]);
		TextDrawHideForPlayer(playerid,BGHealthBar);
	
		if(PlayerInMatching[playerid] != -1) TextDrawHideForPlayer(playerid, MatchMaking[PlayerInMatching[playerid]][m_TDStartTime]);
	}
	else {
		openMap{playerid} = false;
		if(TD_IsCircleCreated(playerid)) {
			TD_DestroyCircle(playerid);
		}
		TextDrawHideForPlayer(playerid, TDBackground_Map);
		TextDrawHideForPlayer(playerid, TDBayside);
		TextDrawHideForPlayer(playerid, TDSF);
		TextDrawHideForPlayer(playerid, TDArea);
		TextDrawHideForPlayer(playerid, TDLS);
		TextDrawHideForPlayer(playerid, TDLV);
		TextDrawHideForPlayer(playerid, TDAirport);
		TextDrawHideForPlayer(playerid, TDAngel);
		TextDrawHideForPlayer(playerid, TDMount);
		//PlayerTextDrawDestroy(playerid, PlayerMapIcon[playerid]);
		PlayerTextDrawDestroy(playerid, PlayerMapIcon[playerid][0]);
		PlayerTextDrawDestroy(playerid, PlayerMapIcon[playerid][1]);
		PlayerTextDrawDestroy(playerid, PlayerMapIcon[playerid][2]);
		PlayerTextDrawDestroy(playerid, PlayerMapIcon[playerid][3]);
		PlayerTextDrawDestroy(playerid, PlayerMapName[playerid][0]);
		PlayerTextDrawDestroy(playerid, PlayerMapName[playerid][1]);
		PlayerTextDrawDestroy(playerid, PlayerMapName[playerid][2]);
		PlayerTextDrawDestroy(playerid, PlayerMapName[playerid][3]);
		
		HideKillText(playerid);
		//PlayerCompass(playerid, true);
		
		PlayerTextDrawShow(playerid, NameAndVersion[playerid]);
		PlayerTextDrawShow(playerid, HealthBar[playerid]);
		TextDrawShowForPlayer(playerid,BGHealthBar);

		if(PlayerInMatching[playerid] != -1) TextDrawShowForPlayer(playerid, MatchMaking[PlayerInMatching[playerid]][m_TDStartTime]);
	}
}

forward UpdatePlayerMap(playerid);
public UpdatePlayerMap(playerid) { 

	if(openMap{playerid}) {
	
		new Float:x, Float:y, Float:z, Float:icox, Float:icoy;
		
		if(InParty[playerid] != -1) {
		
			PlayerTextDrawDestroy(playerid, PlayerMapIcon[playerid][0]);
			PlayerTextDrawDestroy(playerid, PlayerMapIcon[playerid][1]);
			PlayerTextDrawDestroy(playerid, PlayerMapIcon[playerid][2]);
			PlayerTextDrawDestroy(playerid, PlayerMapIcon[playerid][3]);
		
			PlayerTextDrawDestroy(playerid, PlayerMapName[playerid][0]);
			PlayerTextDrawDestroy(playerid, PlayerMapName[playerid][1]);
			PlayerTextDrawDestroy(playerid, PlayerMapName[playerid][2]);
			PlayerTextDrawDestroy(playerid, PlayerMapName[playerid][3]);
			
			for(new i=0;i!=4;i++) {
				if(PartyInfo[InParty[playerid]][pMember][i] != INVALID_PLAYER_ID) {
		
					new MapIcon[24];
					if(InPlane{PartyInfo[InParty[playerid]][pMember][i]}) {
						GetVehiclePos(MatchMaking[PlayerInMatching[PartyInfo[InParty[playerid]][pMember][i]]][m_Plane], x, y, z);
						//PlayerMapIcon[playerid][i] = CreatePlayerTextDraw(playerid, icox, icoy, "hud:radar_airYard");
						format(MapIcon, 24, "hud:radar_airYard");
					}
					else {
						GetPlayerPos(PartyInfo[InParty[playerid]][pMember][i], x, y, z);
						//PlayerMapIcon[playerid][i] = CreatePlayerTextDraw(playerid, icox, icoy, "hud:arrow");
						format(MapIcon, 24, "hud:arrow");
					}
					
					icox = (x / 20) + (314.0);
					icoy = (-y / 20) + (215.0);
		
					PlayerMapIcon[playerid][i] = CreatePlayerTextDraw(playerid, icox, icoy, MapIcon);
					PlayerTextDrawLetterSize(playerid, PlayerMapIcon[playerid][i], 0.000000, 0.000000);
					PlayerTextDrawTextSize(playerid, PlayerMapIcon[playerid][i], 10.000000, 10.000000);
					PlayerTextDrawAlignment(playerid, PlayerMapIcon[playerid][i], 1);
					PlayerTextDrawColor(playerid, PlayerMapIcon[playerid][i], -1);
					PlayerTextDrawSetShadow(playerid, PlayerMapIcon[playerid][i], 0);
					PlayerTextDrawSetOutline(playerid, PlayerMapIcon[playerid][i], 0);
					PlayerTextDrawFont(playerid, PlayerMapIcon[playerid][i], 4);
					PlayerTextDrawShow(playerid, PlayerMapIcon[playerid][i]);
					
		
					PlayerMapName[playerid][i] = CreatePlayerTextDraw(playerid, icox + 5.0, icoy + 10.0, ReturnName(PartyInfo[InParty[playerid]][pMember][i]));
					PlayerTextDrawLetterSize(playerid, PlayerMapName[playerid][i], 0.161199, 0.918044);
					PlayerTextDrawAlignment(playerid, PlayerMapName[playerid][i], 1);
					
					switch(i) {
						case 0: PlayerTextDrawColor(playerid, PlayerMapName[playerid][i], TEAM_RED);
						case 1: PlayerTextDrawColor(playerid, PlayerMapName[playerid][i], TEAM_GREEN);
						case 2: PlayerTextDrawColor(playerid, PlayerMapName[playerid][i], TEAM_BLUE);
						case 3: PlayerTextDrawColor(playerid, PlayerMapName[playerid][i], TEAM_YELLOW);
					}
					PlayerTextDrawSetShadow(playerid, PlayerMapName[playerid][i], 0);
					PlayerTextDrawSetOutline(playerid, PlayerMapName[playerid][i], 1);
					PlayerTextDrawBackgroundColor(playerid, PlayerMapName[playerid][i], 51);
					PlayerTextDrawFont(playerid, PlayerMapName[playerid][i], 1);
					PlayerTextDrawSetProportional(playerid, PlayerMapName[playerid][i], 1);
					PlayerTextDrawShow(playerid, PlayerMapName[playerid][i]);
				}
			}	
		}
		else {
		
			PlayerTextDrawDestroy(playerid, PlayerMapIcon[playerid][0]);
			PlayerTextDrawDestroy(playerid, PlayerMapName[playerid][0]);
			
			
			GetPlayerPos(playerid, x, y, z);
			
			icox = (x / 20) + (314.0);
			icoy = (-y / 20) + (215.0);
		
			PlayerMapIcon[playerid][0] = CreatePlayerTextDraw(playerid, icox, icoy, "hud:arrow");
			PlayerTextDrawLetterSize(playerid, PlayerMapIcon[playerid][0], 0.000000, 0.000000);
			PlayerTextDrawTextSize(playerid, PlayerMapIcon[playerid][0], 10.000000, 10.000000);
			PlayerTextDrawAlignment(playerid, PlayerMapIcon[playerid][0], 1);
			PlayerTextDrawColor(playerid, PlayerMapIcon[playerid][0], -1);
			PlayerTextDrawSetShadow(playerid, PlayerMapIcon[playerid][0], 0);
			PlayerTextDrawSetOutline(playerid, PlayerMapIcon[playerid][0], 0);
			PlayerTextDrawFont(playerid, PlayerMapIcon[playerid][0], 4);
			PlayerTextDrawShow(playerid, PlayerMapIcon[playerid][0]);
			
			PlayerMapName[playerid][0] = CreatePlayerTextDraw(playerid, icox + 5.0, icoy + 10.0, ReturnName(playerid));
			PlayerTextDrawLetterSize(playerid, PlayerMapName[playerid][0], 0.161199, 0.918044);
			PlayerTextDrawAlignment(playerid, PlayerMapName[playerid][0], 1);
			PlayerTextDrawColor(playerid, PlayerMapName[playerid][0], -1);
			PlayerTextDrawSetShadow(playerid, PlayerMapName[playerid][0], 0);
			PlayerTextDrawSetOutline(playerid, PlayerMapName[playerid][0], 1);
			PlayerTextDrawBackgroundColor(playerid, PlayerMapName[playerid][0], 51);
			PlayerTextDrawFont(playerid, PlayerMapName[playerid][0], 1);
			PlayerTextDrawSetProportional(playerid, PlayerMapName[playerid][0], 1);
			PlayerTextDrawShow(playerid, PlayerMapName[playerid][0]);
		}
		
		if(!InPlane{playerid}) {
			if((MatchMaking[PlayerInMatching[playerid]][m_STATE]==STATE_START || MatchMaking[PlayerInMatching[playerid]][m_STATE]==STATE_BLUE_SHRINK)) {
				if(TD_IsCircleCreated(playerid)) {
					TD_DestroyCircle(playerid);
				}
				TD_CreateCircle(playerid, ".", 0xFFFFFFFF, 0x2E64FEFF, (MatchMaking[PlayerInMatching[playerid]][m_WX] / 20.0) + (314.0), (-MatchMaking[PlayerInMatching[playerid]][m_WY] / 20.0) + (235.0), MatchMaking[PlayerInMatching[playerid]][m_WRad]/20.0, 5.0, (MatchMaking[PlayerInMatching[playerid]][m_BX] / 20.0) + (314.0), (-MatchMaking[PlayerInMatching[playerid]][m_BY] / 20.0) + (235.0), MatchMaking[PlayerInMatching[playerid]][m_BRad]/20.0, 5.0);
			}
		}
	}	
	return 1;
}

forward PlayerTimeUI(playerid, bool:on);
public PlayerTimeUI(playerid, bool:on) {
	if(on && (MatchMaking[PlayerInMatching[playerid]][m_STATE]==STATE_START || MatchMaking[PlayerInMatching[playerid]][m_STATE]==STATE_BLUE_SHRINK) && !openMap{playerid}) {
		TimeUI{playerid} = true;
		TextDrawShowForPlayer(playerid, WhiteBox);
		TextDrawShowForPlayer(playerid, RuningBar);
		TextDrawShowForPlayer(playerid, MatchMaking[PlayerInMatching[playerid]][m_TDTime]);
		UpdatePlayerTimeUI(playerid);
	}
	else {
		TimeUI{playerid} = false;
		TextDrawHideForPlayer(playerid, WhiteBox);
		TextDrawHideForPlayer(playerid, RuningBar);
		TextDrawHideForPlayer(playerid, MatchMaking[PlayerInMatching[playerid]][m_TDTime]);
		PlayerTextDrawDestroy(playerid, Runing[playerid]);
		PlayerTextDrawDestroy(playerid, RuningIcon[playerid]);
	}
}

forward UpdatePlayerTimeUI(playerid);
public UpdatePlayerTimeUI(playerid) { 

	if(TimeUI{playerid}) {
	
		new temp_shrink_id = MatchMaking[PlayerInMatching[playerid]][m_ShrinkID], Float:increase_point;
		if(MatchMaking[PlayerInMatching[playerid]][m_STATE]==STATE_BLUE_SHRINK) {
			increase_point = 34 + (float(CircleData[temp_shrink_id][CIRCLEDATA_BLUETIME]-MatchMaking[PlayerInMatching[playerid]][m_Timer]) * 80.0 / float(CircleData[temp_shrink_id][CIRCLEDATA_BLUETIME])); //34 to 114 = 80
					
			if(increase_point > 114) {
				increase_point = 114;
			}
			else if(increase_point < 34) {
				increase_point = 34;
			}

			PlayerTextDrawDestroy(playerid, Runing[playerid]);
			Runing[playerid] = CreatePlayerTextDraw(playerid, increase_point, 314.104461, "usebox");
			PlayerTextDrawLetterSize(playerid, Runing[playerid], 0.000000, -0.120123);
			PlayerTextDrawTextSize(playerid, Runing[playerid], 27.199998, 0.000000);
			PlayerTextDrawAlignment(playerid, Runing[playerid], 1);
			PlayerTextDrawColor(playerid, Runing[playerid], 0);
			PlayerTextDrawUseBox(playerid, Runing[playerid], true);
			PlayerTextDrawBoxColor(playerid, Runing[playerid], 9232895);
			PlayerTextDrawShow(playerid, Runing[playerid]);
		}
		else {
			PlayerTextDrawDestroy(playerid, Runing[playerid]);
			Runing[playerid] = CreatePlayerTextDraw(playerid, 34.0, 314.104461, "usebox");
			PlayerTextDrawLetterSize(playerid, Runing[playerid], 0.000000, -0.120123);
			PlayerTextDrawTextSize(playerid, Runing[playerid], 27.199998, 0.000000);
			PlayerTextDrawAlignment(playerid, Runing[playerid], 1);
			PlayerTextDrawColor(playerid, Runing[playerid], 0);
			PlayerTextDrawUseBox(playerid, Runing[playerid], true);
			PlayerTextDrawBoxColor(playerid, Runing[playerid], 9232895);
			PlayerTextDrawShow(playerid, Runing[playerid]);
		}
		new Float:Zang;	
		MapAndreas_FindZ_For2DCoord(MatchMaking[PlayerInMatching[playerid]][m_WX], MatchMaking[PlayerInMatching[playerid]][m_WY], Zang);
		new Float: tempDistance = GetPlayerDistanceFromPoint(PlayerInMatching[playerid], MatchMaking[PlayerInMatching[playerid]][m_WX], MatchMaking[PlayerInMatching[playerid]][m_WY], Zang);
		tempDistance -= MatchMaking[PlayerInMatching[playerid]][m_WRad];
		increase_point = 19.8 + ((CircleData[temp_shrink_id][CIRCLEDATA_SIZE]-tempDistance) * 83 / CircleData[temp_shrink_id][CIRCLEDATA_SIZE]); //19.8 to 102.8 = 83
	
		if(increase_point > 102.8) {
			increase_point = 102.8;
		}
		else if(increase_point < 19.8) {
			increase_point = 19.8;
		}
		
		PlayerTextDrawDestroy(playerid, RuningIcon[playerid]);
		RuningIcon[playerid] = CreatePlayerTextDraw(playerid, increase_point, 290.702178, "ld_shtr:ship");
		PlayerTextDrawLetterSize(playerid,RuningIcon[playerid], 0.000000, 0.000000);
		PlayerTextDrawTextSize(playerid,RuningIcon[playerid], 22.400007, 25.386661);
		PlayerTextDrawAlignment(playerid,RuningIcon[playerid], 1);
		PlayerTextDrawColor(playerid,RuningIcon[playerid], -1);
		PlayerTextDrawSetShadow(playerid,RuningIcon[playerid], 0);
		PlayerTextDrawSetOutline(playerid,RuningIcon[playerid], 0);
		PlayerTextDrawFont(playerid,RuningIcon[playerid], 4);
		PlayerTextDrawShow(playerid, RuningIcon[playerid]);
	}	
	return 1;
}

forward UpdateHealthBar(playerid, Float:hp);								
public UpdateHealthBar(playerid, Float:hp) {
	if(PlayerInMatching[playerid] != -1 && InGame{playerid}) {
		new Float:h_percent = hp * 150.0 / 100.0;
		if(h_percent < 0) h_percent = 0;
		
		new color = 255, alpha = 128;
		
		if(hp < 100) {
			alpha = 255;
			if(hp < 70) {
				color = floatround(hp * 255 / 100.0);
				if(color > 255) {
					color = 255;
				}
				else if(color <= 0) {
					color = 0;
				}
			}
		}
		PlayerTextDrawTextSize(playerid, HealthBar[playerid], h_percent, 15.0); 
		PlayerTextDrawBoxColor(playerid, HealthBar[playerid], CreateRGB(255, color, color, alpha));
		
		if(!openMap{playerid}) PlayerTextDrawShow(playerid, HealthBar[playerid]);
	}
}

hook OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid, bodypart)
{
	if(PlayerInMatching[playerid] != -1 && InGame{playerid} && MatchMaking[PlayerInMatching[playerid]][m_STATE]!=STATE_WAITING) {
		
		new Float:health, Float:armour;
		health = PlayerData[playerid][pHealth];
		GetPlayerArmour(playerid, armour);
		
		if(issuerid != INVALID_PLAYER_ID)
		{
			PlayerData[issuerid][pMakeDamage] += amount;
			
			if(armour < 1)
			{
				if(health-amount > 0)
				{
					SetPlayerHealthEx(playerid,health-amount);
					return 1;
				}
			}
			else if(armour > 0)
			{
				if(bodypart == 3) {
					new Float:totalarmour;
					totalarmour = armour - amount;
	
					if(totalarmour > 0) {
						SetPlayerArmour(playerid, totalarmour);
						return 1;
					}
					else {
						totalarmour = amount - armour;
						SetPlayerArmour(playerid, 0);
						if(health-totalarmour > 0) {
							SetPlayerHealthEx(playerid,health-totalarmour);
							return 1;
						}
					}
				}
				else {
					if(health-amount > 0) {
						SetPlayerHealthEx(playerid,health-amount);
						return 1;
					}
				}
			}	
			GetPlayerPos(playerid, PlayerData[playerid][pPosX], PlayerData[playerid][pPosY], PlayerData[playerid][pPosZ]);
			GetPlayerFacingAngle(playerid, PlayerData[playerid][pPosA]);
			OnPlayerDeathEx(playerid, issuerid, weaponid);
		}
		else {
			if(health-amount > 0) {
				SetPlayerHealthEx(playerid,health-amount);
				return 1;
			}
			GetPlayerPos(playerid, PlayerData[playerid][pPosX], PlayerData[playerid][pPosY], PlayerData[playerid][pPosZ]);
			GetPlayerFacingAngle(playerid, PlayerData[playerid][pPosA]);
			OnPlayerDeathEx(playerid, issuerid, weaponid);
		}
		
		if(InParty[playerid] != -1) {
			UpdatePartyBox(InParty[playerid], false);
		}
		return 1;
	}
    return SetPlayerHealthEx(playerid, PlayerData[playerid][pHealth]);
}

hook OnPlayerDeath(playerid, killerid, reason) {
	GetPlayerPos(playerid, PlayerData[playerid][pPosX], PlayerData[playerid][pPosY], PlayerData[playerid][pPosZ]);
	GetPlayerFacingAngle(playerid, PlayerData[playerid][pPosA]);
	OnPlayerDeathEx(playerid, killerid, reason);
	return 1;
}

stock OnPlayerDeathEx(playerid, killerid, reason) {
	TogglePlayerSpectating(playerid, true);
	
	//new matchid = PlayerInMatching[playerid];
	
	/*new count_player;
	foreach(new i : Player) {
		if(PlayerInMatching[i] == matchid) count_player++;
	}
	
	if(count_player <= 1) {
		// Ending
		MatchMaking[matchid][m_Timer]=MATCH_TIME_FINISHED;
		MatchMaking[matchid][m_STATE]=STATE_FINISHED;
	}*/
	
	defer OnPlayerDeathTimer(playerid, killerid, reason);
	return 1;
}

timer OnPlayerDeathTimer[500](playerid, killerid, reason)
{
	if(!PlayerData[playerid][pIsDead]) {
	
		PlayerData[playerid][pIsDead] = true;
		
		SetPlayerCameraPos(playerid, PlayerData[playerid][pPosX] + 4.0, PlayerData[playerid][pPosY] + 4.0, PlayerData[playerid][pPosZ] + 1.0);
		SetPlayerCameraLookAt(playerid, PlayerData[playerid][pPosX], PlayerData[playerid][pPosY], PlayerData[playerid][pPosZ]);

		TextDrawStopBoxFadeForPlayer(playerid, bloodFaderTextDraw);
		new matchid = PlayerInMatching[playerid];
		if(matchid != -1) {
			MatchMaking[matchid][m_Alive]--;
			if(killerid != INVALID_PLAYER_ID) {
				PlayerData[killerid][pKillScore]++;
				ShowPlayerKillText(killerid, playerid, reason);
			}
			ShowPlayerDeathText(playerid, reason);
			PlayerData[playerid][pDeaths]++;
			UpdateAliveText(matchid);
			CheckWinner(matchid);
			
			foreach(new x : Player) {
				if(PlayerInMatching[x] == matchid) {
					if(MatchMaking[matchid][m_Alive]>1) {
						SendClientMessageEx(x, -1, "%s ถูกสังหารโดย %s - คงเหลือ %d", ReturnName(playerid), ReturnName(killerid), MatchMaking[matchid][m_Alive]);
					}
					else {
						if(killerid != INVALID_PLAYER_ID) {
							SendClientMessageEx(x, -1, "%s ถูกสังหารโดย %s - จบการแข่งขัน", ReturnName(playerid), ReturnName(killerid)); 
						}
						/*else {
							//SendClientMessageEx(x, -1, "%s ถูกสังหารโดย %s - จบการแข่งขัน", ReturnName(playerid), ReturnWeaponName(reason)); 
						}*/
					}
				}
			}
		}
	}
}

stock ShowPlayerKillText(killerid, playerid, reason) {
	new str[128];
	format(str, sizeof(str), "YOU killed %s with %s", ReturnName(playerid), ReturnWeaponName(reason));
	PlayerTextDrawSetString(killerid, PlayerKillText[killerid], str);
	PlayerTextDrawShow(killerid, PlayerKillText[killerid]);

	format(str, sizeof(str), "%d_kills", PlayerData[killerid][pKillScore]);
	PlayerTextDrawSetString(killerid, OnKill[killerid], str);
	PlayerTextDrawShow(killerid, OnKill[killerid]);
	
	if(PlayerKillTextTimer[killerid]) KillTimer(PlayerKillTextTimer[killerid]);
	PlayerKillTextTimer[killerid] = SetTimerEx("HidePlayerKillText", 8000, false, "d", killerid);
}

forward HidePlayerKillText(playerid);
public HidePlayerKillText(playerid) {

	PlayerTextDrawHide(playerid, PlayerKillText[playerid]);
	PlayerTextDrawHide(playerid, OnKill[playerid]);
}

stock ShowPlayerDeathText(playerid, reason) {

	new str[128];
	format(str, sizeof(str), "YOU died %s", ReturnWeaponName(reason));
	PlayerTextDrawSetString(playerid, PlayerKillText[playerid], str);
	PlayerTextDrawShow(playerid, PlayerKillText[playerid]);
	
	if(PlayerKillTextTimer[playerid]) KillTimer(PlayerKillTextTimer[playerid]);
	PlayerKillTextTimer[playerid] = SetTimerEx("HidePlayerDeathText", 8000, false, "d", playerid);
	
	ShowMatchFinished(playerid, true);
}

stock ShowMatchFinished(playerid, deadshow = false) {

	new str[128], rankpoint, killpoint, hitpoint, reward, deadcount;
	
	if(deadshow) {
		deadcount = 1;
		PlayerTextDrawSetString(playerid, EndingText[playerid], "BETTER LUCK NEXT TIME!");
	}
	else {
		PlayerTextDrawSetString(playerid, EndingText[playerid], "WINNER WINNER CHICKEN DINNER!");
	}
	PlayerTextDrawSetString(playerid, EndingName[playerid], ReturnName(playerid));
	PlayerTextDrawShow(playerid, EndingName[playerid]);
	
	PlayerTextDrawShow(playerid, EndingText[playerid]);
	
	format(str, sizeof(str), "KILL %d", PlayerData[playerid][pKillScore]);
	PlayerTextDrawSetString(playerid, EndingKill[playerid], str);
	PlayerTextDrawShow(playerid, EndingKill[playerid]);
	
	new matchid = PlayerInMatching[playerid];
	
	switch(MatchMaking[matchid][m_Type]) {
		case MATCHING_SOLO: {
			format(str, sizeof(str), "RANK_#%d", MatchSurvivalCount(matchid) + deadcount);
			PlayerTextDrawSetString(playerid, EndingRank[playerid], str);
			PlayerTextDrawShow(playerid, EndingRank[playerid]);
			
			killpoint = PlayerData[playerid][pKillScore] * 20;
			rankpoint = floatround(float(PlayerData[playerid][pServivalTime]) * 1.2);
		}
		case MATCHING_DUO: {
			format(str, sizeof(str), "TEAM_RANK_#%d", MatchSurvivalCount(matchid) + deadcount);
			PlayerTextDrawSetString(playerid, EndingRank[playerid], str);
			PlayerTextDrawShow(playerid, EndingRank[playerid]);
		
			killpoint = PlayerData[playerid][pKillScore] * 15;
			rankpoint = floatround(float(PlayerData[playerid][pServivalTime]) * 0.6);
		}
		case MATCHING_SQUAD: {
			format(str, sizeof(str), "TEAM_RANK_#%d", MatchSurvivalCount(matchid) + deadcount);
			PlayerTextDrawSetString(playerid, EndingRank[playerid], str);
			PlayerTextDrawShow(playerid, EndingRank[playerid]);
			
			killpoint = PlayerData[playerid][pKillScore] * 10;
			rankpoint = floatround(float(PlayerData[playerid][pServivalTime]) * 0.3);
		}
	}
	
	format(str, sizeof(str), "%d", rankpoint);
	PlayerTextDrawSetString(playerid, EndingRankPoint[playerid], str);
	PlayerTextDrawShow(playerid, EndingRankPoint[playerid]);
	
	
	format(str, sizeof(str), "%d", killpoint);
	PlayerTextDrawSetString(playerid, EndingKillPoint[playerid], str);
	PlayerTextDrawShow(playerid, EndingKillPoint[playerid]);
	
	hitpoint = floatround(PlayerData[playerid][pMakeDamage] / 5.0);
	format(str, sizeof(str), "%d", hitpoint);
	PlayerTextDrawSetString(playerid, EndingHitPoint[playerid], str);
	PlayerTextDrawShow(playerid, EndingHitPoint[playerid]);
	
	reward = rankpoint + hitpoint + killpoint;
	
	format(str, sizeof(str), "REWARD_____%d", reward);
	PlayerTextDrawSetString(playerid, EndingReward[playerid], str);
	PlayerTextDrawShow(playerid, EndingReward[playerid]);
	
	PlayerData[playerid][pBattlePoint] += reward;
	
	format(str, sizeof(str), "~y~#%d~w~/%d", MatchSurvivalCount(matchid) + deadcount, MatchMaking[matchid][m_max_team]);
	PlayerTextDrawSetString(playerid, EndingLast[playerid], str);
	PlayerTextDrawShow(playerid, EndingLast[playerid]);
	
	TextDrawShowForPlayer(playerid, EndingBackground);
	TextDrawShowForPlayer(playerid, EndingPointText);
	TextDrawShowForPlayer(playerid, EndingPlayer);
	TextDrawShowForPlayer(playerid, EndingLobby);
	
	// Disabled
	PlayerTextDrawHide(playerid, NameAndVersion[playerid]);
	TextDrawHideForPlayer(playerid,BGHealthBar);
	PlayerTextDrawHide(playerid, HealthBar[playerid]);
	
	//PlayerCompass(playerid, false);
}

forward HidePlayerDeathText(playerid);
public HidePlayerDeathText(playerid) {

	PlayerTextDrawHide(playerid, PlayerKillText[playerid]);
}

stock CheckWinner(matchid) {
		
	switch(MatchMaking[matchid][m_Type]) {
		case MATCHING_SOLO: {
			if(MatchMaking[matchid][m_Alive] == 1) {
			
				if(MatchMaking[matchid][m_Alive] == 1 && MatchMaking[matchid][m_STATE] == STATE_WAITING) {
					foreach(new x : Player) {
						if(PlayerInMatching[x] == matchid) {
							ResetPlayerToLobby(x);
							break;
						}
					}
					return 1;
				}
			
				foreach(new x : Player) {
					if(PlayerInMatching[x] == matchid && !PlayerData[x][pIsDead]) {
						TogglePlayerControllable(x, false);
						ShowMatchFinished(x);
						break;
					}
				}
				MatchMaking[matchid][m_Timer]=MATCH_TIME_FINISHED;
				MatchMaking[matchid][m_STATE]=STATE_FINISHED;
			}
			else if(MatchMaking[matchid][m_Alive] == 0) {
				MatchMaking[matchid][m_Timer]=MATCH_TIME_FINISHED;
				MatchMaking[matchid][m_STATE]=STATE_FINISHED;
			}
		}
		case MATCHING_DUO, MATCHING_SQUAD: {
			new count, teamid = -1, playerid = INVALID_PLAYER_ID;
			
			for(new i=0;i!=MAX_PARTIES;i++) {
				if(PartyInfo[i][pExists]) {
					for(new x=0;x!=MAX_PARTY_MEMBER;x++) {
						if(PartyInfo[i][pMember][x] != INVALID_PLAYER_ID && PlayerInMatching[PartyInfo[i][pMember][x]] == matchid && !PlayerData[PartyInfo[i][pMember][x]][pIsDead]) {
							count++;
							teamid = i;
							break;
						}
					}
				}
			}
			
			foreach(new x : Player) {
				if(PlayerInMatching[x] == matchid && InParty[x] == -1 && !PlayerData[x][pIsDead]) {
					playerid = x;
					count++;
				}
			}
	
			if(count == 1) {
		
				if(MatchMaking[matchid][m_STATE] == STATE_WAITING) {

					if(teamid != -1) {
						for(new x=0;x!=MAX_PARTY_MEMBER;x++) {
							if(PartyInfo[teamid][pMember][x] != INVALID_PLAYER_ID) {
								ResetPlayerToLobby(PartyInfo[teamid][pMember][x]);
							}
						}
					}
					else if(playerid != INVALID_PLAYER_ID) {
						ResetPlayerToLobby(playerid);
					}
					
					return 1;
				}
				
				// Winner Here
				if(teamid != -1) {
					for(new x=0;x!=MAX_PARTY_MEMBER;x++) {
						if(PartyInfo[teamid][pMember][x] != INVALID_PLAYER_ID) {
							TogglePlayerControllable(PartyInfo[teamid][pMember][x], false);
							ShowMatchFinished(PartyInfo[teamid][pMember][x]);
							
							//printf("%s Winner", ReturnName(PartyInfo[teamid][pMember][x]));
						}
					}
				}
				else if(playerid != INVALID_PLAYER_ID) {
					TogglePlayerControllable(playerid, false);
					ShowMatchFinished(playerid);
					
					//printf("%s Winner", ReturnName(playerid));	
				}
				MatchMaking[matchid][m_Timer]=MATCH_TIME_FINISHED;
				MatchMaking[matchid][m_STATE]=STATE_FINISHED;
			}
			else if(count == 0) {
				MatchMaking[matchid][m_Timer]=MATCH_TIME_FINISHED;
				MatchMaking[matchid][m_STATE]=STATE_FINISHED;
			}
		}
	}
	return 1;
}

stock MatchSurvivalCount(matchid) {
	new count;
	for(new i=0;i!=MAX_PARTIES;i++) {
		if(PartyInfo[i][pExists]) {
			for(new x=0;x!=MAX_PARTY_MEMBER;x++) {
				if(PartyInfo[i][pMember][x] != INVALID_PLAYER_ID && PlayerInMatching[PartyInfo[i][pMember][x]] == matchid && !PlayerData[PartyInfo[i][pMember][x]][pIsDead]) {
					count++;
					break;
				}
			}
		}
	}
	
	foreach(new x : Player) {
		if(PlayerInMatching[x] == matchid && InParty[x] == -1 && !PlayerData[x][pIsDead]) {
			count++;
		}
	}
	return count;
}

CMD:gamehelp(playerid) {
	SendClientMessage(playerid, -1, "[GAME] /map - เปิดแผนที่และสามารถใช้ปุ่มลัดเปิดแผนที่ได้โดยกดเมาส์ตรงกลางหรือกดเลข 1 ใน NUMPAD");
	SendClientMessage(playerid, -1, "[GAME] /exit - ออกจากแมตซ์");
	return 1;
}