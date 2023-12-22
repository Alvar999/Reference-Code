/* MatchingInfo MAIN.PWN*/
#include <YSI\y_hooks>

#define MAX_PLAYER_PER_MATCH	100 //จำกัดผู้เล่นต่อแมตซ์ // Player per match
#define MAX_MATCHINGINFO 		3 //จำนวนห้อง // maximum match, recommend 1-3 maximum is 5
#define MIN_PLAYER_FOR_START	1 //จำนวนผู้เล่นอย่างต่ำก่อนเริ่มนับเวลา // min player on match before start countdown
#define TIME_WAITING_TO_START	10 //เวลาสำหรับรอผู้เล่นก่อนเริ่มกระโดดร่ม // wait time for going to plane
#define TIME_BEFORE_FINISH		30 //เวลาก่อนจบแมตซ์ // time after match end

#define MAX_CAR_SPAWN		200
#define MAX_GAS_OBJECT		10 // MAX 20
#define GAS_AREA_DISTANCE	500.0

#define CIRCLEDATA_WHITETIME 	0
#define CIRCLEDATA_SIZE 		1
#define CIRCLEDATA_BLUETIME 	2

#define GZ_AMOUNT_OF_SQUARE		170
#define GZ_SQUARE_SIZE			5

new PlayerInPlane[MAX_PLAYERS];

enum {
	STATE_JOIN,
	STATE_START,
	STATE_WHITE,
	STATE_BLUE,
	STATE_FINISHED
};

enum E_MATCHING_DATA {
	bool:m_EXIST,
	m_STATE, // 
	m_Timer, // 
	m_Type,

	m_Player,
	m_Party,
	
	Float:m_WRad, //ขนาดโซนขาว
	Float:m_BRad, //ขนาดโซนน้ำเงิน
	
	Float:m_WX, // จำแหน่งจุดขาว X
	Float:m_WY, // จำแหน่งจุดขาว Y
	Float:m_BX, // จำแหน่งจุดน้ำเงิน X
	Float:m_BY, // จำแหน่งจุดน้ำเงิน Y
	
	Float:m_DecreaseBShrink, // ค่าสำหรับลดขนาดโซนน้ำเงิน
	
	m_WShrink, // Gangzone โซนขาว
	m_BShrink, // Gangzone โซนน้ำเงิน
	
	m_DynamicGas[MAX_GAS_OBJECT], // Object โซนน้ำเงิน
	
	m_DynamicShrink, // Dynamic Zone by Streamer สำหรับตรวจสอบผู้เล่นเข้า-ออกโซน
	
	m_circleID,
	
	m_Car[MAX_CAR_SPAWN],
	
	m_Pilot,
	m_Plane
};

new MatchingInfo[MAX_MATCHINGINFO][E_MATCHING_DATA];

new const CircleData[][8] = { // Start Shrink , Size, Blue meet white
	{100,1500,100},
	{65,990,45},
	{50,495,30}, 
	{40,250,20},  
	{40,120,20},   
	{30,60,10},   
	{30,30,10},   
	{20,10,10}
};
/*
//Fast shrink
new const CircleData[][8] = { // Start Shrink , Size, Blue meet white
	{5,1200,5},
	{300,990,45},
	{50,495,30}, 
	{40,250,20},  
	{40,120,20},   
	{30,60,10},   
	{30,30,10},   
	{20,10,10}
};*/

/*
new const CircleData[][8] = { // Start Shrink , Size, Blue meet white
	{20,1200,20},
	{20,960,20},
	{20,420,20}, 
	{20,200,20},  
	{20,100,20},   
	{10,50,10},   
	{10,10,10},   
	{10,1,5}
};*/
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

GetMatchingType(matchingid) {
	static name[16];
	switch(matchingid) {
		case MATCHING_SOLO: format(name, 16, "Solo");
		case MATCHING_DUO: format(name, 16, "Duo");
		case MATCHING_SQUAD: format(name, 16, "Squad");
	}
	return name;
}

