//--------------------------------[VARIABLES.PWN]--------------------------------
//new szQuery[256]; เหลือง ฟ้า เขียว แดง
// MySQL Connection Variable
new MySQL:dbCon;

/* AC */
new iLastDialogID[MAX_PLAYERS];

new PlayerInMatching[MAX_PLAYERS];
new bool:PlayerReady[MAX_PLAYERS char];

new bool:InGame[MAX_PLAYERS char];
new bool:InPlane[MAX_PLAYERS char];
new bool:openMap[MAX_PLAYERS char];
new bool:TimeUI[MAX_PLAYERS char];
new MatchingType[MAX_PLAYERS];

new PlayerText:td_uicompass[MAX_PLAYERS][7];
new PlayerText:td_compass[MAX_PLAYERS][7];
new Text:td__compass_dir;

new const Float:LobbySpawn[4][4] = {
	{-2384.9851,-555.0211,129.1375,161.9820},
	{-2385.7166,-554.3669,129.1373,173.357666},
	{-2384.0256,-554.9462,129.1071,145.981994},
	{-2382.9797,-555.2518,129.0861,140.981994}
};

new const CircleData[][8] = { // Start Shrink , Size , Blue meet white
	{150,1200,90},
	{120,740,60}, 
	{120,360,40}, 
	{90,175,30},  
	{90,90,30},   
	{60,40,30},   
	{30,10,10},   
	{30,1,5}
};

new const Float:CircleDamage[8] = {
	0.4,
	0.6,
	0.8,
	1.0,
	3.0,
	5.0,
	7.0,
	9.0,
};

new PlayerData[MAX_PLAYERS][playerData];
new PlayerText:NameAndVersion[MAX_PLAYERS];
new PlayerText:HealthBar[MAX_PLAYERS];
new PlayerText:Runing[MAX_PLAYERS];
new PlayerText:RuningIcon[MAX_PLAYERS];
new PlayerText:KillScore[MAX_PLAYERS];
new PlayerText:PlayerKillText[MAX_PLAYERS];
new Text:BGHealthBar, Text:RuningBar, Text:KillText;
new Text:WhiteBox;

new PlayerText:LobbyStart[MAX_PLAYERS];
new PlayerText:Lobby1[MAX_PLAYERS];
new PlayerText:Lobby2[MAX_PLAYERS];
new PlayerText:Lobby3[MAX_PLAYERS];
new PlayerText:Lobby4[MAX_PLAYERS];
new PlayerText:Lobby5[MAX_PLAYERS];
new PlayerText:Lobby6[MAX_PLAYERS];
new PlayerText:Lobby7[MAX_PLAYERS];
new PlayerText:Lobby8[MAX_PLAYERS];
new PlayerText:Lobby9[MAX_PLAYERS];
new PlayerText:Lobby10[MAX_PLAYERS];
new PlayerText:Lobby11[MAX_PLAYERS];
new PlayerText:emptytext[MAX_PLAYERS];

//new PlayerText:PlayerMapIcon[MAX_PLAYERS];
new PlayerText:PlayerMapIcon[MAX_PLAYERS][4];
new PlayerText:PlayerMapName[MAX_PLAYERS][4];

new PlayerText:EndingName[MAX_PLAYERS];
new PlayerText:EndingText[MAX_PLAYERS];
new PlayerText:EndingKill[MAX_PLAYERS];
new PlayerText:EndingRank[MAX_PLAYERS];
new PlayerText:EndingReward[MAX_PLAYERS];
new PlayerText:EndingRankPoint[MAX_PLAYERS];
new PlayerText:EndingKillPoint[MAX_PLAYERS];
new PlayerText:EndingHitPoint[MAX_PLAYERS];
new PlayerText:EndingLast[MAX_PLAYERS];
new PlayerText:OnKill[MAX_PLAYERS];

new Text:EndingBackground;
new Text:EndingPointText;
new Text:EndingPlayer;
new Text:EndingLobby;


new Text:TDBackground_Map;
new Text:TDBayside;
new Text:TDSF;
new Text:TDArea;
new Text:TDLS;
new Text:TDLV;
new Text:TDAirport;
new Text:TDAngel;
new Text:TDMount;

new const g_aPreloadLibs[][] =
{
	"COP_AMBIENT"
};

