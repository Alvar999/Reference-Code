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
	
	//KHU TAXI LV
	RemoveBuildingForPlayer(playerid, 8501, 2160.2734, 1465.1094, 22.1484, 0.25);
	RemoveBuildingForPlayer(playerid, 8694, 2113.1328, 1465.1094, 22.1484, 0.25);
	RemoveBuildingForPlayer(playerid, 8851, 2086.8125, 1483.2344, 10.0625, 0.25);
	RemoveBuildingForPlayer(playerid, 8853, 2107.1875, 1522.5234, 10.0625, 0.25);
	RemoveBuildingForPlayer(playerid, 8854, 2161.7578, 1522.5234, 10.0625, 0.25);
	RemoveBuildingForPlayer(playerid, 8856, 2107.1875, 1443.9922, 10.0625, 0.25);
	RemoveBuildingForPlayer(playerid, 8930, 2217.7500, 1477.6641, 31.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 8931, 2162.4766, 1403.4375, 14.6563, 0.25);
	RemoveBuildingForPlayer(playerid, 9070, 2111.3203, 1501.1172, 22.1484, 0.25);
	RemoveBuildingForPlayer(playerid, 9071, 2158.4219, 1501.1172, 22.1484, 0.25);
	RemoveBuildingForPlayer(playerid, 9072, 2113.1328, 1465.1094, 22.1484, 0.25);
	RemoveBuildingForPlayer(playerid, 9073, 2158.4219, 1501.1172, 22.1484, 0.25);
	RemoveBuildingForPlayer(playerid, 9074, 2111.3203, 1501.1172, 22.1484, 0.25);
	RemoveBuildingForPlayer(playerid, 9075, 2160.2734, 1465.1094, 22.1484, 0.25);
	RemoveBuildingForPlayer(playerid, 1231, 2099.8125, 1447.9766, 12.4609, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 2100.9922, 1452.1563, 10.2266, 0.25);
	RemoveBuildingForPlayer(playerid, 1231, 2110.8906, 1447.9766, 12.4609, 0.25);
	RemoveBuildingForPlayer(playerid, 1231, 2121.7266, 1447.9766, 12.4609, 0.25);
	RemoveBuildingForPlayer(playerid, 718, 2121.8359, 1443.2344, 9.7500, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 2117.3281, 1452.1563, 10.2266, 0.25);
	RemoveBuildingForPlayer(playerid, 1341, 2125.1328, 1442.0781, 10.7031, 0.25);
	RemoveBuildingForPlayer(playerid, 718, 2147.6641, 1443.2344, 9.7500, 0.25);
	RemoveBuildingForPlayer(playerid, 718, 2147.1563, 1424.7422, 9.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 1340, 2144.6406, 1441.9297, 10.8516, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 2157.0703, 1452.1563, 10.2266, 0.25);
	RemoveBuildingForPlayer(playerid, 8839, 2162.4766, 1403.4375, 14.6563, 0.25);
	RemoveBuildingForPlayer(playerid, 8840, 2162.7891, 1401.4141, 14.3750, 0.25);
	RemoveBuildingForPlayer(playerid, 718, 2171.8672, 1424.6406, 9.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 2169.5781, 1452.1563, 10.2266, 0.25);
	RemoveBuildingForPlayer(playerid, 1344, 2178.2188, 1418.8438, 10.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 718, 2181.9219, 1443.2344, 9.7500, 0.25);
	RemoveBuildingForPlayer(playerid, 1344, 2181.5625, 1418.8438, 10.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 2181.9922, 1458.7109, 10.2266, 0.25);
	RemoveBuildingForPlayer(playerid, 1231, 2087.6094, 1463.2500, 12.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 1231, 2087.6094, 1503.2344, 12.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 718, 2088.4766, 1522.0781, 9.7500, 0.25);
	RemoveBuildingForPlayer(playerid, 8502, 2134.1484, 1483.1172, 21.4844, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 2101.5703, 1514.0781, 10.2266, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 2117.0547, 1514.0781, 10.2266, 0.25);
	RemoveBuildingForPlayer(playerid, 1231, 2110.8906, 1518.1328, 12.4609, 0.25);
	RemoveBuildingForPlayer(playerid, 1231, 2099.8125, 1518.1328, 12.4609, 0.25);
	RemoveBuildingForPlayer(playerid, 1231, 2121.7266, 1518.1328, 12.4609, 0.25);
	RemoveBuildingForPlayer(playerid, 718, 2119.5000, 1522.0781, 9.7500, 0.25);
	RemoveBuildingForPlayer(playerid, 1231, 2182.0547, 1463.2500, 12.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 8852, 2162.1406, 1483.2500, 10.7813, 0.25);
	RemoveBuildingForPlayer(playerid, 8842, 2217.7500, 1477.6641, 31.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 1231, 2153.8516, 1518.1328, 12.4609, 0.25);
	RemoveBuildingForPlayer(playerid, 1231, 2161.9219, 1518.1328, 12.4609, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 2157.5078, 1514.0781, 10.2266, 0.25);
	RemoveBuildingForPlayer(playerid, 1231, 2169.6797, 1518.1328, 12.4609, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 2168.5391, 1514.0781, 10.2266, 0.25);
	RemoveBuildingForPlayer(playerid, 1231, 2182.0547, 1503.2344, 12.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 2181.9922, 1500.4375, 10.2266, 0.25);
	RemoveBuildingForPlayer(playerid, 718, 2148.9219, 1522.0781, 9.7500, 0.25);
	RemoveBuildingForPlayer(playerid, 718, 2180.0781, 1521.4375, 9.7500, 0.25);
	RemoveBuildingForPlayer(playerid, 1341, 2175.0859, 1523.4141, 10.7344, 0.25);
	
	// Trang tri map lv
	RemoveBuildingForPlayer(playerid, 1350, 2082.520, 978.765, 9.789, 0.250);
	RemoveBuildingForPlayer(playerid, 1294, 2087.659, 968.906, 14.273, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 2087.520, 983.398, 9.507, 0.250);
	RemoveBuildingForPlayer(playerid, 3516, 2074.610, 963.359, 12.992, 0.250);
	RemoveBuildingForPlayer(playerid, 1350, 2032.270, 1447.689, 9.742, 0.250);
	RemoveBuildingForPlayer(playerid, 3516, 2040.170, 1463.089, 12.976, 0.250);
	RemoveBuildingForPlayer(playerid, 1350, 2032.270, 1707.680, 9.742, 0.250);
	RemoveBuildingForPlayer(playerid, 647, 2090.469, 1065.079, 11.234, 0.250);
	RemoveBuildingForPlayer(playerid, 647, 2090.469, 1083.479, 11.234, 0.250);
	RemoveBuildingForPlayer(playerid, 647, 2090.469, 1102.989, 11.234, 0.250);
	RemoveBuildingForPlayer(playerid, 647, 2090.469, 1123.310, 11.234, 0.250);
	RemoveBuildingForPlayer(playerid, 647, 2090.469, 1143.660, 11.234, 0.250);
	RemoveBuildingForPlayer(playerid, 7333, 2300.330, 2457.330, 31.320, 0.250);
	
	// NEW MAP
	RemoveBuildingForPlayer(playerid, 7663, 1949.031, 2068.781, 12.109, 0.250);
	RemoveBuildingForPlayer(playerid, 7719, 1949.031, 2068.781, 12.109, 0.250);
	RemoveBuildingForPlayer(playerid, 7720, 2074.757, 2048.070, 9.843, 0.250);
	RemoveBuildingForPlayer(playerid, 7526, 1949.031, 2068.781, 12.109, 0.250);
	RemoveBuildingForPlayer(playerid, 3460, 1931.859, 2084.539, 13.765, 0.250);
	RemoveBuildingForPlayer(playerid, 3459, 1937.570, 2104.710, 17.320, 0.250);
	RemoveBuildingForPlayer(playerid, 3459, 1989.382, 2030.937, 17.320, 0.250);
	RemoveBuildingForPlayer(playerid, 7639, 2022.687, 2065.937, 21.101, 0.250);
	RemoveBuildingForPlayer(playerid, 7531, 2074.757, 2048.070, 9.843, 0.250);
	RemoveBuildingForPlayer(playerid, 7918, 2074.757, 2048.070, 9.843, 0.250);
	RemoveBuildingForPlayer(playerid, 1522, 2084.703, 2073.273, 10.039, 0.250);
	RemoveBuildingForPlayer(playerid, 955, 2085.773, 2071.359, 10.453, 0.250);
	RemoveBuildingForPlayer(playerid, 3459, 2055.562, 2104.007, 17.320, 0.250);
	
	//KE BEN VIP
	RemoveBuildingForPlayer(playerid, 710, 2013.328, 1047.484, 25.304, 0.250);
	RemoveBuildingForPlayer(playerid, 710, 2005.921, 1059.867, 25.304, 0.250);
	RemoveBuildingForPlayer(playerid, 710, 2005.921, 1048.226, 25.304, 0.250);
	RemoveBuildingForPlayer(playerid, 710, 2005.921, 1036.585, 25.304, 0.250);
	RemoveBuildingForPlayer(playerid, 9154, 1960.257, 1004.921, 18.679, 0.250);
	RemoveBuildingForPlayer(playerid, 712, 1996.062, 1039.109, 19.429, 0.250);
	RemoveBuildingForPlayer(playerid, 9153, 2005.117, 1047.398, 13.289, 0.250);
	RemoveBuildingForPlayer(playerid, 712, 2014.031, 1039.593, 19.429, 0.250);
	RemoveBuildingForPlayer(playerid, 647, 2012.515, 1044.757, 11.226, 0.250);
	RemoveBuildingForPlayer(playerid, 647, 2014.265, 1034.468, 11.226, 0.250);
	RemoveBuildingForPlayer(playerid, 647, 2017.757, 1042.148, 11.226, 0.250);
	RemoveBuildingForPlayer(playerid, 647, 2018.609, 1038.367, 11.226, 0.250);
	RemoveBuildingForPlayer(playerid, 759, 1998.617, 1053.890, 9.828, 0.250);
	RemoveBuildingForPlayer(playerid, 712, 2014.031, 1055.898, 19.429, 0.250);
	RemoveBuildingForPlayer(playerid, 712, 1996.062, 1055.414, 19.429, 0.250);
	RemoveBuildingForPlayer(playerid, 647, 1996.703, 1063.195, 11.226, 0.250);
	RemoveBuildingForPlayer(playerid, 647, 2016.953, 1060.031, 11.226, 0.250);
	RemoveBuildingForPlayer(playerid, 647, 2019.039, 1056.656, 11.226, 0.250);
	RemoveBuildingForPlayer(playerid, 647, 2017.382, 1052.640, 11.226, 0.250);
	
	// KHU VUI CHOI
	RemoveBuildingForPlayer(playerid, 1278, 2137.419, 1017.659, 24.164, 0.250);

    return 1;
}