task MatchingInfoTimer[1000]()
{

	for(new i=0;i!=MAX_MATCHINGINFO;i++) {

		if(MatchingInfo[i][m_EXIST]) {
		
			//printf("[MM] state:%d time:%d",  MatchingInfo[i][m_STATE], MatchingInfo[i][m_Timer]);
		
		
			switch(MatchingInfo[i][m_STATE]) {
				case STATE_JOIN: {
					
					new str[128];	
					
					if(MatchingInfo[i][m_Timer] > 0) {
						//SendLobbyMessage(-1, "เซิร์ฟเวอร์ %d (%s) | ผู้เล่น: %d | จะเริ่มในอีก %d", i+1, GetMatchingType(MatchingInfo[i][m_Type]), MatchingInfo[i][m_Player], MatchingInfo[i][m_Timer]);
						
						foreach (new x : Player)
						{
							if (!Lobby_IsPlayerInGame(x)) {
								format(str, 128, "เซิร์ฟเวอร์ %d (%s) | ผู้เล่น: %d | จะเริ่มในอีก %d", i+1, GetMatchingType(MatchingInfo[i][m_Type]), MatchingInfo[i][m_Player], MatchingInfo[i][m_Timer]);
								SendClientMessage(x, -1, str);
							}
						}
						printf("Matching %d (%s) Start in %d", i, GetMatchingType(MatchingInfo[i][m_Type]), MatchingInfo[i][m_Timer]);
					}
					else {
						if(MatchingInfo[i][m_Timer] == 0) { // โดดร่ม
						
							MatchingInfo[i][m_STATE]=STATE_START;
							MatchingInfo[i][m_Timer]=CircleData[MatchingInfo[i][m_circleID]][CIRCLEDATA_WHITETIME];
							
							// ตั้งค่าเครื่องบิน
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
							SetVehiclePos(MatchingInfo[i][m_Plane], rd_flight_x, rd_flight_y, 1000);
							FCNPC_PutInVehicle(MatchingInfo[i][m_Pilot], MatchingInfo[i][m_Plane], 0);
							FCNPC_GoTo(MatchingInfo[i][m_Pilot], rd_des_x, rd_des_y, 1000, FCNPC_MOVE_TYPE_AUTO, 8.0); //FCNPC_MOVE_SPEED_AUTO
							
							printf("Matching %d Start Plane", i);
						}
						else {
							if(MatchingInfo[i][m_Player] >= MIN_PLAYER_FOR_START) {
								MatchingInfo[i][m_Timer] = TIME_WAITING_TO_START;
							}
							else {
								//SendLobbyMessage(-1, "เซิร์ฟเวอร์ %d (%s) | ผู้เล่น: %d | ต้องการผู้เล่นอีก: %d", i+1, GetMatchingType(MatchingInfo[i][m_Type]), MatchingInfo[i][m_Player], MIN_PLAYER_FOR_START - MatchingInfo[i][m_Player]);
								
								foreach (new x : Player)
								{
									if (!Lobby_IsPlayerInGame(x)) {
										format(str, 128, "เซิร์ฟเวอร์ %d (%s) | ผู้เล่น: %d | ต้องการผู้เล่นอีก: %d", i+1, GetMatchingType(MatchingInfo[i][m_Type]), MatchingInfo[i][m_Player], MIN_PLAYER_FOR_START - MatchingInfo[i][m_Player]);
										SendClientMessage(x, -1, str);
									}
								}
								printf("Matching %d (%s) wait more %d player(s)", i, GetMatchingType(MatchingInfo[i][m_Type]), MIN_PLAYER_FOR_START - MatchingInfo[i][m_Player]);
							}
						}
					}
				}
				case STATE_START: {

					if(MatchingInfo[i][m_Timer]==0) {

						new temp_shrink_id = MatchingInfo[i][m_circleID];
						
						/*new Float:Zang;
						MapAndreas_FindZ_For2DCoord(MatchingInfo[i][m_WX]+ MatchingInfo[i][m_WRad], MatchingInfo[i][m_WY] + MatchingInfo[i][m_WRad], Zang);
						SetPlayerPos(0, MatchingInfo[i][m_WX]+ MatchingInfo[i][m_WRad], MatchingInfo[i][m_WY] + MatchingInfo[i][m_WRad], Zang);*/
						
						MatchingInfo[i][m_WRad]=CircleData[temp_shrink_id][CIRCLEDATA_SIZE];
						MatchingInfo[i][m_BRad]=MAP_SIZE_LIMIT;
						
						if(random(2)==0) MatchingInfo[i][m_WX] = random(floatround(MatchingInfo[i][m_BRad]-1000.0-MatchingInfo[i][m_WRad]));
						else MatchingInfo[i][m_WX] = -(random(floatround(MatchingInfo[i][m_BRad]-1000.0-MatchingInfo[i][m_WRad])));
						if(random(2)==0) MatchingInfo[i][m_WY] = random(floatround(MatchingInfo[i][m_BRad]-1000.0-MatchingInfo[i][m_WRad]));
						else MatchingInfo[i][m_WY] = -(random(floatround(MatchingInfo[i][m_BRad]-1000.0-MatchingInfo[i][m_WRad])));
						
						if(MatchingInfo[i][m_WShrink] != INVALID_GZ_SHAPE_ID) GZ_ShapeDestroy(MatchingInfo[i][m_WShrink]);
						MatchingInfo[i][m_WShrink] = GZ_ShapeCreate(CIRCUMFERENCE, MatchingInfo[i][m_WX], MatchingInfo[i][m_WY], MatchingInfo[i][m_WRad], GZ_AMOUNT_OF_SQUARE, GZ_SQUARE_SIZE);

						if(IsValidDynamicArea(MatchingInfo[i][m_DynamicShrink])) DestroyDynamicArea(MatchingInfo[i][m_DynamicShrink]);
						MatchingInfo[i][m_DynamicShrink] = CreateDynamicCircle(MatchingInfo[i][m_BX], MatchingInfo[i][m_BY], MAP_SIZE_LIMIT, i+1);			
						
						//1.448
						new Float:diff = 1.448;
						new Float:temp_gas = -14.4;		
						for(new x=0;x!=MAX_GAS_OBJECT;x++) {
							MatchingInfo[i][m_DynamicGas][x] = Object_CreateCircle(10444, MatchingInfo[i][m_BX], MatchingInfo[i][m_BY], temp_gas, 0.0, 0.0, 0.0, MatchingInfo[i][m_BRad], diff, i+1, -1, GAS_AREA_DISTANCE, GAS_AREA_DISTANCE); 
							temp_gas += 14.4;
						}

						MatchingInfo[i][m_DecreaseBShrink] = (MatchingInfo[i][m_BRad]-MatchingInfo[i][m_WRad])/CircleData[temp_shrink_id][CIRCLEDATA_BLUETIME];
						
						MatchingInfo[i][m_Timer] = CircleData[temp_shrink_id][CIRCLEDATA_WHITETIME];
						MatchingInfo[i][m_STATE] = STATE_WHITE;
						
						foreach(new x : Player) if(PlayerJoined[x] == i) {
							GZ_ShapeShowForPlayer(x, MatchingInfo[i][m_WShrink], 0xFFFFFF77);
						}
						printf("Matching %d Start White Zone [SIZE:%f] %f, %f", i, MatchingInfo[i][m_WRad], MatchingInfo[i][m_WX], MatchingInfo[i][m_WY]);
					}
				
				}
				case STATE_WHITE: {

					if(MatchingInfo[i][m_Timer]==0) {
						new temp_shrink_id = MatchingInfo[i][m_circleID];
						
						MatchingInfo[i][m_Timer]=CircleData[temp_shrink_id][CIRCLEDATA_BLUETIME];
						MatchingInfo[i][m_STATE]=STATE_BLUE;
						
						printf("Matching %d Start Blue Zone to White Zone", i);
					}
				
				}
				
				case STATE_BLUE: {

					if(MatchingInfo[i][m_Timer]) {
					
						if(MatchingInfo[i][m_BX] < MatchingInfo[i][m_WX]) {
							MatchingInfo[i][m_BX] += (MatchingInfo[i][m_WX]-MatchingInfo[i][m_BX])/MatchingInfo[i][m_Timer];
						}
						else {
							MatchingInfo[i][m_BX] -= (MatchingInfo[i][m_BX]-MatchingInfo[i][m_WX])/MatchingInfo[i][m_Timer];
						}
						if(MatchingInfo[i][m_BY] < MatchingInfo[i][m_WY]) {
							MatchingInfo[i][m_BY] += (MatchingInfo[i][m_WY]-MatchingInfo[i][m_BY])/MatchingInfo[i][m_Timer];
						}
						else {
							MatchingInfo[i][m_BY] -= (MatchingInfo[i][m_BY]-MatchingInfo[i][m_WY])/MatchingInfo[i][m_Timer];
						}
						
						MatchingInfo[i][m_BRad]-=MatchingInfo[i][m_DecreaseBShrink];
						if(MatchingInfo[i][m_BRad]-MatchingInfo[i][m_DecreaseBShrink]<MatchingInfo[i][m_WRad]) {
							MatchingInfo[i][m_BRad] = MatchingInfo[i][m_WRad];
							MatchingInfo[i][m_BX] = MatchingInfo[i][m_WX];
							MatchingInfo[i][m_BY] = MatchingInfo[i][m_WY];
							MatchingInfo[i][m_Timer] = 0;
						}

						if(MatchingInfo[i][m_BShrink] != INVALID_GZ_SHAPE_ID) GZ_ShapeDestroy(MatchingInfo[i][m_BShrink]);
						MatchingInfo[i][m_BShrink] = GZ_ShapeCreate(EMPTY_CIRCLE, MatchingInfo[i][m_BX], MatchingInfo[i][m_BY], MatchingInfo[i][m_BRad], GZ_AMOUNT_OF_SQUARE, GZ_SQUARE_SIZE);
						
						Streamer_SetFloatData(STREAMER_TYPE_AREA, MatchingInfo[i][m_DynamicShrink], E_STREAMER_X, MatchingInfo[i][m_BX]);
						Streamer_SetFloatData(STREAMER_TYPE_AREA, MatchingInfo[i][m_DynamicShrink], E_STREAMER_Y, MatchingInfo[i][m_BY]);
						Streamer_SetFloatData(STREAMER_TYPE_AREA, MatchingInfo[i][m_DynamicShrink], E_STREAMER_SIZE, MatchingInfo[i][m_BRad]);
					
						new Float:diff = 1.448; // 1.448
						new Float:temp_gas = -14.4;		
						for(new x=0;x!=MAX_GAS_OBJECT;x++) {
							Object_SetCirclePos(MatchingInfo[i][m_DynamicGas][x], MatchingInfo[i][m_BX], MatchingInfo[i][m_BY], temp_gas);
							Object_SetCircleModel(MatchingInfo[i][m_DynamicGas][x], 10444, MatchingInfo[i][m_BRad], diff);
							temp_gas += 14.4;
						}
						
						foreach(new x : Player) if(PlayerJoined[x] == i) {
							GZ_ShapeShowForPlayer(x, MatchingInfo[i][m_BShrink], 0x2E64FE95);
							Streamer_Update(x, STREAMER_TYPE_OBJECT);
						}
					}
					else {
						if(MatchingInfo[i][m_circleID] < sizeof(CircleData)-1) {
						
							new temp_shrink_id = ++MatchingInfo[i][m_circleID];

							MatchingInfo[i][m_WRad] = CircleData[temp_shrink_id][CIRCLEDATA_SIZE];
						
							new Float:distFromCenter = MatchingInfo[i][m_WRad] + (1.0+(float(random(10)+1)/10)) * (MatchingInfo[i][m_BRad] - MatchingInfo[i][m_WRad] * 2);
							new Float:p2 = 3.141592 * 2;
							new Float:angle = float(random(10))/10.0 * p2;
							
							MatchingInfo[i][m_WX] = MatchingInfo[i][m_BX] + distFromCenter * floatcos(angle, radian);
							MatchingInfo[i][m_WY] = MatchingInfo[i][m_BY] + distFromCenter * floatsin(angle, radian);
							
							if(MatchingInfo[i][m_WShrink] != INVALID_GZ_SHAPE_ID) GZ_ShapeDestroy(MatchingInfo[i][m_WShrink]);
							MatchingInfo[i][m_WShrink] = GZ_ShapeCreate(CIRCUMFERENCE, MatchingInfo[i][m_WX], MatchingInfo[i][m_WY], MatchingInfo[i][m_WRad], GZ_AMOUNT_OF_SQUARE, GZ_SQUARE_SIZE);
							
							MatchingInfo[i][m_Timer] = CircleData[temp_shrink_id][CIRCLEDATA_WHITETIME];
	
							MatchingInfo[i][m_DecreaseBShrink] = (MatchingInfo[i][m_BRad]-MatchingInfo[i][m_WRad])/CircleData[temp_shrink_id][CIRCLEDATA_BLUETIME];
							
							MatchingInfo[i][m_STATE]=STATE_WHITE;
							
							foreach(new x : Player) if(PlayerJoined[x] == i) {
								GZ_ShapeShowForPlayer(x, MatchingInfo[i][m_WShrink], 0xFFFFFF77);
							}
							printf("Matching %d Start New White Zone [SIZE:%f] %f, %f", i, MatchingInfo[i][m_WRad], MatchingInfo[i][m_WX], MatchingInfo[i][m_WY]);
						}
						else {
							MatchingInfo[i][m_Timer]=-1;
							MatchingInfo[i][m_STATE]=STATE_FINISHED;
						}
					}
				
				}
				case STATE_FINISHED: {
					if(MatchingInfo[i][m_Timer]==0) {
						MatchingReset(i);
						ResetAllPlayerToLobby(i);
					}
				}
				
			}
		}
		
		if(MatchingInfo[i][m_STATE] == STATE_WHITE || MatchingInfo[i][m_STATE] == STATE_BLUE) {
			foreach(new x : Player) if(PlayerJoined[x] == i) {
				if(IsPlayerOpenMap(x)) {
					if(TD_IsCircleCreated(x)) {
						TD_DestroyCircle(x);
					}
					TD_CreateCircle(x, ".", 0xFFFFFFFF, 0x2E64FEFF, (MatchingInfo[i][m_WX] / 20.0) + (314.0), (-MatchingInfo[i][m_WY] / 20.0) + (235.0), MatchingInfo[i][m_WRad]/20.0, 5.0, (MatchingInfo[i][m_BX] / 20.0) + (314.0), (-MatchingInfo[i][m_BY] / 20.0) + (235.0), MatchingInfo[i][m_BRad]/20.0, 5.0);
				}
			}
		}	
		
		if(MatchingInfo[i][m_Timer]>0) {
			MatchingInfo[i][m_Timer]--;
		}
		else {
			MatchingInfo[i][m_Timer]=-1;
		}	
		
	}
	return 1;
}

hook OnGameModeInit() {
	for(new i=0;i!=MAX_MATCHINGINFO;i++) {
		MatchingInfo[i][m_STATE]=STATE_JOIN;
		MatchingInfo[i][m_Type]=MATCHING_SOLO;
		MatchingInfo[i][m_Timer]=-1;
		MatchingInfo[i][m_EXIST]=false;
	}
	
	/*new i = 0;
	MatchingInfo[i][m_EXIST]=true;
	MatchingInfo[i][m_Type] = MATCHING_SOLO;
	
	MatchingInfo[i][m_WShrink]=INVALID_GZ_SHAPE_ID;
	MatchingInfo[i][m_BShrink]=INVALID_GZ_SHAPE_ID;
	
	MatchingInfo[i][m_STATE]=STATE_JOIN;
	MatchingInfo[i][m_Timer]=10;
	
	// Create Car
	new carid;
	for(new x=0;x!=sizeof(CarRandomSpawn);x++) {
		if(random(20) > 0) {
			new model_rd;
			
			if(random(5) == 0) { // Motorcycle
				model_rd = random(sizeof(Motorcycle));
				MatchingInfo[i][m_Car][carid] = CreateVehicle(Motorcycle[model_rd], CarRandomSpawn[x][0], CarRandomSpawn[x][1], CarRandomSpawn[x][2], CarRandomSpawn[x][3], -1, -1, -1);
			}
			else {
				model_rd = random(sizeof(GeneralVehicle));
				MatchingInfo[i][m_Car][carid] = CreateVehicle(GeneralVehicle[model_rd], CarRandomSpawn[x][0], CarRandomSpawn[x][1], CarRandomSpawn[x][2], CarRandomSpawn[x][3], -1, -1, -1);
			}
			
			SetVehicleVirtualWorld(MatchingInfo[i][m_Car][carid], i+1);
			carid++;
		}
	}*/
	return 1;
}

hook OnGameModeExit() {
	for(new i=0;i!=MAX_MATCHINGINFO;i++) {
		MatchingInfo[i][m_STATE]=STATE_JOIN;
		MatchingInfo[i][m_Type]=MATCHING_SOLO;
		MatchingInfo[i][m_Timer]=-1;
		MatchingInfo[i][m_EXIST]=false;
	}
	return 1;
}

hook OnPlayerConnect(playerid) {
	PlayerInPlane[playerid]=INVALID_VEHICLE_ID;
	
	for(new i = 0; i < 5; i++)
		SendDeathMessageToPlayer(playerid, 1001, 1001, 200);
}

MatchingReset(matchingid) {

	if(IsValidDynamicArea(MatchingInfo[matchingid][m_DynamicShrink]))
		DestroyDynamicArea(MatchingInfo[matchingid][m_DynamicShrink]);

	if(MatchingInfo[matchingid][m_WShrink] != INVALID_GZ_SHAPE_ID) 
		GZ_ShapeDestroy(MatchingInfo[matchingid][m_WShrink]);
		
	if(MatchingInfo[matchingid][m_BShrink] != INVALID_GZ_SHAPE_ID) 
		GZ_ShapeDestroy(MatchingInfo[matchingid][m_BShrink]);		

	for(new i=0;i!=MAX_GAS_OBJECT;i++) {
		Object_DestroyCircle(MatchingInfo[matchingid][m_DynamicGas][i]);
	}

	for(new x=0;x!=MAX_CAR_SPAWN;x++) {
		if(MatchingInfo[matchingid][m_Car][x] && MatchingInfo[matchingid][m_Car][x] != INVALID_VEHICLE_ID) {
			DestroyVehicle(MatchingInfo[matchingid][m_Car][x]);
		}
	}
	
	MatchingInfo[matchingid][m_WShrink] = INVALID_GZ_SHAPE_ID;
	MatchingInfo[matchingid][m_BShrink] = INVALID_GZ_SHAPE_ID;
	
	MatchingInfo[matchingid][m_Player]=
	MatchingInfo[matchingid][m_Party]=
	MatchingInfo[matchingid][m_Timer]=
	MatchingInfo[matchingid][m_circleID]=0;
	
	MatchingInfo[matchingid][m_DecreaseBShrink]=
	MatchingInfo[matchingid][m_WRad]=
	MatchingInfo[matchingid][m_BRad]=
	MatchingInfo[matchingid][m_WX]=
	MatchingInfo[matchingid][m_WY]=
	MatchingInfo[matchingid][m_BX]=
	MatchingInfo[matchingid][m_BY]=0.0;
	
	MatchingInfo[matchingid][m_EXIST]=false;
	MatchingInfo[matchingid][m_STATE]=STATE_JOIN;
	
	printf("Matching %d reset", matchingid);

	return 1;
}

MatchingSearch(playerid, partyid = NO_PARTY) {

	new bool:founder;
	for(new i=0;i!=MAX_MATCHINGINFO;i++) {
		if(MatchingInfo[i][m_EXIST] && MatchingInfo[i][m_STATE] == STATE_JOIN && MatchingInfo[i][m_Type] == PlayerModeSelected[playerid]) {

			if(partyid != NO_PARTY) {
				
				new countparty = Party_CountMember(partyid);
				
				if(MatchingInfo[i][m_Player] + countparty <= MAX_PLAYER_PER_MATCH) {
					PartyInfo[partyid][pJoined] =i;
					
					MatchingInfo[i][m_Player] += countparty;
					MatchingInfo[i][m_Party] ++;
					
					for(new m=0;m!=MAX_PARTY_MEMBER;m++) {
						if(PartyInfo[partyid][pMember][m] != INVALID_PLAYER_ID) {
							PlayerJoined[PartyInfo[partyid][pMember][m]] = i;
							SpawnPlayer(PartyInfo[partyid][pMember][m]);
						}
					}
					
					UpdateUI_CurrentPlayer(i, MatchingInfo[i][m_Player], "JOINED");
					founder=true;
					break;
				}
				
			
			}
			else {
				if(MatchingInfo[i][m_Player] + 1 <= MAX_PLAYER_PER_MATCH) {
					MatchingInfo[i][m_Player] += 1;
					
					if(PlayerModeSelected[playerid] != MATCHING_SOLO) {
						MatchingInfo[i][m_Party] ++;
					}
					
					PlayerJoined[playerid] = i;
					SpawnPlayer(playerid);
					
					UpdateUI_CurrentPlayer(i, MatchingInfo[i][m_Player], "JOINED");
					founder=true;
					break;
				}
			}
		}
	}
	
	if(!founder) {
		for(new i=0;i!=MAX_MATCHINGINFO;i++) {
			if(!MatchingInfo[i][m_EXIST]) {
						
				MatchingInfo[i][m_EXIST]=true;

				if(partyid != NO_PARTY) {
					
					new countparty = Party_CountMember(partyid);

					if(MatchingInfo[i][m_Player] + countparty <= MAX_PLAYER_PER_MATCH) {
						PartyInfo[partyid][pJoined] =i;
						
						MatchingInfo[i][m_Player] += countparty;
						MatchingInfo[i][m_Party] ++;
						MatchingInfo[i][m_Type] = PlayerModeSelected[PartyInfo[partyid][pLeader]];
						
						for(new m=0;m!=MAX_PARTY_MEMBER;m++) {
							if(PartyInfo[partyid][pMember][m] != INVALID_PLAYER_ID) {
								PlayerJoined[PartyInfo[partyid][pMember][m]] = i;
								SpawnPlayer(PartyInfo[partyid][pMember][m]);
							}
						}
						
						UpdateUI_CurrentPlayer(i, MatchingInfo[i][m_Player], "JOINED");
						founder=true;
					}
					
				
				}
				else {
					if(MatchingInfo[i][m_Player] + 1 <= MAX_PLAYER_PER_MATCH) {
						MatchingInfo[i][m_Player] += 1;
						if(PlayerModeSelected[playerid] != MATCHING_SOLO) {
							MatchingInfo[i][m_Party] ++;
						}
						MatchingInfo[i][m_Type] = PlayerModeSelected[playerid];
						
						PlayerJoined[playerid] = i;
						SpawnPlayer(playerid);
						
						UpdateUI_CurrentPlayer(i, MatchingInfo[i][m_Player], "JOINED");
						founder=true;
					}
				}
				
				if(founder) {
					MatchingInfo[i][m_WShrink]=INVALID_GZ_SHAPE_ID;
					MatchingInfo[i][m_BShrink]=INVALID_GZ_SHAPE_ID;
					
					MatchingInfo[i][m_STATE]=STATE_JOIN;
					MatchingInfo[i][m_Timer]=-1;
					
					new PilotName[MAX_PLAYER_NAME];
					format(PilotName, MAX_PLAYER_NAME, "pilot_%d", i);
					MatchingInfo[i][m_Pilot] = FCNPC_Create(PilotName);
					FCNPC_Spawn(MatchingInfo[i][m_Pilot], 61, 0, 0, 3);
					FCNPC_SetInterior(MatchingInfo[i][m_Pilot], 0);
					FCNPC_SetVirtualWorld(MatchingInfo[i][m_Pilot], i+1);
				
					MatchingInfo[i][m_Plane] = CreateVehicle(519, 3000, 3000, 1000, 0, -1, -1, -1);
					SetVehicleVirtualWorld(MatchingInfo[i][m_Plane], i+1);
					
					//printf("NPC: ID %d Created", MatchingInfo[i][m_Pilot]);
					
					// Create Car
					new carid;
					for(new x=0;x!=sizeof(CarRandomSpawn);x++) {
						if(random(20) > 0) {
							new model_rd;
							
							if(random(5) == 0) { // Motorcycle
								model_rd = random(sizeof(Motorcycle));
								MatchingInfo[i][m_Car][carid] = CreateVehicle(Motorcycle[model_rd], CarRandomSpawn[x][0], CarRandomSpawn[x][1], CarRandomSpawn[x][2], CarRandomSpawn[x][3], -1, -1, -1);
							}
							else {
								model_rd = random(sizeof(GeneralVehicle));
								MatchingInfo[i][m_Car][carid] = CreateVehicle(GeneralVehicle[model_rd], CarRandomSpawn[x][0], CarRandomSpawn[x][1], CarRandomSpawn[x][2], CarRandomSpawn[x][3], -1, -1, -1);
							}
							
							SetVehicleVirtualWorld(MatchingInfo[i][m_Car][carid], i+1);
							carid++;
						}
					}
					break;
				}
			}
		}
	}
	return founder;
}

MatchingPartyCount(matchid, &playerid = INVALID_PLAYER_ID) {
	new count=0;
	foreach(new x : Player) {
		if(IsPlayerInGame{x} && PlayerJoined[x] == matchid && PlayerParty[x] == NO_PARTY && !IsPlayerDeath(x)) {
			playerid = x;
			count++;
		}
	}
	
	for(new i=0;i!=MAX_PARTIES;i++) {
		if(PartyInfo[i][pExists] && PartyInfo[i][pJoined] == matchid) {
			for(new x=0;x!=MAX_PARTY_MEMBER;x++) {
				if(PartyInfo[i][pMember][x] != INVALID_PLAYER_ID && !IsPlayerDeath(PartyInfo[i][pMember][x])) {
					playerid = PartyInfo[i][pMember][x];
					count++;
					break;
				}
			}
		}
	}
	return count;
}

MatchingPlayerCount(matchid) {
	new count=0;
	foreach(new x : Player) {
		if(IsPlayerInGame{x} && PlayerJoined[x] == matchid && !IsPlayerDeath(x)) {
			count++;
		}
	}
	return count;
}

hook OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid, bodypart)
{
	new matchingid = PlayerJoined[playerid];
	new Float:health, Float:armour;
	GetPlayerArmour(playerid, armour);
	GetPlayerHealth(playerid, health);
		
	if(matchingid != -1 && MatchingInfo[matchingid][m_STATE] != STATE_JOIN) {

		if(issuerid != INVALID_PLAYER_ID)
		{
			IncreasePlayerMakeDamage(issuerid, amount);
			
			if(armour < 1)
			{
				if(health-amount > 0)
				{
					SetPlayerHealth(playerid,health-amount);
					Party_UpdateUI(PlayerParty[playerid]);
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
							SetPlayerHealth(playerid,health-totalarmour);
							Party_UpdateUI(PlayerParty[playerid]);
							return 1;
						}
					}
				}
				else {
					if(health-amount > 0) {
						SetPlayerHealth(playerid,health-amount);
						Party_UpdateUI(PlayerParty[playerid]);
						return 1;
					}
				}
			}	
			/*GetPlayerPos(playerid, LastPlayerPosX[playerid], LastPlayerPosY[playerid], LastPlayerPosZ[playerid]);
			GetPlayerFacingAngle(playerid, LastPlayerPosA[playerid]);*/
			OnPlayerDeathEx(playerid, issuerid, weaponid);
		}
		else {
			if(health-amount > 0) {
				SetPlayerHealth(playerid,health-amount);
				Party_UpdateUI(PlayerParty[playerid]);
				return 1;
			}
			/*GetPlayerPos(playerid, LastPlayerPosX[playerid], LastPlayerPosY[playerid], LastPlayerPosZ[playerid]);
			GetPlayerFacingAngle(playerid, LastPlayerPosA[playerid]);*/
			OnPlayerDeathEx(playerid, issuerid, weaponid);
		}

		Party_UpdateUI(PlayerParty[playerid]);

		return 1;
	}
    return SetPlayerHealth(playerid, health);
}

MatchingWinner(matchid, issuerid) {

	printf("MatchingWinner %d %d", matchid, issuerid);
	
	if(MatchingInfo[matchid][m_STATE] == STATE_FINISHED && MatchingInfo[matchid][m_Timer] != -1)
		return 0;
	
	new count, playerid = INVALID_PLAYER_ID;
	
	count = MatchingPartyCount(matchid, playerid);
	
	printf("Lasted players %d, count team %d", playerid, count);
	if(count <= 1) {
		MatchingInfo[matchid][m_Timer]=TIME_BEFORE_FINISH;
		MatchingInfo[matchid][m_STATE]=STATE_FINISHED;
		

		if(playerid != INVALID_PLAYER_ID) {

			new temp_party = PlayerParty[playerid], str_killtext[16], str_ranktext[16], str_bigranktext[16], playerkill, playersurvival, killpoint, rankpoint, hitpoint;
			if(temp_party != NO_PARTY) {
				for (new x; x != MAX_PARTY_MEMBER; x++)
				{
					if(PartyInfo[temp_party][pMember][x] != INVALID_PLAYER_ID) {
						playerkill = GetPlayerKill(PartyInfo[temp_party][pMember][x]);
						playersurvival = GetPlayerSurvivalTime(PartyInfo[temp_party][pMember][x]);
						switch(MatchingInfo[matchid][m_Type]) {
							case MATCHING_SOLO: {
								killpoint = playerkill * 20;
								rankpoint = floatround(float(playersurvival) * 1.2);
							}
							case MATCHING_DUO: {
								killpoint = playerkill * 15;
								rankpoint = floatround(float(playersurvival) * 0.6);
							}
							case MATCHING_SQUAD: {
								killpoint = playerkill * 10;
								rankpoint = floatround(float(playersurvival) * 0.3);
							}
						}
						
						format(str_ranktext, sizeof(str_ranktext), "TEAM_RANK_#%d", count);
						format(str_killtext, sizeof(str_killtext), "KILL %d", playerkill);
						hitpoint = GetPlayerMakeDamage(PartyInfo[temp_party][pMember][x]);
						format(str_bigranktext, sizeof(str_bigranktext), "~y~#%d~w~/%d", count, MatchingInfo[matchid][m_Player]);
						
						PlayerData[PartyInfo[temp_party][pMember][x]][pBattlePoint] += killpoint+rankpoint+hitpoint;
						ShowMatchFinished(playerid, "WINNER WINNER CHICKEN DINNER!", str_killtext, str_ranktext, rankpoint, killpoint, hitpoint, str_bigranktext);
					}
				}
				return count;
			}
			else {
				playerkill = GetPlayerKill(playerid);
				playersurvival = GetPlayerSurvivalTime(playerid);
				
				switch(MatchingInfo[matchid][m_Type]) {
					case MATCHING_SOLO: {
						killpoint = playerkill * 20;
						rankpoint = floatround(float(playersurvival) * 1.2);
					}
					case MATCHING_DUO: {
						killpoint = playerkill * 15;
						rankpoint = floatround(float(playersurvival) * 0.6);
					}
					case MATCHING_SQUAD: {
						killpoint = playerkill * 10;
						rankpoint = floatround(float(playersurvival) * 0.3);
					}
				}
				format(str_ranktext, sizeof(str_ranktext), "%sRANK_#%d", MatchingInfo[matchid][m_Type] != MATCHING_SOLO ? ("TEAM_") : (""), count);
				format(str_bigranktext, sizeof(str_bigranktext), "~y~#%d~w~/%d", count, MatchingInfo[matchid][m_Type] != MATCHING_SOLO ? (MatchingInfo[matchid][m_Party]) : (MatchingInfo[matchid][m_Player]));
				format(str_killtext, sizeof(str_killtext), "KILL %d", playerkill);
				hitpoint = GetPlayerMakeDamage(playerid);
				
				PlayerData[playerid][pBattlePoint] += killpoint+rankpoint+hitpoint;
				ShowMatchFinished(playerid, "WINNER WINNER CHICKEN DINNER!", str_killtext, str_ranktext, rankpoint, killpoint, hitpoint, str_bigranktext);
			}
		}
	}
	
	if(issuerid != INVALID_PLAYER_ID) {
		new temp_party = PlayerParty[issuerid], str_killtext[16], str_ranktext[16], str_bigranktext[16], playerkill, playersurvival, killpoint, rankpoint, hitpoint;
		if(temp_party != NO_PARTY) {	
			new member;
			for (new x; x != MAX_PARTY_MEMBER; x++)
			{
				if(PartyInfo[temp_party][pMember][x] != INVALID_PLAYER_ID && PartyInfo[temp_party][pMember][x] != issuerid && !IsPlayerDeath(PartyInfo[temp_party][pMember][x])) {
					PlayerSpectatePlayer(issuerid, PartyInfo[temp_party][pMember][x]);
					member++;
				}
			}
			if(member==0) { // All Dead
				for (new x; x != MAX_PARTY_MEMBER; x++)
				{
					if(PartyInfo[temp_party][pMember][x] != INVALID_PLAYER_ID) {
					
						playerkill = GetPlayerKill(PartyInfo[temp_party][pMember][x]);
						playersurvival = GetPlayerSurvivalTime(PartyInfo[temp_party][pMember][x]);
						switch(MatchingInfo[matchid][m_Type]) {
							case MATCHING_SOLO: {
								killpoint = playerkill * 20;
								rankpoint = floatround(float(playersurvival) * 1.2);
							}
							case MATCHING_DUO: {
								killpoint = playerkill * 15;
								rankpoint = floatround(float(playersurvival) * 0.6);
							}
							case MATCHING_SQUAD: {
								killpoint = playerkill * 10;
								rankpoint = floatround(float(playersurvival) * 0.3);
							}
						}
						
						format(str_ranktext, sizeof(str_ranktext), "TEAM_RANK_#%d", count + 1);
						format(str_killtext, sizeof(str_killtext), "KILL %d", playerkill);
						hitpoint = GetPlayerMakeDamage(PartyInfo[temp_party][pMember][x]);
						format(str_bigranktext, sizeof(str_bigranktext), "~y~#%d~w~/%d", count + 1, MatchingInfo[matchid][m_Player]);
						
						PlayerData[PartyInfo[temp_party][pMember][x]][pBattlePoint] += killpoint+rankpoint+hitpoint;
						ShowMatchFinished(issuerid, "BETTER LUCK NEXT TIME!", str_killtext, str_ranktext, rankpoint, killpoint, hitpoint, str_bigranktext);
					}
				}
			}
			return count;
		}
		
		playerkill = GetPlayerKill(issuerid);
		playersurvival = GetPlayerSurvivalTime(issuerid);
		
		switch(MatchingInfo[matchid][m_Type]) {
			case MATCHING_SOLO: {
				killpoint = playerkill * 20;
				rankpoint = floatround(float(playersurvival) * 1.2);
			}
			case MATCHING_DUO: {
				killpoint = playerkill * 15;
				rankpoint = floatround(float(playersurvival) * 0.6);
			}
			case MATCHING_SQUAD: {
				killpoint = playerkill * 10;
				rankpoint = floatround(float(playersurvival) * 0.3);
			}
		}
		format(str_ranktext, sizeof(str_ranktext), "%sRANK_#%d", MatchingInfo[matchid][m_Type] != MATCHING_SOLO ? ("TEAM_") : (""), count + 1);
		format(str_bigranktext, sizeof(str_bigranktext), "~y~#%d~w~/%d", count + 1, MatchingInfo[matchid][m_Type] != MATCHING_SOLO ? (MatchingInfo[matchid][m_Party]) : (MatchingInfo[matchid][m_Player]));
		format(str_killtext, sizeof(str_killtext), "KILL %d", playerkill);
		hitpoint = GetPlayerMakeDamage(issuerid);
		
		PlayerData[issuerid][pBattlePoint] += killpoint+rankpoint+hitpoint;
		ShowMatchFinished(issuerid, "BETTER LUCK NEXT TIME!", str_killtext, str_ranktext, rankpoint, killpoint, hitpoint, str_bigranktext);
	}

	
	return count;
}

hook OnPlayerDisconnect(playerid, reason) {
	Matching_Leave(playerid, PlayerJoined[playerid]);
	return 1;
}

MatchingPartyDestroy(matchingid) {
	MatchingInfo[matchingid][m_Party]--;
}	

Matching_Leave(playerid, &matchingid) {
	if(matchingid != -1) {
	
		new temp_matchingid = matchingid;
		
		matchingid = -1;
		IsPlayerInGame{playerid}=false;
		
		if(MatchingInfo[temp_matchingid][m_EXIST]) {
		
			new count = MatchingPartyCount(temp_matchingid);	
			
			//MatchingInfo[temp_matchingid][m_Player]--;
			/*if(Party_CountMember(PlayerParty[playerid]) == 1) {
				MatchingInfo[temp_matchingid][m_Party]--;
			}*/
				
			if(MatchingInfo[temp_matchingid][m_STATE] != STATE_JOIN) {
			
				//MatchingInfo[temp_matchingid][m_Alive]--;
				if(count <= 0) {
				
					if(MatchingInfo[temp_matchingid][m_STATE] == STATE_START && MatchingInfo[temp_matchingid][m_Timer] > 0) {
						ResetAllPlayerToLobby(temp_matchingid);
					}
					else {
						MatchingInfo[temp_matchingid][m_Timer]=5;
						MatchingInfo[temp_matchingid][m_STATE]=STATE_FINISHED;
					}
				}
				else {
					if(MatchingInfo[temp_matchingid][m_STATE] == STATE_START && MatchingInfo[temp_matchingid][m_Timer] > 0) {
						ResetAllPlayerToLobby(temp_matchingid);
					}
					else {
						MatchingWinner(temp_matchingid, INVALID_PLAYER_ID);
					}
				}
				UpdateUI_CurrentPlayer(temp_matchingid, MatchingPlayerCount(temp_matchingid));
			}
			else {
				if(count <= 0) {
					MatchingReset(temp_matchingid);
					ResetAllPlayerToLobby(temp_matchingid);
				}
				UpdateUI_CurrentPlayer(temp_matchingid, MatchingPlayerCount(temp_matchingid), "JOINED");
			}
		}
	}
	return 1;
}

ResetAllPlayerToLobby(matchingid) {
	foreach (new x : Player)
	{
		if (PlayerJoined[x] == matchingid && Lobby_IsPlayerInGame(x)) {
			HideUI_CurrentPlayer(x, PlayerJoined[x]);
			Matching_Leave(x, PlayerJoined[x]);
			UpdatePlayerPartyBox(x);
			HideMatchFinished(x);
			DestroyPlayerCircleShift(x);
			
			for(new i = 0; i < 5; i++)
				SendDeathMessageToPlayer(x, 1001, 1001, 200);
			
			if(PlayerInPlane[x] != INVALID_VEHICLE_ID || IsPlayerDeath(x)) TogglePlayerSpectating(x, false);
			else SpawnPlayer(x);
			//printf("Reset %d to lobby", x);
		}
	}
	return 1;
}

ResetPlayerToLobby(playerid) {
	if (PlayerJoined[playerid] != -1 && Lobby_IsPlayerInGame(playerid)) {
		HideUI_CurrentPlayer(playerid, PlayerJoined[playerid]);
		Matching_Leave(playerid, PlayerJoined[playerid]);
		UpdatePlayerPartyBox(playerid);
		HideMatchFinished(playerid);
		DestroyPlayerCircleShift(playerid);
		
		for(new i = 0; i < 5; i++)
			SendDeathMessageToPlayer(playerid, 1001, 1001, 200);
						
		if(PlayerInPlane[playerid] != INVALID_VEHICLE_ID || IsPlayerDeath(playerid)) TogglePlayerSpectating(playerid, false);
		else SpawnPlayer(playerid);
	}
	return 1;
}