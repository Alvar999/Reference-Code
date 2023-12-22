#include <a_samp>
#include <streamer>

#undef MAX_PLAYERS
#define MAX_PLAYERS 800

public OnFilterScriptExit() {
    for(new i; i < MAX_PLAYERS; i++) {
	    if(GetPlayerVirtualWorld(i) != 0 || GetPlayerInterior(i) != 0) {
			TogglePlayerControllable(i, false);
		}
	}
}

public OnFilterScriptInit() {

    for(new i; i < MAX_PLAYERS; i++) {
	    if(GetPlayerVirtualWorld(i) != 0 || GetPlayerInterior(i) != 0) {
			TogglePlayerControllable(i, false);
		}
	}
	//Custom Exterior Ballas Gang
    CreateDynamicObject(18651, 1813.02, -2068.45, 12.54,   0.00, 0.00, 0.00);
    CreateDynamicObject(18651, 1813.01, -2070.44, 12.54,   0.00, 0.00, 0.00);
    CreateDynamicObject(18651, 1813.02, -2072.39, 12.54,   0.00, 0.00, 0.00);
    CreateDynamicObject(18651, 1813.02, -2074.35, 12.54,   0.00, 0.00, 0.00);
    CreateDynamicObject(18651, 1813.01, -2076.24, 12.54,   0.00, 0.00, 0.00);
    CreateDynamicObject(3038, 1812.85, -2073.75, 15.72,   0.00, 0.00, 0.00);
    CreateDynamicObject(3038, 1812.77, -2066.80, 15.72,   0.00, 0.00, 0.00);
	//Custom Gang Yakuza
    CreateDynamicObject(19125, 1083.28, -1222.35, 17.68,   0.00, 0.00, 0.00);
    CreateDynamicObject(19124, 1085.68, -1222.32, 17.68,   0.00, 0.00, 0.00);
    CreateDynamicObject(19125, 1087.68, -1222.32, 17.68,   0.00, 0.00, 0.00);
    CreateDynamicObject(19124, 1089.68, -1222.32, 17.68,   0.00, 0.00, 0.00);
    CreateDynamicObject(19125, 1091.68, -1222.32, 17.68,   0.00, 0.00, 0.00);
    CreateDynamicObject(19124, 1093.68, -1222.32, 17.68,   0.00, 0.00, 0.00);
    CreateDynamicObject(19125, 1095.68, -1222.32, 17.68,   0.00, 0.00, 0.00);
    CreateDynamicObject(19124, 1097.68, -1222.32, 17.68,   0.00, 0.00, 0.00);
    CreateDynamicObject(19125, 1099.68, -1222.32, 17.68,   0.00, 0.00, 0.00);
    CreateDynamicObject(19124, 1101.68, -1222.32, 17.68,   0.00, 0.00, 0.00);
    CreateDynamicObject(19125, 1103.68, -1222.32, 17.68,   0.00, 0.00, 0.00);
    CreateDynamicObject(19124, 1105.68, -1222.32, 17.68,   0.00, 0.00, 0.00);
    CreateDynamicObject(19125, 1107.68, -1222.32, 17.68,   0.00, 0.00, 0.00);
    CreateDynamicObject(19124, 1109.69, -1222.30, 17.68,   0.00, 0.00, 0.00);
    CreateDynamicObject(19125, 1112.77, -1222.40, 17.68,   0.00, 0.00, 0.00);
    CreateDynamicObject(19381, 1087.15, -1227.18, 14.75,   0.00, 90.00, 0.00);
    CreateDynamicObject(19381, 1087.14, -1236.75, 14.75,   0.00, 90.00, 0.00);
    CreateDynamicObject(19381, 1087.15, -1246.22, 14.75,   0.00, 90.00, 0.00);
    CreateDynamicObject(19381, 1087.15, -1255.83, 14.75,   0.00, 90.00, 0.00);
    CreateDynamicObject(19381, 1097.61, -1248.70, 14.75,   0.00, 90.00, 0.00);
    CreateDynamicObject(19381, 1097.60, -1239.15, 14.75,   0.00, 90.00, 0.00);
    CreateDynamicObject(19381, 1097.53, -1229.54, 14.75,   0.00, 90.00, 0.00);
    CreateDynamicObject(19381, 1097.51, -1219.95, 14.75,   0.00, 90.00, 0.00);
    CreateDynamicObject(19381, 1107.71, -1227.36, 14.75,   0.00, 90.00, 0.00);
    CreateDynamicObject(19381, 1107.98, -1236.79, 14.75,   0.00, 90.00, 0.00);
    CreateDynamicObject(19381, 1108.00, -1246.15, 14.75,   0.00, 90.00, 0.00);
    CreateDynamicObject(19381, 1107.98, -1255.68, 14.75,   0.00, 90.00, 0.00);
    CreateDynamicObject(19381, 1116.96, -1250.85, 14.93,   -3.00, 90.00, 90.00);
    CreateDynamicObject(19381, 1116.85, -1240.43, 14.93,   -3.00, 90.00, 90.00);
    CreateDynamicObject(19381, 1087.66, -1217.32, 16.73,   0.00, 90.00, 0.00);
    CreateDynamicObject(19381, 1098.10, -1217.24, 16.73,   0.00, 90.00, 0.00);
    CreateDynamicObject(19381, 1108.32, -1217.13, 16.73,   0.00, 90.00, 0.00);
    CreateDynamicObject(19381, 1087.99, -1207.72, 16.73,   0.00, 90.00, 0.00);
    CreateDynamicObject(19381, 1098.42, -1207.75, 16.73,   0.00, 90.00, 0.00);
    CreateDynamicObject(19381, 1108.36, -1207.58, 16.73,   0.00, 90.00, 0.00);
    CreateDynamicObject(19381, 1087.95, -1198.09, 16.91,   2.00, 90.00, 0.00);
    CreateDynamicObject(19381, 1098.42, -1198.26, 16.91,   2.00, 90.00, 0.00);
    CreateDynamicObject(19381, 1108.83, -1197.99, 16.91,   2.00, 90.00, 0.00);
    CreateDynamicObject(19381, 1119.11, -1198.14, 16.91,   2.00, 90.00, 0.00);
    CreateDynamicObject(19381, 1118.20, -1216.66, 16.95,   -2.00, 90.00, 90.00);
    CreateDynamicObject(19381, 1118.42, -1206.87, 16.95,   -2.00, 90.00, 90.00);
    CreateDynamicObject(19381, 1118.34, -1226.73, 16.15,   11.00, 88.00, 0.00);
    CreateDynamicObject(19381, 1118.37, -1232.10, 15.15,   11.00, 88.00, 0.00);
    CreateDynamicObject(19381, 1116.79, -1233.36, 14.93,   -3.00, 90.00, 90.00);

	//Crows Zero Exterior Gang HQ
    CreateDynamicObject(980, 1222.53, -1694.91, 19.07,   0.00, 0.00, 0.00);
    CreateDynamicObject(980, 1233.26, -1694.92, 18.87,   0.00, 0.00, 0.00);
    CreateDynamicObject(980, 1253.10, -1694.86, 19.07,   0.00, 0.00, 0.00);
    CreateDynamicObject(980, 1264.51, -1694.80, 19.07,   0.00, 0.00, 0.00);
    CreateDynamicObject(980, 1273.24, -1694.99, 19.07,   0.00, 0.00, 0.00);
    CreateDynamicObject(980, 1279.14, -1689.28, 19.07,   0.00, 0.00, 90.00);
    CreateDynamicObject(980, 1279.13, -1677.75, 19.07,   0.00, 0.00, 90.00);
	//Paintball custom exterior
    CreateDynamicObject(2374, 1801.72, -1573.01, 14.62,   0.00, 0.00, 33.00);
    CreateDynamicObject(2374, 1801.35, -1573.38, 14.62,   0.00, 0.00, 33.00);
    CreateDynamicObject(2383, 1802.43, -1572.45, 14.62,   0.00, 0.00, -55.00);
    CreateDynamicObject(2383, 1803.02, -1571.97, 14.62,   0.00, 0.00, -55.00);
    CreateDynamicObject(2454, 1804.06, -1572.68, 12.41,   0.00, 0.00, 40.00);
    CreateDynamicObject(2455, 1803.39, -1573.28, 12.43,   0.00, 0.00, 40.00);
    CreateDynamicObject(2455, 1802.72, -1573.77, 12.41,   0.00, 0.00, 40.00);
    CreateDynamicObject(2455, 1803.48, -1571.79, 12.43,   0.00, 0.00, 127.00);
    CreateDynamicObject(2454, 1801.83, -1574.35, 12.39,   0.00, 0.00, -47.88);
    CreateDynamicObject(2455, 1801.30, -1573.66, 12.41,   0.00, 0.00, 127.00);
    CreateDynamicObject(2474, 1802.68, -1573.35, 13.43,   0.00, 0.00, 40.00);
    CreateDynamicObject(2692, 1798.55, -1580.69, 13.80,   0.00, 0.00, 120.00);
    CreateDynamicObject(2693, 1796.99, -1577.23, 13.70,   0.00, 0.00, 76.00);
    CreateDynamicObject(2714, 1798.18, -1578.47, 15.89,   0.00, 0.00, 101.00);
    CreateDynamicObject(2754, 1804.46, -1571.00, 13.27,   0.00, 0.00, 127.00);
    CreateDynamicObject(2773, 1799.51, -1580.53, 13.56,   0.00, 0.00, -49.00);
    CreateDynamicObject(2773, 1800.52, -1575.18, 13.56,   0.00, 0.00, 14.00);
    CreateDynamicObject(2773, 1800.99, -1577.05, 13.56,   0.00, 0.00, 14.00);
    CreateDynamicObject(2811, 1799.48, -1575.21, 13.11,   0.00, 0.00, 0.00);
    CreateDynamicObject(2811, 1798.94, -1575.65, 13.11,   0.00, 0.00, 0.00);
    CreateDynamicObject(2833, 1798.12, -1579.14, 13.06,   0.00, 0.00, 0.00);

	//Harem Beach House - Interrior
    CreateDynamicObject(2395,-1610.09960938,-2243.24218750,6021.16015625,0.00000000,0.00000000,270.24719238, .interiorid = 1, .worldid = 7860); //object(cj_sports_wall) (6)
    CreateDynamicObject(2395,-1610.08300781,-2245.54882812,6018.45703125,0.00000000,0.00000000,269.98901367, .interiorid = 1, .worldid = 7860); //object(cj_sports_wall) (7)
    CreateDynamicObject(14596,-1615.75488281,-2240.56250000,6011.96484375,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(paperchase_stairs) (1)
    CreateDynamicObject(2395,-1609.46765137,-2240.62500000,6012.64453125,0.00000000,0.00000000,270.72509766, .interiorid = 1, .worldid = 7860); //object(cj_sports_wall) (8)
    CreateDynamicObject(2395,-1609.37524414,-2242.86083984,6009.58203125,0.00000000,0.00000000,270.98327637, .interiorid = 1, .worldid = 7860); //object(cj_sports_wall) (8)
    CreateDynamicObject(2395,-1610.08300781,-2240.30859375,6018.45703125,0.00000000,0.00000000,269.98901367, .interiorid = 1, .worldid = 7860); //object(cj_sports_wall) (7)
    CreateDynamicObject(1502,-1609.32763672,-2245.37890625,6012.87500000,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(gen_doorint04) (3)
    CreateDynamicObject(2395,-1609.51000977,-2242.76074219,6015.30859375,0.00000000,0.00000000,270.48339844, .interiorid = 1, .worldid = 7860); //object(cj_sports_wall) (8)
    CreateDynamicObject(2395,-1609.38378906,-2245.24218750,6007.05078125,0.00000000,0.00000000,269.98901367, .interiorid = 1, .worldid = 7860); //object(cj_sports_wall) (8)
    CreateDynamicObject(18032,-1539.44897461,-2219.08862305,6026.06250000,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(range_xtras2) (1)
    CreateDynamicObject(2509,-1536.43041992,-2226.66943359,6026.33203125,0.00000000,90.00000000,179.48754883, .interiorid = 1, .worldid = 7860); //object(cj_hobby_shelf_6) (8)
    CreateDynamicObject(2055,-1543.13378906,-2226.46093750,6026.33984375,0.00000000,0.00000000,179.73632812, .interiorid = 1, .worldid = 7860); //object(cj_target5) (1)
    CreateDynamicObject(14388,-1583.50976562,-2219.58203125,6021.92187500,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(madddoggs02) (1)
    CreateDynamicObject(2395,-1609.93750000,-2248.79980469,6021.16015625,0.00000000,0.00000000,89.98898315, .interiorid = 1, .worldid = 7860); //object(cj_sports_wall) (7)
    CreateDynamicObject(2395,-1609.93750000,-2245.26269531,6021.16015625,0.00000000,0.00000000,89.98352051, .interiorid = 1, .worldid = 7860); //object(cj_sports_wall) (7)
    CreateDynamicObject(2395,-1609.91308594,-2248.30175781,6018.42578125,0.00000000,0.00000000,89.98352051, .interiorid = 1, .worldid = 7860); //object(cj_sports_wall) (7)
    CreateDynamicObject(2395,-1609.92382812,-2243.05761719,6018.42187500,0.00000000,0.00000000,89.98352051, .interiorid = 1, .worldid = 7860); //object(cj_sports_wall) (7)
    CreateDynamicObject(14902,-1595.15307617,-2256.86157227,6023.85937500,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(veg_pol_window) (1)
    CreateDynamicObject(14431,-1526.47851562,-2233.71582031,6017.62109375,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(madddoggs20) (2)
    CreateDynamicObject(14389,-1579.47167969,-2234.38476562,6027.84765625,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 7860); //object(madddoggs03) (1)
    CreateDynamicObject(14394,-1572.86132812,-2242.29882812,6019.47656250,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(dr_gsnew10) (1)
    CreateDynamicObject(14395,-1568.74401855,-2234.55981445,6022.43750000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(dr_gsnew11) (1)
    CreateDynamicObject(1502,-1598.05944824,-2241.81591797,6018.66406250,0.00000000,0.00000000,89.98901367, .interiorid = 1, .worldid = 7860); //object(gen_doorint04) (3)
    CreateDynamicObject(1502,-1598.11169434,-2238.78491211,6018.66406250,0.00000000,0.00000000,269.98901367, .interiorid = 1, .worldid = 7860); //object(gen_doorint04) (3)
    CreateDynamicObject(1502,-1550.62268066,-2245.81542969,6020.30468750,0.00000000,0.00000000,89.98901367, .interiorid = 1, .worldid = 7860); //object(gen_doorint04) (3)
    CreateDynamicObject(1502,-1550.67004395,-2242.78149414,6020.30468750,0.00000000,0.00000000,269.98901367, .interiorid = 1, .worldid = 7860); //object(gen_doorint04) (3)
    CreateDynamicObject(1569,-1550.66992188,-2238.79589844,6020.29687500,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 7860); //object(adam_v_door) (1)
    CreateDynamicObject(1569,-1550.66503906,-2241.79907227,6020.29687500,0.00000000,0.00000000,89.99450684, .interiorid = 1, .worldid = 7860); //object(adam_v_door) (3)
    CreateDynamicObject(1502,-1585.49108887,-2238.18945312,6018.66406250,0.00000000,0.00000000,359.98901367, .interiorid = 1, .worldid = 7860); //object(gen_doorint04) (3)
    CreateDynamicObject(1502,-1582.45703125,-2238.14990234,6018.66406250,0.00000000,0.00000000,179.98345947, .interiorid = 1, .worldid = 7860); //object(gen_doorint04) (3)
    CreateDynamicObject(1569,-1557.74499512,-2231.25488281,6020.29687500,0.00000000,0.00000000,359.74450684, .interiorid = 1, .worldid = 7860); //object(adam_v_door) (2)
    CreateDynamicObject(1569,-1554.74145508,-2231.26196289,6020.29687500,0.00000000,0.00000000,179.74182129, .interiorid = 1, .worldid = 7860); //object(adam_v_door) (4)
    CreateDynamicObject(1502,-1561.78869629,-2231.29736328,6020.30078125,0.00000000,0.00000000,359.98901367, .interiorid = 1, .worldid = 7860); //object(gen_doorint04) (3)
    CreateDynamicObject(2395,-1559.79089355,-2231.31665039,6020.10546875,0.00000000,0.00000000,359.98352051, .interiorid = 1, .worldid = 7860); //object(cj_sports_wall) (7)
    CreateDynamicObject(14744,-1562.23242188,-2230.19921875,6022.08203125,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(rybathroom) (2)
    CreateDynamicObject(1463,-1546.44238281,-2235.14062500,6020.77343750,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 7860); //object(dyn_woodpile2) (1)
    CreateDynamicObject(3461,-1546.47460938,-2235.84301758,6018.81640625,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(tikitorch01_lvs) (2)
    CreateDynamicObject(11353,-1526.59375000,-2234.95410156,6019.83203125,0.00000000,0.00000000,269.74182129, .interiorid = 1, .worldid = 7860); //object(station5new) (4)
    CreateDynamicObject(7191,-1598.15136719,-2216.27270508,6020.84375000,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(vegasnnewfence2b) (1)
    CreateDynamicObject(7191,-1606.36914062,-2219.46875000,6020.84375000,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(vegasnnewfence2b) (2)
    CreateDynamicObject(7191,-1542.13378906,-2229.40625000,6020.58593750,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(vegasnnewfence2b) (4)
    CreateDynamicObject(2230,-1542.32775879,-2238.57641602,6020.29687500,0.00000000,0.00000000,271.49450684, .interiorid = 1, .worldid = 7860); //object(swank_speaker_2) (2)
    CreateDynamicObject(2231,-1542.32824707,-2238.09716797,6020.29687500,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 7860); //object(swank_speaker_3) (2)
    CreateDynamicObject(1649,-1564.60803223,-2246.23632812,6022.60937500,0.00000000,0.00000000,179.99993896, .interiorid = 1, .worldid = 7860); //object(wglasssmash) (1)
    CreateDynamicObject(14420,-1599.78125000,-2211.80371094,6021.92187500,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(madddoggs09) (1)
    CreateDynamicObject(7191,-1620.28625488,-2226.45800781,6020.51562500,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 7860); //object(vegasnnewfence2b) (2)
    CreateDynamicObject(3095,-1602.58593750,-2230.75097656,6018.10546875,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(a51_jetdoor) (1)
    CreateDynamicObject(3095,-1602.62500000,-2234.16503906,6018.10546875,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(a51_jetdoor) (2)
    CreateDynamicObject(1818,-1564.96386719,-2242.73535156,6020.27441406,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(coffee_swank_2) (1)
    CreateDynamicObject(2021,-1543.90368652,-2245.28442383,6020.29687500,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(mrk_bdsdecab1) (1)
    CreateDynamicObject(2313,-1563.86474609,-2246.09887695,6020.17675781,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(cj_tv_table1) (1)
    CreateDynamicObject(2231,-1562.32812500,-2246.27246094,6020.29833984,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(swank_speaker_3) (4)
    CreateDynamicObject(2230,-1562.30273438,-2246.74511719,6021.67187500,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(swank_speaker_2) (4)
    CreateDynamicObject(2231,-1561.31359863,-2246.29345703,6020.89746094,0.00000000,179.99450684,180.00000000, .interiorid = 1, .worldid = 7860); //object(swank_speaker_3) (6)
    CreateDynamicObject(2894,-1602.33508301,-2235.07275391,6019.48437500,0.00000000,0.00000000,256.00000000, .interiorid = 1, .worldid = 7860); //object(kmb_rhymesbook) (1)
    CreateDynamicObject(2190,-1602.01562500,-2233.96679688,6019.42968750,0.00000000,0.00000000,299.99816895, .interiorid = 1, .worldid = 7860); //object(pc_1) (1)
    CreateDynamicObject(14458,-1602.06262207,-2235.57934570,6019.64062500,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(gs_chairs) (1)
    CreateDynamicObject(1726,-1565.05004883,-2238.62207031,6020.26562500,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(mrk_seating2) (3)
    CreateDynamicObject(2232,-1556.23706055,-2246.03149414,6020.90405273,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(med_speaker_4) (1)
    CreateDynamicObject(2186,-1601.91625977,-2241.82177734,6018.67187500,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(photocopier_1) (1)
    CreateDynamicObject(2332,-1606.44104004,-2233.70947266,6020.78515625,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(kev_safe) (1)
    CreateDynamicObject(2104,-1555.44702148,-2246.35546875,6020.25146484,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(swank_hi_fi) (1)
    CreateDynamicObject(2229,-1556.02990723,-2246.31518555,6020.29833984,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(swank_speaker) (2)
    CreateDynamicObject(14867,-1550.21679688,-2238.25195312,6021.82812500,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 7860); //object(bobbie-cupboards) (1)
    CreateDynamicObject(14446,-1546.33569336,-2245.06372070,6020.88281250,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(smokes_bed) (1)
    CreateDynamicObject(2855,-1564.36279297,-2242.36669922,6020.77734375,0.00000000,0.00000000,335.99487305, .interiorid = 1, .worldid = 7860); //object(gb_bedmags05) (1)
    CreateDynamicObject(2836,-1561.41210938,-2228.09570312,6020.30078125,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(gb_livingrug05) (1)
    CreateDynamicObject(2741,-1561.06970215,-2224.83203125,6021.64453125,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(cj_soap_disp) (2)
    CreateDynamicObject(2742,-1562.58374023,-2224.83203125,6021.68750000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(cj_handdrier) (1)
    CreateDynamicObject(2528,-1563.86572266,-2228.50976562,6020.30078125,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(cj_toilet3) (1)
    CreateDynamicObject(2527,-1562.85290527,-2226.42163086,6020.30468750,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(cj_shower4) (1)
    CreateDynamicObject(2526,-1562.54064941,-2230.48364258,6020.30078125,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(cj_bath4) (1)
    CreateDynamicObject(2523,-1562.33276367,-2225.35180664,6020.30078125,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(cj_b_sink3) (1)
    CreateDynamicObject(2344,-1564.77282715,-2241.78222656,6020.78515625,0.00000000,0.00000000,44.00000000, .interiorid = 1, .worldid = 7860); //object(cj_remote) (1)
    CreateDynamicObject(14662,-1561.32263184,-2223.09204102,6021.46484375,0.00000000,90.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(int_tatooa02) (1)
    CreateDynamicObject(2133,-1559.90527344,-2228.27246094,6020.30078125,0.00000000,0.00000000,269.98901367, .interiorid = 1, .worldid = 7860); //object(cj_kitch2_r) (4)
    CreateDynamicObject(1727,-1600.79846191,-2233.31250000,6018.66015625,0.00000000,0.00000000,284.00000000, .interiorid = 1, .worldid = 7860); //object(mrk_seating2b) (3)
    CreateDynamicObject(1727,-1600.55627441,-2235.15991211,6018.66015625,0.00000000,0.00000000,247.99658203, .interiorid = 1, .worldid = 7860); //object(mrk_seating2b) (4)
    CreateDynamicObject(2004,-1544.14782715,-2235.76464844,6021.84375000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(cr_safe_door) (1)
    CreateDynamicObject(2233,-1567.45312500,-2237.78393555,6020.28906250,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(swank_speaker_4) (2)
    CreateDynamicObject(2057,-1535.82031250,-2226.27661133,6025.83496094,0.00000000,0.00000000,251.99194336, .interiorid = 1, .worldid = 7860); //object(flame_tins) (1)
    CreateDynamicObject(2690,-1548.32324219,-2222.75561523,6025.99218750,0.00000000,0.00000000,91.74279785, .interiorid = 1, .worldid = 7860); //object(cj_fire_ext) (1)
    CreateDynamicObject(2358,-1543.52124023,-2226.19653320,6025.75781250,0.00000000,0.00000000,179.99572754, .interiorid = 1, .worldid = 7860); //object(ammo_box_c2) (1)
    CreateDynamicObject(16151,-1590.99560547,-2239.37939453,6019.00781250,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(ufo_bar) (1)
    CreateDynamicObject(1548,-1589.33886719,-2240.33837891,6019.67187500,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(cj_drip_tray) (1)
    CreateDynamicObject(1541,-1589.23242188,-2239.87988281,6019.82812500,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(cj_beer_taps_1) (1)
    CreateDynamicObject(1664,-1591.53503418,-2240.26562500,6019.80468750,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(propwinebotl2) (1)
    CreateDynamicObject(1666,-1591.28955078,-2240.41503906,6019.72656250,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(propbeerglass1) (1)
    CreateDynamicObject(14651,-1555.73083496,-2239.93237305,6022.35156250,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(trukstp05) (1)
    CreateDynamicObject(1703,-1557.23620605,-2234.91625977,6020.29687500,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(kb_couch02) (2)
    CreateDynamicObject(1704,-1559.23034668,-2235.93237305,6020.29687500,0.00000000,0.00000000,41.99111938, .interiorid = 1, .worldid = 7860); //object(kb_chair03) (4)
    CreateDynamicObject(1502,-1609.12304688,-2244.76171875,6007.07397461,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(gen_doorint04) (3)
    CreateDynamicObject(1557,-1601.47912598,-2226.51586914,6018.68359375,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(gen_doorext19) (4)
    CreateDynamicObject(1557,-1598.45275879,-2226.49340820,6018.68359375,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(gen_doorext19) (5)
    CreateDynamicObject(14821,-1602.53613281,-2242.52246094,6014.61718750,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(mc_straps_int) (1)
    CreateDynamicObject(7191,-1609.45568848,-2267.52441406,6014.99218750,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(vegasnnewfence2b) (2)
    CreateDynamicObject(7191,-1590.64648438,-2248.16894531,6014.99218750,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(vegasnnewfence2b) (2)
    CreateDynamicObject(7191,-1591.05932617,-2238.29028320,6014.99218750,0.00000000,0.00000000,151.50000000, .interiorid = 1, .worldid = 7860); //object(vegasnnewfence2b) (2)
    CreateDynamicObject(7191,-1595.25561523,-2237.57958984,6014.99218750,0.00000000,0.00000000,177.49597168, .interiorid = 1, .worldid = 7860); //object(vegasnnewfence2b) (2)
    CreateDynamicObject(7191,-1598.67541504,-2236.13964844,6014.99218750,0.00000000,0.00000000,198.24511719, .interiorid = 1, .worldid = 7860); //object(vegasnnewfence2b) (2)
    CreateDynamicObject(7191,-1587.51171875,-2236.80566406,6014.85156250,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(vegasnnewfence2b) (2)
    CreateDynamicObject(7191,-1578.44201660,-2242.96899414,6014.85156250,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(vegasnnewfence2b) (2)
    CreateDynamicObject(7191,-1600.28918457,-2220.89184570,6014.85156250,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(vegasnnewfence2b) (2)
    CreateDynamicObject(7191,-1594.63281250,-2226.69042969,6012.74218750,0.00000000,90.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(vegasnnewfence2b) (2)
    CreateDynamicObject(7191,-1609.42163086,-2221.07421875,6014.85156250,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(vegasnnewfence2b) (2)
    CreateDynamicObject(14820,-1599.67919922,-2245.48388672,6013.75390625,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(dj_stuff) (1)
    CreateDynamicObject(1704,-1603.18530273,-2247.55200195,6012.87109375,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(kb_chair03) (1)
    CreateDynamicObject(1704,-1608.90820312,-2238.20898438,6012.87109375,0.00000000,0.00000000,37.99450684, .interiorid = 1, .worldid = 7860); //object(kb_chair03) (5)
    CreateDynamicObject(1703,-1608.77832031,-2242.34326172,6012.86718750,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(kb_couch02) (1)
    CreateDynamicObject(1703,-1605.14123535,-2247.52807617,6012.86718750,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(kb_couch02) (1)
    CreateDynamicObject(2232,-1604.49707031,-2237.16674805,6015.59765625,0.00000000,180.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(med_speaker_4) (3)
    CreateDynamicObject(2232,-1609.34692383,-2241.41601562,6015.59765625,0.00000000,179.99450684,90.00000000, .interiorid = 1, .worldid = 7860); //object(med_speaker_4) (4)
    CreateDynamicObject(2232,-1603.72424316,-2248.12548828,6015.59765625,0.00000000,179.99450684,180.00000000, .interiorid = 1, .worldid = 7860); //object(med_speaker_4) (5)
    CreateDynamicObject(2232,-1606.90002441,-2248.09130859,6015.59765625,0.00000000,179.99450684,179.99450684, .interiorid = 1, .worldid = 7860); //object(med_speaker_4) (6)
    CreateDynamicObject(1557,-1579.55346680,-2246.33959961,6018.67187500,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(gen_doorext19) (1)
    CreateDynamicObject(1557,-1576.52612305,-2246.34033203,6018.67187500,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(gen_doorext19) (1)
    CreateDynamicObject(2259,-1588.76330566,-2238.76708984,6020.30615234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(frame_clip_6) (1)
    CreateDynamicObject(2258,-1577.75915527,-2238.33325195,6020.87500000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(frame_clip_5) (1)
    CreateDynamicObject(2257,-1602.77612305,-2246.29199219,6020.41015625,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(frame_clip_4) (1)
    CreateDynamicObject(2256,-1591.87231445,-2246.28442383,6021.18017578,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(frame_clip_3) (1)
    CreateDynamicObject(948,-1586.01745605,-2238.66674805,6018.67187500,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(plant_pot_10) (2)
    CreateDynamicObject(644,-1554.40722656,-2231.99609375,6020.60156250,0.00000000,0.00000000,247.98889160, .interiorid = 1, .worldid = 7860); //object(pot_02) (8)
    CreateDynamicObject(948,-1571.43322754,-2231.62353516,6022.67187500,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(plant_pot_10) (4)
    CreateDynamicObject(2240,-1558.33691406,-2231.75976562,6025.14062500,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(plant_pot_8) (4)
    CreateDynamicObject(7191,-1555.93066406,-2211.55664062,6024.42187500,0.00000000,90.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(vegasnnewfence2b) (2)
    CreateDynamicObject(2263,-1553.79101562,-2227.49609375,6026.64453125,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(frame_slim_4) (1)
    CreateDynamicObject(1337,-1647.14245605,-2148.08251953,6014.35546875,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(14)
    CreateDynamicObject(18036,-1540.20214844,-2215.12988281,6026.59375000,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 7860); //object(range_main) (1)
    CreateDynamicObject(11353,-1508.27636719,-2226.37402344,6027.08203125,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(station5new) (4)
    CreateDynamicObject(2509,-1538.30407715,-2226.65307617,6026.33203125,0.00000000,90.00000000,179.48364258, .interiorid = 1, .worldid = 7860); //object(cj_hobby_shelf_6) (8)
    CreateDynamicObject(2509,-1540.18420410,-2226.63598633,6026.33203125,0.00000000,90.00000000,179.48364258, .interiorid = 1, .worldid = 7860); //object(cj_hobby_shelf_6) (8)
    CreateDynamicObject(2509,-1542.06994629,-2226.61889648,6026.33203125,0.00000000,90.00000000,179.48364258, .interiorid = 1, .worldid = 7860); //object(cj_hobby_shelf_6) (8)
    CreateDynamicObject(18032,-1538.16406250,-2223.98046875,6026.09375000,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 7860); //object(range_xtras2) (1)
    CreateDynamicObject(11353,-1508.32324219,-2226.07910156,6027.08203125,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(station5new) (4)
    CreateDynamicObject(2414,-1535.92431641,-2226.33862305,6024.59765625,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(shop_counter_3b) (1)
    CreateDynamicObject(2414,-1537.91015625,-2226.33862305,6024.59765625,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(shop_counter_3b) (1)
    CreateDynamicObject(2414,-1539.88549805,-2226.33813477,6024.59765625,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(shop_counter_3b) (1)
    CreateDynamicObject(2414,-1541.87280273,-2226.33789062,6024.59765625,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(shop_counter_3b) (1)
    CreateDynamicObject(2414,-1543.87182617,-2226.33789062,6024.59765625,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(shop_counter_3b) (1)
    CreateDynamicObject(2358,-1542.81408691,-2226.21264648,6025.75781250,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(ammo_box_c2) (1)
    CreateDynamicObject(1666,-1591.64367676,-2240.40014648,6019.72656250,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(propbeerglass1) (1)
    CreateDynamicObject(1665,-1590.49108887,-2240.34448242,6019.65234375,0.00000000,0.00000000,13.99108887, .interiorid = 1, .worldid = 7860); //object(propashtray1) (3)
    CreateDynamicObject(2885,-1565.66992188,-2246.46679688,6024.57812500,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(xref_garagedoor) (1)
    CreateDynamicObject(2885,-1563.19335938,-2246.46679688,6024.57812500,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(xref_garagedoor) (2)
    CreateDynamicObject(14833,-1612.98767090,-2228.98657227,6014.43872070,0.00000000,0.00000000,179.75000000, .interiorid = 1, .worldid = 7860); //object(lm_stripchairs1) (1)
    CreateDynamicObject(14809,-1601.90246582,-2239.07348633,6013.84570312,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(strip2_platforms) (1)
    CreateDynamicObject(2230,-1562.30273438,-2246.74511719,6022.49365234,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(swank_speaker_2) (4)
    CreateDynamicObject(2230,-1567.53417969,-2246.74902344,6022.49365234,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(swank_speaker_2) (4)
    CreateDynamicObject(2230,-1567.53417969,-2246.74902344,6021.67187500,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(swank_speaker_2) (4)
    CreateDynamicObject(2230,-1565.24841309,-2246.30297852,6020.17480469,0.00000000,90.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(swank_speaker_2) (4)
    CreateDynamicObject(2230,-1563.86999512,-2246.29003906,6020.77905273,0.00000000,270.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(swank_speaker_2) (4)
    CreateDynamicObject(2231,-1567.39404297,-2246.28588867,6020.29833984,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(swank_speaker_3) (4)
    CreateDynamicObject(2231,-1567.41455078,-2246.29687500,6020.89746094,0.00000000,179.99450684,179.99450684, .interiorid = 1, .worldid = 7860); //object(swank_speaker_3) (6)
    CreateDynamicObject(2232,-1554.25207520,-2246.04150391,6020.90405273,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(med_speaker_4) (1)
    CreateDynamicObject(2229,-1555.08813477,-2246.31958008,6020.29833984,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(swank_speaker) (2)
    CreateDynamicObject(1726,-1567.42785645,-2238.62255859,6020.26562500,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(mrk_seating2) (3)
    CreateDynamicObject(1727,-1561.13134766,-2238.79907227,6020.26562500,0.00000000,0.00000000,316.00524902, .interiorid = 1, .worldid = 7860); //object(mrk_seating2b) (1)
    CreateDynamicObject(2233,-1560.93933105,-2237.77880859,6020.28906250,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(swank_speaker_4) (2)
    CreateDynamicObject(644,-1565.10156250,-2232.16503906,6020.60156250,0.00000000,0.00000000,279.98657227, .interiorid = 1, .worldid = 7860); //object(pot_02) (8)
    CreateDynamicObject(1742,-1569.01354980,-2246.37670898,6020.32031250,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(med_bookshelf) (1)
    CreateDynamicObject(2778,-1551.24902344,-2236.48217773,6020.29687500,0.00000000,0.00000000,271.99453735, .interiorid = 1, .worldid = 7860); //object(cj_coin_op_1) (1)
    CreateDynamicObject(2681,-1551.26257324,-2237.58642578,6020.29687500,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 7860); //object(cj_coin_op) (1)
    CreateDynamicObject(1828,-1564.28125000,-2242.31860352,6020.29687500,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(man_sdr_rug) (1)
    CreateDynamicObject(3383,-1612.14770508,-2253.20458984,6001.23730469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(a51_labtable1_) (1)
    CreateDynamicObject(1508,-1619.48034668,-2247.63330078,6002.82275391,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(dyn_garage_door) (1)
    CreateDynamicObject(937,-1609.29748535,-2248.71850586,6001.73486328,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(cj_df_worktop) (1)
    CreateDynamicObject(2044,-1544.15502930,-2246.54492188,6021.14990234,0.00000000,0.00000000,37.99621582, .interiorid = 1, .worldid = 7860); //object(cj_mp5k) (1)
    CreateDynamicObject(2044,-1536.50671387,-2226.63647461,6026.68041992,90.00000000,180.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(cj_mp5k) (2)
    CreateDynamicObject(2036,-1541.25268555,-2226.51269531,6026.68676758,90.00000000,180.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(cj_psg1) (1)
    CreateDynamicObject(2035,-1539.59399414,-2226.60009766,6026.64746094,90.00000000,180.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(cj_m16) (1)
    CreateDynamicObject(1672,-1537.14941406,-2226.29882812,6025.73315430,0.00000000,0.00000000,73.99841309, .interiorid = 1, .worldid = 7860); //object(gasgrenade) (1)
    CreateDynamicObject(1654,-1540.66162109,-2226.29492188,6025.91918945,0.00000000,0.00000000,183.99522400, .interiorid = 1, .worldid = 7860); //object(dynamite) (1)
    CreateDynamicObject(1550,-1542.91979980,-2246.34545898,6020.69750977,0.00000000,0.00000000,221.99523926, .interiorid = 1, .worldid = 7860); //object(cj_money_bag) (1)
    CreateDynamicObject(16662,-1585.34448242,-2227.67309570,6028.79345703,63.49899292,89.49868774,270.31024170, .interiorid = 1, .worldid = 7860); //object(a51_radar_stuff) (1)
    CreateDynamicObject(3016,-1542.03320312,-2226.19824219,6025.79907227,0.00000000,0.00000000,343.99841309, .interiorid = 1, .worldid = 7860); //object(cr_ammobox_nonbrk) (1)
    CreateDynamicObject(931,-1617.65356445,-2242.74682617,6002.29321289,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(rack3) (2)
    CreateDynamicObject(1654,-1540.85412598,-2226.12646484,6025.71997070,342.09228516,271.86767578,192.27720642, .interiorid = 1, .worldid = 7860); //object(dynamite) (2)
    CreateDynamicObject(1654,-1540.39489746,-2226.18969727,6025.71997070,342.08679199,271.86218262,248.27453613, .interiorid = 1, .worldid = 7860); //object(dynamite) (3)
    CreateDynamicObject(3016,-1536.57653809,-2226.23974609,6025.79907227,0.00000000,0.00000000,15.99450684, .interiorid = 1, .worldid = 7860); //object(cr_ammobox_nonbrk) (2)
    CreateDynamicObject(2036,-1541.25195312,-2226.51269531,6026.28833008,90.00000000,179.99450684,179.99450684, .interiorid = 1, .worldid = 7860); //object(cj_psg1) (2)
    CreateDynamicObject(2044,-1536.50585938,-2226.63574219,6026.35668945,90.00000000,179.99450684,179.99450684, .interiorid = 1, .worldid = 7860); //object(cj_mp5k) (3)
    CreateDynamicObject(2044,-1536.50585938,-2226.63574219,6026.03295898,90.00000000,180.00549316,179.98352051, .interiorid = 1, .worldid = 7860); //object(cj_mp5k) (4)
    CreateDynamicObject(2044,-1536.98559570,-2226.63427734,6026.03295898,90.00000000,180.00549316,179.98352051, .interiorid = 1, .worldid = 7860); //object(cj_mp5k) (5)
    CreateDynamicObject(2044,-1536.98266602,-2226.63281250,6026.35668945,90.00000000,179.99450684,179.99450684, .interiorid = 1, .worldid = 7860); //object(cj_mp5k) (6)
    CreateDynamicObject(2044,-1537.00634766,-2226.63574219,6026.68041992,90.00000000,179.99450684,179.99450684, .interiorid = 1, .worldid = 7860); //object(cj_mp5k) (7)
    CreateDynamicObject(2035,-1539.59375000,-2226.59960938,6026.12451172,90.00000000,179.99450684,179.99450684, .interiorid = 1, .worldid = 7860); //object(cj_m16) (1)
    CreateDynamicObject(2035,-1538.48925781,-2226.57910156,6026.12451172,90.00000000,180.00549316,179.98352051, .interiorid = 1, .worldid = 7860); //object(cj_m16) (1)
    CreateDynamicObject(2035,-1538.48925781,-2226.57910156,6026.64746094,90.00000000,180.00549316,179.98352051, .interiorid = 1, .worldid = 7860); //object(cj_m16) (1)
    CreateDynamicObject(2041,-1538.92480469,-2226.33593750,6025.87158203,0.00000000,0.00000000,128.00000000, .interiorid = 1, .worldid = 7860); //object(ammo_box_m2) (1)
    CreateDynamicObject(2040,-1538.08081055,-2226.48559570,6025.77685547,0.00000000,0.00000000,269.99996948, .interiorid = 1, .worldid = 7860); //object(ammo_box_m1) (1)
    CreateDynamicObject(2041,-1539.35192871,-2226.33593750,6025.87158203,0.00000000,0.00000000,127.99621582, .interiorid = 1, .worldid = 7860); //object(ammo_box_m2) (2)
    CreateDynamicObject(2041,-1539.77868652,-2226.33593750,6025.87158203,0.00000000,0.00000000,127.99621582, .interiorid = 1, .worldid = 7860); //object(ammo_box_m2) (3)
    CreateDynamicObject(2040,-1538.07556152,-2226.23339844,6025.77685547,0.00000000,0.00000000,269.99450684, .interiorid = 1, .worldid = 7860); //object(ammo_box_m1) (2)
    CreateDynamicObject(1672,-1537.27441406,-2226.50219727,6025.73315430,0.00000000,0.00000000,73.99841309, .interiorid = 1, .worldid = 7860); //object(gasgrenade) (1)
    CreateDynamicObject(1672,-1537.42529297,-2226.48583984,6025.73315430,0.00000000,0.00000000,73.99841309, .interiorid = 1, .worldid = 7860); //object(gasgrenade) (1)
    CreateDynamicObject(1672,-1537.35839844,-2226.33105469,6025.73315430,0.00000000,0.00000000,73.99841309, .interiorid = 1, .worldid = 7860); //object(gasgrenade) (1)
    CreateDynamicObject(2240,-1558.33691406,-2231.75976562,6020.81884766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(plant_pot_8) (4)
    CreateDynamicObject(1726,-1589.88256836,-2245.71533203,6018.64697266,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(mrk_seating2) (3)
    CreateDynamicObject(1726,-1592.77844238,-2245.73046875,6018.64697266,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(mrk_seating2) (3)
    CreateDynamicObject(2774,-1581.02941895,-2242.31152344,6030.90087891,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(cj_airp_pillars) (1)
    CreateDynamicObject(14419,-1579.79980469,-2247.77539062,6021.92309570,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(madddoggs08) (1)
    CreateDynamicObject(2395,-1581.78381348,-2238.02929688,6018.73583984,270.00000000,180.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(cj_sports_wall) (7)
    CreateDynamicObject(2395,-1581.78405762,-2235.29003906,6018.73583984,270.00000000,179.99853516,179.99853516, .interiorid = 1, .worldid = 7860); //object(cj_sports_wall) (7)
    CreateDynamicObject(2395,-1581.78417969,-2232.54882812,6018.73583984,270.00000000,180.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(cj_sports_wall) (7)
    CreateDynamicObject(2395,-1581.78503418,-2229.81005859,6018.73583984,270.00000000,179.99853516,179.99853516, .interiorid = 1, .worldid = 7860); //object(cj_sports_wall) (7)
    CreateDynamicObject(2395,-1585.50915527,-2229.81005859,6018.73583984,270.00000000,179.99957275,179.99957275, .interiorid = 1, .worldid = 7860); //object(cj_sports_wall) (7)
    CreateDynamicObject(2395,-1585.50915527,-2232.55004883,6018.73583984,270.00000000,179.99853516,179.99853516, .interiorid = 1, .worldid = 7860); //object(cj_sports_wall) (7)
    CreateDynamicObject(2395,-1585.50915527,-2235.29003906,6018.73583984,270.00000000,180.00152588,180.00152588, .interiorid = 1, .worldid = 7860); //object(cj_sports_wall) (7)
    CreateDynamicObject(2395,-1585.50915527,-2238.02905273,6018.73583984,270.00000000,179.99450684,179.99450684, .interiorid = 1, .worldid = 7860); //object(cj_sports_wall) (7)
    CreateDynamicObject(2395,-1589.24096680,-2229.81005859,6018.73583984,270.00000000,179.99853516,179.99853516, .interiorid = 1, .worldid = 7860); //object(cj_sports_wall) (7)
    CreateDynamicObject(2395,-1589.24023438,-2232.54980469,6018.73583984,270.00000000,180.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(cj_sports_wall) (7)
    CreateDynamicObject(2395,-1589.24023438,-2235.29003906,6018.73583984,270.00000000,180.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(cj_sports_wall) (7)
    CreateDynamicObject(2395,-1589.24096680,-2238.03002930,6018.73583984,270.00000000,179.99450684,179.99450684, .interiorid = 1, .worldid = 7860); //object(cj_sports_wall) (7)
    CreateDynamicObject(1569,-1589.71997070,-2233.77148438,6018.69165039,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(adam_v_door) (5)
    CreateDynamicObject(1569,-1589.72509766,-2230.76708984,6018.69165039,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 7860); //object(adam_v_door) (6)
    CreateDynamicObject(3095,-1589.83886719,-2233.29541016,6018.10546875,0.00000000,270.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(a51_jetdoor) (1)
    CreateDynamicObject(2357,-1585.87109375,-2232.67968750,6019.09008789,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(dunc_dinning) (1)
    CreateDynamicObject(1714,-1585.68164062,-2229.87890625,6018.69165039,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(kb_swivelchair1) (1)
    CreateDynamicObject(1714,-1584.59509277,-2235.69873047,6018.69165039,0.00000000,0.00000000,155.99487305, .interiorid = 1, .worldid = 7860); //object(kb_swivelchair1) (2)
    CreateDynamicObject(1714,-1587.12451172,-2234.11059570,6018.69165039,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(kb_swivelchair1) (3)
    CreateDynamicObject(1714,-1587.13220215,-2233.16088867,6018.69165039,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(kb_swivelchair1) (4)
    CreateDynamicObject(1714,-1587.14099121,-2232.26733398,6018.69165039,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(kb_swivelchair1) (5)
    CreateDynamicObject(1714,-1587.12585449,-2231.34301758,6018.69165039,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(kb_swivelchair1) (6)
    CreateDynamicObject(1714,-1581.58471680,-2234.15600586,6018.69165039,0.00000000,0.00000000,269.98901367, .interiorid = 1, .worldid = 7860); //object(kb_swivelchair1) (10)
    CreateDynamicObject(2257,-1577.71911621,-2233.56860352,6021.18212891,0.00000000,0.00000000,269.99450684, .interiorid = 1, .worldid = 7860); //object(frame_clip_4) (1)
    CreateDynamicObject(2627,-1589.23083496,-2242.16162109,6007.08056641,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(gym_treadmill) (1)
    CreateDynamicObject(2628,-1594.91076660,-2245.43408203,6007.06542969,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(gym_bench2) (1)
    CreateDynamicObject(2051,-1543.35766602,-2210.51098633,6026.20117188,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(cj_target4) (1)
    CreateDynamicObject(2051,-1541.75109863,-2207.48803711,6026.20117188,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(cj_target4) (2)
    CreateDynamicObject(2051,-1540.19946289,-2207.50244141,6026.20117188,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(cj_target4) (3)
    CreateDynamicObject(2051,-1538.77246094,-2216.93945312,6026.20117188,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(cj_target4) (4)
    CreateDynamicObject(2051,-1537.21179199,-2212.24926758,6026.20117188,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(cj_target4) (5)
    CreateDynamicObject(2051,-1535.85070801,-2207.73413086,6026.20117188,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(cj_target4) (6)
    CreateDynamicObject(2051,-1534.34020996,-2202.81372070,6026.20117188,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(cj_target4) (7)
    CreateDynamicObject(14419,-1629.17626953,-2251.62646484,6004.52099609,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(madddoggs08) (1)
    CreateDynamicObject(2357,-1582.91674805,-2232.68212891,6019.09008789,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(dunc_dinning) (1)
    CreateDynamicObject(2357,-1584.38354492,-2234.14331055,6019.08691406,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(dunc_dinning) (1)
    CreateDynamicObject(2357,-1584.39111328,-2231.20800781,6019.08593750,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(dunc_dinning) (1)
    CreateDynamicObject(1714,-1581.58312988,-2233.37939453,6018.69165039,0.00000000,0.00000000,269.98901367, .interiorid = 1, .worldid = 7860); //object(kb_swivelchair1) (10)
    CreateDynamicObject(1714,-1581.59118652,-2232.44848633,6018.69165039,0.00000000,0.00000000,269.98901367, .interiorid = 1, .worldid = 7860); //object(kb_swivelchair1) (10)
    CreateDynamicObject(1714,-1581.59167480,-2231.44311523,6018.69165039,0.00000000,0.00000000,269.98901367, .interiorid = 1, .worldid = 7860); //object(kb_swivelchair1) (10)
    CreateDynamicObject(1714,-1584.85253906,-2229.87304688,6018.69165039,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(kb_swivelchair1) (1)
    CreateDynamicObject(1714,-1583.99926758,-2229.86547852,6018.69165039,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(kb_swivelchair1) (1)
    CreateDynamicObject(1714,-1583.11816406,-2229.87988281,6018.69165039,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(kb_swivelchair1) (1)
    CreateDynamicObject(644,-1589.07519531,-2228.05151367,6019.00000000,0.00000000,0.00000000,310.23754883, .interiorid = 1, .worldid = 7860); //object(pot_02) (6)
    CreateDynamicObject(644,-1582.22277832,-2227.93725586,6019.00000000,0.00000000,0.00000000,224.23742676, .interiorid = 1, .worldid = 7860); //object(pot_02) (6)
    CreateDynamicObject(1726,-1578.38952637,-2229.10229492,6018.67187500,0.00000000,0.00000000,269.99450684, .interiorid = 1, .worldid = 7860); //object(mrk_seating2) (3)
    CreateDynamicObject(1726,-1578.38903809,-2231.48388672,6018.67187500,0.00000000,0.00000000,269.98901367, .interiorid = 1, .worldid = 7860); //object(mrk_seating2) (3)
    CreateDynamicObject(1726,-1578.38903809,-2233.86425781,6018.67187500,0.00000000,0.00000000,269.98901367, .interiorid = 1, .worldid = 7860); //object(mrk_seating2) (3)
    CreateDynamicObject(1727,-1578.51086426,-2236.54711914,6018.69165039,0.00000000,0.00000000,240.00000000, .interiorid = 1, .worldid = 7860); //object(mrk_seating2b) (2)
    CreateDynamicObject(1665,-1592.42565918,-2240.31860352,6019.65234375,0.00000000,0.00000000,13.99108887, .interiorid = 1, .worldid = 7860); //object(propashtray1) (3)
    CreateDynamicObject(1665,-1594.17028809,-2240.17602539,6019.65234375,0.00000000,0.00000000,13.99108887, .interiorid = 1, .worldid = 7860); //object(propashtray1) (3)
    CreateDynamicObject(1727,-1587.95031738,-2245.21264648,6018.64184570,0.00000000,0.00000000,203.99633789, .interiorid = 1, .worldid = 7860); //object(mrk_seating2b) (5)
    CreateDynamicObject(1727,-1586.97753906,-2243.81054688,6018.64184570,0.00000000,0.00000000,241.99267578, .interiorid = 1, .worldid = 7860); //object(mrk_seating2b) (6)
    CreateDynamicObject(2232,-1587.76367188,-2238.17529297,6024.01293945,180.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(med_speaker_4) (2)
    CreateDynamicObject(2232,-1592.69946289,-2238.16772461,6024.01293945,0.00549316,180.00000000,359.99450684, .interiorid = 1, .worldid = 7860); //object(med_speaker_4) (7)
    CreateDynamicObject(3383,-1614.67309570,-2253.20214844,6001.23730469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(a51_labtable1_) (1)
    CreateDynamicObject(3383,-1616.69860840,-2253.20043945,6001.23730469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(a51_labtable1_) (1)
    CreateDynamicObject(3383,-1619.15063477,-2253.20263672,6001.23730469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(a51_labtable1_) (1)
    CreateDynamicObject(3383,-1610.72949219,-2251.81469727,6001.23730469,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(a51_labtable1_) (1)
    CreateDynamicObject(937,-1609.29797363,-2246.82910156,6001.73486328,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(cj_df_worktop) (1)
    CreateDynamicObject(937,-1609.29797363,-2244.94555664,6001.73486328,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(cj_df_worktop) (1)
    CreateDynamicObject(937,-1609.29797363,-2243.07519531,6001.73486328,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(cj_df_worktop) (1)
    CreateDynamicObject(2718,-1612.43872070,-2253.64111328,6004.41674805,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(cj_fly_killer) (1)
    CreateDynamicObject(2718,-1615.30139160,-2253.61938477,6004.41674805,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(cj_fly_killer) (2)
    CreateDynamicObject(2718,-1618.36767578,-2253.64599609,6004.41674805,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(cj_fly_killer) (3)
    CreateDynamicObject(2395,-1617.91101074,-2241.63769531,6001.20410156,0.00000000,270.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(cj_sports_wall) (8)
    CreateDynamicObject(2395,-1609.42834473,-2241.63891602,6003.96826172,0.00000000,90.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(cj_sports_wall) (8)
    CreateDynamicObject(2395,-1614.96191406,-2241.63818359,6006.51391602,0.00000000,180.00000000,179.99456787, .interiorid = 1, .worldid = 7860); //object(cj_sports_wall) (8)
    CreateDynamicObject(2230,-1561.39978027,-2246.29443359,6020.29687500,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(swank_speaker_2) (2)
    CreateDynamicObject(2230,-1568.42846680,-2246.28344727,6020.29687500,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(swank_speaker_2) (2)
    CreateDynamicObject(1726,-1560.17602539,-2240.16259766,6020.26562500,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 7860); //object(mrk_seating2) (3)
    CreateDynamicObject(1727,-1562.69946289,-2238.62377930,6020.26562500,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(mrk_seating2b) (1)
    CreateDynamicObject(2134,-1559.89562988,-2227.28979492,6020.30078125,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 7860); //object(cj_kitch2_m) (1)
    CreateDynamicObject(18044,-1541.11938477,-2233.44262695,6026.28906250,0.00000000,0.00000000,89.99450684, .interiorid = 1, .worldid = 7860); //object(cj_ammun3_extra) (1)
    CreateDynamicObject(3015,-1548.17553711,-2223.52539062,6024.70410156,0.00000000,0.00000000,1.98815918, .interiorid = 1, .worldid = 7860); //object(cr_cratestack) (2)
    CreateDynamicObject(3015,-1548.18481445,-2222.90087891,6024.70410156,0.00000000,0.00000000,1.98303223, .interiorid = 1, .worldid = 7860); //object(cr_cratestack) (2)
    CreateDynamicObject(3015,-1548.06506348,-2221.94873047,6024.70410156,0.00000000,0.00000000,333.98303223, .interiorid = 1, .worldid = 7860); //object(cr_cratestack) (2)
    CreateDynamicObject(1654,-1541.19836426,-2226.33544922,6025.71997070,342.09228516,271.86767578,146.27722168, .interiorid = 1, .worldid = 7860); //object(dynamite) (2)
    CreateDynamicObject(2612,-1534.49536133,-2225.45947266,6026.21655273,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(police_nb2) (1)
    CreateDynamicObject(1492,-1545.43249512,-2226.90112305,6024.59765625,0.00000000,0.00000000,179.99993896, .interiorid = 1, .worldid = 7860); //object(gen_doorint02) (1)
    CreateDynamicObject(1492,-1610.01745605,-2243.53588867,6018.67187500,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 7860); //object(gen_doorint02) (2)
    CreateDynamicObject(2240,-1567.82519531,-2235.08056641,6020.81884766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(plant_pot_8) (4)
    CreateDynamicObject(1742,-1559.76403809,-2246.38867188,6020.32031250,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(med_bookshelf) (1)
    CreateDynamicObject(2230,-1561.87646484,-2246.75341797,6021.67187500,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(swank_speaker_2) (4)
    CreateDynamicObject(2230,-1561.87597656,-2246.75292969,6022.49365234,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(swank_speaker_2) (4)
    CreateDynamicObject(2230,-1568.00585938,-2246.74462891,6022.49365234,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(swank_speaker_2) (4)
    CreateDynamicObject(2230,-1568.00585938,-2246.74414062,6021.67187500,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(swank_speaker_2) (4)
    CreateDynamicObject(14455,-1598.42700195,-2236.83691406,6020.32080078,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(gs_bookcase) (1)
    CreateDynamicObject(11353,-1541.70959473,-2254.12133789,6027.95947266,0.00000000,0.00000000,179.50000000, .interiorid = 1, .worldid = 7860); //object(station5new) (4)
    CreateDynamicObject(11353,-1541.71643066,-2257.27270508,6027.95947266,0.00000000,0.00000000,179.49462891, .interiorid = 1, .worldid = 7860); //object(station5new) (4)
    CreateDynamicObject(2021,-1548.80212402,-2245.28564453,6020.29687500,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(mrk_bdsdecab1) (1)
    CreateDynamicObject(1846,-1543.44641113,-2240.00781250,6021.59765625,90.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(shop_shelf04) (1)
    CreateDynamicObject(2230,-1542.31115723,-2242.03637695,6020.29687500,0.00000000,0.00000000,271.49414062, .interiorid = 1, .worldid = 7860); //object(swank_speaker_2) (2)
    CreateDynamicObject(2231,-1542.29980469,-2242.41015625,6020.29687500,0.00000000,0.00000000,269.99450684, .interiorid = 1, .worldid = 7860); //object(swank_speaker_3) (2)
    CreateDynamicObject(1818,-1545.84167480,-2240.16406250,6020.27441406,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(coffee_swank_2) (1)
    CreateDynamicObject(1726,-1547.68017578,-2240.74658203,6020.26562500,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(mrk_seating2) (3)
    CreateDynamicObject(1726,-1544.90222168,-2241.87329102,6020.26562500,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(mrk_seating2) (3)
    CreateDynamicObject(2855,-1545.38854980,-2239.72851562,6020.77734375,0.00000000,0.00000000,335.99487305, .interiorid = 1, .worldid = 7860); //object(gb_bedmags05) (1)
    CreateDynamicObject(2236,-1557.06921387,-2237.32714844,6020.29687500,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(coffee_swank_1) (3)
    CreateDynamicObject(2236,-1594.27807617,-2244.36865234,6018.67187500,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(coffee_swank_1) (4)
    CreateDynamicObject(2236,-1591.42407227,-2244.35815430,6018.67187500,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(coffee_swank_1) (5)
    CreateDynamicObject(1670,-1556.62561035,-2236.79638672,6020.82714844,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(propcollecttable) (4)
    CreateDynamicObject(1670,-1590.89477539,-2243.83471680,6019.20751953,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(propcollecttable) (5)
    CreateDynamicObject(1665,-1593.76867676,-2243.85131836,6019.20410156,0.00000000,0.00000000,13.99108887, .interiorid = 1, .worldid = 7860); //object(propashtray1) (3)
    CreateDynamicObject(644,-1575.43945312,-2245.81835938,6018.97900391,0.00000000,0.00000000,87.98657227, .interiorid = 1, .worldid = 7860); //object(pot_02) (8)
    CreateDynamicObject(644,-1580.59460449,-2245.78369141,6018.97900391,0.00000000,0.00000000,87.98400879, .interiorid = 1, .worldid = 7860); //object(pot_02) (8)
    CreateDynamicObject(2570,-1579.27453613,-2238.79516602,6018.67895508,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(hotel_dresser_4) (2)
    CreateDynamicObject(2833,-1578.58361816,-2246.08227539,6018.67187500,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(gb_livingrug02) (1)
    CreateDynamicObject(948,-1581.96533203,-2238.66992188,6018.67187500,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(plant_pot_10) (2)
    CreateDynamicObject(2164,-1587.13281250,-2237.94165039,6018.69165039,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(med_office_unit_5) (1)
    CreateDynamicObject(2167,-1589.65698242,-2236.40258789,6018.69165039,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(med_office_unit_7) (2)
    CreateDynamicObject(2163,-1589.65563965,-2235.52319336,6018.69165039,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(med_office_unit_2) (1)
    CreateDynamicObject(2255,-1546.34277344,-2246.30078125,6022.58398438,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(frame_clip_2) (1)
    CreateDynamicObject(948,-1609.55920410,-2245.64208984,6018.67187500,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(plant_pot_10) (3)
    CreateDynamicObject(948,-1609.59509277,-2242.98876953,6018.67187500,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(plant_pot_10) (6)
    CreateDynamicObject(14825,-1597.66992188,-2236.78808594,6009.33300781,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 7860); //object(int_boxing07) (1)
    CreateDynamicObject(1985,-1593.74707031,-2241.18627930,6010.67529297,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(punchbagnu) (2)
    CreateDynamicObject(2627,-1589.24023438,-2243.70507812,6007.08056641,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7860); //object(gym_treadmill) (1)
    CreateDynamicObject(2628,-1596.61132812,-2245.36816406,6007.06542969,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(gym_bench2) (1)
    CreateDynamicObject(2630,-1600.62207031,-2245.60009766,6007.06542969,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7860); //object(gym_bike) (1)
    CreateDynamicObject(2632,-1603.04504395,-2233.55004883,6007.16113281,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(gym_mat02) (2)
    CreateDynamicObject(2632,-1603.04504395,-2231.55249023,6007.16113281,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(gym_mat02) (3)
    CreateDynamicObject(14486,-1598.36010742,-2236.71655273,6008.61499023,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 7860); //object(madgym1) (1)
    CreateDynamicObject(3577,-1614.59130859,-2247.45019531,6002.05346680,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(dockcrates1_la) (1)
    CreateDynamicObject(1499,-1615.17700195,-2241.69995117,6001.27099609,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(gen_doorint05) (1)
    CreateDynamicObject(1499,-1612.16296387,-2241.68188477,6001.27099609,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7860); //object(gen_doorint05) (2)
    CreateDynamicObject(3265,-1612.08923340,-2240.77319336,6000.89599609,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 7860); //object(privatesign4) (1)
    CreateDynamicObject(3409,-1612.29968262,-2254.43554688,6001.66430664,0.00000000,0.00000000,87.74993896, .interiorid = 1, .worldid = 7860); //object(grassplant) (5)
    CreateDynamicObject(3409,-1616.78186035,-2254.42626953,6001.66430664,0.00000000,0.00000000,87.74780273, .interiorid = 1, .worldid = 7860); //object(grassplant) (6)
    CreateDynamicObject(3409,-1609.13281250,-2252.10522461,6001.66430664,0.00000000,0.00000000,87.74780273, .interiorid = 1, .worldid = 7860); //object(grassplant) (7)
    CreateDynamicObject(2901,-1609.50231934,-2248.48413086,6002.53247070,0.00000000,0.00000000,282.00000000, .interiorid = 1, .worldid = 7860); //object(kmb_marijuana) (4)
    CreateDynamicObject(2901,-1617.69482422,-2242.66162109,6001.63598633,0.00000000,0.00000000,357.99707031, .interiorid = 1, .worldid = 7860); //object(kmb_marijuana) (5)
    CreateDynamicObject(2901,-1617.45556641,-2243.27490234,6001.63598633,0.00000000,0.00000000,357.99499512, .interiorid = 1, .worldid = 7860); //object(kmb_marijuana) (6)
    CreateDynamicObject(2901,-1617.62646484,-2242.78955078,6002.66088867,0.00000000,0.00000000,323.99499512, .interiorid = 1, .worldid = 7860); //object(kmb_marijuana) (7)
    CreateDynamicObject(1575,-1609.34863281,-2243.35229492,6002.18872070,0.00000000,0.00000000,36.00000000, .interiorid = 1, .worldid = 7860); //object(drug_white) (6)
    CreateDynamicObject(1575,-1609.42834473,-2243.61865234,6002.31323242,0.00000000,322.00000000,91.99670410, .interiorid = 1, .worldid = 7860); //object(drug_white) (15)
    CreateDynamicObject(1575,-1609.53613281,-2244.42089844,6002.18872070,0.00000000,0.00000000,115.99243164, .interiorid = 1, .worldid = 7860); //object(drug_white) (16)
    CreateDynamicObject(1575,-1609.18164062,-2245.11303711,6002.18872070,0.00000000,0.00000000,65.98815918, .interiorid = 1, .worldid = 7860); //object(drug_white) (17)
    CreateDynamicObject(1575,-1609.37414551,-2245.91601562,6002.18872070,0.00000000,0.00000000,19.98388672, .interiorid = 1, .worldid = 7860); //object(drug_white) (18)
    CreateDynamicObject(1575,-1609.37402344,-2245.91601562,6002.36303711,0.00000000,0.00000000,19.97863770, .interiorid = 1, .worldid = 7860); //object(drug_white) (19)
    CreateDynamicObject(1575,-1609.26745605,-2246.83154297,6002.18872070,0.00000000,0.00000000,47.98815918, .interiorid = 1, .worldid = 7860); //object(drug_white) (21)
    CreateDynamicObject(1575,-1609.37207031,-2246.55908203,6001.43676758,0.00000000,0.00000000,47.98278809, .interiorid = 1, .worldid = 7860); //object(drug_white) (22)
    CreateDynamicObject(1575,-1609.35937500,-2247.20605469,6001.43676758,0.00000000,0.00000000,359.98281860, .interiorid = 1, .worldid = 7860); //object(drug_white) (23)
    CreateDynamicObject(1575,-1609.31835938,-2244.55273438,6001.43676758,0.00000000,0.00000000,45.97802734, .interiorid = 1, .worldid = 7860); //object(drug_white) (24)
    CreateDynamicObject(1575,-1609.52807617,-2245.25732422,6001.86010742,0.00000000,0.00000000,71.97778320, .interiorid = 1, .worldid = 7860); //object(drug_white) (25)
    CreateDynamicObject(1575,-1609.37268066,-2242.92968750,6001.43872070,0.00000000,0.00000000,44.00000000, .interiorid = 1, .worldid = 7860); //object(drug_white) (26)
    CreateDynamicObject(1575,-1609.35144043,-2243.50878906,6001.43872070,0.00000000,0.00000000,333.99478149, .interiorid = 1, .worldid = 7860); //object(drug_white) (27)
    CreateDynamicObject(1985,-1596.66772461,-2242.73193359,6010.47607422,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(punchbagnu) (2)
    CreateDynamicObject(14791,-1594.09045410,-2233.48095703,6008.60937500,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7860); //object(a_vgsgymboxa) (1)

	//Harem Beach House
	CreateDynamicObject(11490,971.29980469,-2155.89941406,12.10000038,0.00000000,0.00000000,85.99548340); //object(des_ranch) (1)
	CreateDynamicObject(11491,982.39941406,-2156.69921875,13.60000038,0.24719238,0.24169922,85.98999023); //object(des_ranchbits1) (1)
	CreateDynamicObject(12991,998.19921875,-2218.19921875,12.19999981,359.97802734,0.49438477,21.46179199); //object(sw_shack02) (1)
	CreateDynamicObject(13694,995.29980469,-2179.00000000,10.00000000,0.00000000,0.00000000,356.24267578); //object(cehillhse13) (1)
	CreateDynamicObject(13816,981.29980469,-2108.59960938,9.89999962,0.00000000,0.00000000,240.74340820); //object(ce_safeground) (1)
	CreateDynamicObject(13816,970.69921875,-2127.50000000,-1.50000000,359.73632812,181.24694824,240.74340820); //object(ce_safeground) (2)
	CreateDynamicObject(4005,983.09997559,-2172.60009766,-0.80000001,0.00000000,359.74731445,266.73718262); //object(decoblok2_lan) (1)
	CreateDynamicObject(4005,988.69921875,-2138.09960938,-0.80000001,0.00000000,0.00000000,348.48083496); //object(decoblok2_lan) (2)
	CreateDynamicObject(4005,1003.59997559,-2089.80004883,-0.80000001,359.97802734,0.00000000,152.73193359); //object(decoblok2_lan) (3)
	CreateDynamicObject(3694,1001.09960938,-2148.59960938,12.50000000,0.00000000,359.74731445,96.98730469); //object(ryder_holes) (1)
	CreateDynamicObject(10444,975.39941406,-2104.59960938,12.10000038,0.00000000,0.00000000,332.24853516); //object(poolwater_sfs) (1)
	CreateDynamicObject(16095,977.89941406,-2156.29980469,9.80000019,0.00000000,0.00000000,175.98999023); //object(des_a51guardbox02) (1)
	CreateDynamicObject(3115,1016.69921875,-2062.89941406,11.89999962,359.97802734,0.00000000,79.72778320); //object(carrier_lift1_sfse) (5)
	CreateDynamicObject(3409,1002.20001221,-2143.10009766,12.00000000,0.00000000,0.00000000,91.49511719); //object(grassplant) (1)
	CreateDynamicObject(3409,1002.20001221,-2147.80004883,12.00000000,0.00000000,0.00000000,1.23950195); //object(grassplant) (2)
	CreateDynamicObject(3409,1002.29980469,-2152.69921875,12.00000000,0.00000000,0.00000000,90.49133301); //object(grassplant) (3)
	CreateDynamicObject(3409,1002.39941406,-2157.39941406,12.00000000,0.00000000,0.00000000,4.24621582); //object(grassplant) (4)
	CreateDynamicObject(3409,998.29980469,-2157.59960938,12.00000000,0.00000000,0.00000000,3.74633789); //object(grassplant) (5)
	CreateDynamicObject(3409,998.19921875,-2153.00000000,12.00000000,0.00000000,0.00000000,2.24670410); //object(grassplant) (6)
	CreateDynamicObject(3409,998.19921875,-2148.09960938,12.00000000,0.00000000,0.00000000,3.98901367); //object(grassplant) (7)
	CreateDynamicObject(3409,997.79998779,-2143.19995117,12.00000000,0.00000000,0.00000000,4.49438477); //object(grassplant) (8)
	CreateDynamicObject(1412,1002.09960938,-2162.39941406,13.39999962,0.00000000,0.00000000,348.49182129); //object(dyn_mesh_2) (1)
	CreateDynamicObject(1412,996.90002441,-2161.30004883,13.39999962,0.00000000,0.00000000,347.24487305); //object(dyn_mesh_2) (2)
	CreateDynamicObject(18014,991.59997559,-2092.89990234,12.69999981,359.23095703,358.49487305,330.22436523); //object(vgeplntr06_lvs) (2)
	CreateDynamicObject(3811,975.00000000,-2143.69921875,14.00000000,0.00000000,0.00000000,355.49560547); //object(sfx_winplant08) (1)
	CreateDynamicObject(3810,966.00000000,-2155.50000000,17.70000076,0.74707031,0.24719238,173.49609375); //object(sfx_plant04) (1)
	CreateDynamicObject(3802,980.59997559,-2156.50000000,17.50000000,0.00000000,0.00000000,357.50000000); //object(sfx_plant03) (1)
	CreateDynamicObject(3660,962.00000000,-2091.09960938,13.60000038,1.47216797,359.73632812,59.47998047); //object(lasairfbed_las) (1)
	CreateDynamicObject(14401,1006.40002441,-2187.39990234,12.50000000,359.75000000,0.50000000,354.50219727); //object(bench1) (1)
	CreateDynamicObject(3806,973.20001221,-2170.39990234,14.19999981,0.00000000,0.00000000,355.49560547); //object(sfx_winplant08) (1)
	CreateDynamicObject(642,966.50000000,-2104.10009766,13.50000000,0.00000000,0.00000000,77.74365234); //object(kb_canopy_test) (1)
	CreateDynamicObject(1412,994.50000000,-2158.10009766,13.39999962,0.00000000,0.00000000,89.24487305); //object(dyn_mesh_2) (2)
	CreateDynamicObject(1412,994.59997559,-2152.80004883,13.39999962,0.00000000,0.00000000,89.24194336); //object(dyn_mesh_2) (2)
	CreateDynamicObject(1412,994.70001221,-2147.50000000,13.39999962,0.00000000,0.00000000,89.24194336); //object(dyn_mesh_2) (2)
	CreateDynamicObject(1412,994.79998779,-2142.19995117,13.39999962,0.00000000,0.00000000,88.74194336); //object(dyn_mesh_2) (2)
	CreateDynamicObject(5152,1024.09997559,-2075.60009766,14.10000038,0.07843018,293.73315430,170.71191406); //object(stuntramp1_las2) (2)
	CreateDynamicObject(9820,978.00000000,-2121.00000000,12.89999962,0.00000000,0.00000000,331.74316406); //object(shpbridge_sfw04) (1)
	CreateDynamicObject(9306,957.90002441,-2099.50000000,-22.10000038,0.15380859,269.01123047,59.23828125); //object(sfn_cm_grnd02) (1)
	CreateDynamicObject(975,1020.20001221,-2069.89990234,13.89999962,0.00000000,0.00000000,349.74414062); //object(columbiangate) (1)
	CreateDynamicObject(17915,966.90002441,-2143.19995117,2.00000000,54.97839355,90.00000000,356.49804688); //object(lae2billbrds2) (1)
	CreateDynamicObject(17915,974.59997559,-2127.69995117,2.00000000,54.71740723,90.00000000,326.22802734); //object(lae2billbrds2) (2)
	CreateDynamicObject(9305,974.70001221,-2136.19995117,12.19999981,0.00000000,0.00000000,124.24731445); //object(ground01_sfn_cm) (1)
	CreateDynamicObject(11494,1000.29998779,-2187.89990234,12.69999981,359.98352051,0.24719238,39.99023438); //object(des_rnchbhous) (1)
	CreateDynamicObject(17037,1001.09997559,-2187.19995117,13.00000000,359.57553101,92.46377563,351.75292969); //object(cuntw_carport2_) (1)
	CreateDynamicObject(3578,1012.09997559,-2067.89990234,11.50000000,358.99475098,0.00000000,349.73876953); //object(dockbarr1_la) (1)
	CreateDynamicObject(9339,998.20001221,-2078.39990234,10.50000000,0.00000000,0.00000000,157.99987793); //object(sfnvilla001_cm) (1)
	CreateDynamicObject(9339,998.20001221,-2078.39990234,11.89999962,0.00000000,0.00000000,157.99987793); //object(sfnvilla001_cm) (2)
	CreateDynamicObject(9339,998.19921875,-2078.39941406,13.30000019,0.00000000,0.00000000,157.99987793); //object(sfnvilla001_cm) (3)
	CreateDynamicObject(982,998.29980469,-2078.29980469,14.69999981,0.00000000,0.00000000,337.98339844); //object(fenceshit) (1)
	CreateDynamicObject(16096,993.69921875,-2093.79980469,10.10000038,0.49438477,178.74206543,60.74340820); //object(des_a51guardbox02) (1)
	CreateDynamicObject(15038,983.29998779,-2162.80004883,14.30000019,0.00000000,0.00000000,42.25000000); //object(plant_pot_3_sv) (1)
	CreateDynamicObject(5152,1005.29980469,-2066.69921875,13.19999981,270.01647949,197.51220703,164.76184082); //object(stuntramp1_las2) (6)
	CreateDynamicObject(5152,1019.09997559,-2069.10009766,13.19999981,270.26904297,181.34527588,146.59844971); //object(stuntramp1_las2) (6)
	CreateDynamicObject(5152,1022.79998779,-2069.80004883,13.19999981,270.23242188,358.00787354,324.01342773); //object(stuntramp1_las2) (6)
	CreateDynamicObject(5152,1024.59997559,-2072.30004883,13.19999981,270.23071289,358.00048828,236.25549316); //object(stuntramp1_las2) (6)
	CreateDynamicObject(5152,1019.09960938,-2069.09960938,15.30000019,270.25817871,181.34033203,146.59057617); //object(stuntramp1_las2) (6)
	CreateDynamicObject(5152,1022.79998779,-2069.80004883,15.30000019,270.23071289,358.00598145,324.00878906); //object(stuntramp1_las2) (6)
	CreateDynamicObject(5152,1024.59997559,-2072.30004883,15.30000019,271.01623535,76.90979004,315.17028809); //object(stuntramp1_las2) (6)
	CreateDynamicObject(5152,1005.29980469,-2066.69921875,15.30000019,270.01098633,197.50122070,164.76184082); //object(stuntramp1_las2) (6)
	CreateDynamicObject(9131,968.90002441,-2078.50000000,12.10000038,359.23913574,0.49990845,149.47375488); //object(shbbyhswall13_lvs) (1)
	CreateDynamicObject(8661,1003.69921875,-2091.39941406,12.10000038,0.24719238,359.99450684,67.74719238); //object(gnhtelgrnd_lvs) (1)
	CreateDynamicObject(638,968.40002441,-2173.60009766,12.89999962,0.00000000,0.00000000,86.00000000); //object(kb_planter_bush) (1)
	CreateDynamicObject(802,1005.50000000,-2067.60009766,12.50000000,8.50000000,0.00000000,300.00000000); //object(genveg_bush08) (1)
	CreateDynamicObject(2241,974.89941406,-2161.50000000,12.69999981,0.00000000,0.00000000,317.24121094); //object(plant_pot_5) (1)
	CreateDynamicObject(11472,1001.29998779,-2221.00000000,10.30000019,0.00000000,0.00000000,112.00000000); //object(des_swtstairs1) (1)
	CreateDynamicObject(11472,1001.29980469,-2221.00000000,13.50000000,0.00000000,359.74731445,111.99462891); //object(des_swtstairs1) (2)
	CreateDynamicObject(2288,978.00000000,-2156.30004883,17.29999924,359.24194336,0.00000000,267.73132324); //object(frame_3) (1)
	CreateDynamicObject(2286,974.50000000,-2151.60009766,15.69999981,0.00000000,0.00000000,356.25000000); //object(frame_5) (1)
	CreateDynamicObject(2279,973.79998779,-2160.10009766,15.60000038,0.00000000,0.00000000,175.99511719); //object(frame_thick_6) (1)
	CreateDynamicObject(2278,968.00000000,-2159.69995117,15.39999962,0.00000000,0.00000000,175.75000000); //object(frame_thick_2) (1)
	CreateDynamicObject(2270,978.09997559,-2156.30004883,19.79999924,358.74206543,0.00000000,265.99548340); //object(frame_wood_6) (1)
	CreateDynamicObject(2268,976.79998779,-2160.30004883,15.30000019,0.00000000,0.00000000,175.24841309); //object(frame_wood_2) (1)
	CreateDynamicObject(2266,971.70001221,-2150.80004883,18.60000038,0.00000000,0.00000000,355.25000000); //object(frame_wood_5) (1)
	CreateDynamicObject(2261,971.00000000,-2161.19995117,18.50000000,0.00000000,0.00000000,176.00000000); //object(frame_slim_2) (1)
	CreateDynamicObject(2290,975.29980469,-2153.19921875,13.60000038,0.00000000,0.00000000,356.48986816); //object(swk_couch_1) (1)
	CreateDynamicObject(2290,976.69921875,-2159.29980469,13.60000038,0.00000000,0.00000000,176.73706055); //object(swk_couch_1) (2)
	CreateDynamicObject(1419,978.50000000,-2156.80004883,12.00000000,0.00000000,90.99465942,87.49218750); //object(dyn_f_iron_1) (1)
	CreateDynamicObject(1419,978.59997559,-2155.89990234,12.00000000,0.00000000,89.74975586,78.24209595); //object(dyn_f_iron_1) (2)
	CreateDynamicObject(2357,965.69921875,-2104.50000000,12.69999981,0.00000000,0.00000000,151.24328613); //object(dunc_dinning) (1)
	CreateDynamicObject(2256,967.09997559,-2155.60009766,18.60000038,359.75000000,0.00000000,85.99792480); //object(frame_clip_3) (1)
	CreateDynamicObject(1565,968.59997559,-2152.80004883,16.60000038,0.00000000,0.00000000,151.99548340); //object(swank_dinning_6) (1)
	CreateDynamicObject(2076,970.70001221,-2155.89990234,21.00000000,0.00000000,0.00000000,34.00000000); //object(cj_mlight10) (1)
	CreateDynamicObject(1255,980.40002441,-2106.30004883,12.89999962,0.00000000,0.00000000,122.75000000); //object(lounger) (1)
	CreateDynamicObject(1255,983.00000000,-2101.79980469,12.89999962,0.00000000,0.00000000,175.99548340); //object(lounger) (2)
	CreateDynamicObject(1646,982.40002441,-2104.30004883,12.60000038,0.00000000,0.00000000,240.25000000); //object(lounge_towel_up) (1)
	CreateDynamicObject(2145,967.50000000,-2152.69995117,13.60000038,0.00000000,0.00000000,86.50000000); //object(cj_k3_unit06) (1)
	CreateDynamicObject(2158,967.70001221,-2153.69995117,13.60000038,0.00000000,0.00000000,85.00000000); //object(cj_kitch1_l) (1)
	CreateDynamicObject(2160,967.59997559,-2152.00000000,13.60000038,0.00000000,0.00000000,85.75000000); //object(cj_k6_low_unit3) (1)
	CreateDynamicObject(2158,968.00000000,-2150.10009766,16.10000038,0.00762939,270.25012207,84.75030518); //object(cj_kitch1_l) (2)
	CreateDynamicObject(14820,968.69921875,-2159.09960938,14.60000038,0.00000000,0.00000000,88.72033691); //object(swk_couch_1) (2)
	CreateDynamicObject(1744,978.70001221,-2155.89990234,16.10000038,0.00000000,0.00000000,265.99548340); //object(med_shelf) (1)
	CreateDynamicObject(1754,975.20001221,-2154.19995117,13.60000038,0.00000000,0.00000000,85.75000000); //object(swank_single_1) (1)
	CreateDynamicObject(1754,975.09997559,-2155.19995117,13.60000038,0.00000000,0.00000000,84.99829102); //object(swank_single_1) (2)
	CreateDynamicObject(1754,975.00000000,-2156.19995117,13.60000038,0.00000000,0.00000000,84.99572754); //object(swank_single_1) (3)
	CreateDynamicObject(1754,974.90002441,-2157.19995117,13.60000038,0.00000000,0.00000000,85.74572754); //object(swank_single_1) (4)
	CreateDynamicObject(1754,974.79998779,-2158.19995117,13.60000038,0.00000000,0.00000000,85.99279785); //object(swank_single_1) (5)
	CreateDynamicObject(2290,973.79998779,-2158.10009766,13.60000038,0.00000000,0.00000000,176.23706055); //object(swk_couch_1) (2)
	CreateDynamicObject(1754,973.90002441,-2157.10009766,13.60000038,0.00000000,0.00000000,265.24279785); //object(swank_single_1) (6)
	CreateDynamicObject(1754,974.00000000,-2156.10009766,13.60000038,0.00000000,0.00000000,266.24267578); //object(swank_single_1) (7)
	CreateDynamicObject(1754,974.09997559,-2155.10009766,13.60000038,0.00000000,0.00000000,265.74267578); //object(swank_single_1) (8)
	CreateDynamicObject(2290,972.19921875,-2153.89941406,13.60000038,0.00000000,0.00000000,355.48461914); //object(swk_couch_1) (2)
	CreateDynamicObject(2099,967.00000000,-2159.89990234,13.60000038,0.00000000,0.00000000,118.99542236); //object(med_hi_fi_1) (1)
	CreateDynamicObject(2828,978.50000000,-2155.69995117,14.80000019,0.24990845,1.50000000,69.99346924); //object(gb_ornament02) (1)
	CreateDynamicObject(14519,980.50000000,-2109.29980469,13.60000038,0.00000000,0.00000000,60.74890137); //object(im_xtra4) (1)
	CreateDynamicObject(14806,968.79998779,-2149.00000000,19.39999962,4.24322510,183.25878906,49.00866699); //object(bdupshifi) (1)
	CreateDynamicObject(14806,968.29998779,-2162.80004883,19.60000038,15.74508667,178.95947266,127.52801514); //object(bdupshifi) (2)
	CreateDynamicObject(2293,975.79980469,-2158.29980469,13.60000038,359.49462891,0.00000000,356.24804688); //object(swk_1_fstool) (1)
	CreateDynamicObject(1565,968.40002441,-2155.60009766,16.60000038,0.00000000,0.00000000,151.99035645); //object(swank_dinning_6) (1)
	CreateDynamicObject(1565,968.20001221,-2158.60009766,16.60000038,0.00000000,0.00000000,151.99035645); //object(swank_dinning_6) (1)
	CreateDynamicObject(2293,975.89941406,-2157.29980469,13.60000038,359.48913574,0.00000000,85.74255371); //object(swk_1_fstool) (2)
	CreateDynamicObject(2293,976.00000000,-2156.29980469,13.60000038,359.48913574,0.00000000,174.98754883); //object(swk_1_fstool) (3)
	CreateDynamicObject(2293,976.09960938,-2155.29980469,13.60000038,359.48913574,0.00000000,354.23205566); //object(swk_1_fstool) (4)
	CreateDynamicObject(2293,976.19921875,-2154.29980469,13.60000038,359.48913574,0.00000000,84.73181152); //object(swk_1_fstool) (5)
	CreateDynamicObject(1736,978.20001221,-2156.30004883,17.89999962,0.00000000,0.00000000,266.24816895); //object(cj_stags_head) (1)
	CreateDynamicObject(1786,978.90002441,-2156.30004883,15.10000038,0.00000000,359.75000000,266.25000000); //object(swank_tv_4) (1)
	CreateDynamicObject(1280,975.90002441,-2139.30004883,12.60000038,0.00000000,0.00000000,176.00000000); //object(parkbench1) (1)
	CreateDynamicObject(1463,979.00000000,-2156.39990234,13.10000038,350.53686523,288.26916504,290.27478027); //object(dyn_woodpile2) (1)
	CreateDynamicObject(1463,978.79998779,-2156.30004883,13.30000019,351.34997559,288.37664795,5.64678955); //object(dyn_woodpile2) (2)
	CreateDynamicObject(1463,979.00000000,-2156.10009766,13.39999962,336.41589355,73.05133057,132.71063232); //object(dyn_woodpile2) (3)
	CreateDynamicObject(14872,1002.70001221,-2217.00000000,12.60000038,358.74734497,359.74993896,142.22903442); //object(kylie_logs) (1)
	CreateDynamicObject(1463,996.09960938,-2217.00000000,12.50000000,1.98303223,1.99951172,201.42333984); //object(dyn_woodpile2) (4)
	CreateDynamicObject(742,999.79980469,-2191.59960938,12.50000000,0.00000000,0.00000000,186.49401855); //object(pot_03) (1)
	CreateDynamicObject(1517,978.29998779,-2157.19995117,15.00000000,0.00000000,359.25000000,0.00000000); //object(dyn_wine_break) (1)
	CreateDynamicObject(1520,978.29998779,-2157.00000000,16.50000000,0.00000000,0.00000000,220.00000000); //object(dyn_wine_bounce) (1)
	CreateDynamicObject(1544,968.40002441,-2157.60009766,14.50000000,0.00000000,0.00000000,172.00000000); //object(cj_beer_b_1) (1)
	CreateDynamicObject(1664,978.29998779,-2155.89990234,16.60000038,0.00000000,0.00000000,0.00000000); //object(propwinebotl2) (1)
	CreateDynamicObject(1668,978.29998779,-2156.10009766,16.60000038,0.00000000,0.00000000,0.00000000); //object(propvodkabotl1) (1)
	CreateDynamicObject(1669,978.29998779,-2156.80004883,16.60000038,0.00000000,0.00000000,216.00000000); //object(propwinebotl1) (1)
	CreateDynamicObject(1950,966.59960938,-2104.50000000,13.30000019,0.00000000,0.00000000,1.99523926); //object(kb_beer) (1)
	CreateDynamicObject(16151,967.69921875,-2160.79980469,13.89999962,0.00000000,0.00000000,177.74780273); //object(ufo_bar) (1)
	CreateDynamicObject(2690,971.79998779,-2129.50000000,13.69999981,0.00000000,0.00000000,58.00000000); //object(cj_fire_ext) (1)
	CreateDynamicObject(18078,973.00000000,-2126.69995117,12.80000019,0.00000000,0.00000000,150.75000000); //object(cj_barb_2_acc) (1)
	CreateDynamicObject(18005,976.70001221,-2121.10009766,12.80000019,2.25000000,0.00000000,59.00000000); //object(int_barbera01) (1)
	CreateDynamicObject(14589,1016.09960938,-2065.19921875,-18.39999962,89.64294434,135.03845215,214.70581055); //object(ab_abbatoir06) (1)
	CreateDynamicObject(14586,1025.29980469,-2074.00000000,-22.50000000,271.99951172,0.00000000,169.74975586); //object(ab_abbatoir03) (1)
	CreateDynamicObject(2871,967.29998779,-2159.89990234,12.10000038,0.00000000,0.00000000,123.00000000); //object(cj_ss_3_r) (1)
	CreateDynamicObject(2099,967.40002441,-2160.80004883,13.60000038,0.74990845,0.75006104,208.48388672); //object(med_hi_fi_1) (1)
	CreateDynamicObject(1278,1003.09960938,-2066.29980469,4.90000010,0.49987793,179.99450684,212.73925781); //object(sub_floodlite) (1)
	CreateDynamicObject(1308,1025.00000000,-2070.19995117,12.39999962,0.00000000,0.00000000,308.75000000); //object(telgrphpole02) (1)
	CreateDynamicObject(3463,1003.09960938,-2066.39941406,11.50000000,0.24719238,359.24743652,252.75146484); //object(vegaslampost2) (1)
	CreateDynamicObject(2838,967.00000000,-2105.10009766,13.10000038,2.74975586,0.75085449,214.21398926); //object(gb_takeaway03) (1)
	CreateDynamicObject(2740,994.09960938,-2170.59960938,18.39999962,0.00000000,0.00000000,0.00000000); //object(cj_bs_light) (1)
	CreateDynamicObject(3783,1006.79998779,-2215.69995117,9.80000019,359.99179077,0.49426270,20.49057007); //object(las2xref01_lax) (1)
	CreateDynamicObject(14728,1009.89941406,-2082.19921875,10.60000038,0.00000000,0.00000000,266.23718262); //object(int2labig302) (1)
	CreateDynamicObject(2311,971.09997559,-2155.39990234,13.60000038,359.74731445,359.74731445,353.74206543); //object(dyn_table_1) (2)
	CreateDynamicObject(2311,971.00000000,-2156.19995117,13.60000038,359.74731445,359.74731445,352.23999023); //object(dyn_table_1) (2)
	CreateDynamicObject(1726,1003.50000000,-2160.19921875,12.10000038,0.00000000,0.00000000,262.74853516); //object(mrk_seating2) (1)
	CreateDynamicObject(843,1015.00000000,-2086.89941406,12.89999962,351.49731445,2.26971436,158.58544922); //object(dead_tree_15) (1)
	CreateDynamicObject(2811,976.90002441,-2148.69995117,16.79999924,0.00000000,0.24499512,220.99633789); //object(gb_romanpot01) (1)
	CreateDynamicObject(2370,1001.00000000,-2161.30004883,12.10000038,0.00000000,0.00000000,352.50000000); //object(shop_set_1_table) (1)
	CreateDynamicObject(17021,979.70001221,-2100.69995117,1.89999998,359.99731445,179.74450684,59.48550415); //object(cuntplant06) (1)
	CreateDynamicObject(982,980.59997559,-2085.10009766,13.19999981,359.73901367,359.99719238,59.47442627); //object(fenceshit) (1)
	CreateDynamicObject(17915,985.29998779,-2091.69995117,2.00000000,54.71191406,89.99450684,239.72167969); //object(lae2billbrds2) (2)
	CreateDynamicObject(4085,984.69921875,-2111.09960938,5.59999990,0.46142578,0.24719238,239.24096680); //object(supports01_lan) (1)
	CreateDynamicObject(1894,951.50000000,-2111.19995117,12.00000000,359.49462891,179.99450684,59.98535156); //object(garys_luv_ramp) (1)
	CreateDynamicObject(9339,980.59997559,-2085.10009766,11.80000019,0.24707031,1.74719238,239.48449707); //object(sfnvilla001_cm) (1)
	CreateDynamicObject(1894,974.09997559,-2127.50000000,10.30000019,88.41687012,18.40454102,311.82608032); //object(garys_luv_ramp) (1)
	CreateDynamicObject(17915,976.09997559,-2127.69995117,1.89999998,54.20379639,89.29785156,241.82371521); //object(lae2billbrds2) (2)
	CreateDynamicObject(17915,961.00000000,-2119.39990234,2.00000000,54.19674683,88.95147705,241.24389648); //object(lae2billbrds2) (2)
	CreateDynamicObject(1894,975.20001221,-2125.69995117,10.30000019,89.08935547,145.46313477,184.75529480); //object(garys_luv_ramp) (1)
	CreateDynamicObject(1894,976.20001221,-2124.00000000,10.39999962,89.74664307,88.67504883,241.55072021); //object(garys_luv_ramp) (1)
	CreateDynamicObject(3660,964.40002441,-2087.00000000,13.60000038,1.21948242,359.73632812,59.48547363); //object(lasairfbed_las) (1)
	CreateDynamicObject(982,957.09997559,-2098.19995117,12.89999962,359.98901367,0.24719238,330.22155762); //object(fenceshit) (1)
	CreateDynamicObject(982,958.69921875,-2121.09960938,12.89999962,0.49438477,0.24719238,60.21606445); //object(fenceshit) (1)
	CreateDynamicObject(984,965.20001221,-2084.19995117,12.89999962,0.48889160,359.98901367,329.46630859); //object(fenceshit) (1)
	CreateDynamicObject(11393,975.50000000,-2125.30004883,13.80000019,0.00000000,0.00000000,147.75000000); //object(hubprops1_sfs) (1)
	CreateDynamicObject(1231,968.90002441,-2078.39990234,14.60000038,359.50012207,359.48913574,234.98657227); //object(streetlamp1) (1)
	CreateDynamicObject(16101,1016.70001221,-2068.80004883,16.39999962,359.75000000,180.00000000,237.25000000); //object(des_windsockpole) (1)
	CreateDynamicObject(11494,1000.29998779,-2187.89990234,12.80000019,359.50820923,180.49183655,310.99313354); //object(des_rnchbhous) (1)
	CreateDynamicObject(7246,974.29998779,-2126.30004883,11.30000019,0.00000000,270.00000000,330.99853516); //object(lastran1_la02) (1)
	CreateDynamicObject(5066,992.00000000,-2110.80004883,13.50000000,0.24996948,0.00000000,150.50012207); //object(mondoshave_las) (1)

	//Flint Country - Marie_Culen
	CreateDynamicObject(980, -78.55, -1536.01, 4.28,   0.00, 0.00, 44.00);
	CreateDynamicObject(980, -86.79, -1543.99, 4.28,   0.00, 0.00, 44.00);
	CreateDynamicObject(980, -95.24, -1552.20, 4.28,   0.00, 0.00, 44.00);
	CreateDynamicObject(980, -103.69, -1560.48, 4.28,   0.00, 0.00, 44.00);
	CreateDynamicObject(980, -112.15, -1568.65, 4.28,   0.00, 0.00, 44.00);
	CreateDynamicObject(980, -113.18, -1577.45, 4.28,   0.00, 0.00, 123.00);
	CreateDynamicObject(980, -106.75, -1587.03, 4.28,   0.00, 0.00, 123.00);
	CreateDynamicObject(980, -100.47, -1596.77, 4.28,   0.00, 0.00, 123.00);
	CreateDynamicObject(980, -94.12, -1606.52, 4.28,   0.00, 0.00, 123.00);
	CreateDynamicObject(980, -91.96, -1609.93, 4.28,   0.00, 0.00, 121.00);
	CreateDynamicObject(980, -83.75, -1612.15, 4.28,   0.00, 0.00, 26.00);
	CreateDynamicObject(980, -73.73, -1606.69, 4.28,   0.00, 0.00, 32.00);
	CreateDynamicObject(980, -64.40, -1599.80, 4.28,   0.00, 0.00, 40.00);
	CreateDynamicObject(980, -69.27, -1534.77, 4.28,   0.00, 0.00, -28.00);
	CreateDynamicObject(980, -63.72, -1537.48, 4.28,   0.00, 0.00, -28.00);
	CreateDynamicObject(980, -54.39, -1544.38, 4.28,   0.00, 0.00, -45.00);
	CreateDynamicObject(980, -46.34, -1552.36, 4.28,   0.00, 0.00, -45.00);
	CreateDynamicObject(980, -41.91, -1555.60, 4.28,   0.00, 0.00, -40.00);
	CreateDynamicObject(980, -40.00, -1564.58, 4.28,   0.00, 0.00, 62.00);
	CreateDynamicObject(980, -43.54, -1572.02, 4.28,   0.00, 0.00, 62.00);
	CreateDynamicObject(980, -49.51, -1582.34, 4.28,   0.00, 0.00, 62.00);

	//Custom House Nhim.Stone
	CreateDynamicObject(14389,-346.85000000,-1905.86000000,1000.00000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1536,-333.84000000,-1864.68000000,996.75000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1536,-333.84000000,-1861.66000000,996.75000000,0.00000000,0.00000000,269.99000000); //
	CreateDynamicObject(1567,-335.17000000,-1868.69000000,996.74000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(1567,-339.17000000,-1868.68000000,996.74000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(14900,-339.36000000,-1869.97000000,998.34000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(14900,-335.36000000,-1870.02000000,998.34000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(14415,-380.06000000,-1881.27000000,1002.91000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(16637,-354.48000000,-1869.92000000,998.25000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(16637,-354.48000000,-1875.25000000,998.25000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(16637,-354.54000000,-1871.98000000,996.60000000,0.00000000,90.00000000,0.00000000); //
	CreateDynamicObject(2331,-354.88000000,-1871.50000000,996.99000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2331,-354.88000000,-1873.56000000,996.99000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2251,-355.02000000,-1871.50000000,998.30000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2251,-355.02000000,-1873.50000000,998.30000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1491,-354.43000000,-1871.82000000,996.75000000,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(3494,-361.66000000,-1887.13000000,999.26000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(3494,-361.66000000,-1894.44000000,999.26000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(14446,-363.00000000,-1891.70000000,997.33000000,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(2333,-362.72000000,-1888.24000000,996.75000000,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(2710,-361.73000000,-1889.51000000,997.82000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1670,-361.74000000,-1888.91000000,997.73000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1644,-361.49000000,-1888.23000000,997.74000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1550,-361.64000000,-1888.40000000,996.89000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1550,-361.66000000,-1889.15000000,996.89000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2052,-361.79000000,-1888.17000000,997.71000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2818,-363.62000000,-1889.92000000,996.75000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1828,-366.87000000,-1890.97000000,996.75000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2573,-366.97000000,-1886.94000000,996.75000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2147,-368.56000000,-1887.03000000,996.75000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1491,-369.23000000,-1886.21000000,996.75000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(1491,-372.26000000,-1886.21000000,996.75000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1491,-372.24000000,-1877.80000000,996.75000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1491,-369.21000000,-1877.80000000,996.75000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(1491,-388.10000000,-1894.00000000,996.75000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1491,-388.10000000,-1890.99000000,996.75000000,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(1491,-395.86000000,-1885.83000000,996.75000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1491,-392.80000000,-1885.83000000,996.75000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(1491,-400.50000000,-1872.00000000,996.75000000,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(1491,-400.50000000,-1875.03000000,996.75000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(14411,-411.89000000,-1878.65000000,993.55000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1649,-410.32000000,-1871.50000000,999.00000000,0.00000000,90.00000000,0.00000000); //
	CreateDynamicObject(1651,-410.83000000,-1871.06000000,998.73000000,90.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1651,-410.83000000,-1871.06000000,1001.48000000,90.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1491,-413.63000000,-1871.30000000,996.75000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2032,-411.49000000,-1869.57000000,996.75000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1510,-411.41000000,-1869.41000000,997.55000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2601,-411.34000000,-1868.66000000,997.63000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(3044,-411.45000000,-1869.25000000,997.59000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1811,-412.76000000,-1869.58000000,997.37000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(1811,-412.77000000,-1868.58000000,997.37000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(2196,-411.62000000,-1869.25000000,997.63000000,0.00000000,0.00000000,64.00000000); //
	CreateDynamicObject(1811,-410.40000000,-1869.10000000,997.37000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2207,-369.38000000,-1892.87000000,996.75000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(1714,-370.25000000,-1894.50000000,996.75000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(2828,-369.73000000,-1893.01000000,997.52000000,0.00000000,0.00000000,114.00000000); //
	CreateDynamicObject(2852,-371.06000000,-1893.23000000,997.52000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2004,-369.00000000,-1895.04000000,998.07000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(1822,-370.85000000,-1892.08000000,996.75000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1665,-370.40000000,-1891.74000000,997.26000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1667,-370.50000000,-1891.42000000,997.33000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1669,-370.07000000,-1891.54000000,997.41000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1727,-369.05000000,-1891.02000000,996.75000000,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(1727,-371.71000000,-1892.06000000,996.75000000,0.00000000,0.00000000,90.01000000); //
	CreateDynamicObject(16637,-372.93000000,-1888.10000000,998.25000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(16637,-372.93000000,-1888.10000000,1001.28000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(16637,-372.93000000,-1891.92000000,1001.28000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(16637,-372.93000000,-1895.60000000,1001.28000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(16637,-372.93000000,-1894.00000000,998.25000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(16637,-374.89000000,-1889.95000000,1001.28000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(16637,-374.89000000,-1889.95000000,998.25000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(16637,-378.71000000,-1889.95000000,1001.28000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(16637,-376.75000000,-1888.07000000,998.25000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(16637,-376.75000000,-1888.07000000,1001.28000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(16637,-378.72000000,-1888.70000000,998.25000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(16637,-380.33000000,-1888.64000000,998.25000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(16637,-380.33000000,-1888.64000000,1001.28000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(16637,-378.72000000,-1888.48000000,1000.00000000,0.00000000,270.00000000,90.00000000); //
	CreateDynamicObject(2525,-378.54000000,-1889.27000000,996.75000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2835,-378.95000000,-1889.67000000,996.75000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2097,-373.79000000,-1894.04000000,997.05000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1641,-374.69000000,-1893.76000000,996.75000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2517,-379.59000000,-1895.29000000,996.75000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1741,-376.65000000,-1893.48000000,996.83000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(2515,-377.00000000,-1894.67000000,998.10000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(16779,-366.00000000,-1890.90000000,1002.77000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(16151,-362.27000000,-1871.84000000,997.01000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2116,-366.91000000,-1876.21000000,996.75000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(14820,-366.43000000,-1876.13000000,997.66000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(14809,-381.96000000,-1865.89000000,998.17000000,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(16101,-378.98000000,-1868.92000000,997.20000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2290,-377.38000000,-1877.28000000,996.75000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(2290,-376.21000000,-1873.91000000,996.75000000,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(2083,-378.81000000,-1875.47000000,996.75000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1486,-378.16000000,-1875.01000000,997.39000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1486,-378.30000000,-1874.80000000,997.39000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1486,-378.51000000,-1874.93000000,997.39000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1486,-378.37000000,-1875.14000000,997.39000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1520,-378.04000000,-1875.16000000,997.25000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1520,-363.08000000,-1873.08000000,997.62000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1512,-363.28000000,-1872.32000000,997.82000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1544,-363.30000000,-1869.60000000,997.62000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2780,-370.50000000,-1871.23000000,990.00000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2780,-376.27000000,-1870.95000000,990.25000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2780,-378.98000000,-1871.81000000,990.25000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2780,-378.98000000,-1871.81000000,990.25000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2780,-373.61000000,-1866.29000000,990.25000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2780,-373.61000000,-1866.29000000,990.25000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2780,-373.61000000,-1866.29000000,990.25000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2780,-367.68000000,-1867.17000000,990.25000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2780,-367.67000000,-1867.17000000,990.25000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2780,-367.54000000,-1867.95000000,990.25000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2780,-367.54000000,-1867.95000000,990.25000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2780,-367.54000000,-1867.95000000,990.25000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2780,-367.38000000,-1872.45000000,1003.00000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2780,-370.88000000,-1872.32000000,1003.00000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(14486,-395.22000000,-1884.28000000,998.24000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(14782,-403.99000000,-1890.58000000,997.76000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(14782,-400.27000000,-1886.36000000,997.76000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2475,-392.20000000,-1886.10000000,997.10000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2475,-390.70000000,-1886.10000000,997.10000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(355,-391.95000000,-1886.10000000,998.80000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(356,-391.94000000,-1886.10000000,998.12000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(358,-390.50000000,-1886.10000000,997.41000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(14391,-389.15000000,-1877.09000000,997.71000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(1846,-389.37000000,-1876.85000000,999.15000000,90.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1846,-395.00000000,-1866.60000000,998.30000000,90.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1702,-397.09000000,-1871.16000000,996.75000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1702,-393.11000000,-1869.05000000,996.75000000,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(1705,-394.00000000,-1872.73000000,996.75000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(1705,-395.56000000,-1872.73000000,996.75000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(1819,-395.62000000,-1870.87000000,996.75000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2230,-396.34000000,-1867.54000000,997.76000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2230,-393.00000000,-1867.54000000,997.76000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1670,-395.14000000,-1870.30000000,997.26000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1714,-391.18000000,-1875.03000000,996.75000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1714,-391.18000000,-1876.00000000,996.75000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1714,-391.18000000,-1877.00000000,996.75000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1714,-391.18000000,-1878.00000000,996.75000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1714,-391.18000000,-1879.00000000,996.75000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1714,-391.18000000,-1880.00000000,996.75000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(9819,-399.10000000,-1881.47000000,997.35000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(1714,-398.38000000,-1883.46000000,996.75000000,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(1714,-398.58000000,-1880.58000000,996.75000000,0.00000000,0.00000000,269.99000000); //
	CreateDynamicObject(1714,-398.46000000,-1877.75000000,996.75000000,0.00000000,0.00000000,269.99000000); //
	CreateDynamicObject(2606,-400.33000000,-1869.94000000,998.86000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2606,-400.33000000,-1869.94000000,998.36000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2606,-400.33000000,-1869.94000000,997.86000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2606,-400.33000000,-1869.94000000,997.36000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2185,-388.88000000,-1869.56000000,996.75000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1714,-390.16000000,-1868.97000000,996.75000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(16779,-396.10000000,-1874.56000000,1002.62000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(16779,-390.49000000,-1873.28000000,1002.62000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(16779,-394.22000000,-1880.47000000,1002.62000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2817,-395.08000000,-1877.95000000,996.75000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2817,-394.11000000,-1877.95000000,996.75000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2817,-394.13000000,-1879.92000000,996.75000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2817,-395.08000000,-1881.90000000,996.75000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2817,-395.08000000,-1879.92000000,996.75000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2817,-394.13000000,-1881.90000000,996.75000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2817,-393.17000000,-1881.90000000,996.75000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2817,-393.17000000,-1879.92000000,996.75000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2817,-393.17000000,-1877.95000000,996.75000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(14825,-397.78000000,-1882.34000000,992.70000000,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(16637,-409.39000000,-1886.89000000,991.90000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(16637,-408.32000000,-1889.42000000,990.35000000,0.00000000,90.00000000,0.00000000); //
	CreateDynamicObject(9131,-409.63000000,-1889.08000000,993.24000000,90.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(9131,-409.57000000,-1888.34000000,991.83000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(11472,-415.40000000,-1891.06000000,990.39000000,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(11472,-415.67000000,-1891.06000000,993.64000000,0.00000000,0.00000000,269.99000000); //
	CreateDynamicObject(9131,-409.57000000,-1889.58000000,990.05000000,90.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(9131,-406.05000000,-1890.27000000,991.24000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(2930,-404.99000000,-1892.52000000,993.63000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(16637,-406.10000000,-1892.28000000,992.01000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(9131,-406.05000000,-1890.27000000,993.51000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(16637,-406.10000000,-1892.28000000,995.03000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(16637,-406.10000000,-1892.28000000,992.01000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(16637,-402.00000000,-1892.28000000,992.01000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(9131,-402.00000000,-1890.27000000,991.24000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(16637,-398.00000000,-1892.28000000,992.01000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(9131,-398.00000000,-1890.27000000,991.24000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(16637,-394.00000000,-1892.28000000,992.01000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(9131,-391.00000000,-1890.27000000,991.24000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(16637,-391.00000000,-1892.28000000,992.01000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(16637,-402.00000000,-1892.28000000,995.03000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(16637,-398.00000000,-1892.28000000,995.03000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(16637,-394.00000000,-1892.28000000,995.03000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(9131,-402.00000000,-1890.27000000,993.51000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(9131,-398.00000000,-1890.27000000,993.51000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(9131,-391.00000000,-1890.27000000,993.51000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(9131,-394.00000000,-1890.27000000,991.24000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(9131,-394.00000000,-1890.27000000,993.51000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(16637,-391.00000000,-1892.28000000,993.51000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(16637,-404.36000000,-1891.54000000,993.51000000,0.00000000,90.00000000,90.00000000); //
	CreateDynamicObject(16637,-400.55000000,-1891.54000000,993.51000000,0.00000000,90.00000000,90.00000000); //
	CreateDynamicObject(16637,-396.87000000,-1891.54000000,993.51000000,0.00000000,90.00000000,90.00000000); //
	CreateDynamicObject(16637,-393.20000000,-1891.54000000,993.51000000,0.00000000,90.00000000,90.00000000); //
	CreateDynamicObject(11472,-407.10000000,-1895.99000000,990.39000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(11472,-407.10000000,-1895.99000000,993.64000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(11472,-402.73000000,-1885.90000000,990.39000000,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(11472,-390.22000000,-1885.90000000,990.39000000,0.00000000,0.00000000,269.99000000); //
	CreateDynamicObject(11472,-402.73000000,-1885.90000000,993.64000000,0.00000000,0.00000000,269.99000000); //
	CreateDynamicObject(11472,-390.22000000,-1885.90000000,993.64000000,0.00000000,0.00000000,269.99000000); //
	CreateDynamicObject(11472,-389.91000000,-1887.77000000,990.39000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(11472,-389.91000000,-1887.77000000,993.64000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1998,-391.72000000,-1887.03000000,990.48000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(1714,-392.67000000,-1887.00000000,990.47000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2518,-403.45000000,-1891.77000000,990.67000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(2518,-399.57000000,-1891.58000000,990.67000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(2518,-395.50000000,-1891.68000000,990.67000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(2518,-391.92000000,-1891.68000000,990.67000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(14422,-364.71000000,-1903.35000000,1000.00000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(1775,-386.82000000,-1879.04000000,997.84000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1775,-387.80000000,-1879.02000000,997.84000000,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(1776,-386.46000000,-1876.00000000,997.85000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1776,-387.20000000,-1876.00000000,997.85000000,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(18102,-370.89000000,-1872.57000000,1004.64000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(18102,-367.97000000,-1874.68000000,1002.89000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1814,-358.45000000,-1887.76000000,996.75000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1769,-355.83000000,-1886.29000000,996.75000000,0.00000000,0.00000000,218.00000000); //
	CreateDynamicObject(1769,-359.23000000,-1887.08000000,996.75000000,0.00000000,0.00000000,153.99000000); //
	CreateDynamicObject(2252,-358.01000000,-1887.18000000,997.57000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(16637,-350.20000000,-1882.89000000,996.63000000,0.00000000,90.00000000,0.00000000); //
	CreateDynamicObject(16637,-347.65000000,-1886.87000000,996.22000000,348.00000000,90.00000000,90.00000000); //
	CreateDynamicObject(16637,-347.65000000,-1886.00000000,996.22000000,348.00000000,90.00000000,90.00000000); //
	CreateDynamicObject(16637,-351.88000000,-1884.87000000,997.90000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(18766,-345.21000000,-1880.30000000,998.12000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(18766,-341.40000000,-1885.16000000,998.12000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(18766,-341.40000000,-1894.00000000,998.25000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(18766,-347.06000000,-1897.56000000,998.25000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(18766,-349.00000000,-1897.56000000,998.25000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(18766,-354.52000000,-1893.11000000,998.25000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(18766,-344.80000000,-1882.40000000,996.20000000,90.00000000,0.00000000,359.90000000); //
	CreateDynamicObject(18766,-341.11000000,-1886.29000000,996.20000000,90.00000000,0.00000000,359.90000000); //
	CreateDynamicObject(18766,-350.07000000,-1887.45000000,995.30000000,90.00000000,0.00000000,359.90000000); //
	CreateDynamicObject(18766,-346.74000000,-1895.78000000,995.39000000,90.00000000,0.00000000,359.90000000); //
	CreateDynamicObject(18766,-349.90000000,-1891.24000000,995.39000000,90.00000000,0.00000000,359.90000000); //
	CreateDynamicObject(18766,-349.53000000,-1895.23000000,995.39000000,90.00000000,0.00000000,359.90000000); //
	CreateDynamicObject(1649,-348.24000000,-1896.82000000,999.39000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(2232,-345.77000000,-1896.46000000,1000.36000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(2232,-345.77000000,-1896.46000000,998.36000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(2232,-350.66000000,-1896.46000000,998.36000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(2232,-350.66000000,-1896.46000000,1000.36000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(2441,-346.72000000,-1896.46000000,996.74000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(2441,-347.74000000,-1896.46000000,996.74000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(2441,-348.70000000,-1896.46000000,996.74000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(2441,-349.70000000,-1896.46000000,996.74000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(2441,-350.70000000,-1896.46000000,996.74000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(2441,-345.70000000,-1896.46000000,996.74000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(2441,-344.70000000,-1896.46000000,996.74000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(2441,-344.70000000,-1896.46000000,997.74000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(2441,-344.70000000,-1896.46000000,998.79000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(2441,-344.70000000,-1896.46000000,999.85000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(2441,-351.64000000,-1896.46000000,996.74000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(2441,-351.65000000,-1896.46000000,997.74000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(2441,-351.65000000,-1896.46000000,998.79000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(2441,-351.65000000,-1896.46000000,999.85000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(2232,-345.77000000,-1896.46000000,999.36000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(2232,-350.66000000,-1896.46000000,999.36000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(2888,-346.35000000,-1886.67000000,999.70000000,180.00000000,180.00000000,0.00000000); //
	CreateDynamicObject(2887,-346.50000000,-1886.27000000,999.74000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(1758,-343.80000000,-1891.00000000,996.00000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1758,-343.80000000,-1889.44000000,996.00000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1758,-343.80000000,-1892.50000000,996.00000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1758,-345.89000000,-1889.44000000,996.00000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2446,-344.50000000,-1889.60000000,995.64000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2446,-344.50000000,-1890.60000000,995.64000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2446,-344.50000000,-1891.50000000,995.64000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2446,-344.50000000,-1892.50000000,995.64000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1758,-345.89000000,-1891.00000000,996.00000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1758,-345.89000000,-1892.50000000,996.00000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2446,-346.44000000,-1892.50000000,995.64000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2446,-346.44000000,-1891.50000000,995.64000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2446,-346.44000000,-1890.60000000,995.64000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2446,-346.44000000,-1889.60000000,995.64000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1758,-347.80000000,-1889.44000000,996.00000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1758,-347.80000000,-1891.00000000,996.00000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1758,-347.80000000,-1892.50000000,996.00000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1758,-352.77000000,-1891.00000000,996.00000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1758,-352.77000000,-1889.44000000,996.00000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1758,-352.77000000,-1892.50000000,996.00000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2446,-353.30000000,-1892.50000000,995.64000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2446,-353.30000000,-1891.50000000,995.64000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2446,-353.30000000,-1890.60000000,995.64000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2446,-353.30000000,-1889.60000000,995.64000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2605,-343.93000000,-1882.80000000,997.27000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(2225,-344.09000000,-1882.58000000,997.69000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1714,-343.96000000,-1881.63000000,996.77000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(869,-346.32000000,-1868.43000000,997.34000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(869,-347.00000000,-1868.23000000,997.34000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(869,-347.33000000,-1868.13000000,997.34000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(869,-345.32000000,-1868.16000000,997.34000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(3462,-346.28000000,-1867.14000000,997.76000000,0.00000000,0.00000000,266.00000000); //
	CreateDynamicObject(1557,-339.40000000,-1857.66000000,996.76000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1557,-336.40000000,-1857.66000000,996.76000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(18766,-346.92000000,-1891.64000000,995.39000000,90.00000000,0.00000000,359.90000000); //
	CreateDynamicObject(16637,-353.56000000,-1886.74000000,996.68000000,0.00000000,90.00000000,0.00000000); //
	CreateDynamicObject(18652,-347.30000000,-1896.03000000,997.80000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(18652,-350.00000000,-1896.02000000,997.80000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(18652,-350.07000000,-1896.82000000,1001.07000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(18652,-347.36000000,-1896.90000000,1000.82000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(18652,-347.00000000,-1896.80000000,1001.07000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(19129,-370.84000000,-1867.50000000,996.70000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(348,-411.84000000,-1869.01000000,997.57000000,90.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(9131,-409.57000000,-1888.34000000,989.56000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(355,-390.50000000,-1886.10000000,998.80000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(356,-390.50000000,-1886.10000000,998.12000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(358,-391.94000000,-1886.10000000,997.41000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(9131,-409.63000000,-1891.33000000,993.24000000,90.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(16637,-354.00000000,-1887.00000000,997.92000000,0.00000000,0.00000000,0.00000000); //

	//Bank Exterior
    CreateDynamicObject(7922, 821.29, -2050.75, 13.30,   0.00, 0.00, 270.00);
    CreateDynamicObject(7922, 821.13, -2049.70, 16.10,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 824.50, -2049.00, 15.80,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 824.50, -2049.00, 15.80,   0.00, 0.00, 180.00);
    CreateDynamicObject(1649, 828.90, -2049.00, 15.80,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 833.30, -2049.00, 15.80,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 828.90, -2049.00, 15.80,   0.00, 0.00, 180.00);
    CreateDynamicObject(1649, 837.70, -2049.00, 15.80,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 833.30, -2049.00, 15.80,   0.00, 0.00, 179.99);
    CreateDynamicObject(1649, 837.70, -2049.00, 15.80,   0.00, 0.00, 179.99);
    CreateDynamicObject(7922, 840.90, -2049.70, 13.30,   0.00, 0.00, 270.00);
    CreateDynamicObject(7922, 840.90, -2066.90, 13.30,   0.00, 0.00, 180.00);
    CreateDynamicObject(2395, 839.40, -2048.90, 11.40,   0.00, 0.00, 179.99);
    CreateDynamicObject(2395, 829.25, -2049.10, 11.40,   0.00, 0.00, 0.00);
    CreateDynamicObject(7922, 840.90, -2049.70, 16.10,   0.00, 0.00, 269.99);
    CreateDynamicObject(7922, 840.90, -2066.90, 16.10,   0.00, 0.00, 179.99);
    CreateDynamicObject(2395, 835.70, -2048.90, 11.40,   0.00, 0.00, 179.99);
    CreateDynamicObject(2395, 832.00, -2048.90, 11.40,   0.00, 0.00, 179.99);
    CreateDynamicObject(2395, 828.30, -2048.90, 11.40,   0.00, 0.00, 179.99);
    CreateDynamicObject(2395, 824.90, -2048.90, 11.40,   0.00, 0.00, 179.99);
    CreateDynamicObject(640, 837.20, -2048.55, 12.60,   0.00, 0.00, 90.00);
    CreateDynamicObject(640, 831.10, -2048.55, 12.60,   0.00, 0.00, 90.00);
    CreateDynamicObject(640, 825.00, -2048.55, 12.60,   0.00, 0.00, 90.00);
    CreateDynamicObject(1361, 834.20, -2048.30, 12.60,   0.00, 0.00, 0.00);
    CreateDynamicObject(1361, 828.00, -2048.30, 12.60,   0.00, 0.00, 0.00);
    CreateDynamicObject(1361, 822.70, -2048.30, 12.60,   0.00, 0.00, 0.00);
    CreateDynamicObject(1361, 839.40, -2048.30, 12.60,   0.00, 0.00, 0.00);
    CreateDynamicObject(2395, 836.65, -2049.10, 11.40,   0.00, 0.00, 0.00);
    CreateDynamicObject(2395, 832.95, -2049.10, 11.40,   0.00, 0.00, 0.00);
    CreateDynamicObject(2395, 829.25, -2049.10, 11.40,   0.00, 0.00, 0.00);
    CreateDynamicObject(2395, 825.90, -2049.10, 11.40,   0.00, 0.00, 0.00);
    CreateDynamicObject(2395, 822.20, -2049.10, 11.40,   0.00, 0.00, 0.00);
    CreateDynamicObject(16151, 823.40, -2056.30, 12.20,   0.00, 0.00, 179.99);
    CreateDynamicObject(7922, 821.13, -2049.70, 13.30,   0.00, 0.00, 0.00);
    CreateDynamicObject(7922, 821.30, -2053.10, 13.30,   0.00, 0.00, 270.00);
    CreateDynamicObject(7922, 821.30, -2060.00, 13.30,   0.00, 0.00, 270.00);
    CreateDynamicObject(7922, 821.30, -2055.40, 13.30,   0.00, 0.00, 270.00);
    CreateDynamicObject(7922, 821.30, -2057.70, 13.30,   0.00, 0.00, 270.00);
    CreateDynamicObject(7922, 821.00, -2066.80, 16.10,   0.00, 0.00, 90.00);
    CreateDynamicObject(7922, 821.00, -2066.80, 13.30,   0.00, 0.00, 89.99);
    CreateDynamicObject(7922, 821.30, -2066.75, 13.30,   0.00, 0.00, 270.00);
    CreateDynamicObject(7922, 821.30, -2062.30, 13.30,   0.00, 0.00, 270.00);
    CreateDynamicObject(7922, 820.98, -2051.80, 13.30,   0.00, 0.00, 90.00);
    CreateDynamicObject(7922, 820.98, -2054.00, 13.30,   0.00, 0.00, 90.00);
    CreateDynamicObject(7922, 821.30, -2064.60, 13.30,   0.00, 0.00, 270.00);
    CreateDynamicObject(7922, 821.00, -2056.00, 13.30,   0.00, 0.00, 90.00);
    CreateDynamicObject(7922, 821.00, -2058.20, 13.30,   0.00, 0.00, 90.00);
    CreateDynamicObject(7922, 821.00, -2062.80, 13.30,   0.00, 0.00, 90.00);
    CreateDynamicObject(7922, 821.00, -2060.50, 13.30,   0.00, 0.00, 90.00);
    CreateDynamicObject(7922, 821.00, -2064.90, 13.30,   0.00, 0.00, 90.00);
    CreateDynamicObject(2765, 820.80, -2051.60, 15.20,   90.00, 0.00, 90.00);
    CreateDynamicObject(2765, 820.80, -2054.50, 15.20,   90.00, 0.00, 90.00);
    CreateDynamicObject(2765, 820.80, -2060.30, 15.20,   90.00, 0.00, 90.00);
    CreateDynamicObject(2765, 820.80, -2057.40, 15.20,   90.00, 0.00, 90.00);
    CreateDynamicObject(2765, 820.80, -2063.20, 15.20,   90.00, 0.00, 90.00);
    CreateDynamicObject(2765, 820.80, -2066.10, 15.20,   90.00, 0.00, 90.00);
    CreateDynamicObject(2765, 820.85, -2066.80, 15.20,   90.00, 0.00, 90.00);
    CreateDynamicObject(1649, 820.80, -2064.80, 15.83,   0.00, 0.00, 270.00);
    CreateDynamicObject(1649, 820.80, -2051.60, 15.83,   0.00, 0.00, 270.00);
    CreateDynamicObject(1649, 820.80, -2056.00, 15.83,   0.00, 0.00, 270.00);
    CreateDynamicObject(1649, 820.80, -2060.40, 15.83,   0.00, 0.00, 270.00);
    CreateDynamicObject(1649, 820.80, -2051.60, 15.83,   0.00, 0.00, 90.00);
    CreateDynamicObject(1649, 820.80, -2056.00, 15.83,   0.00, 0.00, 90.00);
    CreateDynamicObject(1649, 820.80, -2060.40, 15.83,   0.00, 0.00, 90.00);
    CreateDynamicObject(1649, 820.80, -2064.80, 15.83,   0.00, 0.00, 90.00);
    CreateDynamicObject(1649, 837.70, -2067.50, 15.80,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 837.70, -2067.50, 15.80,   0.00, 0.00, 179.99);
    CreateDynamicObject(1649, 828.90, -2067.50, 15.80,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 824.50, -2067.50, 15.80,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 833.30, -2067.50, 15.80,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 833.30, -2067.50, 15.80,   0.00, 0.00, 179.99);
    CreateDynamicObject(1649, 828.90, -2067.50, 15.80,   0.00, 0.00, 180.00);
    CreateDynamicObject(1649, 824.50, -2067.50, 15.80,   0.00, 0.00, 179.99);
    CreateDynamicObject(2395, 825.90, -2067.60, 11.40,   0.00, 0.00, 0.00);
    CreateDynamicObject(2395, 836.65, -2067.60, 11.40,   0.00, 0.00, 0.00);
    CreateDynamicObject(2395, 832.95, -2067.60, 11.40,   0.00, 0.00, 0.00);
    CreateDynamicObject(2395, 829.25, -2067.60, 11.40,   0.00, 0.00, 0.00);
    CreateDynamicObject(2395, 822.20, -2067.60, 11.40,   0.00, 0.00, 0.00);
    CreateDynamicObject(2395, 839.40, -2067.40, 11.40,   0.00, 0.00, 179.99);
    CreateDynamicObject(2395, 835.70, -2067.40, 11.40,   0.00, 0.00, 179.99);
    CreateDynamicObject(2395, 832.00, -2067.40, 11.40,   0.00, 0.00, 179.99);
    CreateDynamicObject(2395, 828.30, -2067.40, 11.40,   0.00, 0.00, 179.99);
    CreateDynamicObject(2395, 824.90, -2067.40, 11.40,   0.00, 0.00, 179.99);
    CreateDynamicObject(2232, 833.80, -2064.30, 12.50,   0.00, 0.00, 179.99);
    CreateDynamicObject(2232, 829.90, -2064.30, 12.50,   0.00, 0.00, 180.00);
    CreateDynamicObject(2207, 832.80, -2063.70, 12.00,   0.00, 0.00, 180.00);
    CreateDynamicObject(2207, 832.80, -2063.70, 11.50,   0.00, 0.00, 179.99);
    CreateDynamicObject(14820, 831.90, -2063.80, 12.90,   0.00, 0.00, 0.00);
    CreateDynamicObject(1486, 830.80, -2064.30, 12.90,   0.00, 0.00, 0.00);
    CreateDynamicObject(1509, 833.60, -2064.30, 13.30,   0.00, 0.00, 0.00);
    CreateDynamicObject(1665, 832.70, -2064.40, 12.80,   0.00, 0.00, 0.00);
    CreateDynamicObject(1541, 822.40, -2054.90, 13.10,   0.00, 0.00, 90.00);
    CreateDynamicObject(1520, 837.90, -2052.50, 12.39,   0.00, 0.00, 20.00);
    CreateDynamicObject(1664, 824.40, -2058.60, 13.00,   0.00, 0.00, 0.00);
    CreateDynamicObject(1664, 824.30, -2058.00, 13.00,   0.00, 0.00, 80.00);
    CreateDynamicObject(1669, 824.40, -2056.40, 13.00,   0.00, 0.00, 0.00);
    CreateDynamicObject(2395, 841.70, -2054.13, 11.40,   0.00, 0.00, 90.00);
    CreateDynamicObject(2395, 841.70, -2065.40, 11.40,   0.00, 0.00, 90.00);
    CreateDynamicObject(9131, 841.60, -2062.20, 13.00,   0.00, 0.00, 270.00);
    CreateDynamicObject(9131, 841.60, -2062.20, 15.27,   0.00, 0.00, 270.00);
    CreateDynamicObject(1649, 841.60, -2052.50, 15.80,   0.00, 0.00, 270.00);
    CreateDynamicObject(1649, 841.60, -2064.40, 15.80,   0.00, 0.00, 89.99);
    CreateDynamicObject(2395, 841.50, -2063.10, 11.40,   0.00, 0.00, 270.00);
    CreateDynamicObject(2395, 841.50, -2051.38, 11.40,   0.00, 0.00, 270.00);
    CreateDynamicObject(3666, 829.90, -2064.30, 12.00,   0.00, 0.00, 0.00);
    CreateDynamicObject(3666, 833.80, -2064.40, 12.00,   0.00, 0.00, 0.00);
    CreateDynamicObject(3461, 842.70, -2054.60, 13.40,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 841.60, -2054.60, 13.00,   0.00, 0.00, 270.00);
    CreateDynamicObject(9131, 841.60, -2054.60, 15.27,   0.00, 0.00, 270.00);
    CreateDynamicObject(3461, 842.70, -2058.35, 13.40,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 841.60, -2064.40, 15.80,   0.00, 0.00, 270.00);
    CreateDynamicObject(1649, 841.60, -2052.50, 15.80,   0.00, 0.00, 90.00);
    CreateDynamicObject(9131, 841.60, -2058.30, 13.00,   0.00, 0.00, 270.00);
    CreateDynamicObject(9131, 841.60, -2058.30, 15.27,   0.00, 0.00, 270.00);
    CreateDynamicObject(3461, 842.70, -2062.20, 13.40,   0.00, 0.00, 0.00);
    CreateDynamicObject(2773, 839.90, -2054.50, 12.40,   0.00, 0.00, 90.00);
    CreateDynamicObject(2773, 839.90, -2058.30, 12.40,   0.00, 0.00, 90.00);
    CreateDynamicObject(2773, 839.90, -2062.20, 12.40,   0.00, 0.00, 90.00);
    CreateDynamicObject(2747, 829.50, -2052.50, 12.30,   0.00, 0.00, 0.00);
    CreateDynamicObject(2747, 829.50, -2056.00, 12.30,   0.00, 0.00, 0.00);
    CreateDynamicObject(2747, 833.20, -2056.00, 12.30,   0.00, 0.00, 0.00);
    CreateDynamicObject(2747, 833.20, -2052.50, 12.30,   0.00, 0.00, 0.00);
    CreateDynamicObject(2747, 833.20, -2059.70, 12.30,   0.00, 0.00, 0.00);
    CreateDynamicObject(2747, 829.50, -2059.70, 12.30,   0.00, 0.00, 0.00);
    CreateDynamicObject(2773, 828.30, -2064.40, 12.40,   0.00, 0.00, 90.00);
    CreateDynamicObject(2773, 823.55, -2064.40, 12.40,   0.00, 0.00, 90.00);
    CreateDynamicObject(2773, 825.93, -2064.40, 12.40,   0.00, 0.00, 90.00);
    CreateDynamicObject(2370, 823.20, -2066.30, 11.90,   0.00, 0.00, 0.00);
    CreateDynamicObject(2350, 832.20, -2065.20, 12.20,   0.00, 0.00, 18.00);
    CreateDynamicObject(2309, 833.00, -2053.20, 11.90,   0.00, 0.00, 352.00);
    CreateDynamicObject(2309, 833.30, -2057.20, 11.90,   0.00, 0.00, 14.00);
    CreateDynamicObject(2309, 828.80, -2057.20, 11.90,   0.00, 0.00, 324.00);
    CreateDynamicObject(2309, 833.10, -2060.50, 11.90,   0.00, 0.00, 0.00);
    CreateDynamicObject(2309, 829.30, -2051.50, 11.90,   0.00, 0.00, 186.00);
    CreateDynamicObject(2309, 829.40, -2058.70, 11.90,   0.00, 0.00, 179.99);
    CreateDynamicObject(2309, 833.10, -2058.80, 11.90,   0.00, 0.00, 179.99);
    CreateDynamicObject(2309, 833.40, -2051.40, 11.90,   0.00, 0.00, 161.99);
    CreateDynamicObject(2309, 829.30, -2055.00, 11.90,   0.00, 0.00, 191.99);
    CreateDynamicObject(1486, 829.70, -2056.20, 12.90,   0.00, 0.00, 0.00);
    CreateDynamicObject(1509, 829.30, -2059.60, 12.90,   0.00, 0.00, 0.00);
    CreateDynamicObject(1509, 832.80, -2052.60, 12.90,   0.00, 0.00, 0.00);
    CreateDynamicObject(1509, 833.70, -2052.70, 12.90,   0.00, 0.00, 0.00);
    CreateDynamicObject(1510, 832.90, -2056.20, 12.73,   0.00, 0.00, 0.00);
    CreateDynamicObject(2453, 823.60, -2053.00, 13.20,   0.00, 0.00, 0.00);
    CreateDynamicObject(2647, 833.60, -2059.90, 12.90,   0.00, 0.00, 0.00);
    CreateDynamicObject(2647, 824.10, -2053.10, 12.90,   0.00, 0.00, 0.00);
    CreateDynamicObject(2814, 833.00, -2059.70, 12.70,   0.00, 0.00, 0.00);
    CreateDynamicObject(2823, 833.60, -2055.90, 12.70,   0.00, 0.00, 0.00);
    CreateDynamicObject(2840, 829.50, -2052.50, 12.70,   0.00, 0.00, 0.00);
    CreateDynamicObject(2860, 833.10, -2052.50, 12.70,   0.00, 0.00, 0.00);
    CreateDynamicObject(1775, 822.80, -2049.80, 13.00,   0.00, 0.00, 90.00);
    CreateDynamicObject(1776, 822.60, -2062.90, 13.00,   0.00, 0.00, 90.00);
    CreateDynamicObject(1302, 822.60, -2061.50, 11.90,   0.00, 0.00, 90.00);
    CreateDynamicObject(2663, 823.00, -2059.70, 13.10,   0.00, 0.00, 0.00);
    CreateDynamicObject(2671, 829.50, -2053.80, 11.90,   0.00, 0.00, 0.00);
    CreateDynamicObject(2671, 831.90, -2058.30, 11.90,   0.00, 0.00, 198.00);
    CreateDynamicObject(2673, 823.60, -2050.60, 12.00,   0.00, 0.00, 0.00);
    CreateDynamicObject(2674, 834.50, -2053.80, 11.90,   0.00, 0.00, 0.00);
    CreateDynamicObject(2677, 824.80, -2062.30, 12.10,   0.00, 0.00, 0.00);
    CreateDynamicObject(2773, 837.95, -2064.40, 12.40,   0.00, 0.00, 90.00);
    CreateDynamicObject(2773, 835.50, -2064.40, 12.40,   0.00, 0.00, 90.00);
    CreateDynamicObject(1712, 837.00, -2050.10, 11.90,   0.00, 0.00, 0.00);
    CreateDynamicObject(1712, 840.70, -2051.80, 11.90,   0.00, 0.00, 269.99);
    CreateDynamicObject(1711, 839.70, -2050.50, 11.90,   0.00, 0.00, 320.00);
    CreateDynamicObject(1827, 837.90, -2052.60, 11.90,   0.00, 0.00, 0.00);
    CreateDynamicObject(1520, 824.20, -2054.60, 12.88,   0.00, 0.00, 0.00);
    CreateDynamicObject(1520, 838.20, -2052.20, 12.39,   0.00, 0.00, 332.00);
    CreateDynamicObject(1510, 837.80, -2052.90, 12.34,   0.00, 0.00, 0.00);
    CreateDynamicObject(1368, 842.60, -2064.20, 12.60,   0.00, 0.00, 90.00);
    CreateDynamicObject(1368, 842.60, -2052.50, 12.60,   0.00, 0.00, 90.00);
    CreateDynamicObject(5153, 830.90, -2049.60, 17.60,   180.00, 23.60, 0.00);
    CreateDynamicObject(5153, 839.69, -2049.60, 17.60,   179.99, 23.59, 0.00);
    CreateDynamicObject(5153, 835.31, -2049.60, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 826.50, -2049.60, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 822.10, -2049.60, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 822.10, -2055.90, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 822.10, -2051.75, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 839.69, -2053.80, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 839.69, -2051.75, 17.60,   179.99, 23.59, 0.00);
    CreateDynamicObject(5153, 822.10, -2065.00, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 839.69, -2058.05, 17.60,   180.00, 23.60, 0.00);
    CreateDynamicObject(5153, 822.10, -2060.10, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 839.69, -2065.00, 17.60,   0.01, 203.60, 180.00);
    CreateDynamicObject(5153, 839.69, -2064.30, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 839.69, -2066.84, 17.60,   0.00, 203.59, 179.99);
    CreateDynamicObject(9131, 841.60, -2062.20, 17.52,   0.00, 0.00, 270.00);
    CreateDynamicObject(9131, 841.60, -2058.30, 17.52,   0.00, 0.00, 270.00);
    CreateDynamicObject(9131, 841.60, -2054.60, 17.52,   0.00, 0.00, 270.00);
    CreateDynamicObject(5153, 822.10, -2053.80, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 839.69, -2055.90, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 822.10, -2058.05, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 839.69, -2060.10, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 839.69, -2062.20, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 835.31, -2064.30, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 822.10, -2064.30, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 822.10, -2066.84, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 830.90, -2066.84, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 835.31, -2066.84, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 826.50, -2066.84, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 826.50, -2065.00, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 830.90, -2065.00, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 835.31, -2065.00, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 835.31, -2051.75, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 830.90, -2051.75, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 826.50, -2051.75, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 822.10, -2062.20, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 835.31, -2062.20, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 835.31, -2060.10, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 835.31, -2055.90, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 835.31, -2053.80, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(5153, 835.31, -2058.05, 17.60,   179.99, 23.60, 0.00);
    CreateDynamicObject(9131, 824.00, -2062.77, 17.60,   0.00, 90.00, 270.00);
    CreateDynamicObject(9131, 824.00, -2053.90, 17.60,   0.00, 90.00, 270.00);
    CreateDynamicObject(9131, 833.30, -2059.70, 17.60,   0.00, 90.00, 90.00);
    CreateDynamicObject(9131, 833.30, -2057.50, 17.60,   0.00, 90.00, 90.00);
    CreateDynamicObject(9131, 833.30, -2055.40, 17.60,   0.00, 90.00, 90.00);
    CreateDynamicObject(9131, 824.77, -2052.50, 17.60,   0.00, 90.00, 180.00);
    CreateDynamicObject(9131, 827.00, -2052.50, 17.60,   0.00, 90.00, 179.99);
    CreateDynamicObject(9131, 829.20, -2052.50, 17.60,   0.00, 90.00, 179.99);
    CreateDynamicObject(9131, 831.40, -2052.50, 17.60,   0.00, 90.00, 179.99);
    CreateDynamicObject(9131, 832.00, -2052.50, 17.60,   0.00, 90.00, 179.99);
    CreateDynamicObject(9131, 830.00, -2064.10, 17.60,   0.00, 90.00, 0.00);
    CreateDynamicObject(9131, 832.20, -2064.10, 17.60,   0.00, 90.00, 0.00);
    CreateDynamicObject(9131, 825.70, -2064.10, 17.60,   0.00, 90.00, 0.00);
    CreateDynamicObject(9131, 827.80, -2064.10, 17.60,   0.00, 90.00, 0.00);
    CreateDynamicObject(9131, 824.80, -2064.10, 17.60,   0.00, 90.00, 0.00);
    CreateDynamicObject(9131, 833.30, -2063.36, 17.60,   0.00, 90.00, 90.00);
    CreateDynamicObject(9131, 824.00, -2060.50, 17.60,   0.00, 90.00, 270.00);
    CreateDynamicObject(9131, 824.00, -2058.23, 17.60,   0.00, 90.00, 270.00);
    CreateDynamicObject(9131, 824.00, -2055.99, 17.60,   0.00, 90.00, 270.00);
    CreateDynamicObject(9131, 833.30, -2053.27, 17.60,   0.00, 90.00, 90.00);
    CreateDynamicObject(9131, 833.30, -2061.50, 17.60,   0.00, 90.00, 90.00);
    CreateDynamicObject(1649, 831.80, -2062.70, 17.60,   270.00, 90.00, 180.00);
    CreateDynamicObject(1649, 831.80, -2058.35, 17.60,   269.99, 90.00, 179.99);
    CreateDynamicObject(1649, 831.80, -2054.00, 17.60,   269.99, 90.00, 179.99);
    CreateDynamicObject(1649, 828.50, -2062.70, 17.60,   269.99, 90.00, 179.99);
    CreateDynamicObject(1649, 828.50, -2058.35, 17.60,   269.99, 90.00, 179.99);
    CreateDynamicObject(1649, 828.50, -2054.00, 17.60,   269.99, 90.00, 179.99);
    CreateDynamicObject(1649, 825.20, -2054.00, 17.60,   269.99, 90.00, 179.99);
    CreateDynamicObject(1649, 825.20, -2058.35, 17.60,   269.99, 90.00, 179.99);
    CreateDynamicObject(1649, 825.20, -2062.70, 17.60,   269.99, 90.00, 179.99);
    CreateDynamicObject(1649, 828.50, -2058.35, 17.60,   90.00, 270.00, 179.99);
    CreateDynamicObject(1649, 825.20, -2058.35, 17.60,   90.00, 270.00, 179.99);
    CreateDynamicObject(1649, 831.80, -2058.35, 17.60,   90.00, 270.00, 179.99);
    CreateDynamicObject(1649, 831.80, -2054.00, 17.60,   90.00, 90.00, 179.99);
    CreateDynamicObject(1649, 828.50, -2054.00, 17.60,   90.00, 90.00, 179.99);
    CreateDynamicObject(1649, 831.80, -2062.70, 17.60,   90.00, 90.00, 179.99);
    CreateDynamicObject(1649, 828.50, -2062.70, 17.60,   90.00, 90.00, 179.99);
    CreateDynamicObject(1649, 825.20, -2062.70, 17.60,   90.00, 90.00, 179.99);
    CreateDynamicObject(1649, 825.20, -2054.00, 17.60,   90.00, 90.00, 179.99);
    CreateDynamicObject(2765, 850.50, -2067.40, 11.64,   0.00, 0.00, 0.00);
    CreateDynamicObject(2765, 847.60, -2067.40, 11.64,   0.00, 0.00, 0.00);
    CreateDynamicObject(2765, 850.20, -2068.36, 11.64,   0.00, 0.00, 180.00);
    CreateDynamicObject(2765, 841.78, -2067.40, 11.64,   0.00, 0.00, 0.00);
    CreateDynamicObject(2765, 844.70, -2067.40, 11.64,   0.00, 0.00, 0.00);
    CreateDynamicObject(2765, 852.50, -2068.36, 11.64,   0.00, 0.00, 179.99);
    CreateDynamicObject(2765, 847.30, -2068.36, 11.64,   0.00, 0.00, 179.99);
    CreateDynamicObject(2765, 844.52, -2068.36, 11.64,   0.00, 0.00, 179.99);
    CreateDynamicObject(1549, 823.80, -2052.40, 11.90,   0.00, 0.00, 240.00);
    CreateDynamicObject(1232, 841.60, -2062.20, 16.50,   0.00, 0.00, 0.00);
    CreateDynamicObject(1232, 841.60, -2054.60, 16.50,   0.00, 0.00, 0.00);
    CreateDynamicObject(1232, 841.60, -2058.30, 16.50,   0.00, 0.00, 0.00);
    CreateDynamicObject(2773, 839.90, -2054.50, 12.40,   0.00, 0.00, 90.00);
    CreateDynamicObject(15038, 840.70, -2066.60, 12.50,   0.00, 0.00, 0.00);
    CreateDynamicObject(2252, 823.60, -2065.90, 13.10,   0.00, 0.00, 0.00);
    CreateDynamicObject(1664, 824.00, -2065.50, 12.90,   0.00, 0.00, 340.00);
    CreateDynamicObject(1486, 824.10, -2065.90, 12.90,   0.00, 0.00, 0.00);
    CreateDynamicObject(970, 844.10, -2067.90, 13.20,   0.00, 0.00, 0.00);
    CreateDynamicObject(970, 851.10, -2067.90, 13.20,   0.00, 0.00, 0.00);
    CreateDynamicObject(970, 853.20, -2065.80, 13.20,   0.00, 0.00, 90.00);
    CreateDynamicObject(970, 853.20, -2061.70, 13.20,   0.00, 0.00, 90.00);
    CreateDynamicObject(970, 853.20, -2054.80, 13.20,   0.00, 0.00, 90.00);
    CreateDynamicObject(970, 853.20, -2050.70, 13.20,   0.00, 0.00, 90.00);
    CreateDynamicObject(951, 847.55, -2067.75, 12.70,   0.00, 0.00, 10.00);
    CreateDynamicObject(2765, 841.78, -2048.15, 11.64,   0.00, 0.00, 0.00);
    CreateDynamicObject(2765, 852.50, -2049.10, 11.64,   0.00, 0.00, 180.00);
    CreateDynamicObject(970, 844.00, -2048.60, 13.20,   0.00, 0.00, 0.00);
    CreateDynamicObject(2765, 843.70, -2048.15, 11.64,   0.00, 0.00, 0.00);
    CreateDynamicObject(2765, 844.30, -2049.10, 11.64,   0.00, 0.00, 179.99);
    CreateDynamicObject(2765, 850.49, -2048.15, 11.64,   0.00, 0.00, 0.00);
    CreateDynamicObject(970, 851.10, -2048.60, 13.20,   0.00, 0.00, 0.00);
    CreateDynamicObject(2765, 849.43, -2048.15, 11.64,   0.00, 0.00, 0.00);
    CreateDynamicObject(2765, 845.67, -2049.10, 11.64,   0.00, 0.00, 179.99);
    CreateDynamicObject(2765, 851.41, -2049.10, 11.64,   0.00, 0.00, 179.99);
    CreateDynamicObject(970, 853.20, -2058.10, 13.20,   0.00, 0.00, 90.00);
    CreateDynamicObject(9131, 1436.79, -1021.79, 22.75,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 1434.20, -1021.78, 25.71,   0.00, 0.00, 0.00);
    CreateDynamicObject(2395, 1432.48, -1021.86, 21.33,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 1434.20, -1021.78, 29.04,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1436.79, -1021.79, 25.01,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1436.79, -1021.79, 27.30,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1436.79, -1021.79, 29.54,   0.00, 0.00, 0.00);
    CreateDynamicObject(2395, 1436.21, -1021.86, 21.33,   0.00, 0.00, 0.00);
    CreateDynamicObject(2395, 1447.42, -1021.86, 21.33,   0.00, 0.00, 0.00);
    CreateDynamicObject(2395, 1443.68, -1021.86, 21.33,   0.00, 0.00, 0.00);
    CreateDynamicObject(2395, 1439.94, -1021.86, 21.33,   0.00, 0.00, 0.00);
    CreateDynamicObject(2395, 1451.13, -1021.86, 21.33,   0.00, 0.00, 0.00);
    CreateDynamicObject(2395, 1454.85, -1021.86, 21.33,   0.00, 0.00, 0.00);
    CreateDynamicObject(2395, 1456.44, -1021.86, 21.33,   0.00, 0.00, 0.00);
    CreateDynamicObject(2395, 1463.17, -1021.88, 21.33,   0.00, 0.00, 0.00);
    CreateDynamicObject(1491, 1459.66, -1022.09, 22.82,   0.00, 0.00, 0.00);
    CreateDynamicObject(1491, 1462.68, -1022.09, 22.82,   0.00, 0.00, -180.00);
    CreateDynamicObject(2395, 1466.89, -1021.88, 21.33,   0.00, 0.00, 0.00);
    CreateDynamicObject(2395, 1470.60, -1021.88, 21.33,   0.00, 0.00, 0.00);
    CreateDynamicObject(2395, 1474.32, -1021.88, 21.33,   0.00, 0.00, 0.00);
    CreateDynamicObject(2395, 1478.04, -1021.88, 21.33,   0.00, 0.00, 0.00);
    CreateDynamicObject(2395, 1481.75, -1021.88, 21.33,   0.00, 0.00, 0.00);
    CreateDynamicObject(2395, 1485.41, -1021.88, 21.33,   0.00, 0.00, 0.00);
    CreateDynamicObject(2395, 1489.13, -1021.88, 21.33,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 1461.20, -1021.78, 26.82,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 1461.20, -1021.78, 30.12,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1459.33, -1021.79, 23.83,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1459.33, -1021.79, 26.08,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1459.33, -1021.79, 28.33,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1459.33, -1021.79, 30.57,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1463.05, -1021.79, 30.57,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1463.05, -1021.79, 23.83,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1463.05, -1021.79, 26.08,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1463.05, -1021.79, 28.33,   0.00, 0.00, 0.00);
    CreateDynamicObject(1232, 1462.87, -1023.86, 25.32,   0.00, 0.00, 0.00);
    CreateDynamicObject(1232, 1459.59, -1023.86, 25.32,   0.00, 0.00, 13.15);
    CreateDynamicObject(1361, 1464.07, -1022.78, 23.49,   0.00, 0.00, 0.00);
    CreateDynamicObject(1361, 1458.19, -1022.47, 23.49,   0.00, 0.00, 0.00);
    CreateDynamicObject(1359, 1488.90, -1022.36, 23.43,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 1439.35, -1021.78, 29.04,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 1439.35, -1021.78, 25.71,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1441.93, -1021.79, 29.54,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1441.93, -1021.79, 27.30,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1441.93, -1021.79, 25.01,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1441.93, -1021.79, 22.75,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 1444.49, -1021.76, 29.04,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 1444.46, -1021.78, 25.71,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1447.05, -1021.79, 29.54,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1447.04, -1021.79, 27.30,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1447.04, -1021.79, 25.01,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1447.04, -1021.79, 22.75,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 1449.57, -1021.76, 29.04,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 1449.58, -1021.78, 25.71,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1452.10, -1021.79, 29.54,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1452.10, -1021.79, 27.30,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1452.10, -1021.79, 25.01,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1452.10, -1021.79, 22.75,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 1454.57, -1021.76, 29.04,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 1454.58, -1021.78, 25.71,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1457.10, -1021.79, 25.01,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1457.10, -1021.79, 27.30,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1457.10, -1021.79, 29.54,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1457.10, -1021.79, 22.75,   0.00, 0.00, 0.00);
    CreateDynamicObject(19466, 1458.28, -1021.94, 25.07,   0.00, 0.00, 90.00);
    CreateDynamicObject(19466, 1458.28, -1021.94, 26.92,   0.00, 0.00, 90.00);
    CreateDynamicObject(19466, 1458.28, -1021.94, 28.76,   0.00, 0.00, 90.00);
    CreateDynamicObject(19466, 1458.28, -1021.94, 29.76,   0.00, 0.00, 90.00);
    CreateDynamicObject(1649, 1452.78, -1021.25, 32.30,   -17.44, 0.00, 0.00);
    CreateDynamicObject(1649, 1457.06, -1021.25, 32.30,   -17.44, 0.00, 0.00);
    CreateDynamicObject(1649, 1461.42, -1021.25, 32.54,   -17.44, 0.00, 0.00);
    CreateDynamicObject(1649, 1465.82, -1021.25, 32.30,   -17.44, 0.00, 0.00);
    CreateDynamicObject(1649, 1470.15, -1021.25, 32.30,   -17.44, 0.00, 0.00);
    CreateDynamicObject(19466, 1464.07, -1021.81, 23.99,   0.00, 0.00, 90.00);
    CreateDynamicObject(19466, 1464.07, -1021.81, 25.89,   0.00, 0.00, 90.00);
    CreateDynamicObject(19466, 1464.07, -1021.81, 27.83,   0.00, 0.00, 90.00);
    CreateDynamicObject(19466, 1464.07, -1021.81, 29.75,   0.00, 0.00, 90.00);
    CreateDynamicObject(9131, 1465.40, -1021.79, 29.54,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1465.40, -1021.79, 27.30,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1465.40, -1021.79, 25.01,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1465.40, -1021.79, 22.75,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 1467.89, -1021.76, 29.04,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 1467.91, -1021.78, 25.71,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1470.48, -1021.79, 29.54,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1470.48, -1021.79, 27.30,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1470.48, -1021.79, 25.01,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1470.48, -1021.79, 22.75,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1475.60, -1021.79, 22.75,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1475.60, -1021.79, 25.01,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1480.73, -1021.79, 22.75,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1485.85, -1021.79, 22.75,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1475.60, -1021.79, 27.30,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1480.73, -1021.79, 27.30,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1480.73, -1021.79, 25.01,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1485.85, -1021.79, 25.01,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1485.85, -1021.79, 27.30,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1475.60, -1021.79, 29.54,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1480.73, -1021.79, 29.54,   0.00, 0.00, 0.00);
    CreateDynamicObject(9131, 1485.85, -1021.79, 29.54,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 1473.02, -1021.76, 29.04,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 1473.03, -1021.78, 25.71,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 1478.15, -1021.78, 25.71,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 1483.28, -1021.78, 25.71,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 1488.40, -1021.78, 25.71,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 1478.14, -1021.76, 29.04,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 1483.26, -1021.76, 29.04,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 1488.40, -1021.78, 28.98,   0.00, 0.00, 0.00);
    CreateDynamicObject(1649, 1492.19, -1021.62, 28.98,   0.00, 90.00, 0.00);
    CreateDynamicObject(1649, 1492.26, -1021.78, 25.71,   0.00, 90.00, 0.00);
    CreateDynamicObject(1359, 1478.08, -1022.31, 23.43,   0.00, 0.00, 0.00);
    CreateDynamicObject(1359, 1468.08, -1022.31, 23.43,   0.00, 0.00, 0.00);
    CreateDynamicObject(1359, 1454.58, -1022.31, 23.43,   0.00, 0.00, 0.00);
    CreateDynamicObject(1359, 1444.58, -1022.31, 23.43,   0.00, 0.00, 0.00);
    CreateDynamicObject(1359, 1434.08, -1022.31, 23.43,   0.00, 0.00, 0.00);
    CreateDynamicObject(1280, 1439.32, -1022.23, 23.18,   0.00, 0.00, 90.00);
    CreateDynamicObject(1280, 1449.64, -1022.20, 23.18,   0.00, 0.00, 90.00);
    CreateDynamicObject(1280, 1473.06, -1022.20, 23.18,   0.00, 0.00, 90.00);
    CreateDynamicObject(1280, 1483.44, -1022.20, 23.18,   0.00, 0.00, 90.00);
    CreateDynamicObject(1257, 1431.27, -1026.81, 23.97,   0.00, 0.00, 90.00);
    CreateDynamicObject(1232, 1434.08, -1027.35, 25.32,   0.00, 0.00, 13.15);
    CreateDynamicObject(970, 1436.84, -1028.20, 23.36,   0.00, 0.00, 0.00);
    CreateDynamicObject(970, 1440.94, -1028.20, 23.36,   0.00, 0.00, 0.00);
    CreateDynamicObject(970, 1445.07, -1028.20, 23.36,   0.00, 0.00, 0.00);
    CreateDynamicObject(970, 1449.21, -1028.20, 23.36,   0.00, 0.00, 0.00);
    CreateDynamicObject(970, 1453.35, -1028.20, 23.36,   0.00, 0.00, 0.00);
    CreateDynamicObject(970, 1457.45, -1028.20, 23.36,   0.00, 0.00, 0.00);
    CreateDynamicObject(970, 1465.06, -1028.20, 23.36,   0.00, 0.00, 0.00);
    CreateDynamicObject(970, 1469.16, -1028.20, 23.36,   0.00, 0.00, 0.00);
    CreateDynamicObject(970, 1473.27, -1028.20, 23.36,   0.00, 0.00, 0.00);
    CreateDynamicObject(970, 1477.37, -1028.20, 23.36,   0.00, 0.00, 0.00);
    CreateDynamicObject(970, 1481.48, -1028.20, 23.36,   0.00, 0.00, 0.00);
    CreateDynamicObject(970, 1485.59, -1028.20, 23.36,   0.00, 0.00, 0.00);
    CreateDynamicObject(970, 1489.69, -1028.20, 23.36,   0.00, 0.00, 0.00);
    CreateDynamicObject(970, 1493.80, -1028.20, 23.36,   0.00, 0.00, 0.00);
    CreateDynamicObject(970, 1426.34, -1028.20, 23.36,   0.00, 0.00, 0.00);
    CreateDynamicObject(970, 1422.23, -1028.20, 23.36,   0.00, 0.00, 0.00);
    CreateDynamicObject(970, 1418.13, -1028.20, 23.36,   0.00, 0.00, 0.00);
    CreateDynamicObject(970, 1413.97, -1028.20, 23.36,   0.00, 0.00, 0.00);
    CreateDynamicObject(1361, 1463.90, -1027.69, 23.49,   0.00, 0.00, 0.00);
    CreateDynamicObject(1361, 1458.60, -1027.47, 23.49,   0.00, 0.00, 0.00);
    CreateDynamicObject(1232, 1463.05, -1027.80, 25.32,   0.00, 0.00, 0.00);
    CreateDynamicObject(1232, 1459.39, -1027.91, 25.32,   0.00, 0.00, 0.00);
	//Hq gang bonano
    CreateDynamicObject(4562,1310.53710938,-1541.86132812,2985.02075195,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(laplaza2_lan) (1)
    CreateDynamicObject(3612,1346.76562500,-1582.54736328,2997.91406250,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (1)
    CreateDynamicObject(3612,1358.00524902,-1571.05725098,2997.91406250,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (2)
    CreateDynamicObject(3612,1337.91589355,-1575.54687500,2997.91406250,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (4)
    CreateDynamicObject(3612,1332.39794922,-1567.80957031,2997.91406250,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (5)
    CreateDynamicObject(3612,1320.57910156,-1567.05957031,2997.91406250,0.00000000,0.00000000,179.98352051 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (6)
    CreateDynamicObject(2774,1341.51611328,-1566.50866699,2996.43017578,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airp_pillars) (1)
    CreateDynamicObject(2774,1349.24560547,-1566.50781250,2996.18701172,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airp_pillars) (2)
    CreateDynamicObject(1569,1346.42480469,-1579.03601074,2986.07543945,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(adam_v_door) (1)
    CreateDynamicObject(1569,1349.42529297,-1579.03515625,2986.07543945,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 6053); //object(adam_v_door) (2)
    CreateDynamicObject(8661,1347.24243164,-1586.35437012,2993.47216797,0.00000000,180.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(gnhtelgrnd_lvs) (1)
    CreateDynamicObject(8661,1339.51367188,-1555.16894531,2993.79052734,0.00000000,179.99450684,179.99450684 , .interiorid = 1, .worldid = 6053); //object(gnhtelgrnd_lvs) (2)
    CreateDynamicObject(2773,1346.14282227,-1577.59179688,2986.59277344,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airprt_bar) (1)
    CreateDynamicObject(2773,1349.67041016,-1577.59179688,2986.59277344,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airprt_bar) (2)
    CreateDynamicObject(1892,1348.42285156,-1576.13671875,2986.07470703,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(security_gatsh) (1)
    CreateDynamicObject(1892,1346.43652344,-1576.13671875,2986.07470703,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(security_gatsh) (2)
    CreateDynamicObject(638,1344.02758789,-1577.63256836,2986.77246094,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_planter_bush) (1)
    CreateDynamicObject(638,1351.60937500,-1577.63183594,2986.77246094,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_planter_bush) (2)
    CreateDynamicObject(3612,1358.35302734,-1563.28112793,2997.91406250,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (8)
    CreateDynamicObject(1726,1353.40222168,-1572.22277832,2986.09252930,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2) (1)
    CreateDynamicObject(1726,1353.40136719,-1568.49316406,2986.09252930,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2) (2)
    CreateDynamicObject(1727,1351.39245605,-1567.55859375,2986.12011719,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2b) (1)
    CreateDynamicObject(1727,1352.38134766,-1575.25390625,2986.12011719,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2b) (2)
    CreateDynamicObject(2126,1352.42687988,-1569.89038086,2986.11108398,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(coffee_swank_5) (1)
    CreateDynamicObject(2126,1352.38525391,-1573.75634766,2986.11108398,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(coffee_swank_5) (2)
    CreateDynamicObject(1726,1350.37060547,-1570.50634766,2986.09252930,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2) (3)
    CreateDynamicObject(1726,1350.36718750,-1574.23242188,2986.09252930,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2) (4)
    CreateDynamicObject(2852,1351.90136719,-1569.42395020,2986.61865234,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(gb_bedmags02) (1)
    CreateDynamicObject(2855,1351.82360840,-1573.26110840,2986.61865234,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(gb_bedmags05) (1)
    CreateDynamicObject(1808,1354.28430176,-1571.32446289,2986.11108398,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_watercooler2) (1)
    CreateDynamicObject(1846,1353.45544434,-1569.52575684,2989.76708984,90.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(shop_shelf04) (1)
    CreateDynamicObject(1846,1353.45507812,-1573.10400391,2989.76708984,90.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(shop_shelf04) (2)
    CreateDynamicObject(2102,1354.48388672,-1567.69738770,2989.82763672,0.00000000,90.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(low_hi_fi_2) (1)
    CreateDynamicObject(2102,1354.48339844,-1574.75146484,2989.82763672,0.00000000,90.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(low_hi_fi_2) (3)
    CreateDynamicObject(2773,1351.13574219,-1576.62939453,2986.59277344,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airprt_bar) (3)
    CreateDynamicObject(2773,1353.30371094,-1576.62890625,2986.59277344,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airprt_bar) (4)
    CreateDynamicObject(2773,1344.68750000,-1576.62890625,2986.59277344,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airprt_bar) (5)
    CreateDynamicObject(2773,1342.61572266,-1576.62890625,2986.59277344,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airprt_bar) (6)
    CreateDynamicObject(2774,1344.01562500,-1565.75781250,2993.18017578,0.00000000,90.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airp_pillars) (3)
    CreateDynamicObject(2774,1341.51562500,-1565.25781250,2996.43017578,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airp_pillars) (4)
    CreateDynamicObject(2774,1349.24169922,-1565.25781250,2996.18017578,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airp_pillars) (5)
    CreateDynamicObject(3612,1341.14746094,-1569.29589844,3005.41406250,0.00000000,0.00000000,269.98901367 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (9)
    CreateDynamicObject(2605,1343.40209961,-1566.83007812,2986.50097656,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 6053); //object(polce_desk1) (1)
    CreateDynamicObject(2773,1322.81054688,-1551.28125000,2986.68603516,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airprt_bar) (7)
    CreateDynamicObject(2773,1348.14892578,-1566.04101562,2986.61840820,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airprt_bar) (9)
    CreateDynamicObject(2257,1341.48730469,-1571.84899902,2990.16040039,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(frame_clip_4) (1)
    CreateDynamicObject(1671,1343.33886719,-1565.41113281,2986.56884766,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (1)
    CreateDynamicObject(3612,1342.27929688,-1542.53027344,2997.80126953,0.00000000,0.00000000,269.98901367 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(14537,1341.21972656,-1546.85351562,2988.01416016,0.00000000,0.00000000,88.74755859 , .interiorid = 1, .worldid = 6053); //object(pdomesbar) (1)
    CreateDynamicObject(3612,1353.46923828,-1539.39013672,2997.41406250,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (11)
    CreateDynamicObject(1726,1338.11474609,-1559.09326172,2986.09179688,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2) (6)
    CreateDynamicObject(1726,1335.23095703,-1559.09277344,2986.09179688,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2) (7)
    CreateDynamicObject(1726,1332.45996094,-1559.09277344,2986.09179688,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2) (8)
    CreateDynamicObject(1726,1329.66845703,-1559.09277344,2986.09179688,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2) (9)
    CreateDynamicObject(1726,1341.01123047,-1560.21337891,2986.09179688,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2) (10)
    CreateDynamicObject(1726,1328.79541016,-1562.21289062,2986.09179688,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2) (11)
    CreateDynamicObject(2126,1339.58496094,-1560.82617188,2986.09912109,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(coffee_swank_5) (3)
    CreateDynamicObject(2126,1336.61230469,-1560.82617188,2986.09912109,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(coffee_swank_5) (4)
    CreateDynamicObject(2126,1333.86230469,-1560.82617188,2986.09912109,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(coffee_swank_5) (5)
    CreateDynamicObject(2126,1331.20800781,-1560.82617188,2986.09912109,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(coffee_swank_5) (6)
    CreateDynamicObject(1846,1337.53540039,-1563.26965332,2989.52050781,90.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(shop_shelf04) (3)
    CreateDynamicObject(1846,1332.04882812,-1563.26953125,2989.52050781,90.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(shop_shelf04) (4)
    CreateDynamicObject(2230,1339.18408203,-1564.63330078,2988.86132812,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 6053); //object(swank_speaker_2) (1)
    CreateDynamicObject(2230,1335.31005859,-1564.63281250,2988.86132812,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(swank_speaker_2) (2)
    CreateDynamicObject(2230,1333.68310547,-1564.63281250,2988.86132812,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(swank_speaker_2) (3)
    CreateDynamicObject(2230,1329.90185547,-1564.63281250,2988.86132812,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(swank_speaker_2) (4)
    CreateDynamicObject(2350,1339.10253906,-1552.37500000,2986.46582031,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_barstool_2) (3)
    CreateDynamicObject(2350,1338.10253906,-1552.37500000,2986.46582031,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_barstool_2) (4)
    CreateDynamicObject(2350,1343.10644531,-1552.49804688,2986.46582031,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_barstool_2) (6)
    CreateDynamicObject(2350,1344.35644531,-1552.49804688,2986.46582031,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_barstool_2) (7)
    CreateDynamicObject(2350,1345.40429688,-1552.49804688,2986.46582031,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_barstool_2) (8)
    CreateDynamicObject(2350,1335.66796875,-1550.95751953,2986.46582031,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_barstool_2) (9)
    CreateDynamicObject(2350,1335.66796875,-1549.20703125,2986.46582031,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_barstool_2) (10)
    CreateDynamicObject(2350,1346.53417969,-1550.85058594,2986.46582031,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_barstool_2) (13)
    CreateDynamicObject(2350,1346.53417969,-1549.20703125,2986.46582031,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_barstool_2) (14)
    CreateDynamicObject(1541,1343.83300781,-1550.85839844,2987.36572266,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_beer_taps_1) (1)
    CreateDynamicObject(1541,1338.66210938,-1550.75244141,2987.35888672,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_beer_taps_1) (2)
    CreateDynamicObject(3612,1357.60253906,-1552.53027344,2997.91406250,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (12)
    CreateDynamicObject(970,1349.87988281,-1549.98925781,2986.67993164,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(fencesmallb) (1)
    CreateDynamicObject(970,1349.87988281,-1554.16064453,2986.67993164,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(fencesmallb) (2)
    CreateDynamicObject(970,1349.87646484,-1558.33203125,2986.67993164,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(fencesmallb) (3)
    CreateDynamicObject(6965,1351.94824219,-1553.73730469,2984.95947266,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(venefountain02) (1)
    CreateDynamicObject(6965,1352.00244141,-1549.98730469,2983.47314453,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(venefountain02) (2)
    CreateDynamicObject(6965,1352.00195312,-1557.53906250,2983.47314453,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(venefountain02) (3)
    CreateDynamicObject(3612,1307.09863281,-1562.82226562,2997.91406250,0.00000000,0.00000000,269.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (13)
    CreateDynamicObject(3612,1317.40332031,-1562.91162109,2997.91406250,0.00000000,0.00000000,179.97253418 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (14)
    CreateDynamicObject(3612,1320.35937500,-1542.59667969,2997.91406250,0.00000000,0.00000000,89.95605469 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (15)
    CreateDynamicObject(2964,1325.69665527,-1561.15783691,2986.13110352,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(k_pooltablesm) (1)
    CreateDynamicObject(3003,1325.53405762,-1560.86535645,2987.06176758,0.00000000,0.00000000,80.00000000 , .interiorid = 1, .worldid = 6053); //object(k_poolballcue) (1)
    CreateDynamicObject(2997,1325.53320312,-1561.61523438,2987.06103516,0.00000000,0.00000000,149.99694824 , .interiorid = 1, .worldid = 6053); //object(k_poolballstp03) (2)
    CreateDynamicObject(2996,1325.78320312,-1561.36523438,2987.06103516,0.00000000,0.00000000,359.99694824 , .interiorid = 1, .worldid = 6053); //object(k_poolballstp02) (1)
    CreateDynamicObject(2999,1325.80712891,-1560.61523438,2987.06103516,0.00000000,0.00000000,169.99694824 , .interiorid = 1, .worldid = 6053); //object(k_poolballstp05) (1)
    CreateDynamicObject(3101,1325.27880859,-1560.54345703,2987.06127930,0.00000000,0.00000000,159.99694824 , .interiorid = 1, .worldid = 6053); //object(k_poolballspt03) (1)
    CreateDynamicObject(3004,1325.52600098,-1561.54431152,2987.01611328,0.00000000,0.00000000,8.00000000 , .interiorid = 1, .worldid = 6053); //object(k_poolq2) (1)
    CreateDynamicObject(3004,1325.35742188,-1561.48242188,2987.01611328,0.00000000,0.00000000,317.99804688 , .interiorid = 1, .worldid = 6053); //object(k_poolq2) (2)
    CreateDynamicObject(1727,1327.45019531,-1559.01171875,2986.14013672,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2b) (5)
    CreateDynamicObject(1727,1327.45019531,-1562.29589844,2986.14013672,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2b) (6)
    CreateDynamicObject(2126,1326.95800781,-1560.69287109,2986.09912109,0.00000000,0.00000000,269.99450684 , .interiorid = 1, .worldid = 6053); //object(coffee_swank_5) (6)
    CreateDynamicObject(1670,1327.45117188,-1561.17675781,2986.62036133,0.00000000,0.00000000,278.74511719 , .interiorid = 1, .worldid = 6053); //object(propcollecttable) (1)
    CreateDynamicObject(3612,1317.40722656,-1544.39257812,2997.91406250,0.00000000,0.00000000,179.96154785 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (14)
    CreateDynamicObject(3612,1317.42041016,-1554.81542969,3000.43066406,0.00000000,0.00000000,179.97253418 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (14)
    CreateDynamicObject(2774,1323.41601562,-1559.36035156,2996.49511719,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airp_pillars) (4)
    CreateDynamicObject(3612,1307.09863281,-1545.75390625,2997.91406250,0.00000000,0.00000000,89.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (13)
    CreateDynamicObject(3612,1299.84863281,-1554.07226562,2997.91406250,0.00000000,0.00000000,179.97253418 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (13)
    CreateDynamicObject(8661,1300.86474609,-1555.16894531,2990.79052734,0.00000000,179.99450684,179.99450684 , .interiorid = 1, .worldid = 6053); //object(gnhtelgrnd_lvs) (2)
    CreateDynamicObject(1502,1313.83984375,-1552.88183594,2986.14013672,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(gen_doorint04) (1)
    CreateDynamicObject(2207,1307.05664062,-1554.47460938,2986.08569336,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office7_desk_1) (1)
    CreateDynamicObject(1708,1304.93139648,-1553.99645996,2986.07324219,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_chair02) (1)
    CreateDynamicObject(14455,1304.17480469,-1559.07324219,2987.74462891,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(gs_bookcase) (2)
    CreateDynamicObject(2007,1303.88574219,-1554.91210938,2986.05566406,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(filing_cab_nu01) (1)
    CreateDynamicObject(2190,1306.86669922,-1552.93334961,2986.86303711,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(pc_1) (1)
    CreateDynamicObject(2855,1306.40625000,-1554.47265625,2986.86303711,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(gb_bedmags05) (2)
    CreateDynamicObject(2261,1303.88891602,-1553.45288086,2988.26831055,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(frame_slim_2) (1)
    CreateDynamicObject(2161,1303.37890625,-1550.60058594,2986.05517578,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office_unit_4) (1)
    CreateDynamicObject(2162,1305.07421875,-1549.27148438,2986.07250977,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office_unit_1) (1)
    CreateDynamicObject(2164,1307.61621094,-1549.30175781,2986.09082031,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office_unit_5) (1)
    CreateDynamicObject(1671,1308.17102051,-1552.64697266,2986.55395508,0.00000000,0.00000000,300.00000000 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (2)
    CreateDynamicObject(1671,1308.17089844,-1554.38281250,2986.55395508,0.00000000,0.00000000,240.00000000 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (3)
    CreateDynamicObject(2611,1303.42614746,-1556.12695312,2988.65673828,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(police_nb1) (1)
    CreateDynamicObject(2199,1309.64062500,-1549.33007812,2986.10327148,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office6_mc_1) (1)
    CreateDynamicObject(2606,1305.79589844,-1549.29003906,2988.62133789,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_police_counter2) (1)
    CreateDynamicObject(2606,1305.79296875,-1549.29003906,2989.07690430,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_police_counter2) (4)
    CreateDynamicObject(1713,1313.17736816,-1550.43359375,2986.12500000,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_couch04) (1)
    CreateDynamicObject(2612,1303.42578125,-1550.87695312,2988.80102539,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(police_nb2) (1)
    CreateDynamicObject(1713,1313.17675781,-1555.19335938,2986.12500000,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_couch04) (2)
    CreateDynamicObject(1708,1311.44042969,-1558.58398438,2986.12500000,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(kb_couch04) (3)
    CreateDynamicObject(2126,1312.29760742,-1551.78674316,2986.12597656,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(coffee_swank_5) (3)
    CreateDynamicObject(2126,1312.29687500,-1556.42626953,2986.12597656,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(coffee_swank_5) (3)
    CreateDynamicObject(2852,1311.81933594,-1551.20507812,2986.63354492,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(gb_bedmags02) (2)
    CreateDynamicObject(2853,1311.75109863,-1555.80468750,2986.63354492,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(gb_bedmags03) (1)
    CreateDynamicObject(2818,1313.53027344,-1554.14355469,2986.14257812,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(gb_bedrug02) (1)
    CreateDynamicObject(2256,1313.77209473,-1551.13024902,2988.92431641,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(frame_clip_3) (1)
    CreateDynamicObject(2258,1313.76806641,-1556.08203125,2988.82958984,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(frame_clip_5) (1)
    CreateDynamicObject(2259,1311.37487793,-1558.81750488,2988.26806641,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 6053); //object(frame_clip_6) (1)
    CreateDynamicObject(16779,1307.09167480,-1553.38085938,2990.77612305,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(ufo_light02) (1)
    CreateDynamicObject(2435,1321.41259766,-1549.77600098,2986.12866211,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_ff_conter_2) (1)
    CreateDynamicObject(2435,1322.34375000,-1549.77539062,2986.12866211,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_ff_conter_2) (8)
    CreateDynamicObject(2435,1323.27148438,-1549.77539062,2986.12866211,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_ff_conter_2) (10)
    CreateDynamicObject(2435,1324.20312500,-1549.77539062,2986.12866211,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_ff_conter_2) (11)
    CreateDynamicObject(2435,1325.13476562,-1549.77539062,2986.12866211,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_ff_conter_2) (12)
    CreateDynamicObject(2434,1326.06518555,-1549.77514648,2986.12890625,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_ff_conter_2b) (3)
    CreateDynamicObject(2435,1326.23046875,-1548.64501953,2986.12866211,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_ff_conter_2) (19)
    CreateDynamicObject(2435,1326.23046875,-1547.71582031,2986.12866211,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_ff_conter_2) (20)
    CreateDynamicObject(1491,1326.54223633,-1547.28784180,2984.64672852,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(gen_doorint01) (2)
    CreateDynamicObject(2332,1303.80554199,-1551.92297363,2986.52099609,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(kev_safe) (1)
    CreateDynamicObject(2453,1323.52880859,-1549.78662109,2987.56274414,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_pizza_dispf) (2)
    CreateDynamicObject(2453,1322.84924316,-1549.82922363,2987.56274414,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_pizza_dispf) (3)
    CreateDynamicObject(2425,1325.48437500,-1549.59619141,2987.18432617,0.00000000,0.00000000,359.99572754 , .interiorid = 1, .worldid = 6053); //object(cj_ff_juice) (1)
    CreateDynamicObject(2222,1324.21630859,-1549.79003906,2987.24926758,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(rustyhigh) (1)
    CreateDynamicObject(2222,1324.67871094,-1549.79003906,2987.24926758,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(rustyhigh) (2)
    CreateDynamicObject(2350,1337.06152344,-1552.37500000,2986.46582031,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_barstool_2) (5)
    CreateDynamicObject(2764,1322.56933594,-1557.55859375,2986.56445312,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_pizza_table03) (1)
    CreateDynamicObject(2642,1320.95996094,-1551.01464844,2988.14233398,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_burger_poster2) (1)
    CreateDynamicObject(2773,1344.62500000,-1566.04101562,2986.62524414,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airprt_bar) (7)
    CreateDynamicObject(2773,1325.15283203,-1551.28125000,2986.67919922,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airprt_bar) (7)
    CreateDynamicObject(2416,1321.42675781,-1546.63281250,2986.16967773,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_ff_disp) (1)
    CreateDynamicObject(2369,1322.34375000,-1549.57031250,2987.18432617,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_till) (1)
    CreateDynamicObject(2764,1322.57519531,-1555.45605469,2986.56445312,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_pizza_table03) (1)
    CreateDynamicObject(3612,1348.02929688,-1533.28027344,2997.86279297,0.00000000,0.00000000,179.98352051 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(3612,1324.55078125,-1526.03320312,2997.87988281,0.00000000,0.00000000,359.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(8661,1339.51367188,-1535.37109375,2990.04052734,0.00000000,179.99450684,179.99450684 , .interiorid = 1, .worldid = 6053); //object(gnhtelgrnd_lvs) (2)
    CreateDynamicObject(3612,1319.71875000,-1539.39257812,2997.91406250,0.00000000,0.00000000,89.95605469 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (14)
    CreateDynamicObject(3612,1336.25195312,-1541.77636719,3001.82763672,0.00000000,0.00000000,269.98901367 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(3095,1316.45422363,-1532.09338379,2986.22241211,0.00000000,180.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(a51_jetdoor) (1)
    CreateDynamicObject(3095,1316.45410156,-1523.09277344,2986.22241211,0.00000000,179.99450684,0.00000000 , .interiorid = 1, .worldid = 6053); //object(a51_jetdoor) (2)
    CreateDynamicObject(3095,1320.91601562,-1530.03710938,2990.42114258,90.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(a51_jetdoor) (3)
    CreateDynamicObject(3095,1320.91601562,-1521.03710938,2990.42114258,90.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(a51_jetdoor) (4)
    CreateDynamicObject(3095,1316.45410156,-1519.10888672,2990.42114258,90.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 6053); //object(a51_jetdoor) (5)
    CreateDynamicObject(3095,1311.95410156,-1523.59179688,2990.42114258,90.00000000,0.00000000,269.98901367 , .interiorid = 1, .worldid = 6053); //object(a51_jetdoor) (6)
    CreateDynamicObject(3095,1311.95410156,-1532.59179688,2990.42114258,90.00000000,0.00000000,269.98901367 , .interiorid = 1, .worldid = 6053); //object(a51_jetdoor) (7)
    CreateDynamicObject(8661,1312.36328125,-1520.99121094,2990.00292969,0.00000000,179.99450684,89.99450684 , .interiorid = 1, .worldid = 6053); //object(gnhtelgrnd_lvs) (2)
    CreateDynamicObject(3095,1316.41992188,-1535.73242188,2990.42114258,90.00000000,0.00000000,359.98901367 , .interiorid = 1, .worldid = 6053); //object(a51_jetdoor) (8)
    CreateDynamicObject(3055,1321.27636719,-1535.21582031,2990.70458984,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(kmb_shutter) (1)
    CreateDynamicObject(3440,1321.24121094,-1536.27539062,2988.77099609,90.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(arptpillar01_lvs) (2)
    CreateDynamicObject(1523,1321.09704590,-1535.97900391,2986.19311523,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(gen_doorext10) (1)
    CreateDynamicObject(9819,1313.28906250,-1531.64062500,2987.11743164,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(shpbridge_sfw02) (1)
    CreateDynamicObject(16782,1312.03283691,-1533.88256836,2988.77392578,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(a51_radar_scan) (1)
    CreateDynamicObject(16782,1312.03222656,-1529.09765625,2988.77392578,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(a51_radar_scan) (2)
    CreateDynamicObject(2606,1311.75976562,-1531.48046875,2988.99096680,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_police_counter2) (5)
    CreateDynamicObject(2606,1311.75976562,-1531.48046875,2988.52172852,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_police_counter2) (6)
    CreateDynamicObject(1671,1313.89440918,-1533.68066406,2986.67919922,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (4)
    CreateDynamicObject(1671,1313.89355469,-1530.69091797,2986.67919922,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (5)
    CreateDynamicObject(1671,1313.89355469,-1527.99853516,2986.67919922,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (6)
    CreateDynamicObject(16662,1305.90844727,-1520.64636230,2987.41503906,0.00000000,0.00000000,63.75000000 , .interiorid = 1, .worldid = 6053); //object(a51_radar_stuff) (1)
    CreateDynamicObject(2185,1315.11901855,-1525.52075195,2986.21875000,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office6_desk_1) (1)
    CreateDynamicObject(1671,1313.89355469,-1524.67285156,2986.67919922,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (7)
    CreateDynamicObject(2007,1312.45703125,-1524.62011719,2986.21875000,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(filing_cab_nu01) (1)
    CreateDynamicObject(3066,1319.77734375,-1520.85546875,2987.27612305,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(ammotrn_obj) (1)
    CreateDynamicObject(936,1320.26159668,-1527.23461914,2986.69409180,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_df_worktop_2) (1)
    CreateDynamicObject(936,1320.26074219,-1529.23437500,2986.69409180,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_df_worktop_2) (2)
    CreateDynamicObject(936,1320.26074219,-1531.20996094,2986.69409180,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_df_worktop_2) (3)
    CreateDynamicObject(936,1320.26074219,-1533.19238281,2986.69409180,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_df_worktop_2) (4)
    CreateDynamicObject(2509,1320.91650391,-1526.98132324,2988.51123047,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_hobby_shelf_6) (1)
    CreateDynamicObject(2509,1320.91601562,-1528.29589844,2988.51123047,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_hobby_shelf_6) (2)
    CreateDynamicObject(2509,1320.91601562,-1529.60107422,2988.51123047,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_hobby_shelf_6) (3)
    CreateDynamicObject(2509,1320.91601562,-1530.90917969,2988.51123047,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_hobby_shelf_6) (4)
    CreateDynamicObject(2509,1320.91601562,-1532.22460938,2988.51123047,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_hobby_shelf_6) (5)
    CreateDynamicObject(2509,1320.91601562,-1533.53906250,2988.51123047,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_hobby_shelf_6) (6)
    CreateDynamicObject(2358,1320.25390625,-1526.79199219,2987.28613281,0.00000000,0.00000000,299.99511719 , .interiorid = 1, .worldid = 6053); //object(ammo_box_c2) (1)
    CreateDynamicObject(2358,1320.25390625,-1527.79199219,2987.28613281,0.00000000,0.00000000,299.98962402 , .interiorid = 1, .worldid = 6053); //object(ammo_box_c2) (3)
    CreateDynamicObject(2358,1320.25390625,-1528.83642578,2987.28613281,0.00000000,0.00000000,279.99511719 , .interiorid = 1, .worldid = 6053); //object(ammo_box_c2) (4)
    CreateDynamicObject(2358,1320.25390625,-1529.77832031,2987.28613281,0.00000000,0.00000000,239.99206543 , .interiorid = 1, .worldid = 6053); //object(ammo_box_c2) (5)
    CreateDynamicObject(2358,1320.25390625,-1529.25097656,2987.51171875,0.00000000,0.00000000,299.99084473 , .interiorid = 1, .worldid = 6053); //object(ammo_box_c2) (6)
    CreateDynamicObject(930,1317.47070312,-1524.22070312,2986.69506836,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(o2_bottles) (1)
    CreateDynamicObject(2060,1320.26318359,-1530.55725098,2987.32641602,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_sandbag) (1)
    CreateDynamicObject(2060,1320.26269531,-1531.05664062,2987.32641602,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_sandbag) (2)
    CreateDynamicObject(2060,1320.26269531,-1531.50830078,2987.32641602,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_sandbag) (3)
    CreateDynamicObject(2060,1320.26269531,-1531.94921875,2987.32641602,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_sandbag) (4)
    CreateDynamicObject(2060,1320.26269531,-1531.74414062,2987.51440430,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_sandbag) (5)
    CreateDynamicObject(2060,1320.26269531,-1531.25488281,2987.51440430,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_sandbag) (6)
    CreateDynamicObject(2060,1320.26269531,-1530.79589844,2987.51440430,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_sandbag) (7)
    CreateDynamicObject(3612,1336.32324219,-1528.53027344,2997.85595703,0.00000000,0.00000000,359.98352051 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(3612,1343.82324219,-1525.53027344,2997.91406250,0.00000000,0.00000000,269.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(2172,1340.41638184,-1536.30664062,2986.09594727,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office2_desk_1) (1)
    CreateDynamicObject(2172,1340.41601562,-1534.33056641,2986.09594727,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office2_desk_1) (2)
    CreateDynamicObject(2172,1340.41601562,-1532.35400391,2986.09594727,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office2_desk_1) (3)
    CreateDynamicObject(2172,1341.65283203,-1529.62402344,2986.09594727,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office2_desk_1) (4)
    CreateDynamicObject(2172,1343.94384766,-1531.35351562,2986.09594727,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office2_desk_1) (5)
    CreateDynamicObject(2172,1343.94335938,-1533.32958984,2986.09594727,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office2_desk_1) (6)
    CreateDynamicObject(2172,1343.94335938,-1535.30859375,2986.09594727,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office2_desk_1) (7)
    CreateDynamicObject(1671,1342.35852051,-1530.68579102,2986.55859375,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (1)
    CreateDynamicObject(1671,1342.93701172,-1531.97705078,2986.55859375,0.00000000,0.00000000,89.99450684 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (1)
    CreateDynamicObject(1671,1342.93652344,-1533.92871094,2986.55859375,0.00000000,0.00000000,89.99450684 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (1)
    CreateDynamicObject(1671,1342.93652344,-1535.91162109,2986.55859375,0.00000000,0.00000000,89.99450684 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (1)
    CreateDynamicObject(1671,1341.43652344,-1535.91113281,2986.55859375,0.00000000,0.00000000,269.99450684 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (1)
    CreateDynamicObject(1671,1341.43652344,-1533.90087891,2986.55859375,0.00000000,0.00000000,269.98901367 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (1)
    CreateDynamicObject(1671,1341.43652344,-1531.90039062,2986.55859375,0.00000000,0.00000000,269.98901367 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (1)
    CreateDynamicObject(2616,1344.36242676,-1534.04150391,2988.72509766,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(police_nb04) (1)
    CreateDynamicObject(1808,1344.23632812,-1537.66015625,2986.10375977,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_watercooler2) (4)
    CreateDynamicObject(16779,1342.19042969,-1532.78222656,2990.02343750,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(ufo_light02) (2)
    CreateDynamicObject(3440,1334.11108398,-1539.05407715,2988.43676758,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(arptpillar01_lvs) (3)
    CreateDynamicObject(3440,1334.11035156,-1536.99511719,2988.43676758,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(arptpillar01_lvs) (5)
    CreateDynamicObject(1502,1334.05615234,-1537.23864746,2986.07202148,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(gen_doorint04) (1)
    CreateDynamicObject(3055,1334.11584473,-1535.21582031,2990.76953125,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(kmb_shutter) (1)
    CreateDynamicObject(3612,1317.80078125,-1515.47851562,2997.85937500,0.00000000,0.00000000,89.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(3612,1345.07324219,-1520.78027344,2997.91406250,0.00000000,0.00000000,269.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(3612,1345.07324219,-1510.32641602,2997.91406250,0.00000000,0.00000000,269.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(14409,1350.04528809,-1515.77819824,2989.26489258,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(carter-stairs02) (1)
    CreateDynamicObject(8661,1333.41064453,-1515.39880371,2995.29052734,0.00000000,179.99450684,179.99450684 , .interiorid = 1, .worldid = 6053); //object(gnhtelgrnd_lvs) (2)
    CreateDynamicObject(3612,1336.25195312,-1528.92333984,3001.82763672,0.00000000,0.00000000,269.98901367 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(8661,1363.54003906,-1500.96191406,2992.45214844,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(gnhtelgrnd_lvs) (4)
    CreateDynamicObject(3612,1361.56286621,-1524.28027344,2997.91406250,0.00000000,0.00000000,269.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(3612,1367.06250000,-1512.61059570,2997.91406250,0.00000000,0.00000000,359.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(8661,1361.09875488,-1503.79870605,2997.19775391,0.00000000,179.99450684,269.99450684 , .interiorid = 1, .worldid = 6053); //object(gnhtelgrnd_lvs) (2)
    CreateDynamicObject(3612,1361.90234375,-1500.55566406,2997.91406250,0.00000000,0.00000000,89.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(3612,1344.87792969,-1514.32617188,3007.07861328,0.00000000,0.00000000,269.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(3440,1352.97265625,-1516.94824219,2993.07885742,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(arptpillar01_lvs) (6)
    CreateDynamicObject(3440,1352.97265625,-1514.25634766,2993.07885742,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(arptpillar01_lvs) (7)
    CreateDynamicObject(2774,1328.05273438,-1545.35595703,2996.49511719,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airp_pillars) (4)
    CreateDynamicObject(2774,1334.58691406,-1545.37597656,2996.49511719,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airp_pillars) (4)
    CreateDynamicObject(2117,1358.07812500,-1512.00878906,2992.45214844,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(swank_dinning_5) (4)
    CreateDynamicObject(2117,1358.07812500,-1511.01904297,2992.45214844,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(swank_dinning_5) (5)
    CreateDynamicObject(2117,1358.07812500,-1510.03564453,2992.45214844,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(swank_dinning_5) (6)
    CreateDynamicObject(2117,1358.07812500,-1509.05566406,2992.45214844,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(swank_dinning_5) (7)
    CreateDynamicObject(3612,1345.07324219,-1503.17871094,2997.91406250,0.00000000,0.00000000,269.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(2117,1358.07812500,-1508.06591797,2992.45214844,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(swank_dinning_5) (10)
    CreateDynamicObject(2117,1358.07812500,-1507.07910156,2992.45214844,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(swank_dinning_5) (11)
    CreateDynamicObject(2491,1358.80664062,-1505.77587891,2992.35644531,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(model_stand) (3)
    CreateDynamicObject(2491,1358.80664062,-1505.27539062,2990.81884766,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(model_stand) (5)
    CreateDynamicObject(1714,1360.49804688,-1511.98632812,2992.45214844,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_swivelchair1) (2)
    CreateDynamicObject(1714,1360.49804688,-1511.02050781,2992.45214844,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_swivelchair1) (3)
    CreateDynamicObject(1714,1360.49804688,-1510.04443359,2992.45214844,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_swivelchair1) (4)
    CreateDynamicObject(1714,1360.49804688,-1509.07812500,2992.45214844,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_swivelchair1) (5)
    CreateDynamicObject(1714,1360.49804688,-1508.10546875,2992.45214844,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_swivelchair1) (6)
    CreateDynamicObject(1714,1360.49804688,-1507.09521484,2992.45214844,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_swivelchair1) (7)
    CreateDynamicObject(1714,1356.74121094,-1507.09472656,2992.45214844,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_swivelchair1) (8)
    CreateDynamicObject(1714,1356.74121094,-1508.10546875,2992.45214844,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_swivelchair1) (9)
    CreateDynamicObject(1714,1356.74121094,-1509.04687500,2992.45214844,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_swivelchair1) (10)
    CreateDynamicObject(1714,1356.74121094,-1509.99218750,2992.45214844,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_swivelchair1) (11)
    CreateDynamicObject(1714,1356.74121094,-1510.99218750,2992.45214844,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_swivelchair1) (12)
    CreateDynamicObject(1714,1356.74121094,-1511.95458984,2992.45214844,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_swivelchair1) (13)
    CreateDynamicObject(16779,1358.55761719,-1509.36425781,2997.17773438,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(ufo_light02) (5)
    CreateDynamicObject(3440,1353.66748047,-1520.68408203,2994.82202148,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(arptpillar01_lvs) (8)
    CreateDynamicObject(3440,1363.43750000,-1504.18359375,2994.82202148,0.00000000,0.00000000,109.99447632 , .interiorid = 1, .worldid = 6053); //object(arptpillar01_lvs) (10)
    CreateDynamicObject(1892,1336.94738770,-1516.08227539,2986.08496094,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(security_gatsh) (2)
    CreateDynamicObject(14455,1363.33288574,-1512.13635254,2994.12402344,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(gs_bookcase) (1)
    CreateDynamicObject(14455,1353.76708984,-1507.78271484,2994.12402344,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(gs_bookcase) (3)
    CreateDynamicObject(2612,1356.21093750,-1504.14208984,2995.07519531,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(police_nb2) (2)
    CreateDynamicObject(2611,1360.94628906,-1504.14550781,2995.05737305,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(police_nb1) (2)
    CreateDynamicObject(1726,1356.87695312,-1520.21191406,2992.45214844,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2) (14)
    CreateDynamicObject(1726,1319.91333008,-1511.32446289,2986.13769531,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2) (16)
    CreateDynamicObject(1846,1358.55981445,-1503.15991211,2995.03955078,90.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(shop_shelf04) (4)
    CreateDynamicObject(3440,1353.66699219,-1504.18359375,2994.82202148,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(arptpillar01_lvs) (13)
    CreateDynamicObject(3440,1363.43750000,-1520.62207031,2994.82202148,0.00000000,0.00000000,109.98962402 , .interiorid = 1, .worldid = 6053); //object(arptpillar01_lvs) (15)
    CreateDynamicObject(1808,1353.77233887,-1513.38745117,2992.45214844,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_watercooler2) (5)
    CreateDynamicObject(2007,1354.07641602,-1505.79345703,2992.45214844,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(filing_cab_nu01) (2)
    CreateDynamicObject(2007,1363.03515625,-1505.79296875,2992.45214844,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(filing_cab_nu01) (2)
    CreateDynamicObject(2774,1337.41003418,-1517.30615234,2999.17651367,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airp_pillars) (4)
    CreateDynamicObject(2774,1337.40917969,-1513.87402344,2999.17651367,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airp_pillars) (4)
    CreateDynamicObject(3612,1334.76269531,-1505.35156250,2996.90380859,0.00000000,0.00000000,89.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(3612,1331.08007812,-1501.25195312,2996.66406250,0.00000000,0.00000000,89.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(3612,1317.58007812,-1499.47851562,2996.66406250,0.00000000,0.00000000,89.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(3612,1312.83007812,-1505.22851562,2996.66406250,0.00000000,0.00000000,179.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(8661,1306.33203125,-1499.46386719,2989.57812500,0.00000000,179.99450684,359.99450684 , .interiorid = 1, .worldid = 6053); //object(gnhtelgrnd_lvs) (2)
    CreateDynamicObject(3612,1317.78076172,-1512.47851562,3000.36230469,0.00000000,0.00000000,89.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(1502,1326.26452637,-1511.87792969,2986.06933594,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(gen_doorint04) (1)
    CreateDynamicObject(1502,1326.21923828,-1508.85400391,2986.06933594,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(gen_doorint04) (1)
    CreateDynamicObject(14455,1316.53479004,-1503.79577637,2987.75073242,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(gs_bookcase) (4)
    CreateDynamicObject(1808,1316.56726074,-1509.41748047,2986.13330078,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_watercooler2) (6)
    CreateDynamicObject(1726,1362.04003906,-1520.21191406,2992.45214844,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2) (17)
    CreateDynamicObject(1726,1322.47558594,-1511.32421875,2986.13769531,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2) (19)
    CreateDynamicObject(2126,1320.94433594,-1510.45324707,2986.13623047,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(coffee_swank_5) (7)
    CreateDynamicObject(2126,1318.41015625,-1510.45312500,2986.13623047,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(coffee_swank_5) (8)
    CreateDynamicObject(2852,1321.31384277,-1510.05456543,2986.64379883,0.00000000,0.00000000,100.00000000 , .interiorid = 1, .worldid = 6053); //object(gb_bedmags02) (3)
    CreateDynamicObject(2854,1318.80224609,-1510.01818848,2986.64379883,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(gb_bedmags04) (1)
    CreateDynamicObject(2205,1320.40759277,-1505.30432129,2986.09960938,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office8_desk_1) (1)
    CreateDynamicObject(1708,1319.22314453,-1503.67272949,2986.07983398,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_chair02) (2)
    CreateDynamicObject(1671,1320.60363770,-1506.59313965,2986.56250000,0.00000000,0.00000000,210.00000000 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (1)
    CreateDynamicObject(1671,1318.88427734,-1506.59277344,2986.56250000,0.00000000,0.00000000,149.99450684 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (1)
    CreateDynamicObject(2190,1320.26123047,-1505.59484863,2987.03613281,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 6053); //object(pc_1) (2)
    CreateDynamicObject(2186,1323.16467285,-1505.25781250,2986.09619141,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(photocopier_1) (1)
    CreateDynamicObject(1828,1319.52062988,-1508.20068359,2986.11523438,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(man_sdr_rug) (1)
    CreateDynamicObject(2818,1325.68847656,-1510.85205078,2986.09472656,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(gb_bedrug02) (2)
    CreateDynamicObject(2164,1321.13208008,-1503.01831055,2986.10278320,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office_unit_5) (2)
    CreateDynamicObject(2162,1326.25427246,-1505.48022461,2986.11132812,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office_unit_1) (2)
    CreateDynamicObject(2199,1326.19226074,-1507.54357910,2986.11132812,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office6_mc_1) (2)
    CreateDynamicObject(2286,1319.70043945,-1503.03698730,2988.28222656,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(frame_5) (1)
    CreateDynamicObject(2774,1333.57324219,-1520.69775391,2996.49511719,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airp_pillars) (4)
    CreateDynamicObject(2774,1327.38818359,-1518.32031250,2996.49511719,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airp_pillars) (4)
    CreateDynamicObject(2332,1322.51586914,-1504.17468262,2986.55493164,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(kev_safe) (2)
    CreateDynamicObject(2186,1303.84863281,-1556.93066406,2986.09008789,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(photocopier_1) (2)
    CreateDynamicObject(1727,1332.27343750,-1529.68847656,2986.07836914,0.00000000,0.00000000,260.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2b) (5)
    CreateDynamicObject(1727,1332.09228516,-1527.65039062,2986.07836914,0.00000000,0.00000000,280.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2b) (5)
    CreateDynamicObject(2725,1332.15515137,-1529.18530273,2986.51147461,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(lm_striptable) (1)
    CreateDynamicObject(1670,1332.21142578,-1529.14831543,2986.96801758,0.00000000,0.00000000,278.74511719 , .interiorid = 1, .worldid = 6053); //object(propcollecttable) (1)
    CreateDynamicObject(2254,1332.74475098,-1529.16613770,2988.82641602,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(frame_clip_1) (1)
    CreateDynamicObject(1727,1329.99511719,-1543.27453613,2986.08691406,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2b) (5)
    CreateDynamicObject(2126,1328.97753906,-1541.17883301,2986.07714844,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(coffee_swank_5) (11)
    CreateDynamicObject(2255,1329.34985352,-1541.64074707,2988.24072266,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(frame_clip_2) (1)
    CreateDynamicObject(1727,1328.99511719,-1540.02441406,2986.08691406,0.00000000,0.00000000,359.98901367 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2b) (5)
    CreateDynamicObject(1714,1358.57666016,-1513.44824219,2992.45214844,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_swivelchair1) (1)
    CreateDynamicObject(2416,1323.35839844,-1546.63281250,2986.16967773,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_ff_disp) (1)
    CreateDynamicObject(2007,1317.40429688,-1503.50756836,2986.07055664,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(filing_cab_nu01) (1)
    CreateDynamicObject(2313,1338.21118164,-1563.98291016,2986.09082031,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_tv_table1) (1)
    CreateDynamicObject(2313,1332.75878906,-1563.98242188,2986.09082031,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(cj_tv_table1) (2)
    CreateDynamicObject(2639,1321.37597656,-1557.46105957,2986.80981445,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_pizza_chair3) (1)
    CreateDynamicObject(2639,1321.37597656,-1555.45751953,2986.80981445,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_pizza_chair3) (2)
    CreateDynamicObject(2639,1323.80078125,-1555.56298828,2986.80981445,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_pizza_chair3) (3)
    CreateDynamicObject(2639,1323.79687500,-1557.66455078,2986.80981445,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_pizza_chair3) (4)
    CreateDynamicObject(2567,1317.32629395,-1521.15124512,2988.14648438,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(ab_warehouseshelf) (1)
    CreateDynamicObject(2036,1320.32165527,-1533.26135254,2987.20361328,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_psg1) (3)
    CreateDynamicObject(356,1320.81982422,-1527.02880859,2988.84497070,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(1)
    CreateDynamicObject(356,1320.81933594,-1527.02832031,2988.01635742,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(2)
    CreateDynamicObject(356,1320.81933594,-1529.02832031,2988.84497070,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(3)
    CreateDynamicObject(356,1320.81933594,-1529.04541016,2988.01635742,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(4)
    CreateDynamicObject(359,1320.82714844,-1531.27246094,2988.88500977,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(5)
    CreateDynamicObject(359,1320.82714844,-1531.27246094,2988.00805664,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(6)
    CreateDynamicObject(351,1320.84680176,-1532.78564453,2987.95727539,0.00000000,0.00000000,276.00000000 , .interiorid = 1, .worldid = 6053); //object(9)
    CreateDynamicObject(351,1320.84667969,-1532.78515625,2988.88549805,0.00000000,0.00000000,275.99853516 , .interiorid = 1, .worldid = 6053); //object(10)

	/*Hq gang thap bien*/
	  //Custom Exterior
	CreateDynamicObject(19304, 145.13, -1937.71, 3.87,   0.00, 0.00, 55.00);
    CreateDynamicObject(19304, 142.86, -1941.14, 3.87,   0.00, 0.00, 55.00);
    CreateDynamicObject(19304, 140.51, -1944.52, 3.87,   0.00, 0.00, 57.00);
    CreateDynamicObject(19304, 138.40, -1947.74, 3.87,   0.00, 0.00, 58.00);
    CreateDynamicObject(19304, 136.66, -1950.28, 3.87,   0.00, 0.00, 58.00);
    CreateDynamicObject(19304, 136.79, -1953.67, 3.87,   0.00, 0.00, -55.00);
    CreateDynamicObject(19304, 139.19, -1957.03, 3.87,   0.00, 0.00, -54.00);
    CreateDynamicObject(19304, 141.52, -1960.24, 3.87,   0.00, 0.00, -54.00);
    CreateDynamicObject(19304, 143.94, -1963.53, 3.87,   0.00, 0.00, -54.00);
    CreateDynamicObject(19304, 145.77, -1965.97, 3.87,   0.00, 0.00, -54.00);
    CreateDynamicObject(19304, 149.23, -1967.85, 3.87,   0.00, 0.00, 0.00);
    CreateDynamicObject(19304, 153.25, -1967.84, 3.87,   0.00, 0.00, 0.00);
    CreateDynamicObject(19304, 157.21, -1967.86, 3.87,   0.00, 0.00, 0.00);
    CreateDynamicObject(19304, 160.11, -1967.85, 3.87,   0.00, 0.00, 0.00);
    CreateDynamicObject(19304, 163.50, -1966.19, 3.87,   0.00, 0.00, 55.00);
    CreateDynamicObject(19304, 165.75, -1962.75, 3.87,   0.00, 0.00, 55.00);
    CreateDynamicObject(19304, 168.13, -1959.12, 3.87,   0.00, 0.00, 56.00);
    CreateDynamicObject(19304, 170.38, -1955.71, 3.87,   0.00, 0.00, 56.00);
    CreateDynamicObject(19304, 171.84, -1953.58, 3.87,   0.00, 0.00, 56.00);
    CreateDynamicObject(19304, 171.90, -1950.02, 3.87,   0.00, 0.00, -58.00);
    CreateDynamicObject(19304, 169.72, -1946.55, 3.87,   0.00, 0.00, -58.00);
    CreateDynamicObject(19304, 167.49, -1942.89, 3.87,   0.00, 0.00, -58.00);
    CreateDynamicObject(19304, 165.34, -1939.42, 3.87,   0.00, 0.00, -58.00);
    CreateDynamicObject(19304, 163.50, -1936.52, 3.87,   0.00, 0.00, -58.00);
    CreateDynamicObject(19304, 162.15, -1932.42, 3.87,   0.00, 0.00, 90.00);
    CreateDynamicObject(19304, 162.13, -1928.24, 3.87,   0.00, 0.00, 90.00);
    CreateDynamicObject(19304, 162.11, -1924.13, 3.87,   0.00, 0.00, 90.00);
    CreateDynamicObject(19304, 162.08, -1920.02, 3.87,   0.00, 0.00, 90.00);
    CreateDynamicObject(19304, 162.07, -1915.91, 3.87,   0.00, 0.00, 90.00);
    CreateDynamicObject(19304, 162.09, -1911.80, 3.87,   0.00, 0.00, 90.00);
    CreateDynamicObject(19304, 162.06, -1907.72, 3.87,   0.00, 0.00, 90.00);
    CreateDynamicObject(19304, 162.06, -1903.69, 3.87,   0.00, 0.00, 90.00);
    CreateDynamicObject(19304, 147.38, -1932.29, 3.87,   0.00, 0.00, 90.00);
    CreateDynamicObject(19304, 147.40, -1928.17, 3.87,   0.00, 0.00, 90.00);
    CreateDynamicObject(19304, 147.38, -1924.04, 3.87,   0.00, 0.00, 90.00);
    CreateDynamicObject(19304, 147.40, -1919.93, 3.87,   0.00, 0.00, 90.00);
    CreateDynamicObject(19304, 147.42, -1915.82, 3.87,   0.00, 0.00, 90.00);
    CreateDynamicObject(19304, 147.37, -1911.74, 3.87,   0.00, 0.00, 90.00);
    CreateDynamicObject(19304, 147.36, -1907.70, 3.87,   0.00, 0.00, 90.00);
    CreateDynamicObject(19304, 147.34, -1903.54, 3.87,   0.00, 0.00, 90.00);
    CreateDynamicObject(8676, 161.01, -1903.62, 7.64,   0.00, 0.00, 90.00);
    CreateDynamicObject(1483, 149.02, -1920.53, 4.45,   0.00, 0.00, 0.00);
    CreateDynamicObject(1483, 149.03, -1914.00, 4.45,   0.00, 0.00, 0.00);
    CreateDynamicObject(675, 161.54, -1929.11, 2.96,   0.00, 0.00, 0.00);
    CreateDynamicObject(675, 161.52, -1927.65, 2.96,   0.00, 0.00, 0.00);
    CreateDynamicObject(675, 161.49, -1925.90, 2.96,   0.00, 0.00, 0.00);
    CreateDynamicObject(675, 161.72, -1926.69, 2.96,   0.00, 0.00, 0.00);
    CreateDynamicObject(675, 161.66, -1924.96, 2.96,   0.00, 0.00, 0.00);
    CreateDynamicObject(675, 161.80, -1928.46, 2.96,   0.00, 0.00, 0.00);
    CreateDynamicObject(674, 161.43, -1926.59, 2.77,   0.00, 0.00, 0.00);
    CreateDynamicObject(682, 161.30, -1925.41, 2.76,   0.00, 0.00, 0.00);
    CreateDynamicObject(644, 156.35, -1942.63, 3.06,   0.00, 0.00, 90.00);
    CreateDynamicObject(644, 152.16, -1942.79, 3.06,   0.00, 0.00, 0.00);
    CreateDynamicObject(630, 147.75, -1934.58, 3.70,   0.00, 0.00, 0.00);
    CreateDynamicObject(630, 161.88, -1934.60, 3.70,   0.00, 0.00, 0.00);
    CreateDynamicObject(622, 143.94, -1932.61, -3.87,   0.00, 0.00, -84.00);
    CreateDynamicObject(2600, 163.76, -1937.80, 3.29,   0.00, 0.00, -69.00);
    CreateDynamicObject(3040, 159.94, -1916.75, 4.97,   0.00, 0.00, 0.00);
    CreateDynamicObject(3038, 154.00, -1932.51, 8.77,   -47.00, 0.00, 84.00);
    CreateDynamicObject(3810, 156.52, -1946.59, 7.26,   0.00, 0.00, 90.00);
    CreateDynamicObject(3810, 151.67, -1946.85, 7.26,   0.00, 0.00, 90.00);
    CreateDynamicObject(3811, 161.67, -1932.94, 2.77,   0.00, 0.00, 0.00);
    CreateDynamicObject(3811, 161.65, -1930.68, 2.77,   0.00, 0.00, 0.00);
    CreateDynamicObject(3811, 147.74, -1931.04, 2.76,   0.00, 0.00, 0.00);
    CreateDynamicObject(3811, 147.73, -1929.05, 2.76,   0.00, 0.00, 0.00);
    CreateDynamicObject(3855, 147.78, -1903.88, 2.76,   0.00, 0.00, -180.00);
    CreateDynamicObject(5836, 148.74, -1961.71, 2.76,   0.00, 0.00, 0.00);
       //Custom Interior
    CreateDynamicObject(14546,1055.52929688,-1314.18750000,10341.22851562,0.00000000,0.00000000,271.95556641, .interiorid = 6, .worldid = 6012); //object(pleasure-mid) (1)
    CreateDynamicObject(18036,1060.28515625,-1247.16113281,10328.19824219,0.00000000,0.00000000,3.21899414, .interiorid = 6, .worldid = 6012); //object(range_main) (1)
    CreateDynamicObject(8661,1064.55859375,-1311.13574219,10330.06933594,0.00000000,0.00000000,269.91760254, .interiorid = 6, .worldid = 6012); //object(gnhtelgrnd_lvs) (1)
    CreateDynamicObject(8661,1044.59277344,-1311.92480469,10330.06933594,0.00000000,0.00000000,269.99450684, .interiorid = 6, .worldid = 6012); //object(gnhtelgrnd_lvs) (2)
    CreateDynamicObject(14533,1055.53515625,-1314.18652344,10341.19824219,0.00000000,0.00000000,271.95556641, .interiorid = 6, .worldid = 6012); //object(pleasure-top) (2)
    CreateDynamicObject(14425,1101.84472656,-1265.13476562,10327.71777344,0.00000000,0.00000000,181.86218262, .interiorid = 6, .worldid = 6012); //object(madddoggs14) (1)
    CreateDynamicObject(8661,1081.49316406,-1274.25488281,10330.38574219,0.00000000,0.00000000,272.62023926, .interiorid = 6, .worldid = 6012); //object(gnhtelgrnd_lvs) (1)
    CreateDynamicObject(5340,1072.47607422,-1294.92810059,10333.22460938,90.00000000,0.00000000,271.35681152, .interiorid = 6, .worldid = 6012); //object(modlas2) (1)
    CreateDynamicObject(5340,1071.50195312,-1294.93847656,10333.22460938,90.00000000,0.00000000,271.35681152, .interiorid = 6, .worldid = 6012); //object(modlas2) (2)
    CreateDynamicObject(5340,1078.57958984,-1294.71667480,10333.22460938,90.00000000,0.00000000,271.35681152, .interiorid = 6, .worldid = 6012); //object(modlas2) (3)
    CreateDynamicObject(5340,1075.56347656,-1294.83691406,10336.38671875,90.00000000,0.00000000,272.44445801, .interiorid = 6, .worldid = 6012); //object(modlas2) (4)
    CreateDynamicObject(5340,1077.15893555,-1294.71972656,10336.40429688,90.00000000,0.00000000,272.44445801, .interiorid = 6, .worldid = 6012); //object(modlas2) (4)
    CreateDynamicObject(3113,1079.15820312,-1289.30273438,10337.57421875,179.99450684,14.69970703,181.79626465, .interiorid = 6, .worldid = 6012); //object(carrier_door_sfse) (1)
    CreateDynamicObject(16637,1078.37792969,-1288.50878906,10331.89355469,0.00000000,0.00000000,181.85119629, .interiorid = 6, .worldid = 6012); //object(ghostgardoor) (1)
    CreateDynamicObject(3113,1078.18652344,-1263.66992188,10337.56640625,179.99450684,14.69970703,181.87866211, .interiorid = 6, .worldid = 6012); //object(carrier_door_sfse) (2)
    CreateDynamicObject(3113,1078.63476562,-1276.91308594,10337.01757812,0.00000000,14.69970703,181.87866211, .interiorid = 6, .worldid = 6012); //object(carrier_door_sfse) (4)
    CreateDynamicObject(3113,1070.29003906,-1286.16113281,10341.69531250,90.00000000,14.69970703,351.09008789, .interiorid = 6, .worldid = 6012); //object(carrier_door_sfse) (1)
    CreateDynamicObject(3113,1070.14550781,-1275.31835938,10341.71289062,270.00000000,14.69970703,10.65124512, .interiorid = 6, .worldid = 6012); //object(carrier_door_sfse) (1)
    CreateDynamicObject(3113,1071.07910156,-1280.16064453,10337.00781250,0.00000000,14.69970703,0.43395996, .interiorid = 6, .worldid = 6012); //object(carrier_door_sfse) (4)
    CreateDynamicObject(8661,1099.14660645,-1273.41271973,10330.38574219,0.00000000,0.00000000,272.62573242, .interiorid = 6, .worldid = 6012); //object(gnhtelgrnd_lvs) (1)
    CreateDynamicObject(8661,1117.35156250,-1272.56542969,10330.38574219,0.00000000,0.00000000,272.62023926, .interiorid = 6, .worldid = 6012); //object(gnhtelgrnd_lvs) (1)
    CreateDynamicObject(5442,1079.00927734,-1308.46838379,10333.37597656,90.00000000,0.00000000,91.87866211, .interiorid = 6, .worldid = 6012); //object(laeroad13) (3)
    CreateDynamicObject(5422,1072.51562500,-1284.81835938,10332.39843750,0.00000000,0.00000000,2.01049805, .interiorid = 6, .worldid = 6012); //object(laespraydoor1) (1)
    CreateDynamicObject(5422,1072.76269531,-1289.32714844,10332.39843750,0.00000000,0.00000000,2.01049805, .interiorid = 6, .worldid = 6012); //object(laespraydoor1) (2)
    CreateDynamicObject(5422,1072.88427734,-1292.69116211,10332.39843750,0.00000000,0.00000000,2.01049805, .interiorid = 6, .worldid = 6012); //object(laespraydoor1) (3)
    CreateDynamicObject(3113,1066.85351562,-1279.70410156,10336.26757812,0.00000000,104.99630737,181.09313965, .interiorid = 6, .worldid = 6012); //object(carrier_door_sfse) (1)
    CreateDynamicObject(3113,1052.56347656,-1279.99414062,10336.26757812,0.00000000,104.99084473,1.07666016, .interiorid = 6, .worldid = 6012); //object(carrier_door_sfse) (1)
    CreateDynamicObject(11353,1050.47949219,-1264.66894531,10334.84863281,0.00000000,0.00000000,1.32385254, .interiorid = 6, .worldid = 6012); //object(station5new) (1)
    CreateDynamicObject(3944,1060.26513672,-1273.01049805,10329.88574219,0.00000000,0.00000000,0.07690430, .interiorid = 6, .worldid = 6012); //object(bistro_blok) (1)
    CreateDynamicObject(3944,1060.51171875,-1289.03027344,10329.89746094,0.00000000,0.00000000,179.58251953, .interiorid = 6, .worldid = 6012); //object(bistro_blok) (2)
    CreateDynamicObject(16000,1061.14355469,-1280.80078125,10330.38378906,90.00000000,0.00000000,0.51635742, .interiorid = 6, .worldid = 6012); //object(drvin_screen) (1)
    CreateDynamicObject(16000,1061.19299316,-1280.72863770,10330.38574219,90.00000000,0.00000000,180.51635742, .interiorid = 6, .worldid = 6012); //object(drvin_screen) (3)
    CreateDynamicObject(3944,1060.27246094,-1273.01660156,10331.96777344,0.00000000,0.00000000,0.07690430, .interiorid = 6, .worldid = 6012); //object(bistro_blok) (3)
    CreateDynamicObject(3944,1060.52514648,-1289.03234863,10332.23730469,0.00000000,0.00000000,179.58251953, .interiorid = 6, .worldid = 6012); //object(bistro_blok) (4)
    CreateDynamicObject(3944,1051.75390625,-1280.41015625,10330.79589844,0.00000000,0.00000000,91.37878418, .interiorid = 6, .worldid = 6012); //object(bistro_blok) (6)
    CreateDynamicObject(3944,1051.75390625,-1280.41015625,10332.23730469,0.00000000,0.00000000,91.37878418, .interiorid = 6, .worldid = 6012); //object(bistro_blok) (7)
    CreateDynamicObject(1494,1071.73730469,-1282.21752930,10330.38769531,0.00000000,0.00000000,91.17993164, .interiorid = 6, .worldid = 6012); //object(gen_doorint03) (1)
    CreateDynamicObject(1494,1071.68469238,-1279.20483398,10330.38769531,0.00000000,0.00000000,270.59863281, .interiorid = 6, .worldid = 6012); //object(gen_doorint03) (2)
    CreateDynamicObject(14740,1050.81115723,-1267.56127930,10333.32812500,0.00000000,0.00000000,0.71163940, .interiorid = 6, .worldid = 6012); //object(ryblinds) (1)
    CreateDynamicObject(14762,1050.63659668,-1271.54699707,10333.55175781,0.00000000,0.00000000,2.87957764, .interiorid = 6, .worldid = 6012); //object(arsewinows) (1)
    CreateDynamicObject(14740,1051.05493164,-1278.61193848,10333.32812500,0.00000000,0.00000000,0.70861816, .interiorid = 6, .worldid = 6012); //object(ryblinds) (2)
    CreateDynamicObject(14762,1050.89550781,-1282.60424805,10333.55175781,0.00000000,0.00000000,2.77441406, .interiorid = 6, .worldid = 6012); //object(arsewinows) (2)
    CreateDynamicObject(14762,1050.89550781,-1282.60351562,10333.07128906,0.00000000,0.00000000,2.77404785, .interiorid = 6, .worldid = 6012); //object(arsewinows) (3)
    CreateDynamicObject(14762,1050.68261719,-1271.57116699,10333.07128906,0.00000000,0.00000000,2.04602051, .interiorid = 6, .worldid = 6012); //object(arsewinows) (4)
    CreateDynamicObject(14576,1078.10058594,-1268.92578125,10325.98828125,0.00000000,0.00000000,181.12060547, .interiorid = 6, .worldid = 6012); //object(vault_door) (1)
    CreateDynamicObject(5442,1077.20446777,-1264.19592285,10360.44238281,0.00000000,90.00000000,2.37594604, .interiorid = 6, .worldid = 6012); //object(laeroad13) (3)
    CreateDynamicObject(16637,1077.60583496,-1264.60559082,10331.89355469,0.00000000,0.00000000,181.85119629, .interiorid = 6, .worldid = 6012); //object(ghostgardoor) (1)
    CreateDynamicObject(16637,1071.61621094,-1268.79870605,10331.89355469,0.00000000,0.00000000,1.85119629, .interiorid = 6, .worldid = 6012); //object(ghostgardoor) (1)
    CreateDynamicObject(16637,1071.22155762,-1256.72326660,10331.89355469,0.00000000,0.00000000,1.85119629, .interiorid = 6, .worldid = 6012); //object(ghostgardoor) (1)
    CreateDynamicObject(3051,1072.82421875,-1254.37524414,10331.69238281,0.00000000,0.00000000,318.54394531, .interiorid = 6, .worldid = 6012); //object(lift_dr) (1)
    CreateDynamicObject(3051,1075.52929688,-1254.26477051,10331.69238281,0.00000000,0.00000000,318.54309082, .interiorid = 6, .worldid = 6012); //object(lift_dr) (2)
    CreateDynamicObject(3051,1074.21386719,-1254.23144531,10333.48339844,315.99975586,90.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(lift_dr) (3)
    CreateDynamicObject(3113,1090.38964844,-1286.88085938,10337.57421875,179.99450684,14.69970703,271.79077148, .interiorid = 6, .worldid = 6012); //object(carrier_door_sfse) (1)
    CreateDynamicObject(3113,1089.17163086,-1265.01379395,10337.57421875,179.99450684,14.69970703,94.17514038, .interiorid = 6, .worldid = 6012); //object(carrier_door_sfse) (1)
    CreateDynamicObject(3113,1099.14453125,-1275.52563477,10337.57421875,179.99450684,14.69970703,0.84613037, .interiorid = 6, .worldid = 6012); //object(carrier_door_sfse) (1)
    CreateDynamicObject(3051,1071.94262695,-1254.42712402,10331.69238281,0.00000000,0.00000000,318.54309082, .interiorid = 6, .worldid = 6012); //object(lift_dr) (4)
    CreateDynamicObject(8661,1089.27929688,-1277.62304688,10339.38378906,179.99450684,0.00000000,272.62023926, .interiorid = 6, .worldid = 6012); //object(gnhtelgrnd_lvs) (1)
    CreateDynamicObject(11324,1094.93493652,-1265.06799316,10336.46679688,0.00000000,90.00000000,273.98205566, .interiorid = 6, .worldid = 6012); //object(station_lights) (1)
    CreateDynamicObject(11324,1096.02636719,-1286.22705078,10336.46679688,0.00000000,90.00000000,91.97497559, .interiorid = 6, .worldid = 6012); //object(station_lights) (2)
    CreateDynamicObject(11324,1098.74023438,-1281.99975586,10336.46679688,0.00000000,90.00000000,181.17504883, .interiorid = 6, .worldid = 6012); //object(station_lights) (3)
    CreateDynamicObject(3565,1051.80749512,-1301.90063477,10330.24511719,0.00000000,0.00000000,2.00207520, .interiorid = 6, .worldid = 6012); //object(lasdkrt1_la01) (1)
    CreateDynamicObject(3565,1059.85742188,-1301.61816406,10330.24511719,0.00000000,0.00000000,1.99951172, .interiorid = 6, .worldid = 6012); //object(lasdkrt1_la01) (2)
    CreateDynamicObject(3565,1051.71057129,-1299.33508301,10330.24511719,0.00000000,0.00000000,1.99951172, .interiorid = 6, .worldid = 6012); //object(lasdkrt1_la01) (3)
    CreateDynamicObject(3565,1051.62512207,-1296.82287598,10330.24511719,0.00000000,0.00000000,1.99951172, .interiorid = 6, .worldid = 6012); //object(lasdkrt1_la01) (4)
    CreateDynamicObject(3565,1051.53710938,-1294.26672363,10330.24511719,0.00000000,0.00000000,1.99951172, .interiorid = 6, .worldid = 6012); //object(lasdkrt1_la01) (5)
    CreateDynamicObject(3565,1059.76416016,-1299.08178711,10330.24511719,0.00000000,0.00000000,1.99951172, .interiorid = 6, .worldid = 6012); //object(lasdkrt1_la01) (6)
    CreateDynamicObject(3565,1059.68127441,-1296.53454590,10330.24511719,0.00000000,0.00000000,1.99951172, .interiorid = 6, .worldid = 6012); //object(lasdkrt1_la01) (7)
    CreateDynamicObject(3565,1059.58911133,-1293.98950195,10330.24511719,0.00000000,0.00000000,1.99951172, .interiorid = 6, .worldid = 6012); //object(lasdkrt1_la01) (8)
    CreateDynamicObject(10558,1038.10400391,-1327.56970215,10329.85351562,0.00000000,0.00000000,90.07852173, .interiorid = 6, .worldid = 6012); //object(tbnsfs) (1)
    CreateDynamicObject(10558,1038.10351562,-1327.56933594,10333.69726562,0.00000000,0.00000000,90.07690430, .interiorid = 6, .worldid = 6012); //object(tbnsfs) (2)
    CreateDynamicObject(14537,1052.83789062,-1332.81933594,10331.92773438,0.00000000,0.00000000,319.08691406, .interiorid = 6, .worldid = 6012); //object(pdomesbar) (1)
    CreateDynamicObject(14835,1067.16052246,-1330.45690918,10331.93750000,0.00000000,0.00000000,311.88635254, .interiorid = 6, .worldid = 6012); //object(lm_stripcolumns) (2)
    CreateDynamicObject(14835,1064.71679688,-1332.73828125,10331.93750000,0.00000000,0.00000000,311.87988281, .interiorid = 6, .worldid = 6012); //object(lm_stripcolumns) (3)
    CreateDynamicObject(1716,1055.35156250,-1326.91711426,10330.06933594,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(kb_slot_stool) (1)
    CreateDynamicObject(1716,1054.55822754,-1326.19714355,10330.06933594,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(kb_slot_stool) (2)
    CreateDynamicObject(1716,1053.74694824,-1325.49206543,10330.06933594,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(kb_slot_stool) (3)
    CreateDynamicObject(1716,1050.04980469,-1327.34179688,10330.06933594,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(kb_slot_stool) (4)
    CreateDynamicObject(1716,1050.77380371,-1326.53552246,10330.06933594,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(kb_slot_stool) (5)
    CreateDynamicObject(1716,1051.57470703,-1325.60375977,10330.06933594,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(kb_slot_stool) (6)
    CreateDynamicObject(1679,1055.78613281,-1311.28027344,10330.55078125,0.00000000,0.00000000,0.51635742, .interiorid = 6, .worldid = 6012); //object(chairsntableml) (1)
    CreateDynamicObject(1679,1051.73217773,-1311.16040039,10330.55078125,0.00000000,0.00000000,91.59680176, .interiorid = 6, .worldid = 6012); //object(chairsntableml) (2)
    CreateDynamicObject(1679,1051.83520508,-1316.11743164,10330.55078125,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(chairsntableml) (3)
    CreateDynamicObject(1679,1055.71423340,-1316.04064941,10330.55078125,0.00000000,0.00000000,178.56030273, .interiorid = 6, .worldid = 6012); //object(chairsntableml) (4)
    CreateDynamicObject(1679,1060.14550781,-1316.26562500,10330.55078125,0.00000000,0.00000000,88.54980469, .interiorid = 6, .worldid = 6012); //object(chairsntableml) (5)
    CreateDynamicObject(1679,1060.21398926,-1311.55432129,10330.55078125,0.00000000,0.00000000,267.76977539, .interiorid = 6, .worldid = 6012); //object(chairsntableml) (6)
    CreateDynamicObject(16101,1055.37805176,-1301.77075195,10322.09082031,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(des_windsockpole) (1)
    CreateDynamicObject(1840,1048.27722168,-1302.74755859,10331.59472656,0.00000000,0.00000000,92.87957764, .interiorid = 6, .worldid = 6012); //object(speaker_2) (1)
    CreateDynamicObject(1840,1063.51452637,-1302.27441406,10331.59472656,0.00000000,0.00000000,92.87841797, .interiorid = 6, .worldid = 6012); //object(speaker_2) (2)
    CreateDynamicObject(1840,1059.99682617,-1302.43164062,10331.59472656,0.00000000,0.00000000,92.87841797, .interiorid = 6, .worldid = 6012); //object(speaker_2) (3)
    CreateDynamicObject(1840,1051.84985352,-1302.69799805,10331.59472656,0.00000000,0.00000000,92.87841797, .interiorid = 6, .worldid = 6012); //object(speaker_2) (4)
    CreateDynamicObject(2006,1055.39208984,-1301.84619141,10333.05371094,22.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(cr_safe_dial) (4)
    CreateDynamicObject(2006,1055.38708496,-1301.75537109,10333.08496094,21.99462891,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(cr_safe_dial) (5)
    CreateDynamicObject(2006,1055.38244629,-1301.66943359,10333.11621094,21.99462891,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(cr_safe_dial) (6)
    CreateDynamicObject(2232,1047.94067383,-1293.90026855,10332.19238281,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(med_speaker_4) (1)
    CreateDynamicObject(2232,1063.12048340,-1293.20361328,10332.19238281,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(med_speaker_4) (2)
    CreateDynamicObject(1953,1055.38940430,-1301.75561523,10331.59863281,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(turn_plater_r) (1)
    CreateDynamicObject(2232,1063.11718750,-1293.19946289,10333.30761719,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(med_speaker_4) (3)
    CreateDynamicObject(2232,1047.94042969,-1293.89941406,10333.31933594,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(med_speaker_4) (4)
    CreateDynamicObject(2964,1037.71606445,-1318.07116699,10330.39160156,0.00000000,0.00000000,92.08981323, .interiorid = 6, .worldid = 6012); //object(k_pooltablesm) (1)
    CreateDynamicObject(2964,1037.92358398,-1323.68444824,10330.39160156,0.00000000,0.00000000,93.12744141, .interiorid = 6, .worldid = 6012); //object(k_pooltablesm) (2)
    CreateDynamicObject(1897,1034.40893555,-1314.29785156,10331.83300781,90.00000000,0.00000000,3.45159912, .interiorid = 6, .worldid = 6012); //object(wheel_support) (1)
    CreateDynamicObject(1897,1034.40820312,-1314.29785156,10331.83300781,90.00000000,0.00000000,183.44970703, .interiorid = 6, .worldid = 6012); //object(wheel_support) (2)
    CreateDynamicObject(3004,1034.54760742,-1315.19421387,10332.53710938,266.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(k_poolq2) (1)
    CreateDynamicObject(3004,1034.54687500,-1314.94189453,10332.53710938,265.99548340,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(k_poolq2) (2)
    CreateDynamicObject(3004,1034.54687500,-1314.67773438,10332.53710938,265.99548340,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(k_poolq2) (3)
    CreateDynamicObject(3004,1034.54687500,-1314.40917969,10332.53710938,265.99548340,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(k_poolq2) (4)
    CreateDynamicObject(3004,1034.54687500,-1314.13085938,10332.53710938,265.99548340,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(k_poolq2) (5)
    CreateDynamicObject(3004,1034.54296875,-1313.49804688,10332.53710938,265.99548340,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(k_poolq2) (7)
    CreateDynamicObject(1670,1055.72314453,-1311.23632812,10330.95703125,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(propcollecttable) (1)
    CreateDynamicObject(1739,1055.06201172,-1280.75878906,10331.28320312,0.00000000,0.00000000,178.55529785, .interiorid = 6, .worldid = 6012); //object(swank_din_chair_5) (1)
    CreateDynamicObject(2120,1057.85437012,-1283.31201172,10331.02539062,0.00000000,0.00000000,270.90087891, .interiorid = 6, .worldid = 6012); //object(med_din_chair_4) (2)
    CreateDynamicObject(2120,1059.59631348,-1283.29150391,10331.02539062,0.00000000,0.00000000,270.90087891, .interiorid = 6, .worldid = 6012); //object(med_din_chair_4) (3)
    CreateDynamicObject(2120,1061.61523438,-1283.28027344,10331.02539062,0.00000000,0.00000000,270.90087891, .interiorid = 6, .worldid = 6012); //object(med_din_chair_4) (4)
    CreateDynamicObject(2120,1063.78515625,-1283.26025391,10331.02539062,0.00000000,0.00000000,270.90087891, .interiorid = 6, .worldid = 6012); //object(med_din_chair_4) (5)
    CreateDynamicObject(2120,1063.74316406,-1278.22851562,10331.02539062,0.00000000,0.00000000,91.03820801, .interiorid = 6, .worldid = 6012); //object(med_din_chair_4) (6)
    CreateDynamicObject(2120,1061.98242188,-1278.24023438,10331.02539062,0.00000000,0.00000000,91.03271484, .interiorid = 6, .worldid = 6012); //object(med_din_chair_4) (7)
    CreateDynamicObject(2120,1059.91113281,-1278.26269531,10331.02539062,0.00000000,0.00000000,91.03271484, .interiorid = 6, .worldid = 6012); //object(med_din_chair_4) (8)
    CreateDynamicObject(2120,1057.96484375,-1278.27978516,10331.02539062,0.00000000,0.00000000,91.02722168, .interiorid = 6, .worldid = 6012); //object(med_din_chair_4) (9)
    CreateDynamicObject(2930,1085.63024902,-1276.83776855,10333.57324219,0.00000000,0.00000000,2.98358154, .interiorid = 6, .worldid = 6012); //object(chinatgate) (1)
    CreateDynamicObject(2930,1085.54821777,-1275.23132324,10333.57324219,0.00000000,0.00000000,3.16558838, .interiorid = 6, .worldid = 6012); //object(chinatgate) (2)
    CreateDynamicObject(3440,1085.46972656,-1273.35644531,10331.40722656,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(arptpillar01_lvs) (1)
    CreateDynamicObject(3440,1085.73242188,-1278.86230469,10331.40722656,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(arptpillar01_lvs) (2)
    CreateDynamicObject(2930,1086.02539062,-1279.02734375,10333.57324219,0.00000000,0.00000000,35.75500488, .interiorid = 6, .worldid = 6012); //object(chinatgate) (3)
    CreateDynamicObject(2930,1085.70349121,-1273.14135742,10333.57324219,0.00000000,0.00000000,137.06439209, .interiorid = 6, .worldid = 6012); //object(chinatgate) (4)
    CreateDynamicObject(2930,1085.48388672,-1273.59252930,10333.57324219,0.00000000,0.00000000,2.45382690, .interiorid = 6, .worldid = 6012); //object(chinatgate) (5)
    CreateDynamicObject(3440,1087.14245605,-1280.61450195,10331.40722656,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(arptpillar01_lvs) (3)
    CreateDynamicObject(3440,1086.97558594,-1271.68493652,10331.40722656,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(arptpillar01_lvs) (4)
    CreateDynamicObject(2930,1087.41992188,-1280.64941406,10333.57324219,0.00000000,0.00000000,91.37329102, .interiorid = 6, .worldid = 6012); //object(chinatgate) (6)
    CreateDynamicObject(2930,1089.04785156,-1280.61328125,10333.57324219,0.00000000,0.00000000,91.36779785, .interiorid = 6, .worldid = 6012); //object(chinatgate) (7)
    CreateDynamicObject(2930,1090.68457031,-1280.56933594,10333.57324219,0.00000000,0.00000000,91.36779785, .interiorid = 6, .worldid = 6012); //object(chinatgate) (8)
    CreateDynamicObject(2930,1087.23437500,-1271.44091797,10333.57324219,0.00000000,0.00000000,95.60089111, .interiorid = 6, .worldid = 6012); //object(chinatgate) (9)
    CreateDynamicObject(2930,1088.90136719,-1271.27246094,10333.57324219,0.00000000,0.00000000,92.56530762, .interiorid = 6, .worldid = 6012); //object(chinatgate) (11)
    CreateDynamicObject(2930,1090.52636719,-1271.19726562,10333.57324219,0.00000000,0.00000000,92.56530762, .interiorid = 6, .worldid = 6012); //object(chinatgate) (12)
    CreateDynamicObject(3440,1092.70043945,-1280.49145508,10331.40722656,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(arptpillar01_lvs) (5)
    CreateDynamicObject(3440,1092.50976562,-1271.22851562,10331.40722656,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(arptpillar01_lvs) (6)
    CreateDynamicObject(2930,1092.73925781,-1271.45214844,10333.57324219,0.00000000,0.00000000,35.74951172, .interiorid = 6, .worldid = 6012); //object(chinatgate) (13)
    CreateDynamicObject(3440,1093.88891602,-1278.73815918,10331.40722656,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(arptpillar01_lvs) (7)
    CreateDynamicObject(3440,1093.71826172,-1273.16430664,10331.40722656,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(arptpillar01_lvs) (8)
    CreateDynamicObject(2930,1093.86914062,-1273.45703125,10333.57324219,0.00000000,0.00000000,1.51062012, .interiorid = 6, .worldid = 6012); //object(chinatgate) (15)
    CreateDynamicObject(2930,1093.91015625,-1275.08593750,10333.57324219,0.00000000,0.00000000,1.50512695, .interiorid = 6, .worldid = 6012); //object(chinatgate) (16)
    CreateDynamicObject(2930,1093.95312500,-1276.71777344,10333.57324219,0.00000000,0.00000000,1.50512695, .interiorid = 6, .worldid = 6012); //object(chinatgate) (17)
    CreateDynamicObject(13649,1088.83178711,-1275.96496582,10339.78125000,180.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(ramplandpad01) (1)
    CreateDynamicObject(3095,1089.64782715,-1274.50439453,10330.94628906,180.00000000,0.00000000,92.87957764, .interiorid = 6, .worldid = 6012); //object(a51_jetdoor) (1)
    CreateDynamicObject(3095,1089.79309082,-1277.52880859,10330.95019531,179.99450684,0.00000000,92.87841797, .interiorid = 6, .worldid = 6012); //object(a51_jetdoor) (2)
    CreateDynamicObject(3095,1089.79296875,-1277.52832031,10334.13574219,179.99450684,0.00000000,92.87841797, .interiorid = 6, .worldid = 6012); //object(a51_jetdoor) (4)
    CreateDynamicObject(3095,1089.64746094,-1274.50390625,10334.13378906,179.99450684,0.00000000,92.87841797, .interiorid = 6, .worldid = 6012); //object(a51_jetdoor) (5)
    CreateDynamicObject(3819,1089.22424316,-1267.93566895,10330.41113281,0.00000000,0.00000000,94.01708984, .interiorid = 6, .worldid = 6012); //object(bleacher_sfsx) (1)
    CreateDynamicObject(3819,1090.10351562,-1283.96264648,10330.41113281,0.00000000,0.00000000,271.61364746, .interiorid = 6, .worldid = 6012); //object(bleacher_sfsx) (2)
    CreateDynamicObject(3095,1098.49475098,-1277.09643555,10329.41113281,200.00000000,0.00000000,92.87841797, .interiorid = 6, .worldid = 6012); //object(a51_jetdoor) (6)
    CreateDynamicObject(3095,1098.34667969,-1274.06774902,10329.41113281,199.99511719,0.00000000,92.87292480, .interiorid = 6, .worldid = 6012); //object(a51_jetdoor) (7)
    CreateDynamicObject(3864,1096.73791504,-1266.37622070,10331.37011719,0.00000000,0.00000000,45.57662964, .interiorid = 6, .worldid = 6012); //object(ws_floodlight) (1)
    CreateDynamicObject(3864,1097.33886719,-1284.95825195,10331.37011719,0.00000000,0.00000000,313.81750488, .interiorid = 6, .worldid = 6012); //object(ws_floodlight) (2)
    CreateDynamicObject(3872,1091.79492188,-1270.79797363,10332.17675781,0.00000000,0.00000000,41.75387573, .interiorid = 6, .worldid = 6012); //object(ws_floodbeams) (1)
    CreateDynamicObject(3872,1091.74902344,-1281.48144531,10332.17675781,0.00000000,0.00000000,328.79534912, .interiorid = 6, .worldid = 6012); //object(ws_floodbeams) (2)
    CreateDynamicObject(1826,1085.79809570,-1268.76733398,10317.91894531,0.00000000,0.00000000,271.31005859, .interiorid = 6, .worldid = 6012); //object(kb_table1) (1)
    CreateDynamicObject(1826,1085.67700195,-1263.70434570,10317.91894531,0.00000000,0.00000000,271.30737305, .interiorid = 6, .worldid = 6012); //object(kb_table1) (2)
    CreateDynamicObject(1826,1072.08508301,-1264.01074219,10317.91894531,0.00000000,0.00000000,271.30737305, .interiorid = 6, .worldid = 6012); //object(kb_table1) (3)
    CreateDynamicObject(1826,1072.31176758,-1269.12890625,10317.91894531,0.00000000,0.00000000,271.30737305, .interiorid = 6, .worldid = 6012); //object(kb_table1) (4)
    CreateDynamicObject(3383,1062.60620117,-1273.51965332,10320.83300781,270.00000000,0.00000000,271.07519531, .interiorid = 6, .worldid = 6012); //object(a51_labtable1_) (1)
    CreateDynamicObject(3383,1062.61059570,-1266.79809570,10320.83300781,270.00000000,0.00000000,271.07116699, .interiorid = 6, .worldid = 6012); //object(a51_labtable1_) (2)
    CreateDynamicObject(3383,1062.61535645,-1260.23645020,10320.83300781,270.00000000,0.00000000,271.07116699, .interiorid = 6, .worldid = 6012); //object(a51_labtable1_) (3)
    CreateDynamicObject(3409,1066.34399414,-1273.23986816,10317.91894531,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(grassplant) (1)
    CreateDynamicObject(3409,1066.10449219,-1266.84277344,10317.91894531,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(grassplant) (2)
    CreateDynamicObject(3409,1065.85461426,-1260.15332031,10317.91894531,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(grassplant) (3)
    CreateDynamicObject(1575,1072.32299805,-1270.49450684,10318.70703125,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(drug_white) (1)
    CreateDynamicObject(1575,1072.32226562,-1270.49414062,10318.83593750,0.00000000,0.00000000,2.87957764, .interiorid = 6, .worldid = 6012); //object(drug_white) (2)
    CreateDynamicObject(1575,1072.32226562,-1270.49414062,10318.97265625,0.00000000,0.00000000,4.31820679, .interiorid = 6, .worldid = 6012); //object(drug_white) (3)
    CreateDynamicObject(1575,1072.32226562,-1270.10839844,10318.71679688,0.00000000,0.00000000,4.31762695, .interiorid = 6, .worldid = 6012); //object(drug_white) (4)
    CreateDynamicObject(1575,1072.32226562,-1270.10839844,10318.84765625,0.00000000,0.00000000,4.31762695, .interiorid = 6, .worldid = 6012); //object(drug_white) (5)
    CreateDynamicObject(2035,1085.61401367,-1263.67236328,10318.75488281,0.00000000,0.00000000,308.19311523, .interiorid = 6, .worldid = 6012); //object(cj_m16) (1)
    CreateDynamicObject(2035,1085.71887207,-1269.42626953,10318.75488281,0.00000000,0.00000000,262.50793457, .interiorid = 6, .worldid = 6012); //object(cj_m16) (2)
    CreateDynamicObject(2044,1085.60461426,-1264.41040039,10318.77050781,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(cj_mp5k) (1)
    CreateDynamicObject(2034,1085.88769531,-1265.00952148,10318.75878906,0.00000000,0.00000000,181.43994141, .interiorid = 6, .worldid = 6012); //object(cj_sawnoff) (1)
    CreateDynamicObject(2033,1085.60437012,-1265.07641602,10318.77539062,0.00000000,0.00000000,183.82470703, .interiorid = 6, .worldid = 6012); //object(cj_sawnoff2) (1)
    CreateDynamicObject(2033,1085.37902832,-1265.10278320,10318.77539062,0.00000000,0.00000000,186.01708984, .interiorid = 6, .worldid = 6012); //object(cj_sawnoff2) (2)
    CreateDynamicObject(2037,1085.65380859,-1268.76977539,10318.81640625,0.00000000,0.00000000,295.83764648, .interiorid = 6, .worldid = 6012); //object(cj_pistol_ammo) (1)
    CreateDynamicObject(2567,1090.87829590,-1272.39550781,10319.84667969,0.00000000,0.00000000,270.18200684, .interiorid = 6, .worldid = 6012); //object(ab_warehouseshelf) (1)
    CreateDynamicObject(2567,1090.84326172,-1266.75500488,10319.84667969,0.00000000,0.00000000,270.17578125, .interiorid = 6, .worldid = 6012); //object(ab_warehouseshelf) (2)
    CreateDynamicObject(2567,1090.71240234,-1261.17761230,10319.84667969,0.00000000,0.00000000,270.17578125, .interiorid = 6, .worldid = 6012); //object(ab_warehouseshelf) (3)
    CreateDynamicObject(3798,1090.19970703,-1257.42456055,10317.79785156,0.00000000,0.00000000,10.98150635, .interiorid = 6, .worldid = 6012); //object(acbox3_sfs) (1)
    CreateDynamicObject(2901,1072.07629395,-1264.58544922,10319.00390625,0.00000000,0.00000000,90.00000000, .interiorid = 6, .worldid = 6012); //object(kmb_marijuana) (1)
    CreateDynamicObject(2357,1062.55737305,-1281.42004395,10330.87988281,0.00000000,0.00000000,0.37322998, .interiorid = 6, .worldid = 6012); //object(dunc_dinning) (1)
    CreateDynamicObject(2239,1071.06237793,-1269.70422363,10325.19921875,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(cj_mlight16) (1)
    CreateDynamicObject(2026,1075.94470215,-1263.79528809,10329.57812500,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(mrk_shade_tmp) (1)
    CreateDynamicObject(1964,1074.09863281,-1264.85937500,10326.28027344,0.00000000,0.00000000,179.99450684, .interiorid = 6, .worldid = 6012); //object(est_dsk_stuf) (1)
    CreateDynamicObject(1742,1076.30566406,-1270.49023438,10325.19921875,0.00000000,0.00000000,181.43920898, .interiorid = 6, .worldid = 6012); //object(med_bookshelf) (1)
    CreateDynamicObject(1820,1079.93969727,-1257.14636230,10325.19921875,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(coffee_low_4) (1)
    CreateDynamicObject(2200,1079.91711426,-1270.35644531,10325.99902344,0.00000000,0.00000000,180.00000000, .interiorid = 6, .worldid = 6012); //object(med_office5_unit_1) (1)
    CreateDynamicObject(2164,1081.95214844,-1266.32641602,10325.19921875,0.00000000,0.00000000,269.99450684, .interiorid = 6, .worldid = 6012); //object(med_office_unit_5) (1)
    CreateDynamicObject(1741,1080.06726074,-1268.93615723,10324.84570312,0.00000000,0.00000000,181.36126709, .interiorid = 6, .worldid = 6012); //object(low_cabinet_1) (1)
    CreateDynamicObject(1741,1079.45214844,-1268.95117188,10324.84570312,0.00000000,0.00000000,181.35131836, .interiorid = 6, .worldid = 6012); //object(low_cabinet_1) (2)
    CreateDynamicObject(2257,1073.07141113,-1270.53881836,10327.39062500,0.00000000,0.00000000,181.12780762, .interiorid = 6, .worldid = 6012); //object(frame_clip_4) (1)
    CreateDynamicObject(2357,1062.54882812,-1280.09875488,10330.87988281,0.00000000,0.00000000,0.36804199, .interiorid = 6, .worldid = 6012); //object(dunc_dinning) (1)
    CreateDynamicObject(2357,1058.29589844,-1281.44824219,10330.87988281,0.00000000,0.00000000,0.36254883, .interiorid = 6, .worldid = 6012); //object(dunc_dinning) (1)
    CreateDynamicObject(2357,1058.28833008,-1280.12756348,10330.87988281,0.00000000,0.00000000,0.36804199, .interiorid = 6, .worldid = 6012); //object(dunc_dinning) (1)
    CreateDynamicObject(2205,1073.75488281,-1264.71154785,10325.19921875,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(med_office8_desk_1) (1)
    CreateDynamicObject(2205,1076.01733398,-1264.71044922,10325.19921875,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(med_office8_desk_1) (2)
    CreateDynamicObject(2190,1077.06274414,-1264.58117676,10326.10058594,0.00000000,0.00000000,318.11755371, .interiorid = 6, .worldid = 6012); //object(pc_1) (1)
    CreateDynamicObject(1563,1076.14868164,-1265.00634766,10326.11035156,285.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(ab_jetseat_hrest) (1)
    CreateDynamicObject(1723,1076.76477051,-1256.60705566,10325.20410156,0.00000000,0.00000000,1.02377319, .interiorid = 6, .worldid = 6012); //object(mrk_seating1) (1)
    CreateDynamicObject(1724,1080.67199707,-1257.92578125,10325.20312500,0.00000000,0.00000000,270.98046875, .interiorid = 6, .worldid = 6012); //object(mrk_seating1b) (1)
    CreateDynamicObject(627,1070.76110840,-1256.32287598,10326.99023438,0.00000000,0.00000000,37.43450928, .interiorid = 6, .worldid = 6012); //object(veg_palmkb3) (1)
    CreateDynamicObject(2286,1070.03186035,-1264.88940430,10327.59960938,0.00000000,0.00000000,91.17004395, .interiorid = 6, .worldid = 6012); //object(frame_5) (1)
    CreateDynamicObject(2266,1070.41357422,-1260.03637695,10327.25097656,0.00000000,0.00000000,91.33734131, .interiorid = 6, .worldid = 6012); //object(frame_wood_5) (1)
    CreateDynamicObject(2261,1081.47204590,-1262.04541016,10327.12988281,0.00000000,0.00000000,271.25659180, .interiorid = 6, .worldid = 6012); //object(frame_slim_2) (1)
    CreateDynamicObject(2834,1073.17626953,-1254.12963867,10326.19531250,0.00000000,0.00000000,1.02377319, .interiorid = 6, .worldid = 6012); //object(gb_livingrug03) (1)
    CreateDynamicObject(1714,1075.62719727,-1266.43762207,10325.19921875,0.00000000,0.00000000,177.19891357, .interiorid = 6, .worldid = 6012); //object(kb_swivelchair1) (1)
    CreateDynamicObject(1499,1078.23583984,-1274.98803711,10330.38574219,0.00000000,0.00000000,271.69982910, .interiorid = 6, .worldid = 6012); //object(gen_doorint05) (1)
    CreateDynamicObject(1499,1078.34924316,-1277.98901367,10330.38574219,0.00000000,0.00000000,91.69738770, .interiorid = 6, .worldid = 6012); //object(gen_doorint05) (2)
    CreateDynamicObject(1536,1066.32812500,-1332.80981445,10330.39257812,0.00000000,0.00000000,41.69979858, .interiorid = 6, .worldid = 6012); //object(gen_doorext15) (1)
    CreateDynamicObject(1536,1068.57763672,-1330.80688477,10330.39257812,0.00000000,0.00000000,222.08862305, .interiorid = 6, .worldid = 6012); //object(gen_doorext15) (2)
    CreateDynamicObject(5422,1071.85510254,-1260.92358398,10332.39843750,0.00000000,0.00000000,2.01049805, .interiorid = 6, .worldid = 6012); //object(laespraydoor1) (2)
    CreateDynamicObject(5422,1071.90380859,-1264.55102539,10332.39843750,0.00000000,0.00000000,2.01049805, .interiorid = 6, .worldid = 6012); //object(laespraydoor1) (2)
    CreateDynamicObject(5422,1072.12841797,-1272.84277344,10332.39843750,0.00000000,0.00000000,2.01049805, .interiorid = 6, .worldid = 6012); //object(laespraydoor1) (2)
    CreateDynamicObject(5422,1072.15588379,-1276.53967285,10332.39843750,0.00000000,0.00000000,2.01049805, .interiorid = 6, .worldid = 6012); //object(laespraydoor1) (2)
    CreateDynamicObject(1744,1070.79711914,-1282.63024902,10332.20214844,0.00000000,90.00000000,93.03222656, .interiorid = 6, .worldid = 6012); //object(med_shelf) (1)
    CreateDynamicObject(1744,1072.11621094,-1278.71289062,10332.20214844,0.00000000,90.00000000,277.35156250, .interiorid = 6, .worldid = 6012); //object(med_shelf) (1)
    CreateDynamicObject(1744,1071.59704590,-1282.88854980,10332.30175781,0.00000000,90.00000000,93.03222656, .interiorid = 6, .worldid = 6012); //object(med_shelf) (1)
    CreateDynamicObject(1744,1071.23962402,-1278.59509277,10332.20214844,0.00000000,90.00000000,303.03222656, .interiorid = 6, .worldid = 6012); //object(med_shelf) (1)
    CreateDynamicObject(1744,1078.38854980,-1278.37939453,10331.98144531,0.00000000,90.00000000,93.03222656, .interiorid = 6, .worldid = 6012); //object(med_shelf) (1)
    CreateDynamicObject(2332,1081.65161133,-1268.22570801,10325.66210938,0.00000000,0.00000000,270.94506836, .interiorid = 6, .worldid = 6012); //object(kev_safe) (1)
    CreateDynamicObject(1731,1072.57934570,-1274.59753418,10332.94824219,0.00000000,0.00000000,181.25708008, .interiorid = 6, .worldid = 6012); //object(cj_mlight3) (1)
    CreateDynamicObject(1731,1072.14501953,-1262.66943359,10332.94824219,0.00000000,0.00000000,181.25244141, .interiorid = 6, .worldid = 6012); //object(cj_mlight3) (2)
    CreateDynamicObject(1731,1077.03027344,-1270.60034180,10332.94824219,0.00000000,0.00000000,5.36380005, .interiorid = 6, .worldid = 6012); //object(cj_mlight3) (3)
    CreateDynamicObject(1731,1077.41613770,-1282.44396973,10332.94824219,0.00000000,0.00000000,5.36132812, .interiorid = 6, .worldid = 6012); //object(cj_mlight3) (4)
    CreateDynamicObject(3594,1049.10205078,-1243.64160156,10326.83691406,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(la_fuckcar1) (1)
    CreateDynamicObject(1985,1059.14099121,-1253.20825195,10329.43554688,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(punchbagnu) (1)
    CreateDynamicObject(1225,1051.65124512,-1253.19494629,10327.33984375,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(barrel4) (1)
    CreateDynamicObject(2056,1046.74267578,-1250.54931641,10327.91601562,0.00000000,0.00000000,98.56021118, .interiorid = 6, .worldid = 6012); //object(cj_target6) (1)
    CreateDynamicObject(1583,1047.10424805,-1245.25634766,10326.31835938,0.00000000,0.00000000,90.00000000, .interiorid = 6, .worldid = 6012); //object(tar_gun2) (1)
    CreateDynamicObject(1584,1055.95373535,-1243.53955078,10327.00683594,0.00000000,0.00000000,270.00000000, .interiorid = 6, .worldid = 6012); //object(tar_gun1) (1)
    CreateDynamicObject(3275,1059.50012207,-1254.71276855,10326.65234375,0.00000000,0.00000000,4.16238403, .interiorid = 6, .worldid = 6012); //object(cxreffence) (1)
    CreateDynamicObject(1329,1055.07543945,-1249.97717285,10326.65820312,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(binnt13_la) (1)
    CreateDynamicObject(1264,1056.33325195,-1248.39062500,10326.67773438,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(blackbag1) (1)
    CreateDynamicObject(12957,1052.04113770,-1252.14770508,10327.08398438,0.00000000,0.00000000,200.00000000, .interiorid = 6, .worldid = 6012); //object(sw_pickupwreck01) (1)
    CreateDynamicObject(1649,1052.52087402,-1241.57580566,10330.43457031,0.00000000,0.00000000,94.24084473, .interiorid = 6, .worldid = 6012); //object(wglasssmash) (1)
    CreateDynamicObject(1517,1049.73583984,-1246.29760742,10327.30859375,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(dyn_wine_break) (1)
    CreateDynamicObject(3057,1052.37109375,-1252.53051758,10327.46289062,90.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(kb_barrel_exp) (1)
    CreateDynamicObject(3275,1056.33105469,-1239.62402344,10326.65234375,0.00000000,0.00000000,4.15832520, .interiorid = 6, .worldid = 6012); //object(cxreffence) (2)
    CreateDynamicObject(1985,1058.05590820,-1241.00634766,10329.43554688,0.00000000,0.00000000,230.00000000, .interiorid = 6, .worldid = 6012); //object(punchbagnu) (2)
    CreateDynamicObject(3057,1052.64257812,-1253.41967773,10327.46289062,90.00000000,0.00000000,300.00000000, .interiorid = 6, .worldid = 6012); //object(kb_barrel_exp) (2)
    CreateDynamicObject(1225,1047.81005859,-1240.57226562,10326.79882812,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(barrel4) (2)
    CreateDynamicObject(1649,1052.84631348,-1245.94506836,10330.41699219,0.00000000,0.00000000,94.24072266, .interiorid = 6, .worldid = 6012); //object(wglasssmash) (2)
    CreateDynamicObject(1649,1053.16162109,-1250.29345703,10330.40136719,0.00000000,0.00000000,94.24072266, .interiorid = 6, .worldid = 6012); //object(wglasssmash) (3)
    CreateDynamicObject(1649,1053.48095703,-1254.67041016,10330.39160156,0.00000000,0.00000000,94.24072266, .interiorid = 6, .worldid = 6012); //object(wglasssmash) (4)
    CreateDynamicObject(2056,1046.54736328,-1248.63867188,10327.91601562,0.00000000,0.00000000,98.55834961, .interiorid = 6, .worldid = 6012); //object(cj_target6) (5)
    CreateDynamicObject(2056,1046.44763184,-1246.74743652,10327.91601562,0.00000000,0.00000000,98.55834961, .interiorid = 6, .worldid = 6012); //object(cj_target6) (6)
    CreateDynamicObject(2056,1046.33923340,-1244.82922363,10327.91601562,0.00000000,0.00000000,95.67877197, .interiorid = 6, .worldid = 6012); //object(cj_target6) (7)
    CreateDynamicObject(2056,1046.24462891,-1242.66345215,10327.91601562,0.00000000,0.00000000,97.06655884, .interiorid = 6, .worldid = 6012); //object(cj_target6) (8)
    CreateDynamicObject(1219,1056.33337402,-1243.65368652,10327.57128906,0.00000000,90.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(palette) (1)
    CreateDynamicObject(2056,1046.92883301,-1252.62060547,10327.91601562,0.00000000,0.00000000,98.55834961, .interiorid = 6, .worldid = 6012); //object(cj_target6) (9)
    CreateDynamicObject(1264,1056.29772949,-1251.11120605,10326.65429688,0.00000000,0.00000000,287.12036133, .interiorid = 6, .worldid = 6012); //object(blackbag1) (2)
    CreateDynamicObject(1264,1054.85656738,-1251.09167480,10326.65429688,0.00000000,0.00000000,317.11669922, .interiorid = 6, .worldid = 6012); //object(blackbag1) (3)
    CreateDynamicObject(1264,1055.66491699,-1250.78088379,10326.65429688,0.00000000,0.00000000,187.11486816, .interiorid = 6, .worldid = 6012); //object(blackbag1) (4)
    CreateDynamicObject(1264,1054.51477051,-1253.00622559,10326.65429688,0.00000000,0.00000000,244.31250000, .interiorid = 6, .worldid = 6012); //object(blackbag1) (5)
    CreateDynamicObject(1517,1049.69238281,-1245.65820312,10327.30859375,0.00000000,0.00000000,140.00000000, .interiorid = 6, .worldid = 6012); //object(dyn_wine_break) (2)
    CreateDynamicObject(1517,1049.58764648,-1243.58093262,10327.64453125,0.00000000,0.00000000,319.99877930, .interiorid = 6, .worldid = 6012); //object(dyn_wine_break) (3)
    CreateDynamicObject(1517,1049.65332031,-1241.02148438,10327.24414062,0.00000000,0.00000000,169.99328613, .interiorid = 6, .worldid = 6012); //object(dyn_wine_break) (4)
    CreateDynamicObject(1221,1057.10156250,-1244.96459961,10326.77148438,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(cardboardbox4) (1)
    CreateDynamicObject(1338,1051.47729492,-1246.48876953,10326.36621094,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(binnt08_la) (1)
    CreateDynamicObject(3927,1061.24365234,-1253.70971680,10327.32714844,0.00000000,0.00000000,141.51831055, .interiorid = 6, .worldid = 6012); //object(d_sign01) (1)
    CreateDynamicObject(3927,1059.86315918,-1240.17871094,10327.32714844,0.00000000,0.00000000,41.43637085, .interiorid = 6, .worldid = 6012); //object(d_sign01) (2)
    CreateDynamicObject(2051,1059.75195312,-1240.40649414,10328.14843750,0.00000000,0.00000000,41.51831055, .interiorid = 6, .worldid = 6012); //object(cj_target4) (1)
    CreateDynamicObject(2049,1061.48779297,-1253.75427246,10328.08496094,0.00000000,0.00000000,141.54379272, .interiorid = 6, .worldid = 6012); //object(cj_target1) (2)
    CreateDynamicObject(1338,1051.48754883,-1244.88793945,10326.36621094,0.00000000,0.00000000,292.80114746, .interiorid = 6, .worldid = 6012); //object(binnt08_la) (2)
    CreateDynamicObject(1338,1051.81689453,-1242.99658203,10326.68652344,0.00000000,0.00000000,172.79663086, .interiorid = 6, .worldid = 6012); //object(binnt08_la) (3)
    CreateDynamicObject(1338,1051.62707520,-1241.24645996,10326.20605469,0.00000000,0.00000000,92.79296875, .interiorid = 6, .worldid = 6012); //object(binnt08_la) (4)
    CreateDynamicObject(1338,1051.80236816,-1249.18811035,10326.60449219,0.00000000,0.00000000,170.00000000, .interiorid = 6, .worldid = 6012); //object(binnt08_la) (5)
    CreateDynamicObject(1221,1057.11145020,-1243.83264160,10326.77148438,0.00000000,0.00000000,270.00000000, .interiorid = 6, .worldid = 6012); //object(cardboardbox4) (2)
    CreateDynamicObject(1221,1056.93737793,-1242.53393555,10326.77148438,0.00000000,0.00000000,170.00000000, .interiorid = 6, .worldid = 6012); //object(cardboardbox4) (3)
    CreateDynamicObject(1221,1056.92565918,-1242.99133301,10327.67578125,0.00000000,0.00000000,99.99694824, .interiorid = 6, .worldid = 6012); //object(cardboardbox4) (4)
    CreateDynamicObject(1517,1051.57604980,-1250.07739258,10327.63671875,0.00000000,0.00000000,229.99877930, .interiorid = 6, .worldid = 6012); //object(dyn_wine_break) (5)
    CreateDynamicObject(1219,1048.22216797,-1248.49560547,10326.12988281,0.00000000,90.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(palette) (2)
    CreateDynamicObject(1219,1048.01538086,-1251.06591797,10326.12988281,0.00000000,90.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(palette) (3)
    CreateDynamicObject(1219,1048.45458984,-1253.76770020,10326.12988281,0.00000000,90.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(palette) (4)
    CreateDynamicObject(1219,1047.18627930,-1246.14538574,10326.25683594,0.00000000,90.00000000,33.11514282, .interiorid = 6, .worldid = 6012); //object(palette) (5)
    CreateDynamicObject(1219,1046.87573242,-1243.28149414,10326.08886719,0.00000000,90.00000000,3.11279297, .interiorid = 6, .worldid = 6012); //object(palette) (6)
    CreateDynamicObject(1517,1059.65417480,-1240.29504395,10328.06835938,0.00000000,90.00000000,139.99877930, .interiorid = 6, .worldid = 6012); //object(dyn_wine_break) (6)
    CreateDynamicObject(1517,1059.64819336,-1240.30004883,10328.47460938,0.00000000,90.00000000,139.99877930, .interiorid = 6, .worldid = 6012); //object(dyn_wine_break) (7)
    CreateDynamicObject(1517,1061.34887695,-1253.89147949,10328.41601562,0.00000000,90.00000000,229.99877930, .interiorid = 6, .worldid = 6012); //object(dyn_wine_break) (8)
    CreateDynamicObject(1517,1061.37683105,-1253.85070801,10328.02539062,0.00000000,90.00000000,229.99328613, .interiorid = 6, .worldid = 6012); //object(dyn_wine_break) (9)
    CreateDynamicObject(1491,1074.00427246,-1294.72351074,10330.38574219,0.00000000,0.00000000,1.82980347, .interiorid = 6, .worldid = 6012); //object(gen_doorint01) (1)
    CreateDynamicObject(1491,1077.03259277,-1294.61865234,10330.38574219,0.00000000,0.00000000,181.82922363, .interiorid = 6, .worldid = 6012); //object(gen_doorint01) (2)
    CreateDynamicObject(10558,1077.42285156,-1255.03637695,10332.41601562,0.00000000,0.00000000,4.31774902, .interiorid = 6, .worldid = 6012); //object(tbnsfs) (2)
    CreateDynamicObject(949,1069.11950684,-1289.43395996,10331.02832031,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(plant_pot_4) (1)
    CreateDynamicObject(949,1068.91540527,-1272.74951172,10331.02832031,0.00000000,0.00000000,30.00000000, .interiorid = 6, .worldid = 6012); //object(plant_pot_4) (2)
    CreateDynamicObject(2289,1062.24023438,-1289.84558105,10332.92968750,0.00000000,0.00000000,180.00000000, .interiorid = 6, .worldid = 6012); //object(frame_2) (1)
    CreateDynamicObject(2280,1057.75000000,-1289.35302734,10332.52832031,0.00000000,0.00000000,178.63879395, .interiorid = 6, .worldid = 6012); //object(frame_thick_1) (1)
    CreateDynamicObject(2279,1060.55749512,-1272.66455078,10332.79882812,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(frame_thick_6) (1)
    CreateDynamicObject(2278,1056.37194824,-1272.74096680,10332.76953125,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(frame_thick_2) (1)
    CreateDynamicObject(2281,1064.75158691,-1272.65136719,10332.67871094,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(frame_thick_5) (1)
    CreateDynamicObject(1491,1072.96594238,-1254.27075195,10326.18554688,0.00000000,0.00000000,0.72802734, .interiorid = 6, .worldid = 6012); //object(gen_doorint01) (3)
    CreateDynamicObject(1491,1073.41662598,-1254.28881836,10330.37109375,0.00000000,0.00000000,0.72509766, .interiorid = 6, .worldid = 6012); //object(gen_doorint01) (4)
    CreateDynamicObject(1499,1072.14782715,-1253.25488281,10326.20507812,0.00000000,0.00000000,91.64776611, .interiorid = 6, .worldid = 6012); //object(gen_doorint05) (3)
    CreateDynamicObject(3051,1072.11743164,-1252.65026855,10329.32128906,315.99975586,90.00000000,271.10180664, .interiorid = 6, .worldid = 6012); //object(lift_dr) (3)
    CreateDynamicObject(14833,1084.73803711,-1326.74438477,10332.02148438,0.00000000,0.00000000,42.89675903, .interiorid = 6, .worldid = 6012); //object(lm_stripchairs1) (2)
    CreateDynamicObject(1543,1053.41601562,-1327.44348145,10331.08593750,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(cj_beer_b_2) (1)
    CreateDynamicObject(1543,1051.31494141,-1327.91210938,10331.08593750,0.00000000,0.00000000,120.00000000, .interiorid = 6, .worldid = 6012); //object(cj_beer_b_2) (2)
    CreateDynamicObject(2601,1051.13415527,-1328.00610352,10331.17968750,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(cj_juice_can) (1)
    CreateDynamicObject(2601,1051.64562988,-1316.38903809,10331.02539062,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(cj_juice_can) (2)
    CreateDynamicObject(2601,1059.98034668,-1316.24536133,10331.02539062,0.00000000,0.00000000,80.00000000, .interiorid = 6, .worldid = 6012); //object(cj_juice_can) (3)
    CreateDynamicObject(2601,1060.34387207,-1316.60729980,10331.02539062,0.00000000,0.00000000,79.99694824, .interiorid = 6, .worldid = 6012); //object(cj_juice_can) (4)
    CreateDynamicObject(1543,1051.51867676,-1310.92578125,10330.93164062,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(cj_beer_b_2) (3)
    CreateDynamicObject(1543,1052.13293457,-1316.01867676,10330.93164062,0.00000000,0.00000000,240.00000000, .interiorid = 6, .worldid = 6012); //object(cj_beer_b_2) (4)
    CreateDynamicObject(1543,1054.11718750,-1328.06689453,10331.08593750,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(cj_beer_b_2) (5)
    CreateDynamicObject(1705,1036.90612793,-1300.49755859,10330.38183594,0.00000000,0.00000000,90.00000000, .interiorid = 6, .worldid = 6012); //object(kb_chair04) (1)
    CreateDynamicObject(1705,1036.83007812,-1298.92529297,10330.38183594,0.00000000,0.00000000,90.12509155, .interiorid = 6, .worldid = 6012); //object(kb_chair04) (2)
    CreateDynamicObject(1705,1036.88037109,-1297.05932617,10330.38183594,0.00000000,0.00000000,38.39825439, .interiorid = 6, .worldid = 6012); //object(kb_chair04) (3)
    CreateDynamicObject(1433,1069.93164062,-1325.67675781,10330.39746094,0.00000000,0.00000000,311.60559082, .interiorid = 6, .worldid = 6012); //object(dyn_table_1) (1)
    CreateDynamicObject(1656,1064.00061035,-1298.29797363,10331.46875000,0.00000000,0.00000000,92.01232910, .interiorid = 6, .worldid = 6012); //object(esc_step) (1)
    CreateDynamicObject(1656,1064.41174316,-1298.28710938,10331.22656250,0.00000000,0.00000000,92.01049805, .interiorid = 6, .worldid = 6012); //object(esc_step) (2)
    CreateDynamicObject(1656,1064.82617188,-1298.27246094,10330.98632812,0.00000000,0.00000000,92.01049805, .interiorid = 6, .worldid = 6012); //object(esc_step) (3)
    CreateDynamicObject(1656,1065.23559570,-1298.25781250,10330.74023438,0.00000000,0.00000000,92.01049805, .interiorid = 6, .worldid = 6012); //object(esc_step) (4)
    CreateDynamicObject(1656,1065.65063477,-1298.24194336,10330.50195312,0.00000000,0.00000000,92.01049805, .interiorid = 6, .worldid = 6012); //object(esc_step) (5)
    CreateDynamicObject(1656,1066.06335449,-1298.22790527,10330.26171875,0.00000000,0.00000000,92.01049805, .interiorid = 6, .worldid = 6012); //object(esc_step) (6)
    CreateDynamicObject(3565,1066.60412598,-1298.10083008,10328.42285156,0.00000000,30.00000000,1.99951172, .interiorid = 6, .worldid = 6012); //object(lasdkrt1_la01) (2)
    CreateDynamicObject(3051,1073.79150391,-1254.26623535,10329.28613281,315.99426270,90.00000000,1.33471680, .interiorid = 6, .worldid = 6012); //object(lift_dr) (3)
    CreateDynamicObject(1846,1038.19995117,-1326.59997559,10338.95312500,90.00000000,0.00000000,1.25000000, .interiorid = 6, .worldid = 6012); //object(shop_shelf04) (1)
    CreateDynamicObject(2225,1038.05639648,-1327.67321777,10336.29980469,0.00000000,0.00000000,181.86804199, .interiorid = 6, .worldid = 6012); //object(swank_hi_fi_2) (1)
    CreateDynamicObject(2233,1039.94946289,-1327.68493652,10336.30761719,0.00000000,0.00000000,180.00000000, .interiorid = 6, .worldid = 6012); //object(swank_speaker_4) (1)
    CreateDynamicObject(2233,1035.66320801,-1327.85644531,10336.30761719,0.00000000,0.00000000,179.99450684, .interiorid = 6, .worldid = 6012); //object(swank_speaker_4) (2)
    CreateDynamicObject(1753,1039.05078125,-1320.39550781,10336.30761719,0.00000000,0.00000000,2.13134766, .interiorid = 6, .worldid = 6012); //object(swank_couch_1) (1)
    CreateDynamicObject(2292,1035.23986816,-1323.31982422,10336.30761719,0.00000000,0.00000000,92.00000000, .interiorid = 6, .worldid = 6012); //object(swk_single_1b) (1)
    CreateDynamicObject(1754,1035.14733887,-1321.50720215,10336.30175781,0.00000000,0.00000000,93.07586670, .interiorid = 6, .worldid = 6012); //object(swank_single_1) (1)
    CreateDynamicObject(1753,1035.05468750,-1320.54589844,10336.30761719,0.00000000,0.00000000,2.30712891, .interiorid = 6, .worldid = 6012); //object(swank_couch_1) (2)
    CreateDynamicObject(1754,1035.19238281,-1322.40356445,10336.30175781,0.00000000,0.00000000,93.07067871, .interiorid = 6, .worldid = 6012); //object(swank_single_1) (3)
    CreateDynamicObject(1753,1037.06872559,-1319.84362793,10336.30761719,0.00000000,0.00000000,182.55059814, .interiorid = 6, .worldid = 6012); //object(swank_couch_1) (4)
    CreateDynamicObject(1754,1035.01049805,-1319.00878906,10336.30175781,0.00000000,0.00000000,93.07067871, .interiorid = 6, .worldid = 6012); //object(swank_single_1) (4)
    CreateDynamicObject(1754,1034.96606445,-1318.11328125,10336.30175781,0.00000000,0.00000000,93.07067871, .interiorid = 6, .worldid = 6012); //object(swank_single_1) (5)
    CreateDynamicObject(1753,1034.94104004,-1317.42077637,10336.30761719,0.00000000,0.00000000,92.13134766, .interiorid = 6, .worldid = 6012); //object(swank_couch_1) (5)
    CreateDynamicObject(1753,1034.82763672,-1315.43090820,10336.30761719,0.00000000,0.00000000,2.30712891, .interiorid = 6, .worldid = 6012); //object(swank_couch_1) (2)
    CreateDynamicObject(1433,1036.48400879,-1317.68835449,10336.49414062,0.00000000,0.00000000,3.29360962, .interiorid = 6, .worldid = 6012); //object(dyn_table_1) (2)
    CreateDynamicObject(1433,1035.36572266,-1324.44934082,10336.49414062,0.00000000,0.00000000,2.30026245, .interiorid = 6, .worldid = 6012); //object(dyn_table_1) (3)
    CreateDynamicObject(2179,1039.64050293,-1309.15966797,10338.50488281,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(casino_light1) (1)
    CreateDynamicObject(2179,1039.70361328,-1310.34423828,10338.50488281,0.00000000,0.00000000,260.00000000, .interiorid = 6, .worldid = 6012); //object(casino_light1) (2)
    CreateDynamicObject(2179,1039.76611328,-1311.61499023,10338.50488281,0.00000000,0.00000000,183.99694824, .interiorid = 6, .worldid = 6012); //object(casino_light1) (3)
    CreateDynamicObject(2179,1039.81640625,-1312.94775391,10338.50488281,0.00000000,0.00000000,122.19149780, .interiorid = 6, .worldid = 6012); //object(casino_light1) (4)
    CreateDynamicObject(2179,1039.82458496,-1314.20202637,10338.50488281,0.00000000,0.00000000,2.18994141, .interiorid = 6, .worldid = 6012); //object(casino_light1) (5)
    CreateDynamicObject(2248,1041.38256836,-1327.04003906,10336.88964844,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(plant_pot_16) (1)
    CreateDynamicObject(2248,1040.98266602,-1315.41113281,10336.88964844,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(plant_pot_16) (2)
    CreateDynamicObject(2248,1040.69079590,-1307.91687012,10336.88964844,0.00000000,0.00000000,68.00000000, .interiorid = 6, .worldid = 6012); //object(plant_pot_16) (3)
    CreateDynamicObject(2248,1040.32800293,-1296.38647461,10336.88964844,0.00000000,0.00000000,67.99987793, .interiorid = 6, .worldid = 6012); //object(plant_pot_16) (4)
    CreateDynamicObject(994,1036.42138672,-1307.45849609,10336.33593750,0.00000000,0.00000000,91.47192383, .interiorid = 6, .worldid = 6012); //object(lhouse_barrier2) (1)
    CreateDynamicObject(994,1036.36791992,-1305.55090332,10336.33593750,0.00000000,0.00000000,91.46667480, .interiorid = 6, .worldid = 6012); //object(lhouse_barrier2) (2)
    CreateDynamicObject(994,1036.48144531,-1307.39404297,10336.33593750,0.00000000,0.00000000,181.92858887, .interiorid = 6, .worldid = 6012); //object(lhouse_barrier2) (3)
    CreateDynamicObject(2288,1035.07006836,-1318.88134766,10339.06835938,0.00000000,0.00000000,91.58416748, .interiorid = 6, .worldid = 6012); //object(frame_3) (1)
    CreateDynamicObject(2271,1034.77819824,-1311.24304199,10339.17187500,0.00000000,0.00000000,91.93399048, .interiorid = 6, .worldid = 6012); //object(frame_wood_1) (1)
    CreateDynamicObject(2260,1034.50830078,-1304.05053711,10339.16796875,0.00000000,0.00000000,91.58416748, .interiorid = 6, .worldid = 6012); //object(frame_slim_1) (1)
    CreateDynamicObject(626,1052.34118652,-1288.89282227,10332.43652344,0.00000000,0.00000000,130.00000000, .interiorid = 6, .worldid = 6012); //object(veg_palmkb2) (1)
    CreateDynamicObject(1658,1060.11755371,-1280.91723633,10335.53613281,0.00000000,0.00000000,0.00000000, .interiorid = 6, .worldid = 6012); //object(htl_fan_static_nt) (1)

	//Gang HQ families 8
	CreateDynamicObject(3942,2699.34000000,-18.15000000,6999.99000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(3919,2699.25000000,-21.00000000,7000.33000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(3944,2699.20000000,-11.93000000,7000.00000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(3943,2700.89000000,-20.45000000,6996.15000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(3961,2695.39000000,-16.63000000,6993.63000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(14592,2681.79000000,-6.96000000,6998.57000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(16637,2690.32000000,-22.91000000,6993.08000000,90.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(16637,2690.32000000,-25.94000000,6995.73000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(16637,2690.32000000,-27.83000000,6993.08000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(16637,2691.13000000,-25.05000000,6991.51000000,0.00000000,90.00000000,179.99000000); //
	CreateDynamicObject(2184,2686.87000000,-16.87000000,6991.58000000,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(1714,2688.55000000,-17.93000000,6991.60000000,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(3945,2701.10000000,-17.40000000,7002.45000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(3920,2700.56000000,-18.79000000,6999.44000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1846,2698.53000000,-26.58000000,7002.61000000,90.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2230,2696.66000000,-27.66000000,7001.98000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(2230,2699.90000000,-27.66000000,7001.98000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(3922,2698.56000000,-28.97000000,7000.48000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(3922,2700.82000000,-28.98000000,7000.48000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(3922,2702.84000000,-28.96000000,7000.48000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(3922,2705.83000000,-29.11000000,7000.48000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(3966,2707.17000000,-24.50000000,7005.79000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(3966,2709.40000000,-24.60000000,7005.79000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(3966,2711.40000000,-24.59000000,7005.79000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(3966,2714.40000000,-24.57000000,7005.79000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(16637,2701.11000000,-29.90000000,7001.99000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(3963,2703.81000000,-30.97000000,7002.60000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2854,2704.10000000,-30.37000000,7001.49000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2855,2703.20000000,-30.42000000,7001.49000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(3921,2707.71000000,-23.77000000,7001.02000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(3946,2700.77000000,-20.64000000,6999.47000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1972,2699.69000000,-18.65000000,6997.43000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(3965,2700.07000000,-20.39000000,6997.51000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1514,2704.07000000,-18.40000000,6997.45000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(2245,2702.23000000,-18.46000000,6997.49000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1432,2706.23000000,-9.06000000,6996.03000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1432,2702.48000000,-9.21000000,6996.03000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1432,2699.01000000,-9.08000000,6996.03000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1432,2695.56000000,-9.08000000,6996.03000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1722,2705.10000000,-14.85000000,6996.03000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(1722,2704.00000000,-14.85000000,6996.03000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(1722,2703.00000000,-14.85000000,6996.03000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(1722,2702.00000000,-14.85000000,6996.03000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(1722,2701.00000000,-14.85000000,6996.03000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(1722,2700.00000000,-14.85000000,6996.03000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(1722,2699.00000000,-14.85000000,6996.03000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(1722,2698.00000000,-14.85000000,6996.03000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(1722,2697.00000000,-14.85000000,6996.03000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(1432,2705.99000000,-12.30000000,6996.03000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1432,2702.29000000,-12.20000000,6996.03000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1432,2698.82000000,-12.08000000,6996.03000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2954,2695.80000000,-22.44000000,6996.03000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1541,2700.99000000,-19.18000000,6997.42000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(1544,2703.86000000,-21.92000000,6997.18000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1544,2703.37000000,-21.84000000,6997.18000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1544,2703.62000000,-21.88000000,6997.18000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1544,2704.11000000,-21.97000000,6997.18000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1544,2703.61000000,-21.88000000,6997.18000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1544,2704.35000000,-22.01000000,6997.18000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1545,2701.76000000,-22.41000000,6997.94000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(1545,2699.27000000,-22.41000000,6997.94000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(1546,2700.47000000,-22.08000000,6997.27000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1546,2700.54000000,-21.84000000,6997.27000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1546,2701.02000000,-21.97000000,6997.27000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1546,2700.30000000,-21.77000000,6997.27000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1546,2700.16000000,-22.25000000,6997.27000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1546,2700.64000000,-22.38000000,6997.27000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1546,2700.78000000,-21.90000000,6997.27000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1546,2699.92000000,-22.18000000,6997.27000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2296,2676.62000000,-19.29000000,6991.57000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1768,2679.01000000,-16.68000000,6991.58000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1768,2681.02000000,-20.32000000,6991.58000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(1769,2681.73000000,-18.06000000,6991.58000000,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(1819,2679.16000000,-18.83000000,6991.58000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2835,2679.17000000,-18.79000000,6991.58000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2190,2687.20000000,-17.03000000,6992.36000000,0.00000000,0.00000000,46.00000000); //
	CreateDynamicObject(2852,2687.17000000,-18.72000000,6992.36000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1670,2687.70000000,-18.65000000,6992.37000000,0.00000000,0.00000000,300.00000000); //
	CreateDynamicObject(2985,2689.35000000,-22.18000000,6991.58000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(2985,2689.67000000,-13.50000000,6991.58000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(1736,2689.73000000,-18.00000000,6994.39000000,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(1714,2685.41000000,-18.76000000,6991.60000000,0.00000000,0.00000000,114.00000000); //
	CreateDynamicObject(1714,2685.23000000,-16.97000000,6991.60000000,0.00000000,0.00000000,64.00000000); //
	CreateDynamicObject(2127,2686.13000000,-22.57000000,6991.58000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(644,2676.48000000,-22.07000000,6991.90000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(644,2676.49000000,-13.81000000,6991.90000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(16779,2687.00000000,-18.03000000,6996.07000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(16779,2679.04000000,-18.84000000,6996.07000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1502,2680.74000000,-23.02000000,6991.58000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(16637,2681.27000000,-23.00000000,6995.60000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(3055,2675.99000000,15.41000000,6993.78000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(3055,2682.00000000,15.41000000,6993.78000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(3055,2688.00000000,15.41000000,6993.78000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(3055,2675.99000000,1.60000000,6993.78000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(3055,2682.00000000,1.60000000,6993.78000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(3055,2687.90000000,1.60000000,6993.78000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2008,2673.22000000,12.11000000,6991.59000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(1663,2672.41000000,13.05000000,6992.05000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2357,2660.74000000,3.34000000,6991.97000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2357,2660.74000000,7.60000000,6991.97000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2357,2662.07000000,7.60000000,6991.97000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2357,2662.07000000,3.34000000,6991.97000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1704,2658.95000000,8.09000000,6991.57000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1704,2658.95000000,6.00000000,6991.57000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1704,2658.95000000,4.00000000,6991.57000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1704,2658.95000000,2.00000000,6991.57000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1704,2661.80000000,-0.16000000,6991.58000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(1704,2663.84000000,2.77000000,6991.58000000,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(1704,2663.83000000,4.50000000,6991.58000000,0.00000000,0.00000000,269.99000000); //
	CreateDynamicObject(1704,2663.83000000,6.50000000,6991.58000000,0.00000000,0.00000000,269.99000000); //
	CreateDynamicObject(1704,2663.83000000,8.50000000,6991.58000000,0.00000000,0.00000000,269.99000000); //
	CreateDynamicObject(1439,2653.67000000,-3.84000000,6991.57000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(3092,2653.49000000,-3.83000000,6992.60000000,0.00000000,80.00000000,0.00000000); //
	CreateDynamicObject(3092,2653.80000000,-3.43000000,6992.10000000,0.00000000,32.00000000,0.00000000); //
	CreateDynamicObject(16444,2655.47000000,0.18000000,6991.92000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(16444,2668.39000000,-20.68000000,6991.69000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1502,2667.50000000,-22.93000000,6991.60000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(16637,2667.98000000,-22.91000000,6995.58000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(14412,2721.90000000,16.66000000,6996.86000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(16637,2698.52000000,-27.88000000,7002.15000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1800,2676.68000000,10.61000000,6991.63000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2518,2678.63000000,13.30000000,6992.13000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2521,2681.48000000,13.54000000,6991.63000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2518,2685.00000000,13.30000000,6992.13000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1800,2682.50000000,10.61000000,6991.63000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2521,2687.77000000,13.54000000,6991.63000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1800,2676.68000000,1.80000000,6991.63000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2518,2680.00000000,4.00000000,6992.52000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(2521,2681.80000000,3.30000000,6991.63000000,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(2521,2687.80000000,3.44000000,6991.63000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(1800,2682.68000000,1.79000000,6991.63000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2518,2686.48000000,3.27000000,6992.52000000,0.00000000,0.00000000,179.99000000); //
	CreateDynamicObject(14838,2726.99000000,-28.33000000,6994.35000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(14829,2727.01000000,-28.35000000,6994.29000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(14835,2727.49000000,-28.17000000,6994.30000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(14836,2727.11000000,-28.45000000,6994.38000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(14830,2726.97000000,-28.31000000,6994.54000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(14833,2726.97000000,-28.35000000,6994.23000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(14832,2727.02000000,-28.48000000,6994.18000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(14837,2726.71000000,-28.30000000,6994.58000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(14831,2727.12000000,-28.94000000,6994.34000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1500,2718.87000000,-40.31000000,6992.81000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(14459,2717.35000000,16.70000000,6994.50000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(14439,2722.81000000,15.91000000,6995.07000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(14445,2727.21000000,22.76000000,6993.55000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(934,2728.85000000,16.07000000,6988.84000000,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(934,2723.00000000,16.00000000,6988.84000000,0.00000000,0.00000000,269.99000000); //
	CreateDynamicObject(934,2712.00000000,16.00000000,6988.84000000,0.00000000,0.00000000,269.99000000); //
	CreateDynamicObject(941,2729.90000000,17.61000000,6987.99000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(941,2727.56000000,17.60000000,6987.99000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(941,2725.21000000,17.60000000,6987.99000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(941,2722.86000000,17.60000000,6987.99000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(941,2722.86000000,14.50000000,6987.99000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(941,2725.21000000,14.50000000,6987.99000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(941,2727.56000000,14.50000000,6987.99000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(941,2729.90000000,14.50000000,6987.99000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(941,2713.00000000,17.60000000,6987.99000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(941,2713.00000000,14.55000000,6987.99000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(936,2723.19000000,23.77000000,6987.99000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(937,2722.86000000,25.42000000,6987.99000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(936,2715.25000000,23.17000000,6987.99000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(936,2707.55000000,23.14000000,6987.99000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(937,2715.20000000,25.07000000,6987.99000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(937,2707.77000000,25.28000000,6987.99000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(14451,2694.64000000,20.45000000,6995.50000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2649,2690.62000000,26.71000000,6995.25000000,0.00000000,90.00000000,0.00000000); //
	CreateDynamicObject(2649,2690.62000000,24.00000000,6995.25000000,0.00000000,90.00000000,0.00000000); //
	CreateDynamicObject(2649,2690.62000000,21.00000000,6995.25000000,0.00000000,90.00000000,0.00000000); //
	CreateDynamicObject(2649,2690.62000000,19.00000000,6995.25000000,0.00000000,90.00000000,0.00000000); //
	CreateDynamicObject(2649,2690.62000000,17.00000000,6995.25000000,0.00000000,90.00000000,0.00000000); //
	CreateDynamicObject(2649,2690.62000000,15.00000000,6995.25000000,0.00000000,90.00000000,0.00000000); //
	CreateDynamicObject(2649,2690.62000000,13.00000000,6995.25000000,0.00000000,90.00000000,0.00000000); //
	CreateDynamicObject(937,2692.66000000,12.12000000,6992.15000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(937,2697.18000000,12.11000000,6992.15000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2780,2713.23000000,15.89000000,6981.77000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2780,2731.50000000,18.86000000,6981.77000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2780,2743.91000000,3.43000000,6981.77000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2780,2706.15000000,11.75000000,6981.77000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2780,2707.19000000,19.93000000,6981.77000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2780,2720.54000000,27.81000000,6981.77000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2780,2715.18000000,19.56000000,6996.52000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2780,2708.04000000,18.52000000,6997.77000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2780,2720.31000000,18.37000000,6997.77000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2780,2729.82000000,14.67000000,6997.77000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2780,2729.54000000,18.35000000,6997.77000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2901,2722.89000000,17.57000000,6988.61000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2901,2722.84000000,14.46000000,6988.61000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2901,2725.27000000,14.34000000,6988.61000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2901,2730.12000000,14.22000000,6988.61000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2901,2728.05000000,14.28000000,6988.61000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1279,2730.36000000,17.72000000,6988.40000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1279,2728.62000000,17.57000000,6988.40000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1575,2726.74000000,17.72000000,6988.42000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1575,2725.48000000,17.90000000,6988.42000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1575,2724.61000000,17.68000000,6988.67000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1575,2713.88000000,17.86000000,6988.42000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1575,2713.15000000,17.56000000,6988.42000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1575,2712.61000000,18.03000000,6988.42000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1575,2712.65000000,17.53000000,6988.42000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1575,2714.16000000,17.38000000,6988.42000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2901,2712.93000000,14.36000000,6988.86000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(937,2692.66000000,15.00000000,6992.15000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(937,2692.66000000,18.00000000,6992.15000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(937,2692.66000000,21.00000000,6992.15000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(937,2692.66000000,24.00000000,6992.15000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(937,2692.66000000,30.00000000,6992.15000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(937,2697.18000000,15.00000000,6992.15000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(937,2697.18000000,18.00000000,6992.15000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(937,2697.18000000,21.00000000,6992.15000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(937,2697.18000000,24.00000000,6992.15000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(937,2697.18000000,30.00000000,6992.15000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2901,2692.93000000,11.94000000,6992.78000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2901,2692.61000000,17.82000000,6992.78000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2901,2692.74000000,15.06000000,6992.78000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2901,2696.99000000,17.97000000,6992.78000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1578,2696.86000000,11.89000000,6992.58000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1578,2697.67000000,12.29000000,6992.58000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1578,2697.67000000,12.29000000,6992.08000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1578,2697.14000000,12.11000000,6991.83000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1579,2697.05000000,20.64000000,6992.58000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1579,2697.50000000,21.24000000,6992.58000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1579,2696.80000000,21.14000000,6992.58000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(3409,2719.01000000,27.72000000,6986.77000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(3409,2719.95000000,28.22000000,6986.77000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(3409,2717.34000000,28.22000000,6986.77000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(3409,2715.69000000,27.93000000,6986.77000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(3409,2723.03000000,28.09000000,6986.77000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(3409,2725.21000000,29.27000000,6986.77000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(3409,2711.42000000,27.63000000,6986.77000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(3409,2710.94000000,27.77000000,6986.77000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(3409,2705.29000000,28.93000000,6986.77000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(3409,2706.01000000,28.72000000,6986.77000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(3409,2702.78000000,5.25000000,6987.52000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(3409,2705.25000000,5.08000000,6987.52000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(14416,2701.18000000,24.34000000,6988.27000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2357,2660.74000000,11.87000000,6991.97000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2357,2662.07000000,11.87000000,6991.97000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1704,2658.98000000,9.84000000,6991.57000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1704,2659.01000000,11.84000000,6991.57000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1704,2663.96000000,10.25000000,6991.58000000,0.00000000,0.00000000,269.99000000); //
	CreateDynamicObject(1704,2664.08000000,11.99000000,6991.58000000,0.00000000,0.00000000,269.99000000); //
	CreateDynamicObject(1704,2664.19000000,13.49000000,6991.58000000,0.00000000,0.00000000,269.99000000); //
	CreateDynamicObject(1704,2660.76000000,15.18000000,6991.58000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1491,2690.20000000,7.14000000,6991.65000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(16637,2694.80000000,-22.69000000,6995.90000000,0.00000000,90.00000000,90.00000000); //
	CreateDynamicObject(16637,2701.63000000,-17.75000000,6991.59000000,0.00000000,90.00000000,90.00000000); //
	CreateDynamicObject(1508,2739.35000000,8.51000000,6989.17000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(16637,2702.51000000,-17.72000000,6991.23000000,0.00000000,90.00000000,90.00000000); //
	CreateDynamicObject(18765,2665.31000000,25.77000000,6993.90000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(18765,2675.30000000,25.76000000,6993.90000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(18766,2690.04000000,2.15000000,6993.42000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(18766,2690.04000000,2.15000000,6998.41000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(18766,2690.03000000,12.16000000,6996.66000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(18766,2690.03000000,15.16000000,6991.64000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1491,2690.20000000,10.17000000,6991.65000000,0.00000000,0.00000000,-90.00000000); //
	CreateDynamicObject(18765,2713.42000000,-14.14000000,7004.84000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(18765,2713.48000000,-23.45000000,6999.84000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(18765,2684.99000000,-13.17000000,7004.84000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(18765,2684.99000000,-13.17000000,7004.84000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(18765,2684.92000000,-18.02000000,7004.84000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(18652,2698.61000000,-11.03000000,7002.00000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(18652,2699.84000000,-5.11000000,7002.00000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(18649,2698.61000000,-11.03000000,7002.60000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(18647,2698.61000000,-11.03000000,7001.40000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(18652,2708.27000000,-15.21000000,7000.99000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(18649,2708.27000000,-15.21000000,7001.90000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(18647,2708.27000000,-15.21000000,7000.12000000,0.00000000,0.00000000,0.00000000); //
    //Phong hop Admin
    CreateDynamicObject(14411,2121.00488281,-1897.54785156,15561.37011719,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(carter-stairs04) (1)
    CreateDynamicObject(3598,2136.07519531,-1895.12988281,15567.47753906,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(hillhouse01_la) (2)
    CreateDynamicObject(3598,2136.07519531,-1904.52929688,15567.47753906,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(hillhouse01_la) (5)
    CreateDynamicObject(3598,2123.04980469,-1877.59765625,15567.47753906,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 7405); //object(hillhouse01_la) (6)
    CreateDynamicObject(3598,2107.47412109,-1895.15747070,15567.47753906,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 7405); //object(hillhouse01_la) (7)
    CreateDynamicObject(3598,2107.40478516,-1904.58789062,15567.47753906,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 7405); //object(hillhouse01_la) (8)
    CreateDynamicObject(3598,2117.15234375,-1896.86376953,15573.12207031,270.00000000,270.00000000,3.03222656 , .interiorid = 1, .worldid = 7405); //object(hillhouse01_la) (9)
    CreateDynamicObject(15048,2115.90527344,-1900.06250000,15564.24609375,0.00000000,0.00000000,270.24719238 , .interiorid = 1, .worldid = 7405); //object(labigsavehouse) (1)
    CreateDynamicObject(3095,2119.12304688,-1907.11816406,15560.50000000,179.99450684,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(a51_jetdoor) (1)
    CreateDynamicObject(3095,2119.11914062,-1916.06347656,15560.50000000,179.99450684,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(a51_jetdoor) (2)
    CreateDynamicObject(12950,2119.17480469,-1917.24853516,15565.85156250,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 7405); //object(cos_sbanksteps03) (1)
    CreateDynamicObject(11490,2109.57177734,-1916.84741211,15567.78906250,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 7405); //object(des_ranch) (1)
    CreateDynamicObject(3095,2119.13183594,-1898.86401367,15560.50000000,179.99450684,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(a51_jetdoor) (1)
    CreateDynamicObject(3095,2124.78271484,-1913.52856445,15567.25097656,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 7405); //object(a51_jetdoor) (1)
    CreateDynamicObject(3095,2115.79394531,-1911.49218750,15567.24902344,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 7405); //object(a51_jetdoor) (1)
    CreateDynamicObject(3095,2118.71313477,-1916.63220215,15571.79003906,90.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 7405); //object(a51_jetdoor) (1)
    CreateDynamicObject(3095,2120.23535156,-1916.02368164,15571.79003906,90.00000000,0.00000000,89.99450684 , .interiorid = 1, .worldid = 7405); //object(a51_jetdoor) (1)
    CreateDynamicObject(3095,2118.52343750,-1917.92187500,15571.77050781,90.00000000,0.00000000,359.98901367 , .interiorid = 1, .worldid = 7405); //object(a51_jetdoor) (1)
    CreateDynamicObject(3055,2114.63208008,-1919.02160645,15566.38378906,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 7405); //object(kmb_shutter) (2)
    CreateDynamicObject(3095,2114.11376953,-1912.11230469,15571.79003906,90.00000000,0.00000000,89.99450684 , .interiorid = 1, .worldid = 7405); //object(a51_jetdoor) (1)
    CreateDynamicObject(3095,2118.75708008,-1915.73156738,15571.79003906,0.00000000,0.00000000,89.99450684 , .interiorid = 1, .worldid = 7405); //object(a51_jetdoor) (1)
    CreateDynamicObject(1677,2098.35644531,-1927.21875000,15584.08398438,90.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 7405); //object(wshxrefhse2) (1)
    CreateDynamicObject(1533,2115.99267578,-1917.96130371,15564.26171875,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 7405); //object(gen_doorext12) (1)
    CreateDynamicObject(3095,2124.76538086,-1911.57714844,15567.24902344,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 7405); //object(a51_jetdoor) (1)
    CreateDynamicObject(3095,2115.80004883,-1912.11779785,15567.25097656,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 7405); //object(a51_jetdoor) (1)
    CreateDynamicObject(3095,2121.45092773,-1906.99060059,15571.78417969,90.00000000,0.00000000,359.98901367 , .interiorid = 1, .worldid = 7405); //object(a51_jetdoor) (1)
    CreateDynamicObject(16101,2119.13842773,-1907.05969238,15567.26757812,90.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 7405); //object(des_windsockpole) (1)
    CreateDynamicObject(2071,2120.92944336,-1891.10534668,15566.08105469,0.00000000,0.00000000,69.99938965 , .interiorid = 1, .worldid = 7405); //object(cj_mlight5) (1)
    CreateDynamicObject(2071,2122.68359375,-1891.19628906,15566.08105469,0.00000000,0.00000000,279.99755859 , .interiorid = 1, .worldid = 7405); //object(cj_mlight5) (2)
    CreateDynamicObject(18013,2122.77368164,-1884.46887207,15567.02539062,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(int_rest_veg3) (1)
    CreateDynamicObject(3785,2119.21582031,-1894.28857422,15566.11621094,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(bulkheadlight) (1)
    CreateDynamicObject(3785,2122.85742188,-1894.18041992,15566.11621094,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 7405); //object(bulkheadlight) (2)
    CreateDynamicObject(3785,2119.24536133,-1902.78869629,15563.42089844,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(bulkheadlight) (3)
    CreateDynamicObject(3785,2122.86279297,-1902.63549805,15563.42089844,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 7405); //object(bulkheadlight) (4)
    CreateDynamicObject(2256,2120.33227539,-1915.11230469,15562.89453125,0.00000000,0.00000000,180.25000000 , .interiorid = 1, .worldid = 7405); //object(frame_clip_3) (1)
    CreateDynamicObject(2290,2122.77685547,-1914.63427734,15560.49609375,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 7405); //object(swk_couch_1) (2)
    CreateDynamicObject(2290,2119.72363281,-1914.62255859,15560.49609375,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 7405); //object(swk_couch_1) (3)
    CreateDynamicObject(2292,2123.71582031,-1913.65795898,15560.49609375,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 7405); //object(swk_single_1b) (1)
    CreateDynamicObject(2292,2123.70849609,-1912.68334961,15560.49609375,0.00000000,0.00000000,269.99450684 , .interiorid = 1, .worldid = 7405); //object(swk_single_1b) (2)
    CreateDynamicObject(646,2116.64648438,-1914.53820801,15562.07714844,0.00000000,0.00000000,22.00000000 , .interiorid = 1, .worldid = 7405); //object(veg_palmkb14) (1)
    CreateDynamicObject(646,2123.55126953,-1914.62854004,15562.07714844,0.00000000,0.00000000,137.99755859 , .interiorid = 1, .worldid = 7405); //object(veg_palmkb14) (2)
    CreateDynamicObject(18013,2127.15820312,-1913.05725098,15567.30468750,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(int_rest_veg3) (2)
    CreateDynamicObject(14455,2118.73754883,-1925.35241699,15565.78125000,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(gs_bookcase) (1)
    CreateDynamicObject(14455,2121.63452148,-1925.37023926,15565.78125000,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(gs_bookcase) (2)
    CreateDynamicObject(14455,2126.06982422,-1924.59411621,15565.78125000,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 7405); //object(gs_bookcase) (3)
    CreateDynamicObject(14455,2118.09033203,-1920.04418945,15565.78125000,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 7405); //object(gs_bookcase) (4)
    CreateDynamicObject(1491,2121.39013672,-1919.21606445,15564.26171875,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(gen_doorint01) (1)
    CreateDynamicObject(2205,2123.76440430,-1919.82763672,15564.26171875,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(med_office8_desk_1) (1)
    CreateDynamicObject(1714,2124.56030273,-1921.13830566,15564.26171875,0.00000000,0.00000000,200.00000000 , .interiorid = 1, .worldid = 7405); //object(kb_swivelchair1) (1)
    CreateDynamicObject(2190,2124.14306641,-1919.70825195,15565.19824219,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(pc_1) (1)
    CreateDynamicObject(2828,2125.04809570,-1919.79650879,15565.19824219,0.00000000,0.00000000,140.00000000 , .interiorid = 1, .worldid = 7405); //object(gb_ornament02) (1)
    CreateDynamicObject(2280,2119.77124023,-1919.85083008,15565.69921875,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(frame_thick_1) (1)
    CreateDynamicObject(2071,2118.39306641,-1924.99121094,15565.77734375,0.00000000,0.00000000,130.00000000 , .interiorid = 1, .worldid = 7405); //object(cj_mlight5) (3)
    CreateDynamicObject(2071,2125.59887695,-1924.87280273,15565.77734375,0.00000000,0.00000000,230.24572754 , .interiorid = 1, .worldid = 7405); //object(cj_mlight5) (4)
    CreateDynamicObject(2071,2118.52734375,-1919.62011719,15565.77734375,0.00000000,0.00000000,40.24047852 , .interiorid = 1, .worldid = 7405); //object(cj_mlight5) (5)
    CreateDynamicObject(2291,2118.70483398,-1919.92321777,15564.26171875,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(swk_single_1) (1)
    CreateDynamicObject(2291,2119.65039062,-1919.92480469,15564.26171875,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(swk_single_1) (2)
    CreateDynamicObject(16779,2121.58764648,-1922.10925293,15567.29785156,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(ufo_light02) (1)
    CreateDynamicObject(1962,2124.61645508,-1919.37939453,15566.50781250,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(record1) (1)
    CreateDynamicObject(1961,2123.83105469,-1919.35583496,15566.05371094,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(record3) (1)
    CreateDynamicObject(1960,2125.37573242,-1919.35083008,15566.05761719,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(record2) (1)
    CreateDynamicObject(2439,2107.59350586,-1916.92016602,15569.29687500,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 7405); //object(cj_ff_conter_3) (1)
    CreateDynamicObject(2439,2107.59277344,-1915.93090820,15569.29687500,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 7405); //object(cj_ff_conter_3) (2)
    CreateDynamicObject(2439,2107.59277344,-1917.91992188,15569.29687500,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 7405); //object(cj_ff_conter_3) (3)
    CreateDynamicObject(2440,2107.56274414,-1918.92517090,15569.29687500,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(cj_ff_conter_3b) (1)
    CreateDynamicObject(2440,2106.56005859,-1918.89562988,15569.29687500,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 7405); //object(cj_ff_conter_3b) (2)
    CreateDynamicObject(2440,2107.59667969,-1914.93798828,15569.29687500,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 7405); //object(cj_ff_conter_3b) (3)
    CreateDynamicObject(2440,2106.59716797,-1914.90466309,15569.29687500,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 7405); //object(cj_ff_conter_3b) (4)
    CreateDynamicObject(2439,2106.56274414,-1915.91064453,15569.29687500,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 7405); //object(cj_ff_conter_3) (4)
    CreateDynamicObject(2439,2106.56250000,-1916.91101074,15569.29687500,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 7405); //object(cj_ff_conter_3) (5)
    CreateDynamicObject(2439,2106.56250000,-1917.91101074,15569.29687500,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 7405); //object(cj_ff_conter_3) (6)
    CreateDynamicObject(1714,2107.15551758,-1913.54565430,15569.29687500,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(kb_swivelchair1) (2)
    CreateDynamicObject(1714,2106.92773438,-1920.41088867,15569.29687500,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 7405); //object(kb_swivelchair1) (3)
    CreateDynamicObject(1714,2108.35351562,-1919.68334961,15569.29687500,0.00000000,0.00000000,219.99450684 , .interiorid = 1, .worldid = 7405); //object(kb_swivelchair1) (4)
    CreateDynamicObject(1714,2105.60302734,-1919.66491699,15569.29687500,0.00000000,0.00000000,129.99023438 , .interiorid = 1, .worldid = 7405); //object(kb_swivelchair1) (5)
    CreateDynamicObject(1714,2105.14990234,-1918.56555176,15569.29687500,0.00000000,0.00000000,99.98474121 , .interiorid = 1, .worldid = 7405); //object(kb_swivelchair1) (6)
    CreateDynamicObject(1714,2105.08740234,-1917.61547852,15569.29687500,0.00000000,0.00000000,89.98107910 , .interiorid = 1, .worldid = 7405); //object(kb_swivelchair1) (7)
    CreateDynamicObject(1714,2105.05297852,-1916.68933105,15569.29687500,0.00000000,0.00000000,89.97802734 , .interiorid = 1, .worldid = 7405); //object(kb_swivelchair1) (8)
    CreateDynamicObject(1714,2105.11230469,-1915.63488770,15569.29687500,0.00000000,0.00000000,83.97802734 , .interiorid = 1, .worldid = 7405); //object(kb_swivelchair1) (9)
    CreateDynamicObject(1714,2105.61523438,-1914.23669434,15569.29687500,0.00000000,0.00000000,51.97399902 , .interiorid = 1, .worldid = 7405); //object(kb_swivelchair1) (10)
    CreateDynamicObject(1714,2108.35375977,-1914.14477539,15569.29687500,0.00000000,0.00000000,311.97082520 , .interiorid = 1, .worldid = 7405); //object(kb_swivelchair1) (11)
    CreateDynamicObject(1714,2108.75903320,-1915.33068848,15569.29687500,0.00000000,0.00000000,271.96777344 , .interiorid = 1, .worldid = 7405); //object(kb_swivelchair1) (12)
    CreateDynamicObject(1714,2108.84228516,-1916.40661621,15569.29687500,0.00000000,0.00000000,271.96655273 , .interiorid = 1, .worldid = 7405); //object(kb_swivelchair1) (13)
    CreateDynamicObject(1714,2108.89697266,-1917.46166992,15569.29687500,0.00000000,0.00000000,265.96655273 , .interiorid = 1, .worldid = 7405); //object(kb_swivelchair1) (14)
    CreateDynamicObject(1714,2108.87036133,-1918.47778320,15569.29687500,0.00000000,0.00000000,261.96252441 , .interiorid = 1, .worldid = 7405); //object(kb_swivelchair1) (15)
    CreateDynamicObject(2119,2107.20898438,-1916.66723633,15569.53808594,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 7405); //object(med_dinning_6) (1)
    CreateDynamicObject(2119,2107.26416016,-1918.56506348,15569.53808594,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 7405); //object(med_dinning_6) (2)
    CreateDynamicObject(2869,2107.06909180,-1916.93798828,15570.33300781,0.00000000,0.00000000,50.00000000 , .interiorid = 1, .worldid = 7405); //object(gb_ornament04) (1)
    CreateDynamicObject(2816,2107.62304688,-1918.04541016,15570.34179688,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(gb_bedmags01) (1)
    CreateDynamicObject(2824,2107.01635742,-1915.08972168,15570.34179688,0.00000000,0.00000000,200.00000000 , .interiorid = 1, .worldid = 7405); //object(gb_novels02) (1)
    CreateDynamicObject(1486,2106.22827148,-1917.69494629,15570.48632812,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(dyn_beer_1) (1)
    CreateDynamicObject(1736,2102.63769531,-1916.89306641,15572.49511719,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 7405); //object(cj_stags_head) (1)
    CreateDynamicObject(14455,2103.35815430,-1921.42077637,15570.96875000,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(gs_bookcase) (5)
    CreateDynamicObject(14455,2107.57470703,-1912.34667969,15570.96875000,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 7405); //object(gs_bookcase) (6)
    CreateDynamicObject(644,2102.58813477,-1912.92431641,15569.52148438,0.00000000,0.00000000,324.00000000 , .interiorid = 1, .worldid = 7405); //object(pot_02) (4)
    CreateDynamicObject(644,2102.55981445,-1920.78247070,15569.52148438,0.00000000,0.00000000,43.99780273 , .interiorid = 1, .worldid = 7405); //object(pot_02) (5)
    CreateDynamicObject(2290,2113.29272461,-1918.79772949,15569.29687500,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 7405); //object(swk_couch_1) (4)
    CreateDynamicObject(2290,2113.24707031,-1912.81652832,15569.29687500,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 7405); //object(swk_couch_1) (5)
    CreateDynamicObject(14455,2113.82861328,-1914.43945312,15570.63867188,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 7405); //object(gs_bookcase) (7)
    CreateDynamicObject(14455,2113.71337891,-1923.56481934,15570.63867188,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 7405); //object(gs_bookcase) (8)
    CreateDynamicObject(644,2113.39892578,-1915.73388672,15569.52148438,0.00000000,0.00000000,213.99475098 , .interiorid = 1, .worldid = 7405); //object(pot_02) (6)
    CreateDynamicObject(1846,2125.28979492,-1919.09655762,15562.40820312,90.00000000,90.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(shop_shelf04) (1)
    CreateDynamicObject(2230,2126.75463867,-1917.78747559,15561.80078125,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 7405); //object(swank_speaker_2) (1)
    CreateDynamicObject(2230,2126.78002930,-1920.98718262,15561.80078125,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 7405); //object(swank_speaker_2) (2)
    CreateDynamicObject(2225,2126.29760742,-1919.26086426,15560.66015625,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 7405); //object(swank_hi_fi_2) (1)
    CreateDynamicObject(646,2125.90869141,-1916.26367188,15562.07714844,0.00000000,0.00000000,109.99755859 , .interiorid = 1, .worldid = 7405); //object(veg_palmkb14) (3)
    CreateDynamicObject(646,2125.75097656,-1921.86804199,15562.07714844,0.00000000,0.00000000,109.99514771 , .interiorid = 1, .worldid = 7405); //object(veg_palmkb14) (4)
    CreateDynamicObject(2290,2122.69287109,-1915.99316406,15560.66699219,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(swk_couch_1) (6)
    CreateDynamicObject(2290,2124.76416016,-1921.78747559,15560.66699219,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 7405); //object(swk_couch_1) (7)
    CreateDynamicObject(2290,2122.12841797,-1920.01794434,15560.66699219,0.00000000,0.00000000,89.99450684 , .interiorid = 1, .worldid = 7405); //object(swk_couch_1) (8)
    CreateDynamicObject(1815,2123.77416992,-1919.53662109,15560.66699219,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(coffee_low_2) (1)
    CreateDynamicObject(2344,2124.09082031,-1919.32727051,15561.17285156,0.00000000,0.00000000,30.00000000 , .interiorid = 1, .worldid = 7405); //object(cj_remote) (1)
    CreateDynamicObject(2816,2124.26440430,-1918.97204590,15561.16308594,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(gb_bedmags01) (3)
    CreateDynamicObject(2964,2118.98901367,-1920.37341309,15560.66015625,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(k_pooltablesm) (1)
    CreateDynamicObject(2965,2119.36132812,-1920.27966309,15561.55175781,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(k_pooltriangle01) (1)
    CreateDynamicObject(2998,2118.61279297,-1920.35437012,15561.58984375,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(k_poolballstp04) (1)
    CreateDynamicObject(3002,2118.65673828,-1920.67456055,15561.58984375,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(k_poolballspt01) (1)
    CreateDynamicObject(2999,2119.08666992,-1920.05163574,15561.58984375,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(k_poolballstp05) (1)
    CreateDynamicObject(2997,2118.22900391,-1920.55407715,15561.59277344,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(k_poolballstp03) (1)
    CreateDynamicObject(3102,2119.73144531,-1920.07421875,15561.58984375,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(k_poolballspt04) (1)
    CreateDynamicObject(3104,2119.43457031,-1920.63757324,15561.58984375,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(k_poolballspt06) (1)
    CreateDynamicObject(3101,2119.43041992,-1920.26904297,15561.58984375,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(k_poolballspt03) (1)
    CreateDynamicObject(3004,2119.43725586,-1920.00329590,15561.57421875,0.00000000,0.00000000,108.00000000 , .interiorid = 1, .worldid = 7405); //object(k_poolq2) (1)
    CreateDynamicObject(3004,2119.28222656,-1919.89062500,15562.03125000,299.29690552,150.37045288,347.61291504 , .interiorid = 1, .worldid = 7405); //object(k_poolq2) (2)
    CreateDynamicObject(2256,2119.61401367,-1915.44030762,15562.29296875,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(frame_clip_3) (2)
    CreateDynamicObject(2255,2123.75366211,-1915.87194824,15562.20507812,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(frame_clip_2) (1)
    CreateDynamicObject(2071,2116.85839844,-1915.96289062,15562.17578125,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(cj_mlight5) (6)
    CreateDynamicObject(2071,2116.68554688,-1922.09179688,15562.17578125,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(cj_mlight5) (7)
    CreateDynamicObject(1491,2116.26831055,-1918.12219238,15560.66699219,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 7405); //object(gen_doorint01) (2)
    CreateDynamicObject(16779,2121.39526367,-1919.57958984,15563.72558594,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(ufo_light02) (2)
    CreateDynamicObject(2255,2111.44873047,-1916.19335938,15562.15332031,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 7405); //object(frame_clip_2) (2)
    CreateDynamicObject(2568,2111.40307617,-1917.74621582,15560.66015625,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 7405); //object(hotel_dresser_3) (1)
    CreateDynamicObject(644,2125.69628906,-1918.58593750,15564.52929688,0.00000000,0.00000000,121.99755859 , .interiorid = 1, .worldid = 7405); //object(pot_02) (10)
    CreateDynamicObject(2255,2119.69360352,-1917.28332520,15569.69335938,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 7405); //object(frame_clip_2) (3)
    CreateDynamicObject(2291,2122.01879883,-1923.92419434,15564.26171875,0.00000000,0.00000000,206.25000000 , .interiorid = 1, .worldid = 7405); //object(swk_single_1) (2)
    CreateDynamicObject(2291,2119.58984375,-1924.30322266,15564.26171875,0.00000000,0.00000000,156.24633789 , .interiorid = 1, .worldid = 7405); //object(swk_single_1) (2)
    CreateDynamicObject(1815,2119.85424805,-1924.89746094,15564.26171875,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(coffee_low_2) (2)
    CreateDynamicObject(2824,2120.41992188,-1924.41772461,15564.75781250,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(gb_novels02) (2)
    CreateDynamicObject(3055,2108.44116211,-1913.39196777,15562.81445312,0.00000000,90.00000000,90.24719238 , .interiorid = 1, .worldid = 7405); //object(kmb_shutter) (1)
    CreateDynamicObject(3961,2105.82153320,-1919.68371582,15562.64941406,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 7405); //object(boxkitch) (1)
    CreateDynamicObject(3095,2109.62304688,-1907.07641602,15560.65234375,179.99450684,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(a51_jetdoor) (1)
    CreateDynamicObject(3055,2110.58837891,-1908.81298828,15565.37109375,0.00000000,0.00000000,90.24719238 , .interiorid = 1, .worldid = 7405); //object(kmb_shutter) (1)
    CreateDynamicObject(3117,2109.53369141,-1910.69738770,15564.84179688,0.00000000,90.00000000,90.00000000 , .interiorid = 1, .worldid = 7405); //object(a51_ventcoverb) (1)
    CreateDynamicObject(14596,2093.32788086,-1914.83496094,15553.96582031,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 7405); //object(paperchase_stairs) (1)
    CreateDynamicObject(3055,2098.94824219,-1913.62976074,15562.87109375,0.00000000,0.00000000,90.24719238 , .interiorid = 1, .worldid = 7405); //object(kmb_shutter) (1)
    CreateDynamicObject(3055,2098.88769531,-1916.32861328,15565.61328125,0.00000000,0.00000000,90.24719238 , .interiorid = 1, .worldid = 7405); //object(kmb_shutter) (1)
    CreateDynamicObject(14738,2109.76782227,-1920.98168945,15557.49121094,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(brothelbar) (2)
    CreateDynamicObject(2765,2099.28173828,-1918.13366699,15557.29980469,0.00000000,90.00000000,90.00000000 , .interiorid = 1, .worldid = 7405); //object(cj_cb_list1) (1)
    CreateDynamicObject(2765,2099.28002930,-1919.52502441,15557.36816406,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 7405); //object(cj_cb_list1) (2)
    CreateDynamicObject(2765,2099.30468750,-1919.52392578,15558.41699219,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 7405); //object(cj_cb_list1) (3)
    CreateDynamicObject(14446,2105.79492188,-1923.05297852,15555.71191406,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 7405); //object(smokes_bed) (1)
    CreateDynamicObject(3598,2105.43969727,-1937.99841309,15552.23535156,180.00000000,0.00000000,269.99450684 , .interiorid = 1, .worldid = 7405); //object(hillhouse01_la) (7)
    CreateDynamicObject(1557,2101.04589844,-1924.94396973,15554.87402344,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(gen_doorext19) (3)
    CreateDynamicObject(1491,2099.72802734,-1918.11828613,15554.87207031,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 7405); //object(gen_doorint01) (3)
    CreateDynamicObject(16151,2114.77319336,-1917.95837402,15555.15332031,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 7405); //object(ufo_bar) (1)
    CreateDynamicObject(2562,2100.31909180,-1923.98901367,15554.87402344,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 7405); //object(hotel_dresser_2) (1)
    CreateDynamicObject(644,2100.34936523,-1924.45397949,15555.16015625,0.00000000,0.00000000,30.00000000 , .interiorid = 1, .worldid = 7405); //object(pot_02) (1)
    CreateDynamicObject(644,2100.49316406,-1917.42102051,15555.16015625,0.00000000,0.00000000,299.99816895 , .interiorid = 1, .worldid = 7405); //object(pot_02) (2)
    CreateDynamicObject(644,2110.49438477,-1917.35925293,15555.16015625,0.00000000,0.00000000,219.99267578 , .interiorid = 1, .worldid = 7405); //object(pot_02) (3)
    CreateDynamicObject(1753,2118.30712891,-1924.36584473,15554.87402344,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 7405); //object(swank_couch_1) (1)
    CreateDynamicObject(1753,2119.23632812,-1921.41088867,15554.87402344,0.00000000,0.00000000,269.99450684 , .interiorid = 1, .worldid = 7405); //object(swank_couch_1) (2)
    CreateDynamicObject(1753,2113.16015625,-1924.24633789,15554.87402344,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 7405); //object(swank_couch_1) (3)
    CreateDynamicObject(2236,2114.26977539,-1924.87231445,15554.88574219,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(coffee_swank_1) (1)
    CreateDynamicObject(644,2109.79931641,-1924.35461426,15555.16015625,0.00000000,0.00000000,109.99816895 , .interiorid = 1, .worldid = 7405); //object(pot_02) (7)
    CreateDynamicObject(2852,2114.77539062,-1924.38464355,15555.39160156,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(gb_bedmags02) (1)
    CreateDynamicObject(2844,2108.63623047,-1923.89953613,15554.87402344,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(gb_bedclothes03) (1)
    CreateDynamicObject(2256,2105.70214844,-1916.89184570,15557.24316406,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(frame_clip_3) (3)
    CreateDynamicObject(2569,2104.23950195,-1917.35974121,15555.06933594,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(hotel_dresser_1) (1)
    CreateDynamicObject(2562,2104.22314453,-1917.04260254,15554.92480469,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(hotel_dresser_2) (2)
    CreateDynamicObject(2344,2104.40161133,-1917.58422852,15555.83593750,0.00000000,0.00000000,290.00000000 , .interiorid = 1, .worldid = 7405); //object(cj_remote) (2)
    CreateDynamicObject(3095,2116.33081055,-1919.96630859,15560.42382812,179.99450684,0.00000000,180.00000000 , .interiorid = 1, .worldid = 7405); //object(a51_jetdoor) (2)
    CreateDynamicObject(1517,2112.65698242,-1919.09948730,15555.95898438,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(dyn_wine_break) (1)
    CreateDynamicObject(1512,2114.84130859,-1918.84460449,15555.95605469,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(dyn_wine_03) (1)
    CreateDynamicObject(1509,2112.12939453,-1918.82238770,15555.95605469,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(dyn_wine_3) (1)
    CreateDynamicObject(1543,2114.18090820,-1919.13635254,15555.75878906,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(cj_beer_b_2) (1)
    CreateDynamicObject(1544,2114.30444336,-1924.32458496,15555.39160156,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(cj_beer_b_1) (1)
    CreateDynamicObject(2714,2097.74975586,-1918.75830078,15557.95800781,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 7405); //object(cj_open_sign_2) (1)
    CreateDynamicObject(3055,2088.98583984,-1917.41674805,15555.57031250,0.00000000,90.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(kmb_shutter) (7)
    CreateDynamicObject(644,2088.00830078,-1918.12915039,15555.16015625,0.00000000,0.00000000,349.99267578 , .interiorid = 1, .worldid = 7405); //object(pot_02) (8)
    CreateDynamicObject(644,2087.89697266,-1921.22680664,15555.16015625,0.00000000,0.00000000,349.99145508 , .interiorid = 1, .worldid = 7405); //object(pot_02) (9)
    CreateDynamicObject(1775,2087.68505859,-1919.69519043,15555.96875000,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 7405); //object(cj_sprunk1) (1)
    CreateDynamicObject(644,2097.40478516,-1908.48925781,15556.99023438,0.00000000,0.00000000,219.99145508 , .interiorid = 1, .worldid = 7405); //object(pot_02) (11)
    CreateDynamicObject(644,2088.22045898,-1921.12463379,15560.91796875,0.00000000,0.00000000,29.99023438 , .interiorid = 1, .worldid = 7405); //object(pot_02) (12)
    CreateDynamicObject(2342,2116.40991211,-1918.88146973,15555.89257812,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(donut_disp) (1)
    CreateDynamicObject(1506,2121.10180664,-1890.75537109,15564.56542969,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 7405); //object(gen_doorext08) (1)

	//Hitman HQ - Chua co Door
    CreateDynamicObject(14425,2487.00000000,-928.29998779,5068.59912109,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(madddoggs14) (1)
    CreateDynamicObject(14388,2487.00000000,-928.29980469,5068.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(madddoggs02) (1)
    CreateDynamicObject(14422,2487.00000000,-928.29980469,5068.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(madddoggs01) (1)
    CreateDynamicObject(14424,2487.00000000,-928.29980469,5068.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(madddoggs13) (1)
    CreateDynamicObject(14390,2487.00000000,-928.29980469,5068.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(madddoggs04) (1)
    CreateDynamicObject(14419,2487.00000000,-928.29980469,5068.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(madddoggs08) (1)
    CreateDynamicObject(14420,2487.00000000,-928.29980469,5068.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(madddoggs09) (1)
    CreateDynamicObject(14421,2535.97949219,-926.17999268,5074.52392578,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(madddoggs10) (1)
    CreateDynamicObject(14423,2487.00000000,-928.29980469,5068.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(madddoggs12) (1)
    CreateDynamicObject(14417,2487.00000000,-928.29980469,5068.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(madddoggs05) (1)
    CreateDynamicObject(2004,2465.28051758,-921.76690674,5067.61962891,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cr_safe_door) (1)
    CreateDynamicObject(1671,2463.94091797,-924.02166748,5065.75976562,0.00000000,0.00000000,24.00000000, .interiorid = 1, .worldid = 6049); //object(swivelchair_a) (1)
    CreateDynamicObject(2207,2463.12109375,-925.63378906,5065.35009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(med_office7_desk_1) (1)
    CreateDynamicObject(2190,2464.44238281,-925.88671875,5066.12744141,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 6049); //object(pc_1) (1)
    CreateDynamicObject(2854,2458.48046875,-924.72686768,5065.85546875,0.00000000,0.00000000,308.00000000, .interiorid = 1, .worldid = 6049); //object(gb_bedmags04) (1)
    CreateDynamicObject(1742,2472.27465820,-924.16760254,5065.35009766,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(med_bookshelf) (1)
    CreateDynamicObject(2811,2471.87475586,-925.98071289,5065.27929688,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(gb_romanpot01) (1)
    CreateDynamicObject(1665,2464.41796875,-926.17089844,5066.18750000,0.00000000,0.00000000,305.99670410, .interiorid = 1, .worldid = 6049); //object(propashtray1) (1)
    CreateDynamicObject(2894,2465.26269531,-925.11816406,5066.12744141,0.00000000,0.00000000,59.99633789, .interiorid = 1, .worldid = 6049); //object(kmb_rhymesbook) (1)
    CreateDynamicObject(1721,2464.97534180,-927.38787842,5065.35009766,0.00000000,0.00000000,24.00000000, .interiorid = 1, .worldid = 6049); //object(est_chair1) (1)
    CreateDynamicObject(1721,2463.07568359,-927.36450195,5065.35009766,0.00000000,0.00000000,335.99963379, .interiorid = 1, .worldid = 6049); //object(est_chair1) (2)
    CreateDynamicObject(1828,2458.52978516,-924.30816650,5065.34716797,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(man_sdr_rug) (2)
    CreateDynamicObject(1713,2457.08666992,-924.91735840,5065.35009766,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(kb_couch04) (1)
    CreateDynamicObject(1708,2459.11694336,-926.16314697,5065.35009766,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6049); //object(kb_chair02) (1)
    CreateDynamicObject(2311,2458.62597656,-924.79003906,5065.35009766,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(cj_tv_table2) (2)
    CreateDynamicObject(2854,2463.15527344,-925.38867188,5066.12744141,0.00000000,0.00000000,307.99621582, .interiorid = 1, .worldid = 6049); //object(gb_bedmags04) (2)
    CreateDynamicObject(2251,2458.65795898,-924.14636230,5066.69824219,0.00000000,0.00000000,102.00000000, .interiorid = 1, .worldid = 6049); //object(plant_pot_20) (1)
    CreateDynamicObject(2852,2458.58447266,-923.42724609,5065.85546875,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(gb_bedmags02) (1)
    CreateDynamicObject(2606,2463.89990234,-929.79998779,5068.50000000,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 6049); //object(cj_police_counter2) (1)
    CreateDynamicObject(2260,2456.97729492,-924.08496094,5067.45263672,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(frame_slim_1) (1)
    CreateDynamicObject(2026,2466.19311523,-925.74383545,5069.83837891,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(mrk_shade_tmp) (1)
    CreateDynamicObject(2606,2463.89990234,-929.79998779,5068.10009766,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 6049); //object(cj_police_counter2) (3)
    CreateDynamicObject(3811,2456.89990234,-944.90002441,5067.79980469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(sfx_winplant08) (1)
    CreateDynamicObject(3811,2456.89990234,-939.29998779,5069.70019531,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(sfx_winplant08) (2)
    CreateDynamicObject(2011,2456.89941406,-954.50000000,5065.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(nu_plant2_ofc) (1)
    CreateDynamicObject(2257,2460.89990234,-944.29998779,5069.20019531,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(frame_clip_4) (1)
    CreateDynamicObject(1491,2472.39941406,-950.52929688,5065.36621094,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (1)
    CreateDynamicObject(1491,2472.39941406,-947.50000000,5065.36621094,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (2)
    CreateDynamicObject(16151,2465.79980469,-946.50000000,5065.89990234,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 6049); //object(ufo_bar) (1)
    CreateDynamicObject(16780,2484.00000000,-941.00000000,5069.89990234,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(ufo_light03) (1)
    CreateDynamicObject(1703,2464.89990234,-939.00000000,5064.50000000,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(kb_couch02) (1)
    CreateDynamicObject(1703,2468.79980469,-939.79980469,5064.50000000,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 6049); //object(kb_couch02) (2)
    CreateDynamicObject(2297,2466.79980469,-935.29980469,5064.50000000,0.00000000,0.00000000,315.99975586, .interiorid = 1, .worldid = 6049); //object(tv_unit_2) (1)
    CreateDynamicObject(2640,2475.79980469,-935.34594727,5065.29980469,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(neil_slot) (1)
    CreateDynamicObject(2640,2475.79882812,-936.19964600,5065.29980469,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(neil_slot) (2)
    CreateDynamicObject(2964,2471.39941406,-937.39941406,5064.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(k_pooltablesm) (1)
    CreateDynamicObject(2964,2472.69921875,-941.09960938,5064.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(k_pooltablesm) (2)
    CreateDynamicObject(2965,2468.50000000,-935.70001221,5064.70019531,357.88140869,58.06280518,317.39361572, .interiorid = 1, .worldid = 6049); //object(k_pooltriangle01) (1)
    CreateDynamicObject(2997,2471.89990234,-937.20001221,5065.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(k_poolballstp03) (1)
    CreateDynamicObject(2996,2471.69995117,-937.50000000,5065.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(k_poolballstp02) (1)
    CreateDynamicObject(2999,2472.30004883,-937.79998779,5065.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(k_poolballstp05) (1)
    CreateDynamicObject(3002,2471.19995117,-937.00000000,5065.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(k_poolballspt01) (1)
    CreateDynamicObject(3104,2471.10009766,-937.79998779,5065.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(k_poolballspt06) (1)
    CreateDynamicObject(638,2475.89941406,-945.59960938,5066.09912109,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(kb_planter_bush) (1)
    CreateDynamicObject(638,2475.89990234,-944.09997559,5066.10009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(kb_planter_bush) (2)
    CreateDynamicObject(2256,2464.30004883,-938.90002441,5067.60009766,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(frame_clip_3) (1)
    CreateDynamicObject(2232,2476.39990234,-945.59997559,5068.70019531,0.00000000,180.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(med_speaker_4) (2)
    CreateDynamicObject(2231,2469.30004883,-935.09997559,5064.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(swank_speaker_3) (1)
    CreateDynamicObject(2101,2467.30004883,-935.40002441,5066.20019531,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(med_hi_fi_3) (1)
    CreateDynamicObject(18092,2484.00000000,-940.29980469,5065.89990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(ammun3_counter) (1)
    CreateDynamicObject(18092,2484.00000000,-940.69921875,5065.89892578,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6049); //object(ammun3_counter) (2)
    CreateDynamicObject(2124,2485.89941406,-941.69921875,5066.20019531,0.00000000,1.99951172,285.99609375, .interiorid = 1, .worldid = 6049); //object(swank_din_chair_1) (1)
    CreateDynamicObject(2124,2484.80004883,-941.70001221,5066.20019531,0.00000000,0.00000000,263.99548340, .interiorid = 1, .worldid = 6049); //object(swank_din_chair_1) (2)
    CreateDynamicObject(2124,2483.50000000,-941.90002441,5066.20019531,0.00000000,0.00000000,275.99548340, .interiorid = 1, .worldid = 6049); //object(swank_din_chair_1) (3)
    CreateDynamicObject(2124,2482.39941406,-941.79980469,5066.20019531,0.00000000,0.00000000,261.99096680, .interiorid = 1, .worldid = 6049); //object(swank_din_chair_1) (4)
    CreateDynamicObject(2124,2485.80004883,-939.09997559,5066.20019531,0.00000000,0.00000000,98.00000000, .interiorid = 1, .worldid = 6049); //object(swank_din_chair_1) (5)
    CreateDynamicObject(2124,2484.69995117,-939.00000000,5066.20019531,0.00000000,0.00000000,89.99804688, .interiorid = 1, .worldid = 6049); //object(swank_din_chair_1) (6)
    CreateDynamicObject(2124,2483.50000000,-939.20001221,5066.20019531,0.00000000,0.00000000,95.99450684, .interiorid = 1, .worldid = 6049); //object(swank_din_chair_1) (7)
    CreateDynamicObject(2124,2482.30004883,-939.09997559,5066.20019531,0.00000000,0.00000000,83.99304199, .interiorid = 1, .worldid = 6049); //object(swank_din_chair_1) (8)
    CreateDynamicObject(1704,2488.10009766,-936.29998779,5065.39990234,0.00000000,0.00000000,22.00000000, .interiorid = 1, .worldid = 6049); //object(kb_chair03) (1)
    CreateDynamicObject(1703,2490.89990234,-936.70001221,5065.39990234,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(kb_couch02) (2)
    CreateDynamicObject(1704,2489.19921875,-939.69921875,5065.39990234,0.00000000,0.00000000,169.99694824, .interiorid = 1, .worldid = 6049); //object(kb_chair03) (2)
    CreateDynamicObject(2227,2477.60009766,-941.29998779,270.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(swank_hi_fi_3) (1)
    CreateDynamicObject(1649,2477.03759766,-940.43872070,5067.70019531,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(wglasssmash) (1)
    CreateDynamicObject(2848,2482.30004883,-941.00000000,5066.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(gb_kitchdirt02) (1)
    CreateDynamicObject(2830,2484.89990234,-940.00000000,5066.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(gb_platedirty04) (1)
    CreateDynamicObject(1664,2484.54077148,-940.06091309,5066.56689453,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(propwinebotl2) (1)
    CreateDynamicObject(1667,2483.29980469,-941.09960938,5066.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(propwineglass1) (1)
    CreateDynamicObject(1667,2484.80004883,-940.90002441,5066.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(propwineglass1) (2)
    CreateDynamicObject(1667,2485.80004883,-940.00000000,5066.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(propwineglass1) (4)
    CreateDynamicObject(2295,2464.80004883,-935.29998779,5064.50000000,0.00000000,0.00000000,34.00000000, .interiorid = 1, .worldid = 6049); //object(cj_beanbag) (1)
    CreateDynamicObject(1484,2482.30004883,-940.20001221,5066.60009766,347.31005859,28.76559448,40.47015381, .interiorid = 1, .worldid = 6049); //object(cj_bear_bottle) (1)
    CreateDynamicObject(2001,2491.64941406,-946.19116211,5065.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(nu_plant_ofc) (1)
    CreateDynamicObject(1808,2491.82373047,-944.68988037,5065.39990234,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(cj_watercooler2) (1)
    CreateDynamicObject(2289,2492.00000000,-941.29998779,5067.60009766,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(frame_2) (1)
    CreateDynamicObject(1491,2485.02001953,-946.92199707,5065.35009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (1)
    CreateDynamicObject(1491,2488.04589844,-946.89941406,5065.35009766,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (2)
    CreateDynamicObject(2288,2481.00000000,-946.29998779,5067.70019531,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6049); //object(frame_3) (1)
    CreateDynamicObject(2305,2513.19995117,-935.09997559,5067.00000000,0.00000000,0.00000000,272.00000000, .interiorid = 1, .worldid = 6049); //object(cj_k3_c_unit) (1)
    CreateDynamicObject(2139,2513.19995117,-929.79998779,5067.00000000,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(cj_k3_low_unit2) (2)
    CreateDynamicObject(2139,2513.19995117,-928.90002441,5067.00000000,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(cj_k3_low_unit2) (3)
    CreateDynamicObject(2139,2513.19995117,-928.00000000,5067.00000000,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(cj_k3_low_unit2) (4)
    CreateDynamicObject(2140,2512.19921875,-924.19921875,5067.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_k3_tall_unit1) (1)
    CreateDynamicObject(2136,2510.19921875,-924.19921875,5067.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_k3_sink) (1)
    CreateDynamicObject(2139,2509.30004883,-924.20001221,5067.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_k3_low_unit2) (6)
    CreateDynamicObject(2135,2508.29980469,-924.19921875,5067.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_k3_cooker) (1)
    CreateDynamicObject(2137,2508.29980469,-926.89941406,5067.00000000,0.00000000,0.00000000,87.99499512, .interiorid = 1, .worldid = 6049); //object(cj_k3_low_unit3) (1)
    CreateDynamicObject(2138,2508.30004883,-927.79998779,5067.00000000,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(cj_k3_low_unit1) (1)
    CreateDynamicObject(2137,2508.29980469,-928.69921875,5067.00000000,0.00000000,0.00000000,87.98400879, .interiorid = 1, .worldid = 6049); //object(cj_k3_low_unit3) (2)
    CreateDynamicObject(2138,2508.30004883,-929.59997559,5067.00000000,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(cj_k3_low_unit1) (2)
    CreateDynamicObject(638,2506.60009766,-937.29998779,5067.70019531,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 6049); //object(kb_planter_bush) (4)
    CreateDynamicObject(638,2506.60009766,-934.70001221,5067.70019531,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 6049); //object(kb_planter_bush) (5)
    CreateDynamicObject(1808,2513.39990234,-933.00000000,5067.00000000,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(cj_watercooler2) (2)
    CreateDynamicObject(2139,2513.19995117,-934.00000000,5067.00000000,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(cj_k3_low_unit2) (8)
    CreateDynamicObject(2745,2514.19995117,-954.70001221,5068.20019531,0.00000000,0.00000000,178.00000000, .interiorid = 1, .worldid = 6049); //object(cj_stat_3) (1)
    CreateDynamicObject(2773,2515.16845703,-954.70196533,5067.45019531,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_airprt_bar) (1)
    CreateDynamicObject(2773,2513.28491211,-954.61682129,5067.45117188,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_airprt_bar) (2)
    CreateDynamicObject(2773,2514.24951172,-953.68267822,5067.49218750,0.00000000,0.00000000,87.99499512, .interiorid = 1, .worldid = 6049); //object(cj_airprt_bar) (3)
    CreateDynamicObject(2124,2514.69995117,-930.50000000,5067.79980469,0.00000000,0.00000000,10.00000000, .interiorid = 1, .worldid = 6049); //object(swank_din_chair_1) (10)
    CreateDynamicObject(2124,2514.89941406,-929.29980469,5067.79980469,0.00000000,0.00000000,347.99743652, .interiorid = 1, .worldid = 6049); //object(swank_din_chair_1) (11)
    CreateDynamicObject(2838,2508.10009766,-929.59997559,5068.10009766,357.99499512,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(gb_takeaway03) (1)
    CreateDynamicObject(2821,2508.10009766,-928.00000000,5068.10009766,0.00000000,0.00000000,310.00000000, .interiorid = 1, .worldid = 6049); //object(gb_foodwrap01) (1)
    CreateDynamicObject(2852,2513.30004883,-928.20001221,5068.04980469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(gb_bedmags02) (2)
    CreateDynamicObject(2850,2510.00000000,-924.09960938,5068.10009766,0.00000000,0.00000000,43.99475098, .interiorid = 1, .worldid = 6049); //object(gb_kitchdirt04) (1)
    CreateDynamicObject(2841,2510.01708984,-927.79870605,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(gb_bedrug03) (1)
    CreateDynamicObject(2257,2506.80004883,-955.00000000,5069.50000000,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6049); //object(frame_clip_4) (2)
    CreateDynamicObject(2207,2523.50000000,-944.29980469,5067.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(med_office7_desk_1) (1)
    CreateDynamicObject(1671,2524.50000000,-942.79998779,5067.39990234,0.00000000,0.00000000,346.00000000, .interiorid = 1, .worldid = 6049); //object(swivelchair_a) (2)
    CreateDynamicObject(2813,2523.60009766,-943.90002441,5067.79980469,0.00000000,0.00000000,150.00000000, .interiorid = 1, .worldid = 6049); //object(gb_novels01) (1)
    CreateDynamicObject(948,2520.50000000,-941.19921875,5067.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(plant_pot_10) (1)
    CreateDynamicObject(2280,2520.59960938,-945.69921875,5069.50000000,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(frame_thick_1) (1)
    CreateDynamicObject(1705,2523.39990234,-945.90002441,5067.00000000,0.00000000,0.00000000,137.99993896, .interiorid = 1, .worldid = 6049); //object(kb_chair04) (1)
    CreateDynamicObject(1705,2525.80004883,-945.59997559,5067.00000000,0.00000000,0.00000000,207.99920654, .interiorid = 1, .worldid = 6049); //object(kb_chair04) (2)
    CreateDynamicObject(1665,2524.10595703,-944.07031250,5067.81250000,0.00000000,0.00000000,305.99121094, .interiorid = 1, .worldid = 6049); //object(propashtray1) (1)
    CreateDynamicObject(1706,2527.30004883,-952.59997559,5067.00000000,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(kb_couch03) (1)
    CreateDynamicObject(2311,2525.69995117,-953.09997559,5067.00000000,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(cj_tv_table2) (2)
    CreateDynamicObject(1704,2526.80004883,-950.20001221,5067.00000000,0.00000000,0.00000000,304.00000000, .interiorid = 1, .worldid = 6049); //object(kb_chair03) (3)
    CreateDynamicObject(2816,2525.80004883,-952.90002441,5067.50000000,0.00000000,0.00000000,135.99993896, .interiorid = 1, .worldid = 6049); //object(gb_bedmags01) (1)
    CreateDynamicObject(1486,2525.69995117,-951.40002441,5067.70019531,0.00000000,0.00000000,357.99499512, .interiorid = 1, .worldid = 6049); //object(dyn_beer_1) (2)
    CreateDynamicObject(1665,2525.60009766,-951.70001221,5067.54980469,0.00000000,0.00000000,305.99670410, .interiorid = 1, .worldid = 6049); //object(propashtray1) (1)
    CreateDynamicObject(1828,2524.19921875,-949.00000000,5067.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(man_sdr_rug) (1)
    CreateDynamicObject(2259,2527.60009766,-943.59997559,5069.20019531,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(frame_clip_6) (1)
    CreateDynamicObject(2573,2547.89990234,-976.00000000,4995.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(hotel_dresser_6) (1)
    CreateDynamicObject(2654,2515.30004883,-977.00000000,4993.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_shoe_box) (2)
    CreateDynamicObject(14399,2495.39990234,-909.59997559,5065.29980469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(bar2) (1)
    CreateDynamicObject(2344,2510.30004883,-921.40002441,5071.79980469,0.00000000,0.00000000,62.00000000, .interiorid = 1, .worldid = 6049); //object(cj_remote) (4)
    CreateDynamicObject(2253,2483.85717773,-940.51763916,5066.67968750,0.00000000,0.00000000,38.00000000, .interiorid = 1, .worldid = 6049); //object(plant_pot_22) (1)
    CreateDynamicObject(2313,2477.52465820,-941.11944580,5065.35009766,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(cj_tv_table1) (2)
    CreateDynamicObject(2231,2476.66552734,-937.51025391,5068.33447266,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(swank_speaker_3) (5)
    CreateDynamicObject(2231,2476.66552734,-942.92871094,5068.33886719,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(swank_speaker_3) (6)
    CreateDynamicObject(14455,2478.39086914,-946.66564941,5067.02197266,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(gs_bookcase) (1)
    CreateDynamicObject(14532,2478.01684570,-935.66955566,5066.33300781,0.00000000,0.00000000,242.00000000, .interiorid = 1, .worldid = 6049); //object(tv_stand_driv) (1)
    CreateDynamicObject(2233,2491.45336914,-939.66406250,5065.35302734,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(swank_speaker_4) (1)
    CreateDynamicObject(2233,2491.45214844,-936.46313477,5065.35302734,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(swank_speaker_4) (2)
    CreateDynamicObject(2293,2489.31811523,-937.76745605,5065.35009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(swk_1_fstool) (1)
    CreateDynamicObject(2640,2475.77490234,-937.04241943,5065.29296875,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(neil_slot) (2)
    CreateDynamicObject(2640,2475.75781250,-937.89160156,5065.29296875,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(neil_slot) (2)
    CreateDynamicObject(970,2471.53466797,-946.95245361,5065.90136719,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(fencesmallb) (1)
    CreateDynamicObject(14418,2518.66113281,-963.73925781,5074.52001953,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(madddoggs07) (1)
    CreateDynamicObject(2395,2511.09179688,-929.21777344,5071.04687500,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(cj_sports_wall) (1)
    CreateDynamicObject(1491,2511.04980469,-931.24023438,5071.27392578,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (3)
    CreateDynamicObject(2957,2521.73242188,-932.40722656,5072.82373047,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(chinatgaragedoor) (2)
    CreateDynamicObject(18092,2503.15478516,-928.97967529,5071.74414062,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(ammun3_counter) (3)
    CreateDynamicObject(2509,2502.97363281,-928.02648926,5073.18652344,0.00000000,90.00000000,89.99981689, .interiorid = 1, .worldid = 6049); //object(cj_hobby_shelf_6) (2)
    CreateDynamicObject(2509,2502.97363281,-929.91601562,5073.18652344,0.00000000,90.00000000,89.99993896, .interiorid = 1, .worldid = 6049); //object(cj_hobby_shelf_6) (3)
    CreateDynamicObject(2035,2503.02709961,-929.97918701,5073.54492188,90.00000000,153.43493652,296.56506348, .interiorid = 1, .worldid = 6049); //object(cj_m16) (1)
    CreateDynamicObject(2035,2503.02636719,-929.97851562,5073.17138672,90.00000000,160.52667236,289.46783447, .interiorid = 1, .worldid = 6049); //object(cj_m16) (2)
    CreateDynamicObject(2035,2503.02636719,-929.97851562,5072.77294922,90.00000000,196.78346252,253.20553589, .interiorid = 1, .worldid = 6049); //object(cj_m16) (3)
    CreateDynamicObject(2036,2503.02343750,-928.62091064,5073.58007812,90.00000000,210.00000000,240.00000000, .interiorid = 1, .worldid = 6049); //object(cj_psg1) (1)
    CreateDynamicObject(2036,2503.02343750,-928.62011719,5073.18164062,90.00000000,160.52929688,289.46520996, .interiorid = 1, .worldid = 6049); //object(cj_psg1) (2)
    CreateDynamicObject(2036,2503.02343750,-928.62011719,5072.80810547,90.00000000,160.52673340,289.46228027, .interiorid = 1, .worldid = 6049); //object(cj_psg1) (3)
    CreateDynamicObject(2044,2503.05395508,-927.53839111,5073.57080078,90.00000000,175.02557373,274.97442627, .interiorid = 1, .worldid = 6049); //object(cj_mp5k) (1)
    CreateDynamicObject(2044,2503.05371094,-927.53808594,5073.17236328,90.00000000,184.95814514,265.03634644, .interiorid = 1, .worldid = 6049); //object(cj_mp5k) (2)
    CreateDynamicObject(2044,2503.05371094,-927.53808594,5072.74902344,90.00000000,175.06359863,274.92541504, .interiorid = 1, .worldid = 6049); //object(cj_mp5k) (3)
    CreateDynamicObject(2985,2506.87011719,-927.19989014,5071.27001953,0.00000000,0.00000000,348.00000000, .interiorid = 1, .worldid = 6049); //object(minigun_base) (1)
    CreateDynamicObject(2969,2510.64843750,-926.74237061,5071.39648438,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(level_ammobox) (1)
    CreateDynamicObject(2969,2510.65380859,-927.51940918,5071.39648438,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(level_ammobox) (2)
    CreateDynamicObject(2969,2510.63256836,-928.28540039,5071.39648438,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(level_ammobox) (3)
    CreateDynamicObject(2969,2510.65332031,-927.89392090,5071.64550781,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(level_ammobox) (4)
    CreateDynamicObject(2969,2510.65576172,-927.07330322,5071.65625000,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(level_ammobox) (5)
    CreateDynamicObject(2969,2510.65527344,-927.47363281,5071.90527344,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(level_ammobox) (7)
    CreateDynamicObject(3015,2503.36523438,-931.86590576,5071.27685547,0.00000000,0.00000000,32.00000000, .interiorid = 1, .worldid = 6049); //object(cr_cratestack) (1)
    CreateDynamicObject(2969,2503.43139648,-930.93487549,5072.37109375,0.00000000,0.00000000,142.00000000, .interiorid = 1, .worldid = 6049); //object(level_ammobox) (8)
    CreateDynamicObject(2058,2510.94091797,-928.35943604,5073.13916016,90.00000000,215.26438904,54.73559570, .interiorid = 1, .worldid = 6049); //object(cj_gun_docs) (1)
    CreateDynamicObject(2058,2510.92871094,-927.41162109,5074.16503906,90.00000000,180.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(cj_gun_docs) (3)
    CreateDynamicObject(2058,2510.97363281,-926.78112793,5073.12158203,90.00000000,150.00234985,119.99218750, .interiorid = 1, .worldid = 6049); //object(cj_gun_docs) (4)
    CreateDynamicObject(2068,2507.08374023,-929.05187988,5075.54052734,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_cammo_net) (1)
    CreateDynamicObject(2064,2507.69433594,-931.35888672,5071.90625000,0.00000000,0.00000000,118.00000000, .interiorid = 1, .worldid = 6049); //object(cj_feildgun) (1)
    CreateDynamicObject(2060,2505.78271484,-931.87866211,5071.43359375,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_sandbag) (1)
    CreateDynamicObject(2060,2504.67626953,-931.88000488,5071.43359375,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_sandbag) (2)
    CreateDynamicObject(2060,2504.76562500,-931.84887695,5071.74902344,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_sandbag) (3)
    CreateDynamicObject(2060,2505.13720703,-931.78277588,5072.06445312,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_sandbag) (4)
    CreateDynamicObject(2060,2505.67138672,-931.75146484,5071.74902344,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_sandbag) (5)
    CreateDynamicObject(1828,2507.52758789,-928.98944092,5071.27001953,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(man_sdr_rug) (3)
    CreateDynamicObject(16775,2513.80371094,-933.63378906,5071.14648438,90.00000000,177.16577148,272.83422852, .interiorid = 1, .worldid = 6049); //object(door_savhangr2) (1)
    CreateDynamicObject(2044,2503.64208984,-930.36230469,5072.27197266,0.00000000,0.00000000,56.00000000, .interiorid = 1, .worldid = 6049); //object(cj_mp5k) (4)
    CreateDynamicObject(2044,2503.64379883,-930.05645752,5072.27197266,0.00000000,0.00000000,59.99737549, .interiorid = 1, .worldid = 6049); //object(cj_mp5k) (5)
    CreateDynamicObject(2037,2503.30175781,-930.30267334,5072.31689453,0.00000000,0.00000000,136.00000000, .interiorid = 1, .worldid = 6049); //object(cj_pistol_ammo) (1)
    CreateDynamicObject(2037,2503.29833984,-930.12658691,5072.31689453,0.00000000,0.00000000,135.99975586, .interiorid = 1, .worldid = 6049); //object(cj_pistol_ammo) (2)
    CreateDynamicObject(1654,2503.41894531,-929.72357178,5072.46191406,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(dynamite) (1)
    CreateDynamicObject(1654,2503.37304688,-929.52136230,5072.46191406,0.00000000,0.00000000,136.00000000, .interiorid = 1, .worldid = 6049); //object(dynamite) (2)
    CreateDynamicObject(1650,2503.46313477,-927.07653809,5072.55126953,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(petrolcanm) (2)
    CreateDynamicObject(1672,2503.68969727,-929.25134277,5072.45019531,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(gasgrenade) (1)
    CreateDynamicObject(1672,2503.72363281,-929.36785889,5072.39990234,0.00000000,0.00000000,128.00000000, .interiorid = 1, .worldid = 6049); //object(gasgrenade) (2)
    CreateDynamicObject(2045,2503.70166016,-928.67944336,5072.31250000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_bbat_nails) (1)
    CreateDynamicObject(2045,2503.50683594,-928.66229248,5072.31250000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_bbat_nails) (2)
    CreateDynamicObject(2057,2503.43652344,-927.60394287,5072.41503906,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(flame_tins) (1)
    CreateDynamicObject(2061,2503.32006836,-928.11511230,5072.53662109,0.00000000,0.00000000,114.00000000, .interiorid = 1, .worldid = 6049); //object(cj_shells1) (1)
    CreateDynamicObject(2061,2503.57421875,-927.99218750,5072.53662109,0.00000000,0.00000000,25.99914551, .interiorid = 1, .worldid = 6049); //object(cj_shells1) (2)
    CreateDynamicObject(2037,2503.34155273,-928.91754150,5072.31689453,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_pistol_ammo) (3)
    CreateDynamicObject(2037,2503.32519531,-928.70623779,5072.31689453,0.00000000,0.00000000,26.00000000, .interiorid = 1, .worldid = 6049); //object(cj_pistol_ammo) (4)
    CreateDynamicObject(2190,2524.72167969,-944.40814209,5067.77734375,0.00000000,0.00000000,184.00000000, .interiorid = 1, .worldid = 6049); //object(pc_1) (2)
    CreateDynamicObject(14455,2526.34570312,-940.71154785,5068.64697266,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6049); //object(gs_bookcase) (2)
    CreateDynamicObject(2290,2476.52099609,-947.59014893,5065.35693359,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(swk_couch_1) (1)
    CreateDynamicObject(2290,2480.20019531,-947.62005615,5065.35693359,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(swk_couch_1) (2)
    CreateDynamicObject(16151,2487.15039062,-953.93652344,5065.69873047,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(ufo_bar) (1)
    CreateDynamicObject(1541,2485.53906250,-953.41833496,5066.50634766,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6049); //object(cj_beer_taps_1) (1)
    CreateDynamicObject(1486,2490.51049805,-953.64709473,5066.46923828,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(dyn_beer_1) (5)
    CreateDynamicObject(1486,2488.84594727,-952.90197754,5066.44921875,0.00000000,0.00000000,142.00000000, .interiorid = 1, .worldid = 6049); //object(dyn_beer_1) (6)
    CreateDynamicObject(1486,2487.35131836,-952.90679932,5066.44921875,0.00000000,0.00000000,232.00000000, .interiorid = 1, .worldid = 6049); //object(dyn_beer_1) (7)
    CreateDynamicObject(1665,2490.32983398,-953.41113281,5066.35937500,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(propashtray1) (2)
    CreateDynamicObject(1665,2487.72241211,-953.02465820,5066.35937500,0.00000000,0.00000000,106.00000000, .interiorid = 1, .worldid = 6049); //object(propashtray1) (3)
    CreateDynamicObject(14418,2555.52929688,-924.79980469,5074.52880859,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(madddoggs07) (2)
    CreateDynamicObject(2395,2517.45874023,-934.51043701,5071.24658203,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(cj_sports_wall) (2)
    CreateDynamicObject(1491,2517.58300781,-939.26562500,5071.27148438,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (4)
    CreateDynamicObject(3383,2525.45214844,-938.19531250,5072.43408203,295.99996948,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(a51_labtable1_) (1)
    CreateDynamicObject(3384,2523.85839844,-936.24407959,5072.49218750,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(a51_halbox_) (1)
    CreateDynamicObject(2957,2505.86816406,-925.84570312,5072.88964844,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(chinatgaragedoor) (3)
    CreateDynamicObject(2603,2522.91088867,-939.21136475,5071.73193359,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(police_cell_bed) (1)
    CreateDynamicObject(2603,2522.88281250,-937.61621094,5071.73193359,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(police_cell_bed) (2)
    CreateDynamicObject(2155,2523.85498047,-933.81359863,5071.27880859,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(cj_k5_low_unit4) (1)
    CreateDynamicObject(2155,2523.85595703,-934.64019775,5071.27880859,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(cj_k5_low_unit4) (2)
    CreateDynamicObject(2146,2518.28051758,-935.45251465,5071.76416016,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_trolly1) (1)
    CreateDynamicObject(2044,2523.70336914,-933.64636230,5072.35937500,0.00000000,0.00000000,234.00000000, .interiorid = 1, .worldid = 6049); //object(cj_mp5k) (6)
    CreateDynamicObject(2709,2523.81274414,-934.75433350,5072.47167969,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(pain_killer) (1)
    CreateDynamicObject(2709,2523.56860352,-934.62774658,5072.47167969,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(pain_killer) (2)
    CreateDynamicObject(2690,2523.77416992,-934.08422852,5072.69140625,0.00000000,0.00000000,304.00000000, .interiorid = 1, .worldid = 6049); //object(cj_fire_ext) (1)
    CreateDynamicObject(1893,2520.47753906,-935.54339600,5076.02441406,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(shoplight1) (1)
    CreateDynamicObject(1893,2520.36523438,-937.98834229,5076.02441406,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(shoplight1) (2)
    CreateDynamicObject(3265,2511.73754883,-932.23394775,5071.24658203,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(privatesign4) (1)
    CreateDynamicObject(3384,2518.53125000,-932.97558594,5072.57177734,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(a51_halbox_) (2)
    CreateDynamicObject(3095,2504.03857422,-931.05975342,5065.43554688,90.00000000,180.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(a51_jetdoor) (5)
    CreateDynamicObject(3095,2500.17456055,-931.08648682,5065.43554688,90.00000000,179.99450684,270.00000000, .interiorid = 1, .worldid = 6049); //object(a51_jetdoor) (6)
    CreateDynamicObject(3095,2504.60180664,-931.03839111,5065.65527344,90.00000000,180.00549316,90.00000000, .interiorid = 1, .worldid = 6049); //object(a51_jetdoor) (7)
    CreateDynamicObject(3095,2500.73608398,-931.04296875,5067.22363281,90.00000000,179.99450684,90.01101685, .interiorid = 1, .worldid = 6049); //object(a51_jetdoor) (8)
    CreateDynamicObject(14437,2502.25146484,-927.05206299,5067.34521484,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(carter-bars) (1)
    CreateDynamicObject(14437,2498.50683594,-926.86297607,5067.34521484,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(carter-bars) (2)
    CreateDynamicObject(2603,2503.42407227,-929.29302979,5065.74853516,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(police_cell_bed) (3)
    CreateDynamicObject(2603,2499.47900391,-929.17193604,5065.80322266,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(police_cell_bed) (4)
    CreateDynamicObject(2602,2497.44067383,-930.05877686,5065.87304688,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6049); //object(police_cell_toilet) (1)
    CreateDynamicObject(2602,2501.38964844,-930.06854248,5065.87353516,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 6049); //object(police_cell_toilet) (2)
    CreateDynamicObject(16378,2505.11401367,-921.68255615,5066.10400391,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(des_byofficeint) (1)
    CreateDynamicObject(2290,2497.75708008,-918.93737793,5065.35009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(swk_couch_1) (3)
    CreateDynamicObject(948,2527.69042969,-941.19335938,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(plant_pot_10) (1)
    CreateDynamicObject(948,2497.23242188,-922.03643799,5065.35009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(plant_pot_10) (1)
    CreateDynamicObject(14680,2504.96337891,-925.68188477,5068.44335938,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(int_tat_lights01) (1)
    CreateDynamicObject(1433,2498.74682617,-920.78570557,5065.52441406,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(dyn_table_1) (1)
    CreateDynamicObject(2957,2502.42382812,-918.30468750,5066.96972656,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(chinatgaragedoor) (4)
    CreateDynamicObject(1828,2503.94799805,-921.53283691,5065.35009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(man_sdr_rug) (4)
    CreateDynamicObject(1499,2496.65209961,-925.61810303,5065.35009766,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint05) (1)
    CreateDynamicObject(1499,2496.63769531,-922.62402344,5065.35009766,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint05) (2)
    CreateDynamicObject(3265,2496.55151367,-926.57006836,5065.35693359,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(privatesign4) (2)
    CreateDynamicObject(9244,2512.60009766,-912.70001221,5076.39990234,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(hrborbuild_sfn01) (1)
    CreateDynamicObject(1997,2520.16284180,-933.03344727,5071.27880859,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(hos_trolley) (1)
    CreateDynamicObject(1586,2505.14160156,-932.30712891,5072.74609375,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(tar_civ1) (1)
    CreateDynamicObject(14651,2514.35766602,-946.63085938,5069.09179688,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(trukstp05) (1)
    CreateDynamicObject(1432,2508.33837891,-946.94482422,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(dyn_table_2) (1)
    CreateDynamicObject(1432,2510.82324219,-951.10955811,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(dyn_table_2) (2)
    CreateDynamicObject(1432,2503.58544922,-949.82598877,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(dyn_table_2) (3)
    CreateDynamicObject(1432,2505.80786133,-952.78704834,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(dyn_table_2) (4)
    CreateDynamicObject(14651,2506.83959961,-942.97753906,5069.06738281,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(trukstp05) (4)
    CreateDynamicObject(2681,2502.77172852,-943.93328857,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_coin_op) (1)
    CreateDynamicObject(2779,2503.83642578,-943.91326904,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_coin_op_2) (1)
    CreateDynamicObject(1828,2478.65039062,-951.23498535,5065.35009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(man_sdr_rug) (5)
    CreateDynamicObject(2424,2508.26000977,-930.97674561,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_ff_conter_1) (1)
    CreateDynamicObject(2424,2509.18115234,-930.97766113,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_ff_conter_1) (2)
    CreateDynamicObject(2424,2510.11279297,-930.97607422,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_ff_conter_1) (3)
    CreateDynamicObject(2423,2511.01831055,-930.97564697,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_ff_conter_1b) (1)
    CreateDynamicObject(2032,2510.00903320,-927.23205566,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(med_dinning_2) (1)
    CreateDynamicObject(1739,2509.40576172,-927.26580811,5067.86816406,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6049); //object(swank_din_chair_5) (2)
    CreateDynamicObject(1739,2510.58105469,-926.44744873,5067.86816406,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(swank_din_chair_5) (3)
    CreateDynamicObject(1739,2510.48779297,-928.14038086,5067.86816406,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(swank_din_chair_5) (4)
    CreateDynamicObject(1739,2511.67382812,-927.29919434,5067.86816406,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(swank_din_chair_5) (5)
    CreateDynamicObject(1361,2475.92211914,-933.59753418,5066.09716797,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_bush_prop2) (1)
    CreateDynamicObject(1361,2495.81811523,-929.52770996,5066.09326172,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_bush_prop2) (2)
    CreateDynamicObject(1491,2460.00561523,-929.93249512,5065.35009766,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (5)
    CreateDynamicObject(1491,2472.32348633,-926.58569336,5065.35009766,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (6)
    CreateDynamicObject(1491,2472.35156250,-929.61718750,5065.35009766,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (7)
    CreateDynamicObject(1491,2456.97338867,-929.95690918,5065.35009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (8)
    CreateDynamicObject(1557,2519.90014648,-954.52532959,5066.97509766,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorext19) (6)
    CreateDynamicObject(1557,2519.89794922,-951.50402832,5066.97509766,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorext19) (7)
    CreateDynamicObject(1557,2512.75634766,-939.88317871,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorext19) (8)
    CreateDynamicObject(1557,2515.76708984,-939.88183594,5066.97509766,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorext19) (9)
    CreateDynamicObject(1491,2511.77246094,-939.91680908,5066.97509766,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (2)
    CreateDynamicObject(1491,2508.75366211,-939.93054199,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (2)
    CreateDynamicObject(1491,2519.86523438,-947.49279785,5067.00488281,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (2)
    CreateDynamicObject(1491,2519.90161133,-950.52288818,5067.00488281,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (2)
    CreateDynamicObject(1557,2493.69995117,-921.79998779,5065.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorext19) (11)
    CreateDynamicObject(9244,2492.25195312,-911.74328613,5070.11669922,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(hrborbuild_sfn01) (2)
    CreateDynamicObject(948,2492.81884766,-922.21185303,5065.35009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(plant_pot_10) (1)
    CreateDynamicObject(948,2496.13256836,-922.31329346,5065.35009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(plant_pot_10) (1)
    CreateDynamicObject(2011,2472.87744141,-930.33251953,5065.35400391,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(nu_plant2_ofc) (1)
    CreateDynamicObject(14395,2501.76684570,-943.27703857,5069.11523438,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(dr_gsnew11) (1)
    CreateDynamicObject(14394,2497.64794922,-951.01300049,5066.15478516,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(dr_gsnew10) (1)
    CreateDynamicObject(2232,2476.39990234,-935.70001221,5068.70019531,0.00000000,179.99450684,270.00000000, .interiorid = 1, .worldid = 6049); //object(med_speaker_4) (2)
    CreateDynamicObject(2232,2464.10009766,-949.59997559,5068.70019531,0.00000000,179.99450684,90.00000000, .interiorid = 1, .worldid = 6049); //object(med_speaker_4) (2)
    CreateDynamicObject(2232,2464.09960938,-935.59960938,5068.70019531,0.00000000,179.99450684,90.00000000, .interiorid = 1, .worldid = 6049); //object(med_speaker_4) (2)
    CreateDynamicObject(14421,2487.00000000,-928.39941406,5068.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(madddoggs10) (1)
    CreateDynamicObject(3095,2521.89990234,-927.00000000,5070.70019531,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(a51_jetdoor) (1)
    CreateDynamicObject(3095,2521.50000000,-920.40002441,5070.70019531,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(a51_jetdoor) (2)
    CreateDynamicObject(3095,2526.50000000,-920.09997559,5070.70019531,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(a51_jetdoor) (3)
    CreateDynamicObject(3095,2526.60009766,-928.70001221,5070.70019531,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(a51_jetdoor) (4)
    CreateDynamicObject(16775,2514.50000000,-925.29998779,5071.10009766,90.00000000,163.89672852,286.09777832, .interiorid = 1, .worldid = 6049); //object(door_savhangr2) (1)
    CreateDynamicObject(16775,2517.39990234,-916.79998779,5074.89990234,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(door_savhangr2) (1)
    CreateDynamicObject(16775,2523.30004883,-916.09997559,5074.89990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(door_savhangr2) (1)
    CreateDynamicObject(16775,2524.80004883,-931.40002441,5074.89990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(door_savhangr2) (1)
    CreateDynamicObject(16775,2529.69995117,-922.79998779,5074.89990234,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(door_savhangr2) (1)
    CreateDynamicObject(2957,2516.89990234,-922.00000000,5073.60009766,0.00000000,90.00000000,89.99993896, .interiorid = 1, .worldid = 6049); //object(chinatgaragedoor) (3)
    CreateDynamicObject(2957,2517.50000000,-930.29998779,5073.89990234,0.00000000,90.00000000,89.99993896, .interiorid = 1, .worldid = 6049); //object(chinatgaragedoor) (3)
    CreateDynamicObject(2951,2517.00000000,-930.59997559,5071.20019531,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(a51_labdoor) (1)
    CreateDynamicObject(2951,2517.00000000,-932.90002441,5071.20019531,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(a51_labdoor) (2)
    CreateDynamicObject(2957,2529.69995117,-929.90002441,5072.89990234,0.00000000,90.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(chinatgaragedoor) (3)
    CreateDynamicObject(2208,2522.30004883,-918.29998779,5071.29980469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(med_office7_unit_1) (1)
    CreateDynamicObject(2773,2521.50000000,-917.40002441,5071.79980469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_airprt_bar) (4)
    CreateDynamicObject(14820,2523.60009766,-918.29998779,5072.29980469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(dj_stuff) (1)
    CreateDynamicObject(2773,2525.69995117,-917.40002441,5071.79980469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_airprt_bar) (8)
    CreateDynamicObject(2232,2522.60009766,-916.09997559,5074.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(med_speaker_4) (1)
    CreateDynamicObject(2232,2524.69995117,-916.09997559,5074.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(med_speaker_4) (4)
    CreateDynamicObject(2232,2523.65991211,-916.20001221,5073.20019531,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(med_speaker_4) (5)
    CreateDynamicObject(18102,2524.50000000,-919.40002441,5076.29980469,0.00000000,0.00000000,92.00000000, .interiorid = 1, .worldid = 6049); //object(light_box1) (1)
    CreateDynamicObject(16151,2526.10009766,-930.20001221,5071.60009766,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(ufo_bar) (2)
    CreateDynamicObject(1703,2521.19995117,-930.59997559,5071.29980469,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6049); //object(kb_couch02) (3)
    CreateDynamicObject(1703,2526.89990234,-916.79998779,5071.29980469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(kb_couch02) (4)
    CreateDynamicObject(2126,2519.69995117,-929.20001221,5071.29980469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(coffee_swank_5) (1)
    CreateDynamicObject(14651,2526.80004883,-924.40002441,5073.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(trukstp05) (5)
    CreateDynamicObject(14651,2522.69995117,-924.40002441,5073.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(trukstp05) (6)
    CreateDynamicObject(1515,2518.80004883,-916.70001221,5071.29980469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(dyn_slot_prop) (1)
    CreateDynamicObject(1515,2519.60009766,-916.70001221,5071.29980469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(dyn_slot_prop) (2)
    CreateDynamicObject(1703,2518.09960938,-929.69921875,5071.29980469,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(kb_couch02) (5)
    CreateDynamicObject(14434,2519.50000000,-918.09997559,5075.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(carter-spotlight42) (1)
    CreateDynamicObject(14434,2527.30004883,-930.70001221,5075.39990234,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6049); //object(carter-spotlight42) (3)
    CreateDynamicObject(2126,2527.50000000,-919.09997559,5071.29980469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(coffee_swank_5) (2)
    CreateDynamicObject(2780,2523.19995117,-918.79998779,5066.20019531,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_smoke_mach) (1)
    CreateDynamicObject(1828,2522.19995117,-923.79998779,5071.29980469,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(man_sdr_rug) (7)
    CreateDynamicObject(1828,2526.30004883,-923.79998779,5071.29980469,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(man_sdr_rug) (8)
    CreateDynamicObject(1486,2527.80004883,-929.20001221,5072.39013672,0.00000000,0.00000000,132.00000000, .interiorid = 1, .worldid = 6049); //object(dyn_beer_1) (8)
    CreateDynamicObject(1486,2523.30004883,-929.09997559,5072.39013672,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(dyn_beer_1) (9)
    CreateDynamicObject(1486,2527.39990234,-918.29998779,5071.91992188,0.00000000,0.00000000,104.00000000, .interiorid = 1, .worldid = 6049); //object(dyn_beer_1) (12)
    CreateDynamicObject(2257,2529.50000000,-924.00000000,5073.60009766,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(frame_clip_4) (3)
    CreateDynamicObject(1491,2517.39990234,-927.25000000,5071.29980469,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (4)
    CreateDynamicObject(1491,2517.39990234,-924.21002197,5071.29980469,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (4)
    CreateDynamicObject(2286,2514.30004883,-922.79998779,5074.10009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(frame_5) (1)
    CreateDynamicObject(1364,2514.29980469,-923.69921875,5072.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_bush_prop) (2)
    CreateDynamicObject(16662,2484.69995117,-935.00000000,5075.39990234,64.00000000,90.00000000,269.99996948, .interiorid = 1, .worldid = 6049); //object(a51_radar_stuff) (1)
    CreateDynamicObject(16775,2511.60009766,-935.79998779,5078.89990234,0.00000000,90.00000000,89.99996948, .interiorid = 1, .worldid = 6049); //object(door_savhangr2) (1)
    CreateDynamicObject(16775,2511.60009766,-923.59997559,5078.89990234,0.00000000,90.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(door_savhangr2) (1)

	//Ngoai canh - Khong can Door
	CreateDynamicObject(5715,2037.46191406,-1183.64770508,25.69935417,0.00000000,0.00000000,270.00000000); //object(grave08_law) (1)
	CreateDynamicObject(5777,2019.44055176,-1193.51745605,22.37747383,0.00000000,0.00000000,0.00000000); //object(tombston01_lawn) (1)
	CreateDynamicObject(637,2024.01770020,-1202.21813965,21.98656845,0.00000000,0.00000000,56.00000000); //object(kb_planterbox) (3)
	CreateDynamicObject(2895,2023.30090332,-1201.69226074,22.29654884,0.00000000,0.00000000,146.00000000); //object(fun_flower_law) (5)
	CreateDynamicObject(16101,2016.74023438,-1200.96789551,22.37857246,0.00000000,0.00000000,0.00000000); //object(des_windsockpole) (1)
	CreateDynamicObject(16101,2016.75219727,-1185.92175293,22.37777138,0.00000000,0.00000000,0.00000000); //object(des_windsockpole) (2)
	CreateDynamicObject(11245,2017.12145996,-1200.61523438,25.97312164,0.00000000,289.27355957,44.00000000); //object(sfsefirehseflag) (2)
	CreateDynamicObject(11245,2017.14172363,-1185.55798340,25.97312164,0.00000000,290.37963867,44.00000000); //object(sfsefirehseflag) (3)
	CreateDynamicObject(997,2043.59216309,-1195.60351562,22.47130585,0.00000000,0.00000000,270.01403809); //object(lhouse_barrier3) (2)
	CreateDynamicObject(994,2016.75329590,-1192.77648926,22.48513985,0.00000000,0.00000000,90.00000000); //object(lhouse_barrier2) (9)
	CreateDynamicObject(1215,2026.63464355,-1203.99450684,22.35100365,0.00000000,0.00000000,0.00000000); //object(bollardlight) (2)
	CreateDynamicObject(6417,2075.84252930,-1195.25170898,5.32931137,0.00000000,0.00000000,270.00000000); //object(lawborder2c_law2) (1)
	CreateDynamicObject(994,2016.73718262,-1200.45788574,22.48513985,0.00000000,0.00000000,90.00000000); //object(lhouse_barrier2) (9)
	CreateDynamicObject(994,2017.15087891,-1201.25085449,22.48513985,0.00000000,0.00000000,326.00000000); //object(lhouse_barrier2) (9)
	CreateDynamicObject(994,2022.34851074,-1204.75622559,22.48513985,0.00000000,0.00000000,325.99731445); //object(lhouse_barrier2) (9)
	CreateDynamicObject(994,2027.54516602,-1208.26342773,22.48513985,0.00000000,0.00000000,325.99731445); //object(lhouse_barrier2) (9)
	CreateDynamicObject(994,2032.99487305,-1211.79345703,22.48513985,0.00000000,0.00000000,32.29147339); //object(lhouse_barrier2) (9)
	CreateDynamicObject(994,2038.29357910,-1208.44580078,22.48513985,0.00000000,0.00000000,32.28881836); //object(lhouse_barrier2) (9)
	CreateDynamicObject(994,2017.25891113,-1185.57495117,22.48513985,0.00000000,0.00000000,35.99731445); //object(lhouse_barrier2) (9)
	CreateDynamicObject(994,2022.32946777,-1181.89245605,22.48513985,0.00000000,0.00000000,35.99670410); //object(lhouse_barrier2) (9)
	CreateDynamicObject(994,2027.39953613,-1178.20593262,22.48513985,0.00000000,0.00000000,35.99670410); //object(lhouse_barrier2) (9)
	CreateDynamicObject(994,2032.69238281,-1174.50610352,22.48513985,0.00000000,0.00000000,326.52954102); //object(lhouse_barrier2) (9)
	CreateDynamicObject(994,2037.92224121,-1177.96032715,22.48513985,0.00000000,0.00000000,326.52465820); //object(lhouse_barrier2) (9)
	CreateDynamicObject(5777,2019.91687012,-1195.43188477,22.37747383,0.00000000,0.00000000,30.00000000); //object(tombston01_lawn) (1)
	CreateDynamicObject(5777,2019.90454102,-1191.61596680,22.37747383,0.00000000,0.00000000,330.00000000); //object(tombston01_lawn) (1)
	CreateDynamicObject(637,2029.17529297,-1205.74047852,21.98656845,0.00000000,0.00000000,55.99731445); //object(kb_planterbox) (3)
	CreateDynamicObject(2895,2024.06701660,-1202.19689941,22.29654884,0.00000000,0.00000000,145.99731445); //object(fun_flower_law) (5)
	CreateDynamicObject(2895,2024.80578613,-1202.70703125,22.29654884,0.00000000,0.00000000,145.99734497); //object(fun_flower_law) (5)
	CreateDynamicObject(2895,2028.43481445,-1205.22485352,22.29654884,0.00000000,0.00000000,145.99731445); //object(fun_flower_law) (5)
	CreateDynamicObject(2895,2029.13793945,-1205.69714355,22.29654884,0.00000000,0.00000000,145.99731445); //object(fun_flower_law) (5)
	CreateDynamicObject(2895,2029.92883301,-1206.25256348,22.29654884,0.00000000,0.00000000,145.99731445); //object(fun_flower_law) (5)
	CreateDynamicObject(637,2023.93322754,-1184.18359375,21.98656845,0.00000000,0.00000000,306.08422852); //object(kb_planterbox) (3)
	CreateDynamicObject(637,2029.02038574,-1180.39709473,21.98656845,0.00000000,0.00000000,306.07910156); //object(kb_planterbox) (3)
	CreateDynamicObject(2895,2023.22277832,-1184.69067383,22.29654884,0.00000000,0.00000000,216.08422852); //object(fun_flower_law) (5)
	CreateDynamicObject(2895,2023.95520020,-1184.15026855,22.29654884,0.00000000,0.00000000,216.07910156); //object(fun_flower_law) (5)
	CreateDynamicObject(2895,2024.66174316,-1183.64428711,22.29654884,0.00000000,0.00000000,216.07910156); //object(fun_flower_law) (5)
	CreateDynamicObject(2895,2028.31726074,-1180.92370605,22.29654884,0.00000000,0.00000000,216.07910156); //object(fun_flower_law) (5)
	CreateDynamicObject(2895,2029.07788086,-1180.36962891,22.29654884,0.00000000,0.00000000,216.07910156); //object(fun_flower_law) (5)
	CreateDynamicObject(2895,2029.78796387,-1179.86340332,22.29654884,0.00000000,0.00000000,216.07910156); //object(fun_flower_law) (5)
	CreateDynamicObject(1215,2026.52770996,-1182.33984375,22.35100365,0.00000000,0.00000000,0.00000000); //object(bollardlight) (2)
	CreateDynamicObject(994,2043.20544434,-1181.36486816,22.48513985,0.00000000,0.00000000,270.00000000); //object(lhouse_barrier2) (9)
	CreateDynamicObject(994,2043.59362793,-1198.81359863,22.48513985,0.00000000,0.00000000,270.00000000); //object(lhouse_barrier2) (9)
	CreateDynamicObject(997,2043.59130859,-1188.21154785,22.47130585,0.00000000,0.00000000,270.01098633); //object(lhouse_barrier3) (2)
	CreateDynamicObject(6417,1879.35913086,-1154.11804199,5.55131149,0.00000000,0.00000000,54.00000000); //object(lawborder2c_law2) (2)
	CreateDynamicObject(5715,1903.39074707,-1186.02648926,24.82435799,0.00000000,0.00000000,54.00000000); //object(grave08_law) (1)
	CreateDynamicObject(16101,1930.51098633,-1184.20666504,22.60177040,0.00000000,0.00000000,0.00000000); //object(des_windsockpole) (2)
	CreateDynamicObject(11245,1930.94470215,-1183.84301758,25.99692154,0.00000000,290.37963867,43.99475098); //object(sfsefirehseflag) (3)
	CreateDynamicObject(16101,1921.66638184,-1196.40637207,22.60177040,0.00000000,0.00000000,0.00000000); //object(des_windsockpole) (2)
	CreateDynamicObject(11245,1922.08630371,-1196.04626465,25.99692154,0.00000000,290.37963867,43.99475098); //object(sfsefirehseflag) (3)
	CreateDynamicObject(994,1921.92932129,-1196.10522461,22.69793892,0.00000000,0.00000000,54.00000000); //object(lhouse_barrier2) (9)
	CreateDynamicObject(994,1926.60766602,-1189.68054199,22.69513893,0.00000000,0.00000000,53.99780273); //object(lhouse_barrier2) (9)
	CreateDynamicObject(5777,1923.76293945,-1188.61865234,22.59867287,0.00000000,0.00000000,145.00000000); //object(tombston01_lawn) (1)
	CreateDynamicObject(5777,1924.48706055,-1186.74072266,22.59867287,0.00000000,0.00000000,175.00000000); //object(tombston01_lawn) (1)
	CreateDynamicObject(5777,1922.26660156,-1189.92687988,22.59867287,0.00000000,0.00000000,114.99996948); //object(tombston01_lawn) (1)
	CreateDynamicObject(994,1921.28479004,-1196.37976074,22.69793892,0.00000000,0.00000000,179.99780273); //object(lhouse_barrier2) (9)
	CreateDynamicObject(994,1915.01647949,-1196.38012695,22.69793892,0.00000000,0.00000000,179.99450684); //object(lhouse_barrier2) (9)
	CreateDynamicObject(994,1908.74829102,-1196.38122559,22.69793892,0.00000000,0.00000000,179.99450684); //object(lhouse_barrier2) (9)
	CreateDynamicObject(994,1902.01367188,-1196.04479980,22.69793892,0.00000000,0.00000000,110.48477173); //object(lhouse_barrier2) (9)
	CreateDynamicObject(994,1899.59851074,-1189.65979004,22.69793892,0.00000000,0.00000000,110.48400879); //object(lhouse_barrier2) (9)
	CreateDynamicObject(994,1930.35327148,-1183.73693848,22.69793892,0.00000000,0.00000000,109.93765259); //object(lhouse_barrier2) (9)
	CreateDynamicObject(994,1928.21520996,-1177.84375000,22.69793892,0.00000000,0.00000000,109.93469238); //object(lhouse_barrier2) (9)
	CreateDynamicObject(994,1926.07995605,-1171.95068359,22.69793892,0.00000000,0.00000000,109.93469238); //object(lhouse_barrier2) (9)
	CreateDynamicObject(994,1923.71948242,-1165.92126465,22.69793892,0.00000000,0.00000000,176.42541504); //object(lhouse_barrier2) (9)
	CreateDynamicObject(994,1917.46264648,-1165.52929688,22.69793892,0.00000000,0.00000000,178.42395020); //object(lhouse_barrier2) (9)
	CreateDynamicObject(994,1897.36010742,-1183.78320312,22.69793892,0.00000000,0.00000000,70.48400879); //object(lhouse_barrier2) (9)
	CreateDynamicObject(994,1905.96313477,-1168.90161133,23.10193825,0.00000000,3.37399292,34.14660645); //object(lhouse_barrier2) (9)
	CreateDynamicObject(997,1903.00585938,-1171.76440430,23.31010437,0.00000000,0.00000000,229.71655273); //object(lhouse_barrier3) (2)
	CreateDynamicObject(637,1925.25817871,-1178.85144043,22.20716858,0.00000000,0.00000000,20.05334473); //object(kb_planterbox) (3)
	CreateDynamicObject(637,1923.03491211,-1173.05175781,22.20716858,0.00000000,0.00000000,20.05004883); //object(kb_planterbox) (3)
	CreateDynamicObject(637,1914.99938965,-1193.74230957,22.20716858,0.00000000,0.00000000,90.06408691); //object(kb_planterbox) (3)
	CreateDynamicObject(637,1908.73681641,-1193.78137207,22.20716858,0.00000000,0.00000000,90.06042480); //object(kb_planterbox) (3)
	CreateDynamicObject(2895,1925.53100586,-1179.63708496,22.49194908,0.00000000,0.00000000,288.07910156); //object(fun_flower_law) (5)
	CreateDynamicObject(2895,1924.92114258,-1177.95947266,22.49194908,0.00000000,0.00000000,290.07800293); //object(fun_flower_law) (5)
	CreateDynamicObject(2895,1925.22680664,-1178.77954102,22.49194908,0.00000000,0.00000000,290.07751465); //object(fun_flower_law) (5)
	CreateDynamicObject(2895,1923.34838867,-1173.93322754,22.49194908,0.00000000,0.00000000,290.07751465); //object(fun_flower_law) (5)
	CreateDynamicObject(2895,1922.68945312,-1172.14355469,22.49194908,0.00000000,0.00000000,290.07751465); //object(fun_flower_law) (5)
	CreateDynamicObject(2895,1923.01684570,-1173.02001953,22.49194908,0.00000000,0.00000000,290.07751465); //object(fun_flower_law) (5)
	CreateDynamicObject(2895,1914.03979492,-1193.74108887,22.49194908,0.00000000,0.00000000,0.07751465); //object(fun_flower_law) (5)
	CreateDynamicObject(2895,1915.90222168,-1193.75219727,22.49194908,0.00000000,0.00000000,0.07690430); //object(fun_flower_law) (5)
	CreateDynamicObject(2895,1914.95471191,-1193.74401855,22.49194908,0.00000000,0.00000000,0.07690430); //object(fun_flower_law) (5)
	CreateDynamicObject(2895,1909.63586426,-1193.77697754,22.49194908,0.00000000,0.00000000,0.07690430); //object(fun_flower_law) (5)
	CreateDynamicObject(2895,1907.75512695,-1193.80102539,22.49194908,0.00000000,0.00000000,0.07690430); //object(fun_flower_law) (5)
	CreateDynamicObject(2895,1908.71350098,-1193.76867676,22.49194908,0.00000000,0.00000000,0.07690430); //object(fun_flower_law) (5)
	CreateDynamicObject(1215,1911.83349609,-1193.72949219,22.57160378,0.00000000,0.00000000,0.00000000); //object(bollardlight) (2)
	CreateDynamicObject(1215,1924.10021973,-1175.98950195,22.57160378,0.00000000,0.00000000,0.00000000); //object(bollardlight) (2)

	//Grove Street Gang HQ
	CreateDynamicObject(14746,1936.90820312,-504.75000000,2631.44775391,0.00000000,0.00000000,90.00000000); //object(rylounge) (1)
	CreateDynamicObject(14474,1934.12182617,-477.04711914,2631.44824219,0.00000000,0.00000000,0.00000000); //object(ganghse_int1) (1)
	CreateDynamicObject(8378,1933.77148438,-496.54687500,2628.97875977,90.00000000,0.00000000,90.00000000); //object(vgsbighngrdoor) (4)
	CreateDynamicObject(16637,1933.88281250,-497.84567261,2631.16235352,0.00000000,0.00000000,0.00000000); //object(ghostgardoor) (1)
	CreateDynamicObject(16637,1933.88769531,-495.26171875,2631.16235352,0.00000000,0.00000000,0.00000000); //object(ghostgardoor) (2)
	CreateDynamicObject(16637,1932.24060059,-497.89508057,2631.16235352,0.00000000,0.00000000,180.00000000); //object(ghostgardoor) (3)
	CreateDynamicObject(16637,1932.22167969,-495.25781250,2631.16235352,0.00000000,0.00000000,179.99450684); //object(ghostgardoor) (4)
	CreateDynamicObject(16637,1932.91589355,-497.89288330,2632.16235352,0.00000000,90.00000000,179.99450684); //object(ghostgardoor) (5)
	CreateDynamicObject(16637,1932.90710449,-495.26760864,2632.17236328,0.00000000,90.00000000,179.99450684); //object(ghostgardoor) (6)
	CreateDynamicObject(14745,1929.88769531,-496.37585449,2630.09960938,0.00000000,0.00000000,0.00000000); //object(rybatharse01) (1)
	CreateDynamicObject(14741,1928.19238281,-509.30371094,2629.66650391,0.00000000,0.00000000,179.99450684); //object(rykitunit) (1)
	CreateDynamicObject(14740,1921.76171875,-509.69976807,2631.96337891,0.00000000,0.00000000,89.50000000); //object(ryblinds) (3)
	CreateDynamicObject(8661,1933.71875000,-478.48437500,2633.14550781,179.99450684,0.00000000,90.00000000); //object(gnhtelgrnd_lvs) (1)
	CreateDynamicObject(8661,1911.41113281,-470.80859375,2633.14550781,90.00000000,0.00000000,0.00000000); //object(gnhtelgrnd_lvs) (2)
	CreateDynamicObject(8661,1951.45996094,-473.94921875,2633.14550781,90.00000000,0.00000000,0.00000000); //object(gnhtelgrnd_lvs) (3)
	CreateDynamicObject(7191,1931.42016602,-477.93621826,2631.62915039,90.00000000,0.00000000,0.00000000); //object(vegasnnewfence2b) (3)
	CreateDynamicObject(7191,1931.40527344,-478.39257812,2631.62915039,90.00000000,0.00000000,0.00000000); //object(vegasnnewfence2b) (4)
	CreateDynamicObject(7191,1931.41992188,-477.93554688,2631.62915039,90.00000000,0.00000000,0.00000000); //object(vegasnnewfence2b) (5)
	CreateDynamicObject(7191,1931.59667969,-478.32226562,2631.62915039,90.00000000,180.00000000,0.00000000); //object(vegasnnewfence2b) (6)
	CreateDynamicObject(7191,1931.60180664,-477.97235107,2631.62915039,90.00000000,179.99450684,0.00000000); //object(vegasnnewfence2b) (7)
	CreateDynamicObject(7191,1934.49853516,-478.00466919,2631.62915039,90.00000000,0.00000000,0.00000000); //object(vegasnnewfence2b) (8)
	CreateDynamicObject(7191,1934.50195312,-479.95129395,2631.62915039,90.00000000,0.00000000,0.00000000); //object(vegasnnewfence2b) (9)
	CreateDynamicObject(7191,1934.74121094,-477.95898438,2631.62915039,90.00000000,179.99450684,0.00000000); //object(vegasnnewfence2b) (10)
	CreateDynamicObject(3055,1932.92199707,-495.66098022,2629.66259766,90.00000000,0.00000000,0.00000000); //object(kmb_shutter) (1)
	CreateDynamicObject(3055,1932.80798340,-496.95761108,2629.65258789,90.00000000,0.00000000,0.00000000); //object(kmb_shutter) (2)
	CreateDynamicObject(1492,1933.83105469,-499.64089966,2629.66650391,0.00000000,0.00000000,180.00000000); //object(gen_doorint02) (1)
	CreateDynamicObject(1508,1925.34667969,-490.97949219,2631.31274414,0.00000000,0.00000000,0.00000000); //object(dyn_garage_door) (2)
	CreateDynamicObject(1508,1928.49511719,-490.21972656,2631.31274414,0.00000000,0.00000000,90.00000000); //object(dyn_garage_door) (3)
	CreateDynamicObject(16637,1931.63391113,-492.18640137,2631.16235352,0.00000000,0.00000000,179.99450684); //object(ghostgardoor) (4)
	CreateDynamicObject(1508,1934.64624023,-490.20889282,2631.31274414,0.00000000,0.00000000,0.00000000); //object(dyn_garage_door) (4)
	CreateDynamicObject(1508,1934.62011719,-489.07812500,2631.31274414,0.00000000,0.00000000,0.00000000); //object(dyn_garage_door) (5)
	CreateDynamicObject(1508,1934.63366699,-480.90567017,2631.31274414,0.00000000,0.00000000,0.00000000); //object(dyn_garage_door) (6)
	CreateDynamicObject(1508,1938.00000000,-490.24218750,2631.31274414,0.00000000,0.00000000,90.00000000); //object(dyn_garage_door) (8)
	CreateDynamicObject(1508,1942.51367188,-490.25585938,2631.31274414,0.00000000,0.00000000,90.00000000); //object(dyn_garage_door) (9)
	CreateDynamicObject(1508,1934.81445312,-489.06738281,2631.31274414,0.00000000,0.00000000,0.00000000); //object(dyn_garage_door) (10)
	CreateDynamicObject(1508,1942.85314941,-491.00262451,2631.31274414,0.00000000,0.00000000,0.00000000); //object(dyn_garage_door) (11)
	CreateDynamicObject(1508,1942.84350586,-480.94024658,2631.31274414,0.00000000,0.00000000,0.00000000); //object(dyn_garage_door) (12)
	CreateDynamicObject(1508,1943.31884766,-486.07714844,2631.31274414,0.00000000,0.00000000,0.00000000); //object(dyn_garage_door) (13)
	CreateDynamicObject(1508,1941.06445312,-482.67773438,2631.31274414,0.00000000,0.00000000,90.00000000); //object(dyn_garage_door) (14)
	CreateDynamicObject(1508,1924.94726562,-485.87597656,2631.31274414,0.00000000,0.00000000,0.00000000); //object(dyn_garage_door) (15)
	CreateDynamicObject(1508,1925.34570312,-485.76074219,2629.01269531,0.00000000,0.00000000,0.00000000); //object(dyn_garage_door) (16)
	CreateDynamicObject(1508,1942.90319824,-486.26675415,2629.01269531,0.00000000,0.00000000,0.00000000); //object(dyn_garage_door) (17)
	CreateDynamicObject(16637,1925.26879883,-482.22305298,2631.16235352,0.00000000,0.00000000,0.00000000); //object(ghostgardoor) (2)
	CreateDynamicObject(16637,1925.27148438,-479.82812500,2631.16235352,0.00000000,0.00000000,0.00000000); //object(ghostgardoor) (2)
	CreateDynamicObject(1508,1924.94238281,-475.99804688,2631.31274414,0.00000000,0.00000000,0.00000000); //object(dyn_garage_door) (18)
	CreateDynamicObject(1508,1925.28222656,-471.02947998,2631.31274414,0.00000000,0.00000000,0.00000000); //object(dyn_garage_door) (19)
	CreateDynamicObject(1508,1931.52050781,-471.03515625,2631.31274414,0.00000000,0.00000000,0.00000000); //object(dyn_garage_door) (20)
	CreateDynamicObject(1508,1942.84765625,-475.03515625,2631.31274414,0.00000000,0.00000000,0.00000000); //object(dyn_garage_door) (22)
	CreateDynamicObject(7191,1934.52246094,-475.91210938,2631.62915039,90.00000000,0.00000000,0.00000000); //object(vegasnnewfence2b) (8)
	CreateDynamicObject(7191,1934.76074219,-475.70800781,2631.62915039,90.00000000,179.99450684,0.00000000); //object(vegasnnewfence2b) (10)
	CreateDynamicObject(2952,1937.96618652,-480.56607056,2629.65454102,0.00000000,0.00000000,0.00000000); //object(kmb_gimpdoor) (1)
	CreateDynamicObject(2952,1937.97058105,-478.14117432,2629.65454102,0.00000000,0.00000000,0.00000000); //object(kmb_gimpdoor) (2)
	CreateDynamicObject(2952,1936.03503418,-478.10073853,2629.65454102,0.00000000,0.00000000,0.00000000); //object(kmb_gimpdoor) (3)
	CreateDynamicObject(2952,1936.04382324,-480.63305664,2629.65454102,0.00000000,0.00000000,0.00000000); //object(kmb_gimpdoor) (4)
	CreateDynamicObject(2949,1934.62316895,-478.16021729,2629.65454102,0.00000000,0.00000000,90.00000000); //object(kmb_lockeddoor) (1)
	CreateDynamicObject(1508,1941.15527344,-478.08416748,2631.31274414,0.00000000,0.00000000,90.00000000); //object(dyn_garage_door) (23)
	CreateDynamicObject(1508,1937.02587891,-493.35220337,2631.31274414,0.00000000,0.00000000,90.00000000); //object(dyn_garage_door) (24)
	CreateDynamicObject(1508,1929.13281250,-493.34661865,2631.31274414,0.00000000,0.00000000,90.00000000); //object(dyn_garage_door) (25)
	CreateDynamicObject(2949,1934.61816406,-482.73535156,2629.65454102,0.00000000,0.00000000,90.00000000); //object(kmb_lockeddoor) (2)
	CreateDynamicObject(2949,1930.15979004,-480.61535645,2629.65454102,0.00000000,0.00000000,90.00000000); //object(kmb_lockeddoor) (3)
	CreateDynamicObject(1508,1925.02929688,-480.47949219,2631.31274414,0.00000000,0.00000000,90.00000000); //object(dyn_garage_door) (26)
	CreateDynamicObject(1508,1925.34960938,-476.31542969,2629.01269531,0.00000000,0.00000000,0.00000000); //object(dyn_garage_door) (27)
	CreateDynamicObject(2299,1939.28735352,-486.69293213,2629.65454102,0.00000000,0.00000000,180.00000000); //object(swank_bed_6) (1)
	CreateDynamicObject(2102,1926.42187500,-480.64453125,2632.19409180,0.00000000,0.00000000,0.00000000); //object(low_hi_fi_2) (1)
	CreateDynamicObject(1487,1928.14514160,-484.28833008,2629.85205078,0.00000000,0.00000000,0.00000000); //object(dyn_wine_1) (1)
	CreateDynamicObject(1753,1926.83007812,-482.50292969,2629.65454102,0.00000000,0.00000000,359.24743652); //object(swank_couch_1) (1)
	CreateDynamicObject(1753,1928.91113281,-488.19140625,2629.65454102,0.00000000,0.00000000,179.49462891); //object(swank_couch_1) (2)
	CreateDynamicObject(1753,1930.40051270,-484.27743530,2629.65454102,0.00000000,0.00000000,270.24877930); //object(swank_couch_1) (3)
	CreateDynamicObject(1649,1925.31347656,-485.84484863,2632.40795898,0.00000000,0.00000000,90.00000000); //object(wglasssmash) (1)
	CreateDynamicObject(1649,1925.26367188,-485.84771729,2632.40795898,0.00000000,0.00000000,90.00000000); //object(wglasssmash) (4)
	CreateDynamicObject(1649,1925.33789062,-485.84277344,2632.40795898,0.00000000,0.00000000,90.00000000); //object(wglasssmash) (5)
	CreateDynamicObject(2319,1928.82067871,-486.09277344,2629.65454102,0.00000000,0.00000000,90.00000000); //object(cj_tv_table5) (1)
	CreateDynamicObject(1543,1928.62243652,-485.94793701,2630.15161133,0.00000000,0.00000000,0.00000000); //object(cj_beer_b_2) (1)
	CreateDynamicObject(1543,1928.86254883,-484.55923462,2630.15161133,0.00000000,0.00000000,0.00000000); //object(cj_beer_b_2) (2)
	CreateDynamicObject(1543,1928.78320312,-485.13479614,2630.15161133,0.00000000,0.00000000,0.00000000); //object(cj_beer_b_2) (3)
	CreateDynamicObject(1665,1928.85571289,-485.75497437,2630.17211914,0.00000000,0.00000000,0.00000000); //object(propashtray1) (1)
	CreateDynamicObject(1520,1926.37353516,-486.34216309,2629.65454102,0.00000000,86.00000000,0.00000000); //object(dyn_wine_bounce) (1)
	CreateDynamicObject(1520,1931.89355469,-493.31729126,2629.65454102,0.00000000,85.99548340,106.00000000); //object(dyn_wine_bounce) (2)
	CreateDynamicObject(1510,1931.94433594,-482.07891846,2629.67456055,0.00000000,0.00000000,0.00000000); //object(dyn_ashtry) (1)
	CreateDynamicObject(1510,1930.04736328,-472.78222656,2629.67456055,0.00000000,0.00000000,0.00000000); //object(dyn_ashtry) (2)
	CreateDynamicObject(2226,1925.65002441,-489.71075439,2629.65454102,0.00000000,0.00000000,118.00000000); //object(low_hi_fi_3) (1)
	CreateDynamicObject(2344,1928.86950684,-484.96511841,2630.16162109,0.00000000,0.00000000,278.00000000); //object(cj_remote) (1)
	CreateDynamicObject(14806,1940.62109375,-483.02716064,2630.74047852,0.00000000,0.00000000,0.00000000); //object(bdupshifi) (1)
	CreateDynamicObject(1749,1938.75463867,-482.86822510,2630.91113281,0.00000000,0.00000000,0.00000000); //object(med_tv_3) (1)
	CreateDynamicObject(1749,1940.65917969,-482.78198242,2630.91113281,0.00000000,0.00000000,0.00000000); //object(med_tv_3) (2)
	CreateDynamicObject(1749,1941.01928711,-482.82537842,2630.91113281,0.00000000,0.00000000,0.00000000); //object(med_tv_3) (3)
	CreateDynamicObject(1749,1942.52490234,-482.93835449,2630.91113281,0.00000000,0.00000000,0.00000000); //object(med_tv_3) (4)
	CreateDynamicObject(1738,1930.70703125,-480.97711182,2630.30908203,0.00000000,0.00000000,2.00000000); //object(cj_radiator_old) (1)
	CreateDynamicObject(2028,1940.70410156,-484.16796875,2629.73779297,0.00000000,0.00000000,0.00000000); //object(swank_console) (1)
	CreateDynamicObject(947,1941.48181152,-490.30194092,2630.85742188,0.00000000,0.00000000,0.00000000); //object(bskballhub_lax01) (1)
	CreateDynamicObject(2114,1942.44079590,-489.93157959,2629.80078125,0.00000000,0.00000000,0.00000000); //object(basketball) (1)
	CreateDynamicObject(2089,1935.06530762,-488.21679688,2629.65454102,0.00000000,0.00000000,90.00000000); //object(swank_cabinet_2) (1)
	CreateDynamicObject(2295,1935.45373535,-483.34176636,2629.65454102,0.00000000,0.00000000,62.00000000); //object(cj_beanbag) (1)
	CreateDynamicObject(2820,1924.27856445,-509.43716431,2630.74780273,0.00000000,0.00000000,0.00000000); //object(gb_kitchdirt01) (1)
	CreateDynamicObject(2421,1920.21533203,-509.78634644,2631.38281250,0.00000000,0.00000000,180.00000000); //object(cj_ff_microw) (1)
	CreateDynamicObject(2426,1924.90209961,-503.99435425,2630.77758789,0.00000000,0.00000000,0.00000000); //object(cj_ff_pizza_oven) (1)
	CreateDynamicObject(3383,1928.36547852,-471.59756470,2629.65454102,0.00000000,0.00000000,180.00000000); //object(a51_labtable1_) (1)
	CreateDynamicObject(3409,1928.34667969,-470.31900024,2630.70996094,0.00000000,0.00000000,0.00000000); //object(grassplant) (1)
	CreateDynamicObject(1753,1930.91027832,-477.06491089,2629.65454102,0.00000000,0.00000000,270.24719238); //object(swank_couch_1) (4)
	CreateDynamicObject(2901,1926.39575195,-472.11816406,2630.05126953,0.00000000,0.00000000,267.99499512); //object(kmb_marijuana) (1)
	CreateDynamicObject(2901,1925.64733887,-472.07901001,2630.05126953,0.00000000,0.00000000,267.99499512); //object(kmb_marijuana) (3)
	CreateDynamicObject(1753,1927.78576660,-479.88342285,2629.65454102,0.00000000,0.00000000,180.00000000); //object(swank_couch_1) (5)
	CreateDynamicObject(2236,1926.27246094,-479.01562500,2629.54541016,0.00000000,0.00000000,0.00000000); //object(coffee_swank_1) (1)
	CreateDynamicObject(2726,1926.76440430,-478.51492310,2630.39477539,0.00000000,0.00000000,0.00000000); //object(lm_striplamp) (1)
	CreateDynamicObject(2236,1930.04528809,-478.60455322,2629.54541016,0.00000000,0.00000000,90.00000000); //object(coffee_swank_1) (2)
	CreateDynamicObject(1665,1929.56933594,-477.66534424,2630.07128906,0.00000000,0.00000000,0.00000000); //object(propashtray1) (2)
	CreateDynamicObject(1665,1929.34057617,-478.50207520,2630.07128906,0.00000000,0.00000000,222.00000000); //object(propashtray1) (3)
	CreateDynamicObject(1543,1927.18017578,-478.34719849,2630.03442383,0.00000000,0.00000000,0.00000000); //object(cj_beer_b_2) (4)
	CreateDynamicObject(1543,1926.18542480,-478.72470093,2630.03442383,0.00000000,0.00000000,0.00000000); //object(cj_beer_b_2) (5)
	CreateDynamicObject(2780,1927.73010254,-471.34967041,2638.44506836,180.00000000,0.00000000,180.00000000); //object(cj_smoke_mach) (1)
	CreateDynamicObject(16637,1931.44116211,-472.44619751,2631.16235352,0.00000000,0.00000000,179.99450684); //object(ghostgardoor) (4)
	CreateDynamicObject(1492,1931.46130371,-475.87042236,2629.65454102,0.00000000,0.00000000,90.00000000); //object(gen_doorint02) (2)
	CreateDynamicObject(16637,1931.41088867,-477.77114868,2631.16235352,0.00000000,0.00000000,179.99450684); //object(ghostgardoor) (4)
	CreateDynamicObject(16637,1931.39855957,-475.73779297,2633.64062500,0.00000000,0.00000000,179.99450684); //object(ghostgardoor) (4)
	CreateDynamicObject(16637,1929.26940918,-480.48446655,2633.64062500,0.00000000,0.00000000,270.00000000); //object(ghostgardoor) (4)
	CreateDynamicObject(1492,1928.53063965,-480.45175171,2629.65454102,0.00000000,0.00000000,0.00000000); //object(gen_doorint02) (3)
	CreateDynamicObject(16637,1926.69470215,-480.47799683,2631.16235352,0.00000000,0.00000000,270.00000000); //object(ghostgardoor) (4)
	CreateDynamicObject(1792,1924.83923340,-476.08480835,2630.78198242,0.00000000,0.00000000,90.00000000); //object(swank_tv_1) (1)
	CreateDynamicObject(2028,1925.11706543,-477.06689453,2630.86889648,0.00000000,0.00000000,94.75000000); //object(swank_console) (1)
	CreateDynamicObject(2255,1925.87121582,-479.26812744,2631.71679688,0.00000000,0.00000000,90.00000000); //object(frame_clip_2) (1)
	CreateDynamicObject(2276,1930.81726074,-478.08203125,2631.92626953,0.00000000,0.00000000,269.50000000); //object(frame_fab_3) (1)
	CreateDynamicObject(2282,1930.81945801,-472.70108032,2631.66162109,0.00000000,0.00000000,269.99996948); //object(frame_thick_4) (1)
	CreateDynamicObject(2285,1930.84606934,-481.18969727,2631.95751953,0.00000000,0.00000000,0.00000000); //object(frame_1) (1)
	CreateDynamicObject(2289,1925.41003418,-482.23477173,2632.02734375,0.00000000,0.00000000,89.75000000); //object(frame_2) (1)
	CreateDynamicObject(2288,1928.61914062,-489.68829346,2631.53637695,0.00000000,0.00000000,180.00000000); //object(frame_3) (1)
	CreateDynamicObject(2286,1934.42956543,-489.31158447,2631.94726562,0.00000000,0.00000000,269.99996948); //object(frame_5) (1)
	CreateDynamicObject(2282,1933.93835449,-480.43395996,2631.65332031,0.00000000,0.00000000,269.99996948); //object(frame_thick_4) (2)
	CreateDynamicObject(2283,1942.63244629,-476.08288574,2632.30688477,0.00000000,0.00000000,270.00000000); //object(frame_thick_3) (1)
	CreateDynamicObject(2528,1942.17333984,-476.03155518,2629.65454102,0.00000000,0.00000000,270.00000000); //object(cj_toilet3) (1)
	CreateDynamicObject(2526,1935.33215332,-474.52154541,2629.65454102,0.00000000,0.00000000,0.00000000); //object(cj_bath4) (1)
	CreateDynamicObject(2524,1939.61877441,-477.55288696,2629.65454102,0.00000000,0.00000000,180.00000000); //object(cj_b_sink4) (1)
	CreateDynamicObject(2517,1936.31787109,-477.54452515,2629.65454102,0.00000000,0.00000000,89.75000000); //object(cj_shower1) (1)
	CreateDynamicObject(2281,1935.36779785,-488.21124268,2632.00048828,0.00000000,0.00000000,90.00000000); //object(frame_thick_5) (1)
	CreateDynamicObject(2102,1925.31945801,-474.60913086,2632.64233398,0.00000000,0.00000000,90.25000000); //object(low_hi_fi_2) (1)
	CreateDynamicObject(2102,1925.32336426,-477.45907593,2632.64233398,0.00000000,0.00000000,90.24719238); //object(low_hi_fi_2) (1)
	CreateDynamicObject(2102,1926.35424805,-490.22680664,2632.19409180,0.00000000,0.00000000,179.75000000); //object(low_hi_fi_2) (1)
	CreateDynamicObject(2629,1942.09899902,-486.22549438,2629.65454102,0.00000000,0.00000000,270.00000000); //object(gym_bench1) (1)
	CreateDynamicObject(1649,1925.23779297,-485.84460449,2632.40795898,0.00000000,0.00000000,90.00000000); //object(wglasssmash) (5)
	CreateDynamicObject(1649,1925.33740234,-485.84191895,2632.40795898,0.00000000,0.00000000,90.00000000); //object(wglasssmash) (5)
	CreateDynamicObject(1649,1925.23681641,-485.84362793,2632.40795898,0.00000000,0.00000000,90.00000000); //object(wglasssmash) (5)

	//24/7
	CreateDynamicObject(10966, 2849.35, 2454.28, 1796.79,   270.00, 180.00, 180.00);
	CreateDynamicObject(19460, 2842.08, 2444.37, 1783.95,   0.00, 0.00, 0.00);
	CreateDynamicObject(19460, 2837.30, 2453.75, 1783.95,   0.00, 0.00, 0.00);
	CreateDynamicObject(19460, 2837.30, 2463.38, 1783.95,   0.00, 0.00, 0.00);
	CreateDynamicObject(19460, 2842.17, 2449.02, 1783.95,   0.00, 0.00, 90.00);
	CreateDynamicObject(19460, 2831.24, 2459.30, 1783.95,   0.00, 0.00, 90.00);
	CreateDynamicObject(19460, 2840.82, 2459.30, 1783.95,   0.00, 0.00, 90.00);
	CreateDynamicObject(19460, 2826.51, 2464.02, 1783.95,   0.00, 0.00, 0.00);
	CreateDynamicObject(19460, 2821.65, 2467.40, 1783.95,   0.00, 0.00, 90.00);
	CreateDynamicObject(19460, 2812.03, 2467.41, 1783.95,   0.00, 0.00, 90.00);
	CreateDynamicObject(19460, 2837.21, 2440.65, 1783.95,   0.00, 0.00, 90.00);
	CreateDynamicObject(19460, 2827.61, 2440.65, 1783.95,   0.00, 0.00, 90.00);
	CreateDynamicObject(19176, 2842.05, 2444.72, 1786.96,   0.40, 0.00, 90.00);
	CreateDynamicObject(19460, 2843.73, 2446.51, 1783.76,   90.00, 270.00, 0.00);
	CreateDynamicObject(19460, 2843.73, 2442.91, 1783.76,   90.00, 269.99, 0.00);
	CreateDynamicObject(19368, 2843.73, 2444.89, 1788.49,   0.00, 270.00, 0.00);
	CreateDynamicObject(19368, 2843.73, 2444.59, 1788.49,   0.00, 269.99, 0.00);
	CreateDynamicObject(997, 2828.94, 2448.98, 1785.48,   0.00, 0.00, 270.00);
	CreateDynamicObject(997, 2832.20, 2448.94, 1785.48,   0.00, 0.00, 180.00);
	CreateDynamicObject(1349, 2830.60, 2441.37, 1786.05,   0.00, 0.00, 180.00);
	CreateDynamicObject(1349, 2830.03, 2441.34, 1786.05,   0.00, 0.00, 179.99);
	CreateDynamicObject(1349, 2830.14, 2442.36, 1786.05,   0.00, 0.00, 157.99);
	CreateDynamicObject(1885, 2829.71, 2443.37, 1785.48,   0.00, 0.00, 42.25);
	CreateDynamicObject(1885, 2829.61, 2447.50, 1785.48,   0.00, 0.00, 348.25);
	CreateDynamicObject(2754, 2839.62, 2448.63, 1786.38,   0.00, 0.00, 90.00);
	CreateDynamicObject(2754, 2838.77, 2448.64, 1786.38,   0.00, 0.00, 90.00);
	CreateDynamicObject(1330, 2840.52, 2448.46, 1785.91,   0.00, 0.00, 342.00);
	CreateDynamicObject(949, 2841.69, 2442.59, 1786.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(949, 2841.66, 2446.82, 1786.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(2197, 2839.09, 2441.80, 1785.48,   0.00, 0.00, 180.00);
	CreateDynamicObject(2197, 2838.42, 2441.80, 1785.48,   0.00, 0.00, 179.99);
	CreateDynamicObject(2197, 2837.74, 2441.80, 1785.48,   0.00, 0.00, 179.99);
	CreateDynamicObject(2197, 2837.07, 2441.80, 1785.48,   0.00, 0.00, 179.99);
	CreateDynamicObject(2197, 2839.09, 2441.80, 1787.14,   0.00, 0.00, 179.99);
	CreateDynamicObject(2197, 2838.42, 2441.80, 1787.14,   0.00, 0.00, 179.99);
	CreateDynamicObject(2197, 2837.74, 2441.80, 1787.14,   0.00, 0.00, 179.99);
	CreateDynamicObject(19329, 2834.39, 2440.73, 1788.39,   0.00, 0.00, 0.00);
	CreateDynamicObject(997, 2828.90, 2443.93, 1785.48,   0.00, 0.00, 270.00);
	CreateDynamicObject(1349, 2829.95, 2448.21, 1786.05,   0.00, 0.00, 165.75);
	CreateDynamicObject(997, 2837.21, 2448.96, 1785.48,   0.00, 0.00, 179.99);
	CreateDynamicObject(1885, 2829.71, 2443.37, 1785.91,   0.00, 0.00, 42.25);
	CreateDynamicObject(1885, 2829.38, 2446.47, 1785.48,   0.00, 0.00, 268.24);
	CreateDynamicObject(19460, 2817.99, 2440.65, 1783.95,   0.00, 0.00, 90.00);
	CreateDynamicObject(1984, 2829.58, 2451.75, 1785.48,   0.00, 0.00, 0.00);
	CreateDynamicObject(1984, 2829.58, 2456.82, 1785.48,   0.00, 0.00, 0.00);
	CreateDynamicObject(997, 2832.14, 2452.23, 1785.48,   0.00, 0.00, 270.00);
	CreateDynamicObject(997, 2832.12, 2457.32, 1785.48,   0.00, 0.00, 270.00);
	CreateDynamicObject(997, 2832.21, 2454.06, 1785.48,   0.00, 0.00, 179.99);
	CreateDynamicObject(1806, 2831.31, 2455.45, 1785.48,   0.00, 0.00, 320.00);
	CreateDynamicObject(1806, 2831.39, 2450.40, 1785.48,   0.00, 0.00, 20.00);
	CreateDynamicObject(1885, 2830.04, 2456.04, 1785.48,   0.00, 0.00, 348.24);
	CreateDynamicObject(1349, 2830.36, 2448.10, 1786.05,   0.00, 0.00, 165.75);
	CreateDynamicObject(1349, 2830.88, 2447.19, 1786.05,   0.00, 0.00, 195.75);
	CreateDynamicObject(2197, 2836.39, 2441.80, 1785.48,   0.00, 0.00, 179.99);
	CreateDynamicObject(1702, 2836.66, 2456.75, 1785.48,   0.00, 0.00, 270.00);
	CreateDynamicObject(15038, 2836.69, 2457.57, 1786.10,   0.00, 0.00, 0.00);
	CreateDynamicObject(15038, 2836.69, 2450.40, 1786.10,   0.00, 0.00, 0.00);
	CreateDynamicObject(2370, 2836.64, 2451.46, 1785.48,   0.00, 0.00, 0.00);
	CreateDynamicObject(2370, 2836.65, 2453.16, 1785.48,   0.00, 0.00, 0.00);
	CreateDynamicObject(1716, 2835.51, 2449.71, 1785.48,   0.00, 0.00, 0.00);
	CreateDynamicObject(1886, 2836.45, 2458.56, 1795.20,   20.00, 0.00, 313.00);
	CreateDynamicObject(2362, 2829.24, 2456.20, 1786.43,   0.00, 0.00, 180.00);
	CreateDynamicObject(2490, 2830.05, 2456.62, 1786.56,   0.00, 0.00, 180.00);
	CreateDynamicObject(2489, 2829.52, 2451.53, 1786.56,   0.00, 0.00, 180.00);
	CreateDynamicObject(2495, 2830.18, 2451.51, 1786.56,   0.00, 0.00, 180.00);
	CreateDynamicObject(19460, 2808.42, 2440.64, 1783.95,   0.00, 0.00, 90.00);
	CreateDynamicObject(19460, 2809.82, 2464.07, 1783.95,   0.00, 0.00, 0.00);
	CreateDynamicObject(19460, 2809.82, 2444.90, 1783.95,   0.00, 0.00, 0.00);
	CreateDynamicObject(19460, 2809.82, 2454.48, 1783.95,   0.00, 0.00, 0.00);
	CreateDynamicObject(9527, 2832.05, 2459.92, 1789.90,   0.00, 0.00, 0.00);
	CreateDynamicObject(19326, 2837.21, 2451.88, 1788.11,   0.00, 0.00, 90.00);
	CreateDynamicObject(18100, 2836.41, 2447.40, 1785.50,   0.00, 0.00, 20.00);
	CreateDynamicObject(2690, 2839.87, 2440.79, 1786.29,   0.00, 0.00, 180.00);
	CreateDynamicObject(1891, 2821.80, 2447.48, 1785.48,   0.00, 0.00, 0.00);
	CreateDynamicObject(1890, 2815.44, 2447.84, 1785.48,   0.00, 0.00, 90.00);
	CreateDynamicObject(1889, 2815.44, 2444.78, 1785.48,   0.00, 0.00, 90.00);
	CreateDynamicObject(1887, 2821.12, 2455.60, 1785.48,   0.00, 0.00, 90.00);
	CreateDynamicObject(1884, 2824.91, 2447.48, 1785.48,   0.00, 0.00, 0.00);
	CreateDynamicObject(1883, 2821.45, 2462.07, 1785.48,   0.00, 0.00, 0.00);
	CreateDynamicObject(1850, 2820.08, 2466.92, 1785.48,   0.00, 0.00, 0.00);
	CreateDynamicObject(1849, 2810.27, 2460.66, 1785.48,   0.00, 0.00, 90.00);
	CreateDynamicObject(1848, 2816.54, 2454.60, 1785.48,   0.00, 0.00, 90.00);
	CreateDynamicObject(1847, 2823.86, 2466.75, 1785.48,   0.00, 0.00, 0.00);
	CreateDynamicObject(1845, 2824.94, 2453.65, 1785.48,   0.00, 0.00, 0.00);
	CreateDynamicObject(1844, 2816.78, 2466.79, 1785.48,   0.00, 0.00, 0.00);
	CreateDynamicObject(1843, 2810.37, 2464.68, 1785.48,   0.00, 0.00, 90.00);
	CreateDynamicObject(1842, 2818.44, 2462.06, 1785.95,   0.00, 0.00, 0.00);
	CreateDynamicObject(1983, 2813.00, 2466.85, 1787.10,   0.00, 0.00, 0.00);
	CreateDynamicObject(1983, 2812.00, 2466.85, 1787.10,   0.00, 0.00, 0.00);
	CreateDynamicObject(1848, 2820.05, 2454.61, 1785.48,   0.00, 0.00, 270.00);
	CreateDynamicObject(1847, 2815.44, 2454.61, 1785.48,   0.00, 0.00, 270.00);
	CreateDynamicObject(1981, 2810.39, 2450.67, 1785.48,   0.00, 0.00, 90.00);
	CreateDynamicObject(1981, 2810.39, 2452.66, 1785.48,   0.00, 0.00, 90.00);
	CreateDynamicObject(1981, 2810.39, 2451.67, 1785.48,   0.00, 0.00, 90.00);
	CreateDynamicObject(2871, 2823.32, 2441.22, 1786.65,   0.00, 0.00, 180.00);
	CreateDynamicObject(2871, 2824.32, 2441.22, 1786.65,   0.00, 0.00, 179.99);
	CreateDynamicObject(2583, 2827.35, 2458.95, 1786.35,   0.00, 0.00, 0.00);
	CreateDynamicObject(2542, 2822.29, 2441.22, 1786.65,   0.00, 0.00, 180.00);
	CreateDynamicObject(2541, 2825.70, 2441.22, 1786.65,   0.00, 0.00, 180.00);
	CreateDynamicObject(2536, 2810.35, 2443.23, 1785.48,   0.00, 0.00, 90.00);
	CreateDynamicObject(2535, 2810.35, 2444.22, 1785.48,   0.00, 0.00, 90.00);
	CreateDynamicObject(2539, 2810.34, 2445.21, 1785.48,   0.00, 0.00, 90.00);
	CreateDynamicObject(2538, 2810.34, 2446.19, 1785.48,   0.00, 0.00, 90.00);
	CreateDynamicObject(2537, 2810.38, 2449.73, 1785.48,   0.00, 0.00, 90.00);
	CreateDynamicObject(2536, 2810.39, 2448.74, 1785.48,   0.00, 0.00, 90.00);
	CreateDynamicObject(1996, 2819.00, 2441.23, 1785.48,   0.00, 0.00, 180.00);
	CreateDynamicObject(1996, 2810.39, 2453.66, 1785.48,   0.00, 0.00, 90.00);
	CreateDynamicObject(1991, 2819.99, 2441.23, 1785.48,   0.00, 0.00, 180.00);
	CreateDynamicObject(1993, 2810.33, 2456.20, 1785.48,   0.00, 0.00, 90.00);
	CreateDynamicObject(1994, 2810.30, 2457.21, 1785.48,   0.00, 0.00, 270.00);
	CreateDynamicObject(1995, 2810.30, 2455.21, 1785.48,   0.00, 0.00, 270.00);
	CreateDynamicObject(2541, 2825.96, 2463.10, 1786.89,   0.00, 0.00, 270.00);
	CreateDynamicObject(2541, 2825.96, 2464.08, 1786.89,   0.00, 0.00, 269.99);
	CreateDynamicObject(1988, 2814.00, 2466.85, 1787.10,   0.00, 0.00, 0.00);
	CreateDynamicObject(1983, 2813.40, 2441.22, 1787.79,   0.00, 0.00, 180.00);
	CreateDynamicObject(1987, 2814.40, 2441.22, 1787.79,   0.00, 0.00, 180.00);
	CreateDynamicObject(1987, 2810.39, 2455.75, 1787.51,   0.00, 0.00, 90.00);
	CreateDynamicObject(1988, 2810.39, 2456.75, 1787.51,   0.00, 0.00, 90.00);
	CreateDynamicObject(1988, 2812.40, 2441.22, 1787.79,   0.00, 0.00, 179.99);
	CreateDynamicObject(2804, 2810.28, 2455.32, 1786.38,   0.00, 0.00, 0.00);
	CreateDynamicObject(2804, 2810.45, 2455.46, 1786.38,   0.00, 0.00, 198.00);
	CreateDynamicObject(2806, 2810.31, 2456.26, 1786.37,   0.00, 0.00, 3.00);
	CreateDynamicObject(2804, 2810.48, 2457.30, 1786.38,   0.00, 0.00, 198.00);
	CreateDynamicObject(1209, 2820.89, 2453.44, 1785.48,   0.00, 0.00, 90.00);
	CreateDynamicObject(1776, 2826.06, 2460.73, 1786.58,   0.00, 0.00, 270.00);
	CreateDynamicObject(1775, 2810.30, 2447.58, 1786.58,   0.00, 0.00, 90.00);
	CreateDynamicObject(2663, 2836.81, 2453.96, 1786.58,   0.00, 0.00, 40.00);
	CreateDynamicObject(1776, 2817.89, 2441.18, 1786.58,   0.00, 0.00, 179.99);
	CreateDynamicObject(1886, 2810.56, 2466.50, 1795.23,   20.00, 0.00, 43.74);
	CreateDynamicObject(1886, 2810.42, 2441.30, 1795.25,   19.99, 0.00, 137.74);
	CreateDynamicObject(1845, 2824.95, 2456.62, 1785.48,   0.00, 0.00, 180.00);
	CreateDynamicObject(8710, 2803.61, 2491.60, 1766.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(8710, 2785.67, 2438.85, 1766.94,   0.00, 0.00, 90.00);
	CreateDynamicObject(8710, 2850.60, 2488.95, 1766.94,   0.00, 0.00, 270.00);
	CreateDynamicObject(8710, 2861.40, 2478.67, 1766.94,   0.00, 0.00, 270.00);
	CreateDynamicObject(8710, 2866.18, 2467.26, 1766.94,   0.00, 0.00, 270.00);
	CreateDynamicObject(8710, 2830.66, 2410.95, 1766.94,   0.00, 0.00, 90.00);
	CreateDynamicObject(6989, 2886.02, 2447.43, 1873.28,   0.00, 270.00, 0.00);
	CreateDynamicObject(1892, 2832.57, 2448.64, 1785.48,   0.00, 0.00, 0.00);
	CreateDynamicObject(14439, 2834.41, 2448.16, 1795.50,   0.00, 0.00, 270.00);
	CreateDynamicObject(14439, 2818.34, 2448.14, 1795.50,   0.00, 0.00, 270.00);
	CreateDynamicObject(9186, 2817.24, 2466.66, 1797.05,   0.00, 0.00, 7.75);
	CreateDynamicObject(8326, 2809.80, 2451.68, 1792.46,   0.00, 0.00, 180.00);
	CreateDynamicObject(4729, 2821.21, 2440.72, 1791.34,   0.00, 0.00, 110.00);
	
	/*
    //Gang bien
    CreateDynamicObject(9174, 522.25, -2006.95, 1.40,   0.00, 0.00, 91.00);
    CreateDynamicObject(8832, 592.63, -2027.44, 3.34,   0.00, 0.00, 1.00);
    CreateDynamicObject(9044, 512.40, -1953.84, 7.54,   0.00, 0.00, 84.00);
    CreateDynamicObject(8422, 486.33, -1990.92, 4.52,   0.00, 0.00, 90.00);
    CreateDynamicObject(9052, 507.62, -1958.61, 9.18,   0.00, 0.00, 90.00);
    CreateDynamicObject(9045, 447.05, -1952.14, 7.04,   0.00, 0.00, 90.00);
    CreateDynamicObject(8484, 484.87, -1957.52, 8.42,   0.00, 0.00, 90.00);
    CreateDynamicObject(8483, 435.08, -1940.23, 9.79,   0.00, 0.00, 90.00);
    CreateDynamicObject(1557, 482.97, -1971.18, 4.99,   0.00, 0.00, 180.00);
    CreateDynamicObject(1557, 479.93, -1971.27, 4.99,   360.00, 0.00, 0.00);
    CreateDynamicObject(9041, 476.70, -1971.38, 13.90,   0.00, 0.00, 90.30);
    CreateDynamicObject(8421, 465.99, -2008.85, 40.88,   0.00, 0.00, 83.00);
    CreateDynamicObject(3434, 523.91, -1903.64, 11.23,   0.00, 0.00, 90.00);
    CreateDynamicObject(8423, 523.94, -1903.59, 13.56,   0.00, 0.00, 84.00);
    CreateDynamicObject(9129, 521.80, -1903.51, 20.78,   0.00, 0.00, 90.00);
    CreateDynamicObject(8493, 548.96, -1932.63, 17.90,   0.00, 0.00, 90.00);
    CreateDynamicObject(9159, 549.16, -1932.61, 17.92,   0.00, 0.00, 90.00);
    CreateDynamicObject(8834, 485.45, -1935.56, 4.91,   0.00, 0.00, 91.00);
    CreateDynamicObject(3498, 485.38, -1920.64, 3.71,   0.00, 0.00, 0.00);
    CreateDynamicObject(3524, 485.75, -1907.24, 6.75,   0.00, 0.00, 180.00);
    CreateDynamicObject(3524, 475.04, -1907.60, 6.75,   0.00, 0.00, 180.00);
    CreateDynamicObject(3498, 474.60, -1920.64, 3.71,   0.00, 0.00, 0.00);
    CreateDynamicObject(3498, 485.52, -1927.54, 3.71,   0.00, 0.00, 0.00);
    CreateDynamicObject(3498, 485.82, -1936.02, 3.71,   0.00, 0.00, 0.00);
    CreateDynamicObject(3498, 485.52, -1927.54, 3.71,   0.00, 0.00, 0.00);
    CreateDynamicObject(3498, 474.92, -1936.26, 3.71,   0.00, 0.00, 0.00);
    CreateDynamicObject(3498, 485.52, -1927.54, 3.71,   0.00, 0.00, 0.00);
    CreateDynamicObject(3498, 486.00, -1946.04, 3.71,   0.00, 0.00, 0.00);
    CreateDynamicObject(3498, 474.78, -1927.65, 3.71,   0.00, 0.00, 0.00);
    CreateDynamicObject(3498, 475.98, -1944.79, 3.71,   0.00, 0.00, 0.00);
    CreateDynamicObject(3498, 486.31, -1955.99, 3.71,   0.00, 0.00, 0.00);
    CreateDynamicObject(3498, 476.13, -1955.00, 3.71,   0.00, 0.00, 0.00);
    CreateDynamicObject(3524, 486.36, -1955.92, 6.75,   0.00, 0.00, 180.00);
    CreateDynamicObject(3524, 476.17, -1955.02, 6.75,   0.00, 0.00, 180.00);
    CreateDynamicObject(8835, 476.73, -1949.20, 5.64,   0.00, 0.00, 89.00);
    CreateDynamicObject(620, 527.02, -1946.90, -12.90,   0.00, 0.00, 0.00);
    CreateDynamicObject(620, 510.07, -1944.76, -9.90,   0.00, 0.00, 0.00);
    CreateDynamicObject(621, 514.86, -1944.26, 3.84,   0.00, 0.00, 0.00);
    CreateDynamicObject(621, 446.09, -1937.60, -2.70,   0.00, 0.00, 0.00);
    CreateDynamicObject(620, 433.55, -1933.03, -2.99,   0.00, 0.00, 0.00);
    CreateDynamicObject(8833, 592.17, -2025.07, 5.88,   0.00, 0.00, 91.00);
    CreateDynamicObject(3499, 557.92, -2018.00, -0.80,   0.00, 0.00, 0.00);
    CreateDynamicObject(3499, 571.46, -2018.02, 1.80,   0.00, 0.00, 0.00);
    CreateDynamicObject(3499, 584.87, -2017.44, 1.72,   0.00, 0.00, 0.00);
    CreateDynamicObject(3499, 570.71, -2033.88, 1.80,   0.00, 0.00, 0.00);
    CreateDynamicObject(3499, 603.49, -2017.10, 1.62,   0.00, 0.00, 0.00);
    CreateDynamicObject(3499, 623.68, -2016.29, -0.84,   0.00, 0.00, 0.00);
    CreateDynamicObject(3499, 556.14, -2034.02, -0.80,   0.00, 0.00, 0.00);
    CreateDynamicObject(3499, 584.69, -2033.59, 1.72,   0.00, 0.00, 0.00);
    CreateDynamicObject(3499, 601.75, -2033.43, 1.62,   0.00, 0.00, 0.00);
    CreateDynamicObject(3499, 623.29, -2032.58, -0.84,   0.00, 0.00, 0.00);
    CreateDynamicObject(8981, 555.16, -1933.13, 17.40,   0.00, 0.00, 90.00);
    CreateDynamicObject(3524, 564.33, -1926.47, 4.40,   0.00, 0.00, 180.00);
    CreateDynamicObject(3524, 554.03, -1926.84, 4.40,   0.00, 0.00, 180.00);
    CreateDynamicObject(620, 426.59, -1938.29, -2.99,   0.00, 0.00, 0.00);
    CreateDynamicObject(620, 443.72, -1935.37, -2.99,   0.00, 0.00, 0.00);
*/

	//Gang FunufiT HQ
    CreateDynamicObject(4562,1310.53710938,-1541.86132812,2985.02075195,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(laplaza2_lan) (1)
    CreateDynamicObject(3612,1346.76562500,-1582.54736328,2997.91406250,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (1)
    CreateDynamicObject(3612,1358.00524902,-1571.05725098,2997.91406250,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (2)
    CreateDynamicObject(3612,1337.91589355,-1575.54687500,2997.91406250,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (4)
    CreateDynamicObject(3612,1332.39794922,-1567.80957031,2997.91406250,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (5)
    CreateDynamicObject(3612,1320.57910156,-1567.05957031,2997.91406250,0.00000000,0.00000000,179.98352051 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (6)
    CreateDynamicObject(2774,1341.51611328,-1566.50866699,2996.43017578,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airp_pillars) (1)
    CreateDynamicObject(2774,1349.24560547,-1566.50781250,2996.18701172,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airp_pillars) (2)
    CreateDynamicObject(1569,1346.42480469,-1579.03601074,2986.07543945,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(adam_v_door) (1)
    CreateDynamicObject(1569,1349.42529297,-1579.03515625,2986.07543945,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 6053); //object(adam_v_door) (2)
    CreateDynamicObject(8661,1347.24243164,-1586.35437012,2993.47216797,0.00000000,180.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(gnhtelgrnd_lvs) (1)
    CreateDynamicObject(8661,1339.51367188,-1555.16894531,2993.79052734,0.00000000,179.99450684,179.99450684 , .interiorid = 1, .worldid = 6053); //object(gnhtelgrnd_lvs) (2)
    CreateDynamicObject(2773,1346.14282227,-1577.59179688,2986.59277344,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airprt_bar) (1)
    CreateDynamicObject(2773,1349.67041016,-1577.59179688,2986.59277344,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airprt_bar) (2)
    CreateDynamicObject(1892,1348.42285156,-1576.13671875,2986.07470703,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(security_gatsh) (1)
    CreateDynamicObject(1892,1346.43652344,-1576.13671875,2986.07470703,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(security_gatsh) (2)
    CreateDynamicObject(638,1344.02758789,-1577.63256836,2986.77246094,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_planter_bush) (1)
    CreateDynamicObject(638,1351.60937500,-1577.63183594,2986.77246094,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_planter_bush) (2)
    CreateDynamicObject(3612,1358.35302734,-1563.28112793,2997.91406250,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (8)
    CreateDynamicObject(1726,1353.40222168,-1572.22277832,2986.09252930,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2) (1)
    CreateDynamicObject(1726,1353.40136719,-1568.49316406,2986.09252930,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2) (2)
    CreateDynamicObject(1727,1351.39245605,-1567.55859375,2986.12011719,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2b) (1)
    CreateDynamicObject(1727,1352.38134766,-1575.25390625,2986.12011719,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2b) (2)
    CreateDynamicObject(2126,1352.42687988,-1569.89038086,2986.11108398,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(coffee_swank_5) (1)
    CreateDynamicObject(2126,1352.38525391,-1573.75634766,2986.11108398,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(coffee_swank_5) (2)
    CreateDynamicObject(1726,1350.37060547,-1570.50634766,2986.09252930,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2) (3)
    CreateDynamicObject(1726,1350.36718750,-1574.23242188,2986.09252930,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2) (4)
    CreateDynamicObject(2852,1351.90136719,-1569.42395020,2986.61865234,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(gb_bedmags02) (1)
    CreateDynamicObject(2855,1351.82360840,-1573.26110840,2986.61865234,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(gb_bedmags05) (1)
    CreateDynamicObject(1808,1354.28430176,-1571.32446289,2986.11108398,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_watercooler2) (1)
    CreateDynamicObject(1846,1353.45544434,-1569.52575684,2989.76708984,90.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(shop_shelf04) (1)
    CreateDynamicObject(1846,1353.45507812,-1573.10400391,2989.76708984,90.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(shop_shelf04) (2)
    CreateDynamicObject(2102,1354.48388672,-1567.69738770,2989.82763672,0.00000000,90.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(low_hi_fi_2) (1)
    CreateDynamicObject(2102,1354.48339844,-1574.75146484,2989.82763672,0.00000000,90.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(low_hi_fi_2) (3)
    CreateDynamicObject(2773,1351.13574219,-1576.62939453,2986.59277344,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airprt_bar) (3)
    CreateDynamicObject(2773,1353.30371094,-1576.62890625,2986.59277344,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airprt_bar) (4)
    CreateDynamicObject(2773,1344.68750000,-1576.62890625,2986.59277344,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airprt_bar) (5)
    CreateDynamicObject(2773,1342.61572266,-1576.62890625,2986.59277344,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airprt_bar) (6)
    CreateDynamicObject(2774,1344.01562500,-1565.75781250,2993.18017578,0.00000000,90.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airp_pillars) (3)
    CreateDynamicObject(2774,1341.51562500,-1565.25781250,2996.43017578,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airp_pillars) (4)
    CreateDynamicObject(2774,1349.24169922,-1565.25781250,2996.18017578,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airp_pillars) (5)
    CreateDynamicObject(3612,1341.14746094,-1569.29589844,3005.41406250,0.00000000,0.00000000,269.98901367 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (9)
    CreateDynamicObject(2605,1343.40209961,-1566.83007812,2986.50097656,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 6053); //object(polce_desk1) (1)
    CreateDynamicObject(2773,1322.81054688,-1551.28125000,2986.68603516,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airprt_bar) (7)
    CreateDynamicObject(2773,1348.14892578,-1566.04101562,2986.61840820,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airprt_bar) (9)
    CreateDynamicObject(2257,1341.48730469,-1571.84899902,2990.16040039,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(frame_clip_4) (1)
    CreateDynamicObject(1671,1343.33886719,-1565.41113281,2986.56884766,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (1)
    CreateDynamicObject(3612,1342.27929688,-1542.53027344,2997.80126953,0.00000000,0.00000000,269.98901367 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(14537,1341.21972656,-1546.85351562,2988.01416016,0.00000000,0.00000000,88.74755859 , .interiorid = 1, .worldid = 6053); //object(pdomesbar) (1)
    CreateDynamicObject(3612,1353.46923828,-1539.39013672,2997.41406250,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (11)
    CreateDynamicObject(1726,1338.11474609,-1559.09326172,2986.09179688,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2) (6)
    CreateDynamicObject(1726,1335.23095703,-1559.09277344,2986.09179688,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2) (7)
    CreateDynamicObject(1726,1332.45996094,-1559.09277344,2986.09179688,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2) (8)
    CreateDynamicObject(1726,1329.66845703,-1559.09277344,2986.09179688,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2) (9)
    CreateDynamicObject(1726,1341.01123047,-1560.21337891,2986.09179688,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2) (10)
    CreateDynamicObject(1726,1328.79541016,-1562.21289062,2986.09179688,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2) (11)
    CreateDynamicObject(2126,1339.58496094,-1560.82617188,2986.09912109,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(coffee_swank_5) (3)
    CreateDynamicObject(2126,1336.61230469,-1560.82617188,2986.09912109,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(coffee_swank_5) (4)
    CreateDynamicObject(2126,1333.86230469,-1560.82617188,2986.09912109,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(coffee_swank_5) (5)
    CreateDynamicObject(2126,1331.20800781,-1560.82617188,2986.09912109,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(coffee_swank_5) (6)
    CreateDynamicObject(1846,1337.53540039,-1563.26965332,2989.52050781,90.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(shop_shelf04) (3)
    CreateDynamicObject(1846,1332.04882812,-1563.26953125,2989.52050781,90.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(shop_shelf04) (4)
    CreateDynamicObject(2230,1339.18408203,-1564.63330078,2988.86132812,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 6053); //object(swank_speaker_2) (1)
    CreateDynamicObject(2230,1335.31005859,-1564.63281250,2988.86132812,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(swank_speaker_2) (2)
    CreateDynamicObject(2230,1333.68310547,-1564.63281250,2988.86132812,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(swank_speaker_2) (3)
    CreateDynamicObject(2230,1329.90185547,-1564.63281250,2988.86132812,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(swank_speaker_2) (4)
    CreateDynamicObject(2350,1339.10253906,-1552.37500000,2986.46582031,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_barstool_2) (3)
    CreateDynamicObject(2350,1338.10253906,-1552.37500000,2986.46582031,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_barstool_2) (4)
    CreateDynamicObject(2350,1343.10644531,-1552.49804688,2986.46582031,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_barstool_2) (6)
    CreateDynamicObject(2350,1344.35644531,-1552.49804688,2986.46582031,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_barstool_2) (7)
    CreateDynamicObject(2350,1345.40429688,-1552.49804688,2986.46582031,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_barstool_2) (8)
    CreateDynamicObject(2350,1335.66796875,-1550.95751953,2986.46582031,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_barstool_2) (9)
    CreateDynamicObject(2350,1335.66796875,-1549.20703125,2986.46582031,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_barstool_2) (10)
    CreateDynamicObject(2350,1346.53417969,-1550.85058594,2986.46582031,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_barstool_2) (13)
    CreateDynamicObject(2350,1346.53417969,-1549.20703125,2986.46582031,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_barstool_2) (14)
    CreateDynamicObject(1541,1343.83300781,-1550.85839844,2987.36572266,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_beer_taps_1) (1)
    CreateDynamicObject(1541,1338.66210938,-1550.75244141,2987.35888672,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_beer_taps_1) (2)
    CreateDynamicObject(3612,1357.60253906,-1552.53027344,2997.91406250,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (12)
    CreateDynamicObject(970,1349.87988281,-1549.98925781,2986.67993164,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(fencesmallb) (1)
    CreateDynamicObject(970,1349.87988281,-1554.16064453,2986.67993164,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(fencesmallb) (2)
    CreateDynamicObject(970,1349.87646484,-1558.33203125,2986.67993164,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(fencesmallb) (3)
    CreateDynamicObject(6965,1351.94824219,-1553.73730469,2984.95947266,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(venefountain02) (1)
    CreateDynamicObject(6965,1352.00244141,-1549.98730469,2983.47314453,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(venefountain02) (2)
    CreateDynamicObject(6965,1352.00195312,-1557.53906250,2983.47314453,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(venefountain02) (3)
    CreateDynamicObject(3612,1307.09863281,-1562.82226562,2997.91406250,0.00000000,0.00000000,269.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (13)
    CreateDynamicObject(3612,1317.40332031,-1562.91162109,2997.91406250,0.00000000,0.00000000,179.97253418 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (14)
    CreateDynamicObject(3612,1320.35937500,-1542.59667969,2997.91406250,0.00000000,0.00000000,89.95605469 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (15)
    CreateDynamicObject(2964,1325.69665527,-1561.15783691,2986.13110352,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(k_pooltablesm) (1)
    CreateDynamicObject(3003,1325.53405762,-1560.86535645,2987.06176758,0.00000000,0.00000000,80.00000000 , .interiorid = 1, .worldid = 6053); //object(k_poolballcue) (1)
    CreateDynamicObject(2997,1325.53320312,-1561.61523438,2987.06103516,0.00000000,0.00000000,149.99694824 , .interiorid = 1, .worldid = 6053); //object(k_poolballstp03) (2)
    CreateDynamicObject(2996,1325.78320312,-1561.36523438,2987.06103516,0.00000000,0.00000000,359.99694824 , .interiorid = 1, .worldid = 6053); //object(k_poolballstp02) (1)
    CreateDynamicObject(2999,1325.80712891,-1560.61523438,2987.06103516,0.00000000,0.00000000,169.99694824 , .interiorid = 1, .worldid = 6053); //object(k_poolballstp05) (1)
    CreateDynamicObject(3101,1325.27880859,-1560.54345703,2987.06127930,0.00000000,0.00000000,159.99694824 , .interiorid = 1, .worldid = 6053); //object(k_poolballspt03) (1)
    CreateDynamicObject(3004,1325.52600098,-1561.54431152,2987.01611328,0.00000000,0.00000000,8.00000000 , .interiorid = 1, .worldid = 6053); //object(k_poolq2) (1)
    CreateDynamicObject(3004,1325.35742188,-1561.48242188,2987.01611328,0.00000000,0.00000000,317.99804688 , .interiorid = 1, .worldid = 6053); //object(k_poolq2) (2)
    CreateDynamicObject(1727,1327.45019531,-1559.01171875,2986.14013672,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2b) (5)
    CreateDynamicObject(1727,1327.45019531,-1562.29589844,2986.14013672,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2b) (6)
    CreateDynamicObject(2126,1326.95800781,-1560.69287109,2986.09912109,0.00000000,0.00000000,269.99450684 , .interiorid = 1, .worldid = 6053); //object(coffee_swank_5) (6)
    CreateDynamicObject(1670,1327.45117188,-1561.17675781,2986.62036133,0.00000000,0.00000000,278.74511719 , .interiorid = 1, .worldid = 6053); //object(propcollecttable) (1)
    CreateDynamicObject(3612,1317.40722656,-1544.39257812,2997.91406250,0.00000000,0.00000000,179.96154785 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (14)
    CreateDynamicObject(3612,1317.42041016,-1554.81542969,3000.43066406,0.00000000,0.00000000,179.97253418 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (14)
    CreateDynamicObject(2774,1323.41601562,-1559.36035156,2996.49511719,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airp_pillars) (4)
    CreateDynamicObject(3612,1307.09863281,-1545.75390625,2997.91406250,0.00000000,0.00000000,89.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (13)
    CreateDynamicObject(3612,1299.84863281,-1554.07226562,2997.91406250,0.00000000,0.00000000,179.97253418 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (13)
    CreateDynamicObject(8661,1300.86474609,-1555.16894531,2990.79052734,0.00000000,179.99450684,179.99450684 , .interiorid = 1, .worldid = 6053); //object(gnhtelgrnd_lvs) (2)
    CreateDynamicObject(1502,1313.83984375,-1552.88183594,2986.14013672,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(gen_doorint04) (1)
    CreateDynamicObject(2207,1307.05664062,-1554.47460938,2986.08569336,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office7_desk_1) (1)
    CreateDynamicObject(1708,1304.93139648,-1553.99645996,2986.07324219,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_chair02) (1)
    CreateDynamicObject(14455,1304.17480469,-1559.07324219,2987.74462891,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(gs_bookcase) (2)
    CreateDynamicObject(2007,1303.88574219,-1554.91210938,2986.05566406,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(filing_cab_nu01) (1)
    CreateDynamicObject(2190,1306.86669922,-1552.93334961,2986.86303711,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(pc_1) (1)
    CreateDynamicObject(2855,1306.40625000,-1554.47265625,2986.86303711,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(gb_bedmags05) (2)
    CreateDynamicObject(2261,1303.88891602,-1553.45288086,2988.26831055,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(frame_slim_2) (1)
    CreateDynamicObject(2161,1303.37890625,-1550.60058594,2986.05517578,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office_unit_4) (1)
    CreateDynamicObject(2162,1305.07421875,-1549.27148438,2986.07250977,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office_unit_1) (1)
    CreateDynamicObject(2164,1307.61621094,-1549.30175781,2986.09082031,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office_unit_5) (1)
    CreateDynamicObject(1671,1308.17102051,-1552.64697266,2986.55395508,0.00000000,0.00000000,300.00000000 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (2)
    CreateDynamicObject(1671,1308.17089844,-1554.38281250,2986.55395508,0.00000000,0.00000000,240.00000000 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (3)
    CreateDynamicObject(2611,1303.42614746,-1556.12695312,2988.65673828,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(police_nb1) (1)
    CreateDynamicObject(2199,1309.64062500,-1549.33007812,2986.10327148,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office6_mc_1) (1)
    CreateDynamicObject(2606,1305.79589844,-1549.29003906,2988.62133789,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_police_counter2) (1)
    CreateDynamicObject(2606,1305.79296875,-1549.29003906,2989.07690430,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_police_counter2) (4)
    CreateDynamicObject(1713,1313.17736816,-1550.43359375,2986.12500000,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_couch04) (1)
    CreateDynamicObject(2612,1303.42578125,-1550.87695312,2988.80102539,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(police_nb2) (1)
    CreateDynamicObject(1713,1313.17675781,-1555.19335938,2986.12500000,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_couch04) (2)
    CreateDynamicObject(1708,1311.44042969,-1558.58398438,2986.12500000,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(kb_couch04) (3)
    CreateDynamicObject(2126,1312.29760742,-1551.78674316,2986.12597656,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(coffee_swank_5) (3)
    CreateDynamicObject(2126,1312.29687500,-1556.42626953,2986.12597656,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(coffee_swank_5) (3)
    CreateDynamicObject(2852,1311.81933594,-1551.20507812,2986.63354492,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(gb_bedmags02) (2)
    CreateDynamicObject(2853,1311.75109863,-1555.80468750,2986.63354492,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(gb_bedmags03) (1)
    CreateDynamicObject(2818,1313.53027344,-1554.14355469,2986.14257812,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(gb_bedrug02) (1)
    CreateDynamicObject(2256,1313.77209473,-1551.13024902,2988.92431641,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(frame_clip_3) (1)
    CreateDynamicObject(2258,1313.76806641,-1556.08203125,2988.82958984,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(frame_clip_5) (1)
    CreateDynamicObject(2259,1311.37487793,-1558.81750488,2988.26806641,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 6053); //object(frame_clip_6) (1)
    CreateDynamicObject(16779,1307.09167480,-1553.38085938,2990.77612305,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(ufo_light02) (1)
    CreateDynamicObject(2435,1321.41259766,-1549.77600098,2986.12866211,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_ff_conter_2) (1)
    CreateDynamicObject(2435,1322.34375000,-1549.77539062,2986.12866211,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_ff_conter_2) (8)
    CreateDynamicObject(2435,1323.27148438,-1549.77539062,2986.12866211,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_ff_conter_2) (10)
    CreateDynamicObject(2435,1324.20312500,-1549.77539062,2986.12866211,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_ff_conter_2) (11)
    CreateDynamicObject(2435,1325.13476562,-1549.77539062,2986.12866211,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_ff_conter_2) (12)
    CreateDynamicObject(2434,1326.06518555,-1549.77514648,2986.12890625,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_ff_conter_2b) (3)
    CreateDynamicObject(2435,1326.23046875,-1548.64501953,2986.12866211,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_ff_conter_2) (19)
    CreateDynamicObject(2435,1326.23046875,-1547.71582031,2986.12866211,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_ff_conter_2) (20)
    CreateDynamicObject(1491,1326.54223633,-1547.28784180,2984.64672852,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(gen_doorint01) (2)
    CreateDynamicObject(2332,1303.80554199,-1551.92297363,2986.52099609,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(kev_safe) (1)
    CreateDynamicObject(2453,1323.52880859,-1549.78662109,2987.56274414,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_pizza_dispf) (2)
    CreateDynamicObject(2453,1322.84924316,-1549.82922363,2987.56274414,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_pizza_dispf) (3)
    CreateDynamicObject(2425,1325.48437500,-1549.59619141,2987.18432617,0.00000000,0.00000000,359.99572754 , .interiorid = 1, .worldid = 6053); //object(cj_ff_juice) (1)
    CreateDynamicObject(2222,1324.21630859,-1549.79003906,2987.24926758,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(rustyhigh) (1)
    CreateDynamicObject(2222,1324.67871094,-1549.79003906,2987.24926758,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(rustyhigh) (2)
    CreateDynamicObject(2350,1337.06152344,-1552.37500000,2986.46582031,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_barstool_2) (5)
    CreateDynamicObject(2764,1322.56933594,-1557.55859375,2986.56445312,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_pizza_table03) (1)
    CreateDynamicObject(2642,1320.95996094,-1551.01464844,2988.14233398,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_burger_poster2) (1)
    CreateDynamicObject(2773,1344.62500000,-1566.04101562,2986.62524414,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airprt_bar) (7)
    CreateDynamicObject(2773,1325.15283203,-1551.28125000,2986.67919922,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airprt_bar) (7)
    CreateDynamicObject(2416,1321.42675781,-1546.63281250,2986.16967773,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_ff_disp) (1)
    CreateDynamicObject(2369,1322.34375000,-1549.57031250,2987.18432617,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_till) (1)
    CreateDynamicObject(2764,1322.57519531,-1555.45605469,2986.56445312,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_pizza_table03) (1)
    CreateDynamicObject(3612,1348.02929688,-1533.28027344,2997.86279297,0.00000000,0.00000000,179.98352051 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(3612,1324.55078125,-1526.03320312,2997.87988281,0.00000000,0.00000000,359.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(8661,1339.51367188,-1535.37109375,2990.04052734,0.00000000,179.99450684,179.99450684 , .interiorid = 1, .worldid = 6053); //object(gnhtelgrnd_lvs) (2)
    CreateDynamicObject(3612,1319.71875000,-1539.39257812,2997.91406250,0.00000000,0.00000000,89.95605469 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (14)
    CreateDynamicObject(3612,1336.25195312,-1541.77636719,3001.82763672,0.00000000,0.00000000,269.98901367 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(3095,1316.45422363,-1532.09338379,2986.22241211,0.00000000,180.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(a51_jetdoor) (1)
    CreateDynamicObject(3095,1316.45410156,-1523.09277344,2986.22241211,0.00000000,179.99450684,0.00000000 , .interiorid = 1, .worldid = 6053); //object(a51_jetdoor) (2)
    CreateDynamicObject(3095,1320.91601562,-1530.03710938,2990.42114258,90.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(a51_jetdoor) (3)
    CreateDynamicObject(3095,1320.91601562,-1521.03710938,2990.42114258,90.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(a51_jetdoor) (4)
    CreateDynamicObject(3095,1316.45410156,-1519.10888672,2990.42114258,90.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 6053); //object(a51_jetdoor) (5)
    CreateDynamicObject(3095,1311.95410156,-1523.59179688,2990.42114258,90.00000000,0.00000000,269.98901367 , .interiorid = 1, .worldid = 6053); //object(a51_jetdoor) (6)
    CreateDynamicObject(3095,1311.95410156,-1532.59179688,2990.42114258,90.00000000,0.00000000,269.98901367 , .interiorid = 1, .worldid = 6053); //object(a51_jetdoor) (7)
    CreateDynamicObject(8661,1312.36328125,-1520.99121094,2990.00292969,0.00000000,179.99450684,89.99450684 , .interiorid = 1, .worldid = 6053); //object(gnhtelgrnd_lvs) (2)
    CreateDynamicObject(3095,1316.41992188,-1535.73242188,2990.42114258,90.00000000,0.00000000,359.98901367 , .interiorid = 1, .worldid = 6053); //object(a51_jetdoor) (8)
    CreateDynamicObject(3055,1321.27636719,-1535.21582031,2990.70458984,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(kmb_shutter) (1)
    CreateDynamicObject(3440,1321.24121094,-1536.27539062,2988.77099609,90.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(arptpillar01_lvs) (2)
    CreateDynamicObject(1523,1321.09704590,-1535.97900391,2986.19311523,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(gen_doorext10) (1)
    CreateDynamicObject(9819,1313.28906250,-1531.64062500,2987.11743164,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(shpbridge_sfw02) (1)
    CreateDynamicObject(16782,1312.03283691,-1533.88256836,2988.77392578,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(a51_radar_scan) (1)
    CreateDynamicObject(16782,1312.03222656,-1529.09765625,2988.77392578,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(a51_radar_scan) (2)
    CreateDynamicObject(2606,1311.75976562,-1531.48046875,2988.99096680,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_police_counter2) (5)
    CreateDynamicObject(2606,1311.75976562,-1531.48046875,2988.52172852,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_police_counter2) (6)
    CreateDynamicObject(1671,1313.89440918,-1533.68066406,2986.67919922,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (4)
    CreateDynamicObject(1671,1313.89355469,-1530.69091797,2986.67919922,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (5)
    CreateDynamicObject(1671,1313.89355469,-1527.99853516,2986.67919922,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (6)
    CreateDynamicObject(16662,1305.90844727,-1520.64636230,2987.41503906,0.00000000,0.00000000,63.75000000 , .interiorid = 1, .worldid = 6053); //object(a51_radar_stuff) (1)
    CreateDynamicObject(2185,1315.11901855,-1525.52075195,2986.21875000,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office6_desk_1) (1)
    CreateDynamicObject(1671,1313.89355469,-1524.67285156,2986.67919922,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (7)
    CreateDynamicObject(2007,1312.45703125,-1524.62011719,2986.21875000,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(filing_cab_nu01) (1)
    CreateDynamicObject(3066,1319.77734375,-1520.85546875,2987.27612305,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(ammotrn_obj) (1)
    CreateDynamicObject(936,1320.26159668,-1527.23461914,2986.69409180,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_df_worktop_2) (1)
    CreateDynamicObject(936,1320.26074219,-1529.23437500,2986.69409180,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_df_worktop_2) (2)
    CreateDynamicObject(936,1320.26074219,-1531.20996094,2986.69409180,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_df_worktop_2) (3)
    CreateDynamicObject(936,1320.26074219,-1533.19238281,2986.69409180,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_df_worktop_2) (4)
    CreateDynamicObject(2509,1320.91650391,-1526.98132324,2988.51123047,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_hobby_shelf_6) (1)
    CreateDynamicObject(2509,1320.91601562,-1528.29589844,2988.51123047,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_hobby_shelf_6) (2)
    CreateDynamicObject(2509,1320.91601562,-1529.60107422,2988.51123047,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_hobby_shelf_6) (3)
    CreateDynamicObject(2509,1320.91601562,-1530.90917969,2988.51123047,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_hobby_shelf_6) (4)
    CreateDynamicObject(2509,1320.91601562,-1532.22460938,2988.51123047,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_hobby_shelf_6) (5)
    CreateDynamicObject(2509,1320.91601562,-1533.53906250,2988.51123047,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_hobby_shelf_6) (6)
    CreateDynamicObject(2358,1320.25390625,-1526.79199219,2987.28613281,0.00000000,0.00000000,299.99511719 , .interiorid = 1, .worldid = 6053); //object(ammo_box_c2) (1)
    CreateDynamicObject(2358,1320.25390625,-1527.79199219,2987.28613281,0.00000000,0.00000000,299.98962402 , .interiorid = 1, .worldid = 6053); //object(ammo_box_c2) (3)
    CreateDynamicObject(2358,1320.25390625,-1528.83642578,2987.28613281,0.00000000,0.00000000,279.99511719 , .interiorid = 1, .worldid = 6053); //object(ammo_box_c2) (4)
    CreateDynamicObject(2358,1320.25390625,-1529.77832031,2987.28613281,0.00000000,0.00000000,239.99206543 , .interiorid = 1, .worldid = 6053); //object(ammo_box_c2) (5)
    CreateDynamicObject(2358,1320.25390625,-1529.25097656,2987.51171875,0.00000000,0.00000000,299.99084473 , .interiorid = 1, .worldid = 6053); //object(ammo_box_c2) (6)
    CreateDynamicObject(930,1317.47070312,-1524.22070312,2986.69506836,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(o2_bottles) (1)
    CreateDynamicObject(2060,1320.26318359,-1530.55725098,2987.32641602,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_sandbag) (1)
    CreateDynamicObject(2060,1320.26269531,-1531.05664062,2987.32641602,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_sandbag) (2)
    CreateDynamicObject(2060,1320.26269531,-1531.50830078,2987.32641602,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_sandbag) (3)
    CreateDynamicObject(2060,1320.26269531,-1531.94921875,2987.32641602,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_sandbag) (4)
    CreateDynamicObject(2060,1320.26269531,-1531.74414062,2987.51440430,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_sandbag) (5)
    CreateDynamicObject(2060,1320.26269531,-1531.25488281,2987.51440430,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_sandbag) (6)
    CreateDynamicObject(2060,1320.26269531,-1530.79589844,2987.51440430,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_sandbag) (7)
    CreateDynamicObject(3612,1336.32324219,-1528.53027344,2997.85595703,0.00000000,0.00000000,359.98352051 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(3612,1343.82324219,-1525.53027344,2997.91406250,0.00000000,0.00000000,269.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(2172,1340.41638184,-1536.30664062,2986.09594727,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office2_desk_1) (1)
    CreateDynamicObject(2172,1340.41601562,-1534.33056641,2986.09594727,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office2_desk_1) (2)
    CreateDynamicObject(2172,1340.41601562,-1532.35400391,2986.09594727,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office2_desk_1) (3)
    CreateDynamicObject(2172,1341.65283203,-1529.62402344,2986.09594727,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office2_desk_1) (4)
    CreateDynamicObject(2172,1343.94384766,-1531.35351562,2986.09594727,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office2_desk_1) (5)
    CreateDynamicObject(2172,1343.94335938,-1533.32958984,2986.09594727,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office2_desk_1) (6)
    CreateDynamicObject(2172,1343.94335938,-1535.30859375,2986.09594727,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office2_desk_1) (7)
    CreateDynamicObject(1671,1342.35852051,-1530.68579102,2986.55859375,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (1)
    CreateDynamicObject(1671,1342.93701172,-1531.97705078,2986.55859375,0.00000000,0.00000000,89.99450684 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (1)
    CreateDynamicObject(1671,1342.93652344,-1533.92871094,2986.55859375,0.00000000,0.00000000,89.99450684 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (1)
    CreateDynamicObject(1671,1342.93652344,-1535.91162109,2986.55859375,0.00000000,0.00000000,89.99450684 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (1)
    CreateDynamicObject(1671,1341.43652344,-1535.91113281,2986.55859375,0.00000000,0.00000000,269.99450684 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (1)
    CreateDynamicObject(1671,1341.43652344,-1533.90087891,2986.55859375,0.00000000,0.00000000,269.98901367 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (1)
    CreateDynamicObject(1671,1341.43652344,-1531.90039062,2986.55859375,0.00000000,0.00000000,269.98901367 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (1)
    CreateDynamicObject(2616,1344.36242676,-1534.04150391,2988.72509766,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(police_nb04) (1)
    CreateDynamicObject(1808,1344.23632812,-1537.66015625,2986.10375977,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_watercooler2) (4)
    CreateDynamicObject(16779,1342.19042969,-1532.78222656,2990.02343750,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(ufo_light02) (2)
    CreateDynamicObject(3440,1334.11108398,-1539.05407715,2988.43676758,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(arptpillar01_lvs) (3)
    CreateDynamicObject(3440,1334.11035156,-1536.99511719,2988.43676758,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(arptpillar01_lvs) (5)
    CreateDynamicObject(1502,1334.05615234,-1537.23864746,2986.07202148,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(gen_doorint04) (1)
    CreateDynamicObject(3055,1334.11584473,-1535.21582031,2990.76953125,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(kmb_shutter) (1)
    CreateDynamicObject(3612,1317.80078125,-1515.47851562,2997.85937500,0.00000000,0.00000000,89.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(3612,1345.07324219,-1520.78027344,2997.91406250,0.00000000,0.00000000,269.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(3612,1345.07324219,-1510.32641602,2997.91406250,0.00000000,0.00000000,269.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(14409,1350.04528809,-1515.77819824,2989.26489258,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(carter-stairs02) (1)
    CreateDynamicObject(8661,1333.41064453,-1515.39880371,2995.29052734,0.00000000,179.99450684,179.99450684 , .interiorid = 1, .worldid = 6053); //object(gnhtelgrnd_lvs) (2)
    CreateDynamicObject(3612,1336.25195312,-1528.92333984,3001.82763672,0.00000000,0.00000000,269.98901367 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(8661,1363.54003906,-1500.96191406,2992.45214844,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(gnhtelgrnd_lvs) (4)
    CreateDynamicObject(3612,1361.56286621,-1524.28027344,2997.91406250,0.00000000,0.00000000,269.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(3612,1367.06250000,-1512.61059570,2997.91406250,0.00000000,0.00000000,359.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(8661,1361.09875488,-1503.79870605,2997.19775391,0.00000000,179.99450684,269.99450684 , .interiorid = 1, .worldid = 6053); //object(gnhtelgrnd_lvs) (2)
    CreateDynamicObject(3612,1361.90234375,-1500.55566406,2997.91406250,0.00000000,0.00000000,89.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(3612,1344.87792969,-1514.32617188,3007.07861328,0.00000000,0.00000000,269.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(3440,1352.97265625,-1516.94824219,2993.07885742,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(arptpillar01_lvs) (6)
    CreateDynamicObject(3440,1352.97265625,-1514.25634766,2993.07885742,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(arptpillar01_lvs) (7)
    CreateDynamicObject(2774,1328.05273438,-1545.35595703,2996.49511719,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airp_pillars) (4)
    CreateDynamicObject(2774,1334.58691406,-1545.37597656,2996.49511719,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airp_pillars) (4)
    CreateDynamicObject(2117,1358.07812500,-1512.00878906,2992.45214844,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(swank_dinning_5) (4)
    CreateDynamicObject(2117,1358.07812500,-1511.01904297,2992.45214844,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(swank_dinning_5) (5)
    CreateDynamicObject(2117,1358.07812500,-1510.03564453,2992.45214844,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(swank_dinning_5) (6)
    CreateDynamicObject(2117,1358.07812500,-1509.05566406,2992.45214844,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(swank_dinning_5) (7)
    CreateDynamicObject(3612,1345.07324219,-1503.17871094,2997.91406250,0.00000000,0.00000000,269.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(2117,1358.07812500,-1508.06591797,2992.45214844,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(swank_dinning_5) (10)
    CreateDynamicObject(2117,1358.07812500,-1507.07910156,2992.45214844,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(swank_dinning_5) (11)
    CreateDynamicObject(2491,1358.80664062,-1505.77587891,2992.35644531,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(model_stand) (3)
    CreateDynamicObject(2491,1358.80664062,-1505.27539062,2990.81884766,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(model_stand) (5)
    CreateDynamicObject(1714,1360.49804688,-1511.98632812,2992.45214844,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_swivelchair1) (2)
    CreateDynamicObject(1714,1360.49804688,-1511.02050781,2992.45214844,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_swivelchair1) (3)
    CreateDynamicObject(1714,1360.49804688,-1510.04443359,2992.45214844,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_swivelchair1) (4)
    CreateDynamicObject(1714,1360.49804688,-1509.07812500,2992.45214844,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_swivelchair1) (5)
    CreateDynamicObject(1714,1360.49804688,-1508.10546875,2992.45214844,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_swivelchair1) (6)
    CreateDynamicObject(1714,1360.49804688,-1507.09521484,2992.45214844,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_swivelchair1) (7)
    CreateDynamicObject(1714,1356.74121094,-1507.09472656,2992.45214844,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_swivelchair1) (8)
    CreateDynamicObject(1714,1356.74121094,-1508.10546875,2992.45214844,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_swivelchair1) (9)
    CreateDynamicObject(1714,1356.74121094,-1509.04687500,2992.45214844,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_swivelchair1) (10)
    CreateDynamicObject(1714,1356.74121094,-1509.99218750,2992.45214844,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_swivelchair1) (11)
    CreateDynamicObject(1714,1356.74121094,-1510.99218750,2992.45214844,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_swivelchair1) (12)
    CreateDynamicObject(1714,1356.74121094,-1511.95458984,2992.45214844,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_swivelchair1) (13)
    CreateDynamicObject(16779,1358.55761719,-1509.36425781,2997.17773438,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(ufo_light02) (5)
    CreateDynamicObject(3440,1353.66748047,-1520.68408203,2994.82202148,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(arptpillar01_lvs) (8)
    CreateDynamicObject(3440,1363.43750000,-1504.18359375,2994.82202148,0.00000000,0.00000000,109.99447632 , .interiorid = 1, .worldid = 6053); //object(arptpillar01_lvs) (10)
    CreateDynamicObject(1892,1336.94738770,-1516.08227539,2986.08496094,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(security_gatsh) (2)
    CreateDynamicObject(14455,1363.33288574,-1512.13635254,2994.12402344,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(gs_bookcase) (1)
    CreateDynamicObject(14455,1353.76708984,-1507.78271484,2994.12402344,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(gs_bookcase) (3)
    CreateDynamicObject(2612,1356.21093750,-1504.14208984,2995.07519531,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(police_nb2) (2)
    CreateDynamicObject(2611,1360.94628906,-1504.14550781,2995.05737305,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(police_nb1) (2)
    CreateDynamicObject(1726,1356.87695312,-1520.21191406,2992.45214844,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2) (14)
    CreateDynamicObject(1726,1319.91333008,-1511.32446289,2986.13769531,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2) (16)
    CreateDynamicObject(1846,1358.55981445,-1503.15991211,2995.03955078,90.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(shop_shelf04) (4)
    CreateDynamicObject(3440,1353.66699219,-1504.18359375,2994.82202148,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(arptpillar01_lvs) (13)
    CreateDynamicObject(3440,1363.43750000,-1520.62207031,2994.82202148,0.00000000,0.00000000,109.98962402 , .interiorid = 1, .worldid = 6053); //object(arptpillar01_lvs) (15)
    CreateDynamicObject(1808,1353.77233887,-1513.38745117,2992.45214844,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_watercooler2) (5)
    CreateDynamicObject(2007,1354.07641602,-1505.79345703,2992.45214844,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(filing_cab_nu01) (2)
    CreateDynamicObject(2007,1363.03515625,-1505.79296875,2992.45214844,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(filing_cab_nu01) (2)
    CreateDynamicObject(2774,1337.41003418,-1517.30615234,2999.17651367,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airp_pillars) (4)
    CreateDynamicObject(2774,1337.40917969,-1513.87402344,2999.17651367,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airp_pillars) (4)
    CreateDynamicObject(3612,1334.76269531,-1505.35156250,2996.90380859,0.00000000,0.00000000,89.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(3612,1331.08007812,-1501.25195312,2996.66406250,0.00000000,0.00000000,89.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(3612,1317.58007812,-1499.47851562,2996.66406250,0.00000000,0.00000000,89.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(3612,1312.83007812,-1505.22851562,2996.66406250,0.00000000,0.00000000,179.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(8661,1306.33203125,-1499.46386719,2989.57812500,0.00000000,179.99450684,359.99450684 , .interiorid = 1, .worldid = 6053); //object(gnhtelgrnd_lvs) (2)
    CreateDynamicObject(3612,1317.78076172,-1512.47851562,3000.36230469,0.00000000,0.00000000,89.97802734 , .interiorid = 1, .worldid = 6053); //object(hillhouse12_la) (10)
    CreateDynamicObject(1502,1326.26452637,-1511.87792969,2986.06933594,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(gen_doorint04) (1)
    CreateDynamicObject(1502,1326.21923828,-1508.85400391,2986.06933594,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(gen_doorint04) (1)
    CreateDynamicObject(14455,1316.53479004,-1503.79577637,2987.75073242,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(gs_bookcase) (4)
    CreateDynamicObject(1808,1316.56726074,-1509.41748047,2986.13330078,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_watercooler2) (6)
    CreateDynamicObject(1726,1362.04003906,-1520.21191406,2992.45214844,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2) (17)
    CreateDynamicObject(1726,1322.47558594,-1511.32421875,2986.13769531,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2) (19)
    CreateDynamicObject(2126,1320.94433594,-1510.45324707,2986.13623047,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(coffee_swank_5) (7)
    CreateDynamicObject(2126,1318.41015625,-1510.45312500,2986.13623047,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(coffee_swank_5) (8)
    CreateDynamicObject(2852,1321.31384277,-1510.05456543,2986.64379883,0.00000000,0.00000000,100.00000000 , .interiorid = 1, .worldid = 6053); //object(gb_bedmags02) (3)
    CreateDynamicObject(2854,1318.80224609,-1510.01818848,2986.64379883,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(gb_bedmags04) (1)
    CreateDynamicObject(2205,1320.40759277,-1505.30432129,2986.09960938,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office8_desk_1) (1)
    CreateDynamicObject(1708,1319.22314453,-1503.67272949,2986.07983398,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_chair02) (2)
    CreateDynamicObject(1671,1320.60363770,-1506.59313965,2986.56250000,0.00000000,0.00000000,210.00000000 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (1)
    CreateDynamicObject(1671,1318.88427734,-1506.59277344,2986.56250000,0.00000000,0.00000000,149.99450684 , .interiorid = 1, .worldid = 6053); //object(swivelchair_a) (1)
    CreateDynamicObject(2190,1320.26123047,-1505.59484863,2987.03613281,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 6053); //object(pc_1) (2)
    CreateDynamicObject(2186,1323.16467285,-1505.25781250,2986.09619141,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(photocopier_1) (1)
    CreateDynamicObject(1828,1319.52062988,-1508.20068359,2986.11523438,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(man_sdr_rug) (1)
    CreateDynamicObject(2818,1325.68847656,-1510.85205078,2986.09472656,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(gb_bedrug02) (2)
    CreateDynamicObject(2164,1321.13208008,-1503.01831055,2986.10278320,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office_unit_5) (2)
    CreateDynamicObject(2162,1326.25427246,-1505.48022461,2986.11132812,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office_unit_1) (2)
    CreateDynamicObject(2199,1326.19226074,-1507.54357910,2986.11132812,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(med_office6_mc_1) (2)
    CreateDynamicObject(2286,1319.70043945,-1503.03698730,2988.28222656,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(frame_5) (1)
    CreateDynamicObject(2774,1333.57324219,-1520.69775391,2996.49511719,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airp_pillars) (4)
    CreateDynamicObject(2774,1327.38818359,-1518.32031250,2996.49511719,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_airp_pillars) (4)
    CreateDynamicObject(2332,1322.51586914,-1504.17468262,2986.55493164,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(kev_safe) (2)
    CreateDynamicObject(2186,1303.84863281,-1556.93066406,2986.09008789,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(photocopier_1) (2)
    CreateDynamicObject(1727,1332.27343750,-1529.68847656,2986.07836914,0.00000000,0.00000000,260.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2b) (5)
    CreateDynamicObject(1727,1332.09228516,-1527.65039062,2986.07836914,0.00000000,0.00000000,280.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2b) (5)
    CreateDynamicObject(2725,1332.15515137,-1529.18530273,2986.51147461,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(lm_striptable) (1)
    CreateDynamicObject(1670,1332.21142578,-1529.14831543,2986.96801758,0.00000000,0.00000000,278.74511719 , .interiorid = 1, .worldid = 6053); //object(propcollecttable) (1)
    CreateDynamicObject(2254,1332.74475098,-1529.16613770,2988.82641602,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(frame_clip_1) (1)
    CreateDynamicObject(1727,1329.99511719,-1543.27453613,2986.08691406,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2b) (5)
    CreateDynamicObject(2126,1328.97753906,-1541.17883301,2986.07714844,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(coffee_swank_5) (11)
    CreateDynamicObject(2255,1329.34985352,-1541.64074707,2988.24072266,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(frame_clip_2) (1)
    CreateDynamicObject(1727,1328.99511719,-1540.02441406,2986.08691406,0.00000000,0.00000000,359.98901367 , .interiorid = 1, .worldid = 6053); //object(mrk_seating2b) (5)
    CreateDynamicObject(1714,1358.57666016,-1513.44824219,2992.45214844,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 6053); //object(kb_swivelchair1) (1)
    CreateDynamicObject(2416,1323.35839844,-1546.63281250,2986.16967773,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_ff_disp) (1)
    CreateDynamicObject(2007,1317.40429688,-1503.50756836,2986.07055664,0.00000000,0.00000000,0.00000000 , .interiorid = 1, .worldid = 6053); //object(filing_cab_nu01) (1)
    CreateDynamicObject(2313,1338.21118164,-1563.98291016,2986.09082031,0.00000000,0.00000000,180.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_tv_table1) (1)
    CreateDynamicObject(2313,1332.75878906,-1563.98242188,2986.09082031,0.00000000,0.00000000,179.99450684 , .interiorid = 1, .worldid = 6053); //object(cj_tv_table1) (2)
    CreateDynamicObject(2639,1321.37597656,-1557.46105957,2986.80981445,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_pizza_chair3) (1)
    CreateDynamicObject(2639,1321.37597656,-1555.45751953,2986.80981445,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_pizza_chair3) (2)
    CreateDynamicObject(2639,1323.80078125,-1555.56298828,2986.80981445,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_pizza_chair3) (3)
    CreateDynamicObject(2639,1323.79687500,-1557.66455078,2986.80981445,0.00000000,0.00000000,90.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_pizza_chair3) (4)
    CreateDynamicObject(2567,1317.32629395,-1521.15124512,2988.14648438,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(ab_warehouseshelf) (1)
    CreateDynamicObject(2036,1320.32165527,-1533.26135254,2987.20361328,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(cj_psg1) (3)
    CreateDynamicObject(356,1320.81982422,-1527.02880859,2988.84497070,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(1)
    CreateDynamicObject(356,1320.81933594,-1527.02832031,2988.01635742,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(2)
    CreateDynamicObject(356,1320.81933594,-1529.02832031,2988.84497070,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(3)
    CreateDynamicObject(356,1320.81933594,-1529.04541016,2988.01635742,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(4)
    CreateDynamicObject(359,1320.82714844,-1531.27246094,2988.88500977,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(5)
    CreateDynamicObject(359,1320.82714844,-1531.27246094,2988.00805664,0.00000000,0.00000000,270.00000000 , .interiorid = 1, .worldid = 6053); //object(6)
    CreateDynamicObject(351,1320.84680176,-1532.78564453,2987.95727539,0.00000000,0.00000000,276.00000000 , .interiorid = 1, .worldid = 6053); //object(9)
    CreateDynamicObject(351,1320.84667969,-1532.78515625,2988.88549805,0.00000000,0.00000000,275.99853516 , .interiorid = 1, .worldid = 6053); //object(10)

    // Name Warren Fuente - CUSTOM GANG HQ - ORDER ID 23280
    CreateDynamicObject(14602, 1635.20, 906.90, 2000.00,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1522, 1649.85, 907.70, 1994.60,   0.00, 0.00, 270.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1976, 1612.22, 908.80, 1997.90,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1976, 1612.22, 905.40, 1997.90,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2412, 1648.90, 907.40, 1994.70,   0.00, 0.00, 270.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2412, 1648.90, 905.83, 1994.70,   0.00, 0.00, 269.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2008, 1615.70, 916.00, 1994.72,   0.00, 0.00, 270.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2008, 1615.70, 920.50, 1994.72,   0.00, 0.00, 269.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1714, 1614.40, 911.20, 1994.60,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1714, 1614.40, 915.54, 1994.60,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1714, 1614.40, 920.00, 1994.60,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2008, 1615.70, 903.00, 1994.72,   0.00, 0.00, 269.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2008, 1615.70, 899.00, 1994.72,   0.00, 0.00, 269.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2008, 1615.70, 894.00, 1994.72,   0.00, 0.00, 269.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1714, 1614.50, 901.80, 1994.60,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1714, 1614.50, 898.40, 1994.60,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1714, 1614.50, 893.00, 1994.60,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2610, 1612.50, 894.30, 1995.50,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2610, 1612.50, 894.91, 1995.50,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2610, 1612.50, 895.54, 1995.50,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2610, 1612.50, 896.10, 1995.50,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2610, 1612.50, 899.90, 1995.50,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2610, 1612.50, 900.40, 1995.50,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2610, 1612.50, 901.00, 1995.50,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2610, 1612.50, 901.60, 1995.50,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2610, 1612.50, 911.80, 1995.50,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2610, 1612.50, 912.34, 1995.50,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2610, 1612.50, 913.00, 1995.50,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2610, 1612.50, 913.55, 1995.50,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2610, 1612.50, 917.60, 1995.50,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2610, 1612.50, 918.20, 1995.50,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2610, 1612.50, 918.83, 1995.50,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2610, 1612.50, 919.44, 1995.50,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2942, 1637.00, 903.10, 1995.30,   0.00, 0.00, 180.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(640, 1646.70, 911.00, 1995.30,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(640, 1641.50, 911.00, 1995.30,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(638, 1637.45, 910.81, 1995.30,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1775, 1645.90, 903.10, 1995.70,   0.00, 0.00, 180.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1776, 1644.20, 903.20, 1995.70,   0.00, 0.00, 180.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(14593, 1618.52, 936.95, 1996.96,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(14596, 1626.73, 886.49, 1999.53,   0.00, 0.00, 270.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2817, 1632.90, 919.00, 1994.69,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2817, 1632.90, 918.03, 1994.69,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2817, 1632.90, 917.06, 1994.69,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2817, 1632.90, 916.08, 1994.69,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2817, 1630.91, 915.11, 1994.69,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2817, 1630.91, 916.08, 1994.69,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2817, 1632.90, 915.11, 1994.69,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2817, 1630.91, 917.06, 1994.69,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2817, 1630.91, 919.00, 1994.69,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2817, 1630.91, 918.03, 1994.69,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2370, 1631.90, 916.60, 1994.60,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2852, 1632.00, 916.70, 1995.50,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2852, 1632.30, 917.20, 1995.50,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1846, 1635.20, 916.45, 1997.40,   90.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2233, 1636.20, 914.20, 1994.70,   0.00, 0.00, 270.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2233, 1636.40, 917.70, 1994.70,   0.00, 0.00, 269.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2259, 1631.20, 922.10, 1997.00,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2258, 1633.30, 922.30, 1997.80,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2257, 1636.12, 920.00, 1997.90,   0.00, 0.00, 270.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2395, 1634.74, 892.97, 1992.27,   0.00, 0.00, 180.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2395, 1634.75, 892.97, 1995.01,   0.00, 0.00, 179.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2395, 1632.20, 891.00, 1997.70,   90.00, 0.00, 179.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2395, 1626.70, 924.30, 1994.67,   270.00, 0.00, 179.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1502, 1624.44, 922.60, 1994.61,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1502, 1624.44, 929.44, 1994.61,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1536, 1627.60, 928.04, 1994.60,   0.00, 0.00, 270.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2357, 1617.67, 944.10, 1995.00,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2357, 1619.00, 944.10, 1995.00,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2357, 1619.00, 939.80, 1995.00,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2357, 1617.67, 939.80, 1995.00,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2357, 1617.67, 935.59, 1995.00,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2357, 1619.00, 935.59, 1995.00,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1714, 1618.10, 947.00, 1994.60,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1616.20, 945.10, 1994.60,   0.00, 0.00, 115.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1616.20, 943.00, 1994.60,   0.00, 0.00, 115.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1616.20, 941.00, 1994.60,   0.00, 0.00, 115.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1616.20, 939.00, 1994.60,   0.00, 0.00, 115.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1616.20, 937.00, 1994.60,   0.00, 0.00, 115.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1616.20, 935.00, 1994.60,   0.00, 0.00, 115.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1617.65, 932.55, 1994.60,   0.00, 0.00, 180.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1619.00, 932.55, 1994.60,   0.00, 0.00, 179.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1620.90, 945.10, 1994.60,   0.00, 0.00, 245.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1620.90, 943.00, 1994.60,   0.00, 0.00, 245.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1620.90, 941.00, 1994.60,   0.00, 0.00, 245.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1620.90, 939.00, 1994.60,   0.00, 0.00, 245.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1620.90, 937.00, 1994.60,   0.00, 0.00, 245.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1620.90, 935.00, 1994.60,   0.00, 0.00, 245.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(14576, 1613.09, 885.00, 1984.44,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(16637, 1627.81, 888.44, 1993.01,   0.00, 0.00, 180.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(16637, 1627.80, 891.29, 1990.00,   0.00, 0.00, 179.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(16637, 1627.80, 885.99, 1990.00,   0.00, 0.00, 179.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1829, 1590.10, 884.50, 1976.70,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2634, 1606.60, 885.90, 1978.10,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(3089, 1628.89, 890.63, 1986.00,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(14894, 1629.30, 891.90, 1986.10,   0.00, 0.00, 180.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2357, 1615.60, 886.90, 1984.00,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2357, 1619.84, 886.90, 1984.00,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1714, 1612.70, 887.10, 1983.70,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1614.80, 888.70, 1983.70,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1617.00, 888.70, 1983.70,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1619.00, 888.70, 1983.70,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1621.00, 888.70, 1983.70,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1622.70, 887.00, 1983.70,   0.00, 0.00, 270.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1621.00, 885.50, 1983.70,   0.00, 0.00, 180.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1619.00, 885.50, 1983.70,   0.00, 0.00, 180.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1617.00, 885.50, 1983.70,   0.00, 0.00, 180.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1614.80, 885.50, 1983.70,   0.00, 0.00, 180.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(14594, 1642.13, 914.24, 2000.42,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(14597, 1630.24, 905.37, 2008.23,   0.00, 0.00, 270.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2207, 1620.00, 896.90, 2006.20,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2207, 1620.00, 904.90, 2006.20,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2207, 1641.30, 906.10, 2006.20,   0.00, 0.00, 270.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2207, 1641.30, 899.00, 2006.20,   0.00, 0.00, 269.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2439, 1629.60, 914.90, 2006.20,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2439, 1630.60, 914.90, 2006.20,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2440, 1631.60, 914.90, 2006.20,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2440, 1628.60, 914.92, 2006.20,   0.00, 0.00, 270.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1714, 1630.20, 916.10, 2006.20,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1714, 1618.50, 905.90, 2006.20,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1714, 1618.20, 898.00, 2006.20,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1714, 1643.10, 898.00, 2006.20,   0.00, 0.00, 270.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1714, 1643.10, 905.00, 2006.20,   0.00, 0.00, 269.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1640.20, 906.20, 2006.20,   0.00, 0.00, 52.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1640.30, 904.40, 2006.20,   0.00, 0.00, 106.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1640.30, 897.40, 2006.20,   0.00, 0.00, 106.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1640.40, 898.90, 2006.20,   0.00, 0.00, 64.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1621.30, 898.90, 2006.20,   0.00, 0.00, 312.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1621.40, 896.60, 2006.20,   0.00, 0.00, 248.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1621.20, 904.60, 2006.20,   0.00, 0.00, 247.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1621.10, 906.40, 2006.20,   0.00, 2.00, 291.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1754, 1629.20, 913.30, 2006.20,   0.00, 0.00, 152.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1754, 1631.20, 913.50, 2006.20,   0.00, 0.00, 202.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(14455, 1616.70, 907.80, 2007.90,   0.00, 0.00, 270.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(14455, 1616.80, 900.00, 2007.90,   0.00, 0.00, 269.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(16779, 1623.20, 897.80, 2010.40,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(16779, 1622.90, 905.40, 2010.40,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(16779, 1637.20, 905.70, 2010.40,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(16779, 1636.40, 898.20, 2010.40,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(14455, 1643.90, 895.80, 2007.90,   0.00, 0.00, 90.01, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(14455, 1643.90, 903.60, 2007.90,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1703, 1635.90, 908.80, 2006.21,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1703, 1635.70, 901.00, 2006.21,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1703, 1623.80, 900.90, 2006.21,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1703, 1623.40, 908.90, 2006.21,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(14455, 1632.50, 918.50, 2007.90,   0.00, 0.00, 180.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1964, 1630.40, 915.00, 2007.40,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2344, 1631.00, 914.70, 2007.30,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1792, 1633.50, 913.40, 2008.50,   0.00, 0.00, 270.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1703, 1646.64, 930.10, 2000.44,   0.00, 0.00, 270.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1502, 1647.50, 888.27, 2000.40,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1502, 1655.60, 895.40, 2000.40,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1502, 1653.21, 927.73, 2000.40,   0.00, 0.00, 179.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1506, 1625.40, 914.30, 2000.40,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1502, 1623.70, 927.80, 2000.50,   0.00, 0.00, 179.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1846, 1660.80, 940.40, 2001.90,   270.00, 0.00, 310.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(16637, 1661.37, 941.40, 1999.55,   0.00, 0.00, 40.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(16637, 1664.14, 940.91, 2001.30,   0.00, 0.00, 120.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(16637, 1661.70, 941.00, 2004.30,   0.00, 0.00, 40.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(16637, 1662.30, 943.00, 2001.30,   0.00, 0.00, 119.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1744, 1661.30, 941.40, 2003.10,   0.00, 0.00, 311.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(14782, 1658.50, 928.60, 2001.50,   0.00, 0.00, 179.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2606, 1618.50, 935.90, 2002.30,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2606, 1618.50, 935.90, 2002.80,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2606, 1618.50, 935.90, 2003.30,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2606, 1618.50, 935.90, 2003.80,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2606, 1624.50, 935.90, 2002.20,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2606, 1624.50, 935.90, 2002.70,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2606, 1624.50, 935.90, 2003.20,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2606, 1624.50, 935.90, 2003.70,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2606, 1616.70, 929.90, 2002.00,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2606, 1616.70, 929.90, 2002.50,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2606, 1616.70, 929.90, 2003.00,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2606, 1616.70, 929.90, 2003.50,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2606, 1626.40, 933.50, 2002.10,   0.00, 0.00, 270.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2606, 1626.40, 933.50, 2002.60,   0.00, 0.00, 269.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2606, 1626.40, 933.50, 2003.10,   0.00, 0.00, 269.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2606, 1626.40, 933.50, 2003.60,   0.00, 0.00, 269.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1703, 1627.90, 910.50, 2006.21,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1703, 1633.30, 922.10, 1994.60,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1703, 1629.00, 922.10, 1994.60,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1703, 1628.30, 918.10, 1994.60,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1703, 1628.30, 914.00, 1994.60,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1703, 1632.80, 913.50, 1994.60,   0.00, 0.00, 180.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1703, 1635.80, 913.50, 1994.60,   0.00, 0.00, 179.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1808, 1632.20, 922.10, 1994.60,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(18001, 1627.70, 916.70, 1995.68,   0.00, 0.00, 270.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(18001, 1627.70, 916.70, 1997.10,   0.00, 0.00, 269.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(18001, 1627.70, 916.70, 1994.25,   0.00, 0.00, 269.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(18001, 1627.70, 924.84, 1994.25,   0.00, 0.00, 269.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(18001, 1627.70, 924.84, 1997.10,   0.00, 0.00, 269.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(18001, 1627.70, 924.84, 1995.68,   0.00, 0.00, 269.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(18001, 1627.70, 916.70, 1995.68,   0.00, 0.00, 90.01, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(18001, 1627.70, 916.70, 1997.10,   0.00, 0.00, 90.01, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(18001, 1627.70, 916.70, 1994.25,   0.00, 0.00, 90.01, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(18001, 1627.70, 924.84, 1994.25,   0.00, 0.00, 90.01, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(14632, 1644.60, 934.10, 2001.90,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(14632, 1640.12, 934.10, 2001.90,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(14632, 1640.12, 928.54, 2001.90,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(14632, 1644.60, 928.54, 2001.90,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1502, 1633.70, 927.90, 2000.40,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1703, 1646.64, 933.00, 2000.44,   0.00, 0.00, 270.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1703, 1637.60, 927.90, 2000.40,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1703, 1637.60, 930.66, 2000.40,   0.00, 0.00, 89.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1703, 1639.00, 933.20, 2000.40,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1703, 1643.00, 933.20, 2000.40,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(14782, 1649.50, 931.70, 2001.50,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(14782, 1649.50, 938.20, 2001.50,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(14782, 1662.30, 930.70, 2001.50,   0.00, 0.00, 270.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1703, 1656.80, 938.30, 2000.40,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1703, 1660.30, 937.20, 2000.40,   0.00, 0.00, 180.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(14782, 1653.50, 941.70, 2001.50,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1817, 1658.90, 939.10, 2000.40,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(14782, 1655.60, 933.70, 2001.50,   0.00, 0.00, 179.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(14782, 1655.56, 932.99, 2001.50,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(3390, 1617.10, 934.20, 2000.40,   0.00, 0.00, 180.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(3390, 1619.50, 928.50, 2000.40,   0.00, 0.00, 270.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(3391, 1621.70, 935.50, 2000.40,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(3393, 1625.90, 930.40, 2000.40,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(3392, 1625.90, 934.00, 2000.40,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1714, 1624.10, 929.90, 2000.40,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1714, 1624.10, 933.40, 2000.40,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1714, 1619.50, 929.90, 2000.40,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1714, 1618.60, 934.60, 2000.40,   0.00, 0.00, 272.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1714, 1621.80, 934.10, 2000.40,   0.00, 0.00, 182.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1594, 1653.30, 937.10, 2000.90,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2357, 1661.50, 882.60, 2000.80,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2357, 1656.30, 882.60, 2000.80,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2357, 1651.00, 882.60, 2000.80,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1714, 1661.30, 881.10, 2000.40,   0.00, 0.00, 180.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1714, 1656.50, 881.20, 2000.40,   0.00, 0.00, 179.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1714, 1650.70, 881.10, 2000.40,   0.00, 0.00, 179.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2190, 1661.00, 883.00, 2001.20,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2190, 1656.40, 882.90, 2001.20,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2190, 1650.60, 883.00, 2001.20,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1811, 1662.60, 884.20, 2001.10,   0.00, 0.00, 78.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1811, 1660.60, 884.30, 2001.10,   0.00, 0.00, 110.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1811, 1657.40, 884.20, 2001.10,   0.00, 0.00, 68.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1811, 1655.30, 884.10, 2001.10,   0.00, 0.00, 95.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1811, 1652.40, 884.20, 2001.10,   0.00, 0.00, 67.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1811, 1650.70, 884.30, 2001.10,   0.00, 0.00, 99.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1703, 1661.40, 892.10, 2000.40,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1703, 1657.40, 892.00, 2000.40,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1703, 1653.10, 891.90, 2000.40,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1703, 1649.10, 892.10, 2000.40,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2008, 1615.70, 911.90, 1994.72,   0.00, 0.00, 269.99, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(18766, 1616.00, 913.87, 1999.90,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(18763, 161210.36, 1996.00, 1996.00,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(18766, 1616.00, 923.87, 1999.90,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(18766, 1616.00, 899.82, 1999.90,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(18766, 1615.98, 889.81, 1999.90,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(3494, 1616.76, 903.69, 1998.00,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1491, 1619.37, 906.12, 1995.28,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(3494, 1617.67, 903.73, 1998.00,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(3494, 1618.73, 904.03, 1998.00,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(3494, 1619.37, 904.90, 1998.00,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(3494, 1619.33, 905.51, 1998.00,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(3494, 1619.13, 908.23, 1998.00,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(3494, 1618.95, 908.83, 1998.00,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(3494, 1618.25, 909.42, 1998.00,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(3494, 1617.48, 909.75, 1998.00,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(3494, 1616.82, 909.84, 1998.00,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(16637, 1619.52, 906.62, 1999.00,   0.00, 0.00, 180.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(3858, 1616.28, 896.19, 1998.00,   0.00, 0.00, 315.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(18001, 1616.10, 913.55, 1997.00,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(18001, 1616.10, 921.70, 1997.00,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(18001, 1616.10, 921.70, 1995.58,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(18001, 1616.10, 913.55, 1995.58,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(3858, 1616.02, 917.43, 1998.00,   0.00, 0.00, 315.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(3858, 1616.02, 917.43, 1998.00,   0.00, 0.00, 315.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(18001, 1616.34, 899.40, 1996.76,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(18001, 1616.34, 899.40, 1995.32,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(18001, 1616.34, 891.25, 1995.32,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(18001, 1616.34, 891.25, 1996.76,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(3858, 1637.41, 912.66, 1995.15,   0.00, 0.00, 45.03, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(3858, 1637.41, 912.58, 1995.15,   0.00, 0.00, 45.03, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(3858, 1637.41, 912.58, 1995.15,   0.00, 0.00, 45.03, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1976, 1619.67, 906.93, 1998.70,   0.00, 0.00, 90.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(18766, 1660.44, 909.34, 2002.00,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(18766, 1670.44, 909.34, 2002.00,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1649, 1662.03, 908.82, 2002.41,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2230, 1664.76, 909.13, 2002.61,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2230, 1664.76, 909.13, 2000.81,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2230, 1660.02, 909.15, 2000.81,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2230, 1660.02, 909.15, 2002.66,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2491, 1658.97, 907.88, 1999.69,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2491, 1658.97, 907.88, 1998.66,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1998, 1666.59, 908.15, 2000.50,   0.00, 0.00, 180.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1714, 1665.75, 908.19, 2000.40,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2172, 1664.16, 901.56, 2000.29,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2172, 1666.08, 901.59, 2000.29,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2172, 1665.88, 899.01, 2000.29,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2172, 1664.00, 899.01, 2000.29,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2172, 1664.09, 896.51, 2000.29,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2172, 1665.99, 896.51, 2000.29,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2172, 1656.05, 902.04, 2000.29,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2172, 1658.00, 902.04, 2000.29,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2172, 1656.18, 900.07, 2000.29,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2172, 1658.10, 900.07, 2000.29,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2172, 1657.94, 898.05, 2000.29,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2172, 1656.05, 898.05, 2000.29,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2172, 1656.10, 904.65, 2000.29,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2172, 1658.04, 904.71, 2000.29,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1658.82, 903.60, 2000.44,   0.00, 0.00, 180.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1656.93, 903.54, 2000.44,   0.00, 0.00, 180.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1658.82, 901.11, 2000.44,   0.00, 0.00, 180.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1656.94, 901.17, 2000.44,   0.00, 0.00, 180.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1658.41, 899.23, 2000.44,   0.00, 0.00, 180.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1656.39, 899.26, 2000.44,   0.00, 0.00, 180.00, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1658.21, 897.20, 2000.44,   0.00, 0.00, 180.10, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1656.34, 897.16, 2000.44,   0.00, 0.00, 180.10, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1664.47, 897.67, 2000.44,   0.00, 0.00, 180.10, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1666.34, 897.87, 2000.44,   0.00, 0.00, 180.10, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1666.43, 895.45, 2000.44,   0.00, 0.00, 180.10, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1664.60, 895.52, 2000.44,   0.00, 0.00, 180.10, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1666.40, 900.42, 2000.44,   0.00, 0.00, 180.10, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1715, 1664.51, 900.38, 2000.44,   0.00, 0.00, 180.10, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1622, 1637.79, 903.09, 1997.33,   0.00, 0.00, 248.78, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(1622, 1628.33, 884.79, 1988.00,   0.00, 0.00, 194.16, .interiorid = 1, .worldid = 6047);
    CreateDynamicObject(2921, 1633.53, 892.34, 2009.00,   0.00, 0.00, 0.00, .interiorid = 1, .worldid = 6047);

	 //HQ gang
	CreateDynamicObject(14623,-2775.95898438,85.45605469,4504.74804688,0.00000000,0.00000000,0.00000000); //object(mafcasmain1) (1)
	CreateDynamicObject(14594,-2788.21093750,25.38867188,4499.18554688,0.00000000,0.00000000,270.00000000); //object(paperchase03) (1)
	CreateDynamicObject(16500,-2770.30102539,46.89076614,4501.20166016,0.00000000,0.00000000,90.00000000); //object(cn2_savgardr1_) (1)
	CreateDynamicObject(16500,-2773.05078125,46.90039062,4501.20166016,0.00000000,0.00000000,90.00000000); //object(cn2_savgardr1_) (2)
	CreateDynamicObject(16500,-2779.54101562,46.87160873,4501.19531250,0.00000000,0.00000000,90.00000000); //object(cn2_savgardr1_) (3)
	CreateDynamicObject(16500,-2776.64453125,46.87304688,4503.67626953,0.00000000,0.00000000,90.24719238); //object(cn2_savgardr1_) (4)
	CreateDynamicObject(1491,-2777.07373047,46.85060120,4499.20117188,0.00000000,0.00000000,0.00000000); //object(gen_doorint01) (1)
	CreateDynamicObject(16500,-2776.64453125,46.87304688,4503.67626953,0.00000000,0.00000000,270.24719238); //object(cn2_savgardr1_) (6)
	CreateDynamicObject(16500,-2779.54101562,46.87109375,4501.19531250,0.00000000,0.00000000,270.00000000); //object(cn2_savgardr1_) (7)
	CreateDynamicObject(1491,-2793.47949219,49.82350540,4499.20117188,0.00000000,0.00000000,90.00000000); //object(gen_doorint01) (2)
	CreateDynamicObject(1703,-2803.08593750,53.23339844,4499.19335938,0.00000000,0.00000000,0.00000000); //object(kb_couch02) (2)
	CreateDynamicObject(1703,-2805.01635742,49.18947601,4499.20117188,0.00000000,0.00000000,90.00000000); //object(kb_couch02) (3)
	CreateDynamicObject(1703,-2798.84179688,51.28515625,4499.20117188,0.00000000,0.00000000,270.00000000); //object(kb_couch02) (4)
	CreateDynamicObject(1703,-2810.92358398,45.95611954,4499.19335938,0.00000000,0.00000000,180.00000000); //object(kb_couch02) (5)
	CreateDynamicObject(1703,-2813.23242188,49.48320007,4499.19335938,0.00000000,0.00000000,89.99450684); //object(kb_couch02) (6)
	CreateDynamicObject(2311,-2802.78881836,50.08411407,4499.20117188,0.00000000,0.00000000,0.00000000); //object(cj_tv_table2) (1)
	CreateDynamicObject(2311,-2811.27832031,51.37597656,4499.19335938,0.00000000,0.00000000,270.00000000); //object(cj_tv_table2) (2)
	CreateDynamicObject(2964,-2807.40625000,57.28515625,4499.17626953,0.00000000,0.00000000,0.00000000); //object(k_pooltablesm) (1)
	CreateDynamicObject(2357,-2778.54003906,5.48929977,4499.58837891,0.00000000,0.00000000,270.00000000); //object(dunc_dinning) (2)
	CreateDynamicObject(2357,-2778.53857422,1.22556686,4499.58837891,0.00000000,0.00000000,270.00000000); //object(dunc_dinning) (3)
	CreateDynamicObject(1671,-2779.93432617,6.74639702,4499.66162109,0.00000000,0.00000000,90.00000000); //object(swivelchair_a) (1)
	CreateDynamicObject(1671,-2779.92333984,4.99612045,4499.66162109,0.00000000,0.00000000,70.00000000); //object(swivelchair_a) (2)
	CreateDynamicObject(1671,-2779.96362305,3.37083578,4499.66162109,0.00000000,0.00000000,99.99938965); //object(swivelchair_a) (3)
	CreateDynamicObject(1671,-2779.95410156,1.87014151,4499.66162109,0.00000000,0.00000000,89.74755859); //object(swivelchair_a) (4)
	CreateDynamicObject(1671,-2779.83251953,0.19031005,4499.66162109,0.00000000,0.00000000,93.99731445); //object(swivelchair_a) (5)
	CreateDynamicObject(1671,-2777.28540039,7.01015329,4499.66162109,0.00000000,0.00000000,273.99353027); //object(swivelchair_a) (6)
	CreateDynamicObject(1671,-2777.27124023,5.08334589,4499.66162109,0.00000000,0.00000000,269.99353027); //object(swivelchair_a) (7)
	CreateDynamicObject(1671,-2777.24487305,3.58136201,4499.66162109,0.00000000,0.00000000,269.98901367); //object(swivelchair_a) (8)
	CreateDynamicObject(1671,-2777.30053711,1.83198094,4499.66162109,0.00000000,0.00000000,249.98901367); //object(swivelchair_a) (9)
	CreateDynamicObject(1671,-2777.30566406,0.25586838,4499.66162109,0.00000000,0.00000000,279.98840332); //object(swivelchair_a) (10)
	CreateDynamicObject(3077,-2778.57519531,-3.11664891,4499.19335938,0.00000000,0.00000000,0.00000000); //object(nf_blackboard) (1)
	CreateDynamicObject(1714,-2778.49243164,8.32152843,4499.20117188,0.00000000,0.00000000,358.00000000); //object(kb_swivelchair1) (1)
	CreateDynamicObject(2067,-2773.47387695,8.74494934,4499.19335938,0.00000000,0.00000000,0.00000000); //object(cj_m_fileing3) (1)
	CreateDynamicObject(2067,-2774.04394531,8.74663925,4499.19335938,0.00000000,0.00000000,0.00000000); //object(cj_m_fileing3) (2)
	CreateDynamicObject(2067,-2774.61328125,8.74719238,4499.19335938,0.00000000,0.00000000,0.00000000); //object(cj_m_fileing3) (3)
	CreateDynamicObject(2163,-2773.26684570,1.74378014,4499.19335938,0.00000000,0.00000000,270.00000000); //object(med_office_unit_2) (1)
	CreateDynamicObject(2162,-2773.25122070,4.85203791,4499.19335938,0.00000000,0.00000000,270.00000000); //object(med_office_unit_1) (1)
	CreateDynamicObject(2161,-2773.26293945,3.07736588,4499.19335938,0.00000000,0.00000000,270.00000000); //object(med_office_unit_4) (1)
	CreateDynamicObject(2164,-2773.27270508,-0.02717209,4499.19335938,0.00000000,0.00000000,270.00000000); //object(med_office_unit_5) (1)
	CreateDynamicObject(1808,-2778.18310547,11.10279942,4499.20117188,0.00000000,0.00000000,0.00000000); //object(cj_watercooler2) (1)
	CreateDynamicObject(14782,-2764.14550781,11.16503906,4500.21728516,0.00000000,0.00000000,0.00000000); //object(int3int_boxing30) (1)
	CreateDynamicObject(14629,-2770.33911133,93.33288574,4507.23828125,0.00000000,0.00000000,0.00000000); //object(mafcas_chande) (1)
	CreateDynamicObject(2965,-2807.98071289,57.33958817,4500.09082031,0.00000000,0.00000000,326.00000000); //object(k_pooltriangle01) (1)
	CreateDynamicObject(3003,-2807.38256836,57.26599121,4500.10693359,0.00000000,0.00000000,0.00000000); //object(k_poolballcue) (1)
	CreateDynamicObject(3004,-2806.63525391,56.86889267,4500.06835938,0.00000000,0.00000000,45.50000000); //object(k_poolq2) (1)
	CreateDynamicObject(1824,-2776.10839844,80.74133301,4499.68701172,0.00000000,0.00000000,0.00000000); //object(craps_table) (1)
	CreateDynamicObject(1824,-2775.82714844,90.73849487,4499.68701172,0.00000000,0.00000000,0.00000000); //object(craps_table) (2)
	CreateDynamicObject(1515,-2760.05004883,85.95441437,4499.20117188,0.00000000,0.00000000,90.00000000); //object(dyn_slot_prop) (1)
	CreateDynamicObject(1515,-2760.04907227,86.73674011,4499.20117188,0.00000000,0.00000000,90.00000000); //object(dyn_slot_prop) (2)
	CreateDynamicObject(1515,-2760.05029297,87.50802612,4499.20117188,0.00000000,0.00000000,90.00000000); //object(dyn_slot_prop) (3)
	CreateDynamicObject(1515,-2760.04882812,88.28417969,4499.20117188,0.00000000,0.00000000,90.00000000); //object(dyn_slot_prop) (4)
	CreateDynamicObject(1515,-2760.05175781,85.17327118,4499.20117188,0.00000000,0.00000000,90.00000000); //object(dyn_slot_prop) (5)
	CreateDynamicObject(1515,-2761.05175781,88.29003906,4499.20117188,0.00000000,0.00000000,270.00000000); //object(dyn_slot_prop) (6)
	CreateDynamicObject(1515,-2761.05419922,87.51243591,4499.20117188,0.00000000,0.00000000,270.00000000); //object(dyn_slot_prop) (7)
	CreateDynamicObject(1515,-2761.05273438,86.73308563,4499.20117188,0.00000000,0.00000000,270.00000000); //object(dyn_slot_prop) (8)
	CreateDynamicObject(1515,-2761.05444336,85.96154785,4499.20117188,0.00000000,0.00000000,270.00000000); //object(dyn_slot_prop) (9)
	CreateDynamicObject(1515,-2761.05737305,85.18058777,4499.20117188,0.00000000,0.00000000,270.00000000); //object(dyn_slot_prop) (10)
	CreateDynamicObject(1978,-2780.51000977,85.61137390,4500.25195312,0.00000000,0.00000000,0.00000000); //object(roulette_tbl) (1)
	CreateDynamicObject(1978,-2771.16040039,85.65787506,4500.25195312,0.00000000,0.00000000,180.00000000); //object(roulette_tbl) (2)
	CreateDynamicObject(1979,-2780.70043945,86.95256805,4500.22656250,0.00000000,0.00000000,0.00000000); //object(wheel_wee) (1)
	CreateDynamicObject(1979,-2770.98095703,84.31645203,4500.22656250,0.00000000,0.00000000,0.00000000); //object(wheel_wee) (2)
	CreateDynamicObject(2188,-2765.52172852,77.90378571,4500.18652344,0.00000000,0.00000000,56.00000000); //object(blck_jack) (1)
	CreateDynamicObject(2188,-2767.76855469,79.46484375,4500.18652344,0.00000000,0.00000000,235.99731445); //object(blck_jack) (2)
	CreateDynamicObject(2188,-2786.51342773,77.99935913,4500.18652344,0.00000000,0.00000000,305.99731445); //object(blck_jack) (3)
	CreateDynamicObject(2188,-2783.83984375,79.87661743,4500.18652344,0.00000000,0.00000000,125.99670410); //object(blck_jack) (4)
	CreateDynamicObject(3494,-2775.95532227,73.65091705,4503.21484375,0.00000000,0.00000000,0.00000000); //object(luxorpillar04_lvs) (1)
	CreateDynamicObject(3494,-2768.91943359,75.88941193,4503.21484375,0.00000000,0.00000000,40.00000000); //object(luxorpillar04_lvs) (2)
	CreateDynamicObject(3494,-2764.58178711,81.88932037,4503.21484375,0.00000000,0.00000000,70.24572754); //object(luxorpillar04_lvs) (3)
	CreateDynamicObject(3494,-2764.56982422,89.28350830,4503.21484375,0.00000000,0.00000000,106.24108887); //object(luxorpillar04_lvs) (4)
	CreateDynamicObject(3494,-2768.94726562,95.24316406,4503.21484375,0.00000000,0.00000000,146.23352051); //object(luxorpillar04_lvs) (5)
	CreateDynamicObject(3494,-2775.95019531,97.55175781,4503.21484375,0.00000000,0.00000000,178.23120117); //object(luxorpillar04_lvs) (6)
	CreateDynamicObject(3494,-2783.04052734,95.29927063,4503.21484375,0.00000000,0.00000000,211.23120117); //object(luxorpillar04_lvs) (7)
	CreateDynamicObject(3494,-2787.38183594,89.32714844,4503.21484375,0.00000000,0.00000000,251.22436523); //object(luxorpillar04_lvs) (8)
	CreateDynamicObject(3494,-2787.36767578,81.86427307,4503.21484375,0.00000000,0.00000000,291.22436523); //object(luxorpillar04_lvs) (9)
	CreateDynamicObject(3494,-2783.01806641,75.90995789,4503.21484375,0.00000000,0.00000000,325.22009277); //object(luxorpillar04_lvs) (10)
	CreateDynamicObject(14619,-2791.22485352,82.76283264,4499.55517578,0.00000000,0.00000000,146.00000000); //object(tricas_slottable2) (1)
	CreateDynamicObject(1838,-2794.62109375,84.92996216,4499.93164062,0.00000000,0.00000000,91.00000000); //object(kb_bandit11) (1)
	CreateDynamicObject(1838,-2794.56225586,86.55532837,4499.93164062,0.00000000,0.00000000,88.99975586); //object(kb_bandit11) (2)
	CreateDynamicObject(1838,-2794.60400391,85.80422974,4499.93164062,0.00000000,0.00000000,88.99475098); //object(kb_bandit11) (3)
	CreateDynamicObject(1838,-2793.72875977,91.48796082,4499.93164062,0.00000000,0.00000000,68.99475098); //object(kb_bandit11) (4)
	CreateDynamicObject(1838,-2793.42773438,92.23547363,4499.93164062,0.00000000,0.00000000,68.99414062); //object(kb_bandit11) (5)
	CreateDynamicObject(1838,-2793.10913086,92.95298004,4499.93164062,0.00000000,0.00000000,68.99414062); //object(kb_bandit11) (6)
	CreateDynamicObject(1838,-2793.68627930,80.01130676,4499.93164062,0.00000000,0.00000000,110.99414062); //object(kb_bandit11) (7)
	CreateDynamicObject(1838,-2793.38940430,79.21067047,4499.93164062,0.00000000,0.00000000,110.98937988); //object(kb_bandit11) (8)
	CreateDynamicObject(1838,-2793.04809570,78.37546539,4499.93164062,0.00000000,0.00000000,110.98937988); //object(kb_bandit11) (9)
	CreateDynamicObject(1702,-2787.19458008,92.58068848,4499.20117188,0.00000000,0.00000000,54.00000000); //object(kb_couch06) (1)
	CreateDynamicObject(1702,-2782.99047852,91.99037170,4499.20117188,0.00000000,0.00000000,233.99778748); //object(kb_couch06) (2)
	CreateDynamicObject(1702,-2767.49047852,90.33796692,4499.20117188,0.00000000,0.00000000,133.98925781); //object(kb_couch06) (3)
	CreateDynamicObject(1702,-2766.18750000,94.34954834,4499.20117188,0.00000000,0.00000000,313.98925781); //object(kb_couch06) (4)
	CreateDynamicObject(1702,-2767.90747070,68.35838318,4499.20117188,0.00000000,0.00000000,205.98924255); //object(kb_couch06) (5)
	CreateDynamicObject(1702,-2764.98803711,69.78759003,4499.20117188,0.00000000,0.00000000,205.98815918); //object(kb_couch06) (6)
	CreateDynamicObject(1702,-2783.84130859,68.29144287,4499.20117188,0.00000000,0.00000000,149.98815918); //object(kb_couch06) (7)
	CreateDynamicObject(3494,-2770.04443359,64.40032196,4503.21484375,0.00000000,0.00000000,0.00000000); //object(luxorpillar04_lvs) (11)
	CreateDynamicObject(3494,-2769.99267578,56.89964294,4503.21484375,0.00000000,0.00000000,0.00000000); //object(luxorpillar04_lvs) (12)
	CreateDynamicObject(3494,-2769.93579102,48.64966583,4503.21484375,0.00000000,0.00000000,0.00000000); //object(luxorpillar04_lvs) (13)
	CreateDynamicObject(3494,-2781.85986328,48.56681442,4503.21484375,0.00000000,0.00000000,0.00000000); //object(luxorpillar04_lvs) (14)
	CreateDynamicObject(3494,-2781.91406250,56.56616211,4503.21484375,0.00000000,0.00000000,0.00000000); //object(luxorpillar04_lvs) (15)
	CreateDynamicObject(3494,-2781.96704102,64.31519318,4503.21484375,0.00000000,0.00000000,0.00000000); //object(luxorpillar04_lvs) (16)
	CreateDynamicObject(1703,-2783.82104492,40.17553329,4499.20117188,0.00000000,0.00000000,270.00000000); //object(kb_couch02) (4)
	CreateDynamicObject(1703,-2783.83715820,31.88039017,4499.20117188,0.00000000,0.00000000,270.00000000); //object(kb_couch02) (4)
	CreateDynamicObject(1703,-2783.85449219,22.41601562,4499.20117188,0.00000000,0.00000000,270.00000000); //object(kb_couch02) (4)
	CreateDynamicObject(1703,-2783.86987305,50.78389359,4499.20117188,0.00000000,0.00000000,270.00000000); //object(kb_couch02) (4)
	CreateDynamicObject(1703,-2787.39990234,51.98143768,4499.20117188,0.00000000,0.00000000,0.00000000); //object(kb_couch02) (4)
	CreateDynamicObject(1491,-2779.75390625,11.85644531,4499.19335938,0.00000000,0.00000000,179.99450684); //object(gen_doorint01) (2)
	CreateDynamicObject(3089,-2801.62695312,44.23632812,4500.52246094,0.00000000,0.00000000,270.00000000); //object(ab_casdorlok) (1)
	CreateDynamicObject(3089,-2801.67260742,43.24066162,4500.52246094,0.00000000,0.00000000,90.00000000); //object(ab_casdorlok) (2)
	CreateDynamicObject(3084,-2781.47241211,101.68182373,4500.80859375,0.00000000,0.00000000,180.00000000); //object(trdcsgrgdoor_lvs) (1)
	CreateDynamicObject(3084,-2781.47167969,101.68164062,4504.03466797,0.00000000,0.00000000,179.99450684); //object(trdcsgrgdoor_lvs) (2)
	CreateDynamicObject(3084,-2769.04101562,101.67578125,4500.80859375,0.00000000,0.00000000,179.99450684); //object(trdcsgrgdoor_lvs) (3)
	CreateDynamicObject(3084,-2769.04101562,101.67578125,4504.03466797,0.00000000,0.00000000,179.99450684); //object(trdcsgrgdoor_lvs) (4)
	CreateDynamicObject(2206,-2802.97534180,0.99085808,4499.20117188,0.00000000,0.00000000,0.00000000); //object(med_office8_desk_02) (1)
	CreateDynamicObject(2120,-2802.09106445,-0.09688377,4499.83886719,0.00000000,0.00000000,250.00000000); //object(med_din_chair_4) (1)
	CreateDynamicObject(2120,-2801.14282227,2.21906924,4499.83886719,0.00000000,0.00000000,73.99938965); //object(med_din_chair_4) (2)
	CreateDynamicObject(2120,-2802.89282227,2.38598156,4499.83886719,0.00000000,0.00000000,113.99841309); //object(med_din_chair_4) (3)
	CreateDynamicObject(1708,-2800.73632812,10.75117016,4499.20117188,0.00000000,0.00000000,0.00000000); //object(kb_chair02) (1)
	CreateDynamicObject(1708,-2802.46459961,10.76673603,4499.20117188,0.00000000,0.00000000,0.00000000); //object(kb_chair02) (2)
	CreateDynamicObject(2315,-2804.96508789,10.81807995,4499.20117188,0.00000000,0.00000000,0.00000000); //object(cj_tv_table4) (1)
	CreateDynamicObject(2592,-2784.02978516,101.44794464,4500.10742188,0.00000000,0.00000000,0.00000000); //object(ab_slottable) (1)
	CreateDynamicObject(2004,-2799.94335938,-2.52226830,4501.04296875,0.00000000,0.00000000,180.00000000); //object(cr_safe_door) (1)
	CreateDynamicObject(2161,-2808.59765625,6.83947563,4499.20117188,0.00000000,0.00000000,90.00000000); //object(med_office_unit_4) (2)
	CreateDynamicObject(2162,-2808.60571289,5.06891441,4499.20117188,0.00000000,0.00000000,90.00000000); //object(med_office_unit_1) (2)
	CreateDynamicObject(2163,-2807.39428711,11.37464046,4499.20117188,0.00000000,0.00000000,0.00000000); //object(med_office_unit_2) (2)
	CreateDynamicObject(1708,-2795.83007812,7.59617805,4499.20117188,0.00000000,0.00000000,270.00000000); //object(kb_chair02) (3)
	CreateDynamicObject(1708,-2795.77905273,5.99846840,4499.20117188,0.00000000,0.00000000,270.00000000); //object(kb_chair02) (4)
	CreateDynamicObject(2835,-2802.09057617,4.16550398,4499.20117188,0.00000000,0.00000000,0.00000000); //object(gb_livingrug04) (1)
	CreateDynamicObject(2855,-2804.99902344,10.87674427,4499.69677734,0.00000000,0.00000000,340.00000000); //object(gb_bedmags05) (1)
	CreateDynamicObject(2855,-2803.56689453,10.86559486,4499.69677734,0.00000000,0.00000000,357.99938965); //object(gb_bedmags05) (2)
	CreateDynamicObject(1670,-2801.13500977,1.06626546,4500.13037109,0.00000000,0.00000000,0.00000000); //object(propcollecttable) (1)
	CreateDynamicObject(2190,-2802.51171875,1.29100251,4500.13769531,0.00000000,0.00000000,0.00000000); //object(pc_1) (1)
	CreateDynamicObject(2816,-2804.39648438,10.82647610,4499.69677734,0.00000000,0.00000000,0.00000000); //object(gb_bedmags01) (1)
	CreateDynamicObject(2161,-2808.59912109,3.73601151,4499.20117188,0.00000000,0.00000000,90.00000000); //object(med_office_unit_4) (3)
	CreateDynamicObject(16151,-2768.86816406,100.68945312,4499.52490234,0.00000000,0.00000000,90.00000000); //object(ufo_bar) (1)
	CreateDynamicObject(14782,-2765.93334961,4.14339399,4500.21728516,0.00000000,0.00000000,180.00000000); //object(int3int_boxing30) (1)
	CreateDynamicObject(1368,-2764.14257812,7.04780388,4499.89111328,0.00000000,0.00000000,359.98901367); //object(cj_blocker_bench) (4)
	CreateDynamicObject(1551,-2772.41406250,101.19457245,4500.39062500,0.00000000,0.00000000,0.00000000); //object(dyn_wine_big) (1)
	CreateDynamicObject(1551,-2770.60522461,99.61329651,4500.37060547,0.00000000,0.00000000,0.00000000); //object(dyn_wine_big) (2)
	CreateDynamicObject(1551,-2766.89282227,99.75945282,4500.37060547,0.00000000,0.00000000,0.00000000); //object(dyn_wine_big) (3)
	CreateDynamicObject(1551,-2765.34960938,100.62924194,4500.39062500,0.00000000,0.00000000,0.00000000); //object(dyn_wine_big) (4)
	CreateDynamicObject(1551,-2766.25585938,99.74213409,4500.37060547,0.00000000,0.00000000,0.00000000); //object(dyn_wine_big) (5)
	CreateDynamicObject(1548,-2768.07543945,99.75185394,4500.14257812,0.00000000,0.00000000,0.00000000); //object(cj_drip_tray) (1)
	CreateDynamicObject(1541,-2769.64526367,100.17676544,4500.29931641,0.00000000,0.00000000,0.00000000); //object(cj_beer_taps_1) (1)
	CreateDynamicObject(1491,-2797.72949219,11.85026264,4499.20117188,0.00000000,0.00000000,179.99450684); //object(gen_doorint01) (2)
	CreateDynamicObject(1491,-2768.26074219,11.78996181,4499.20117188,0.00000000,0.00000000,179.99450684); //object(gen_doorint01) (2)
	CreateDynamicObject(1703,-2767.60498047,21.37047386,4499.20117188,0.00000000,0.00000000,270.00000000); //object(kb_couch02) (4)
	CreateDynamicObject(1703,-2799.95361328,15.51834011,4499.20117188,0.00000000,0.00000000,90.00000000); //object(kb_couch02) (4)
	CreateDynamicObject(2188,-2771.73999023,53.37760925,4500.18652344,0.00000000,0.00000000,269.99731445); //object(blck_jack) (2)
	CreateDynamicObject(2188,-2771.86938477,60.64034653,4500.18652344,0.00000000,0.00000000,269.99450684); //object(blck_jack) (2)
	CreateDynamicObject(1515,-2781.32495117,50.18463135,4499.20117188,0.00000000,0.00000000,90.00000000); //object(dyn_slot_prop) (4)
	CreateDynamicObject(1515,-2781.29711914,51.20552063,4499.20117188,0.00000000,0.00000000,90.00000000); //object(dyn_slot_prop) (4)
	CreateDynamicObject(1515,-2781.29028320,52.27036285,4499.20117188,0.00000000,0.00000000,90.00000000); //object(dyn_slot_prop) (4)
	CreateDynamicObject(1515,-2781.31152344,53.29740524,4499.20117188,0.00000000,0.00000000,90.00000000); //object(dyn_slot_prop) (4)
	CreateDynamicObject(1515,-2781.29858398,54.39056778,4499.20117188,0.00000000,0.00000000,90.00000000); //object(dyn_slot_prop) (4)
	CreateDynamicObject(2188,-2780.16723633,61.04415131,4500.18652344,0.00000000,0.00000000,89.99450684); //object(blck_jack) (2)
	CreateDynamicObject(2315,-2767.29101562,92.94060516,4499.20751953,0.00000000,0.00000000,314.00000000); //object(cj_tv_table4) (2)
	CreateDynamicObject(2315,-2784.66040039,92.86672974,4499.20117188,0.00000000,0.00000000,233.99475098); //object(cj_tv_table4) (3)
	CreateDynamicObject(1368,-2766.76928711,7.03759336,4499.89111328,0.00000000,0.00000000,359.98901367); //object(cj_blocker_bench) (4)
	CreateDynamicObject(1368,-2766.76855469,7.93711281,4499.89111328,0.00000000,0.00000000,179.98901367); //object(cj_blocker_bench) (4)
	CreateDynamicObject(1368,-2764.13378906,7.94680977,4499.89111328,0.00000000,0.00000000,179.98901367); //object(cj_blocker_bench) (4)
	CreateDynamicObject(1368,-2771.81689453,7.73090935,4499.89111328,0.00000000,0.00000000,89.98901367); //object(cj_blocker_bench) (4)
	CreateDynamicObject(3089,-2771.22509766,25.42178726,4500.52246094,0.00000000,0.00000000,270.00000000); //object(ab_casdorlok) (1)
	CreateDynamicObject(3089,-2771.22973633,25.94589043,4500.52246094,0.00000000,0.00000000,270.00000000); //object(ab_casdorlok) (1)
	CreateDynamicObject(2964,-2797.33569336,56.18324280,4499.17626953,0.00000000,0.00000000,270.00000000); //object(k_pooltablesm) (1)
	CreateDynamicObject(1846,-2802.05468750,48.01705170,4501.33203125,90.00000000,180.00000000,180.00000000); //object(shop_shelf04) (1)
	CreateDynamicObject(2852,-2801.50756836,50.07935715,4499.70654297,0.00000000,0.00000000,308.00000000); //object(gb_bedmags02) (1)
	CreateDynamicObject(2855,-2802.72778320,50.11149597,4499.70654297,0.00000000,0.00000000,0.00000000); //object(gb_bedmags05) (3)
	CreateDynamicObject(2965,-2797.38623047,55.72977448,4500.09082031,0.00000000,0.00000000,0.00000000); //object(k_pooltriangle01) (2)
	CreateDynamicObject(2997,-2797.58813477,56.55450058,4500.10644531,0.00000000,0.00000000,338.00000000); //object(k_poolballstp03) (1)
	CreateDynamicObject(2998,-2797.01245117,56.48268509,4500.10644531,0.00000000,0.00000000,0.00000000); //object(k_poolballstp04) (1)
	CreateDynamicObject(3000,-2797.31738281,55.74004745,4500.10644531,0.00000000,0.00000000,276.00000000); //object(k_poolballstp06) (1)
	CreateDynamicObject(2999,-2797.74853516,55.35436630,4500.10644531,0.00000000,0.00000000,0.00000000); //object(k_poolballstp05) (1)
	CreateDynamicObject(1703,-2803.19287109,59.60754013,4499.19335938,0.00000000,0.00000000,0.00000000); //object(kb_couch02) (2)
	CreateDynamicObject(2108,-2794.11743164,59.75880432,4499.20117188,0.00000000,0.00000000,0.00000000); //object(cj_mlight13) (1)
	CreateDynamicObject(2108,-2810.08642578,59.66210175,4499.20117188,0.00000000,0.00000000,0.00000000); //object(cj_mlight13) (2)
	CreateDynamicObject(2108,-2795.55493164,-2.08576584,4499.20117188,0.00000000,0.00000000,0.00000000); //object(cj_mlight13) (3)
	CreateDynamicObject(2108,-2808.07299805,-2.10202217,4499.20117188,0.00000000,0.00000000,0.00000000); //object(cj_mlight13) (4)
	CreateDynamicObject(2108,-2795.59716797,10.88568115,4499.20117188,0.00000000,0.00000000,0.00000000); //object(cj_mlight13) (5)
	CreateDynamicObject(1846,-2802.05468750,48.01660156,4501.33203125,90.00000000,179.99450684,179.99450684); //object(shop_shelf04) (1)
	CreateDynamicObject(1846,-2802.05468750,48.01660156,4501.33203125,90.00000000,180.00549316,179.98352051); //object(shop_shelf04) (1)
	CreateDynamicObject(1846,-2802.05468750,48.01660156,4501.33203125,90.00000000,180.00549316,179.98352051); //object(shop_shelf04) (1)
	CreateDynamicObject(2230,-2800.65844727,47.08290863,4499.19335938,0.00000000,0.00000000,180.00000000); //object(swank_speaker_2) (1)
	CreateDynamicObject(2230,-2804.09936523,47.04112625,4499.19335938,0.00000000,0.00000000,179.99450684); //object(swank_speaker_2) (2)
	CreateDynamicObject(1536,-2780.23413086,101.71265411,4499.20117188,0.00000000,0.00000000,0.00000000); //object(gen_doorext15) (1)
	CreateDynamicObject(1536,-2777.23291016,101.73957825,4499.20117188,0.00000000,0.00000000,180.00000000); //object(gen_doorext15) (2)
	CreateDynamicObject(2847,-2779.22167969,100.49062347,4499.20117188,0.00000000,0.00000000,0.00000000); //object(gb_bedrug05) (1)

	//Hq Gang NeprofiT
	CreateDynamicObject(9946, 1113.68, -1876.43, 7607.38,   0.00, 0.00, 0.00);
	CreateDynamicObject(9244, 1127.24, -1885.13, 7610.05,   0.00, 0.00, 270.00);
	CreateDynamicObject(9244, 1127.00, -1887.73, 7612.85,   0.00, 0.00, 35.00);
	CreateDynamicObject(9244, 1119.91, -1890.06, 7612.85,   0.00, 0.00, 0.00);
	CreateDynamicObject(9244, 1100.06, -1861.84, 7612.85,   0.00, 0.00, 179.99);
	CreateDynamicObject(1557, 1122.60, -1880.70, 7607.49,   0.00, 0.00, 214.49);
	CreateDynamicObject(7921, 1124.39, -1858.34, 7606.99,   270.00, 0.00, 90.00);
	CreateDynamicObject(7921, 1107.68, -1858.34, 7606.99,   269.99, 0.00, 90.00);
	CreateDynamicObject(7921, 1110.48, -1858.34, 7606.99,   269.99, 0.00, 90.00);
	CreateDynamicObject(7921, 1113.28, -1858.29, 7606.99,   269.99, 0.00, 90.00);
	CreateDynamicObject(7921, 1115.99, -1858.34, 7606.99,   269.99, 0.00, 90.00);
	CreateDynamicObject(7921, 1118.79, -1858.34, 7606.99,   269.99, 0.00, 90.00);
	CreateDynamicObject(7921, 1121.59, -1858.34, 7606.99,   269.99, 0.00, 90.00);
	CreateDynamicObject(7921, 1121.65, -1857.29, 7612.99,   269.99, 0.00, 270.00);
	CreateDynamicObject(7921, 1118.85, -1857.29, 7612.99,   269.99, 0.00, 270.00);
	CreateDynamicObject(7921, 1116.05, -1857.29, 7612.99,   269.99, 0.00, 270.00);
	CreateDynamicObject(7921, 1113.25, -1857.29, 7612.99,   269.99, 0.00, 270.00);
	CreateDynamicObject(7921, 1110.44, -1857.29, 7612.99,   269.99, 0.00, 270.00);
	CreateDynamicObject(7921, 1107.74, -1857.29, 7612.99,   269.99, 0.00, 270.00);
	CreateDynamicObject(1649, 1120.79, -1857.51, 7610.31,   0.00, 0.00, 0.00);
	CreateDynamicObject(1649, 1116.39, -1857.51, 7610.31,   0.00, 0.00, 0.00);
	CreateDynamicObject(1649, 1111.99, -1857.51, 7610.31,   0.00, 0.00, 0.00);
	CreateDynamicObject(1649, 1107.59, -1857.51, 7610.31,   0.00, 0.00, 0.00);
	CreateDynamicObject(9244, 1100.07, -1869.86, 7612.85,   0.00, 0.00, 179.99);
	CreateDynamicObject(9244, 1097.28, -1868.15, 7622.25,   0.00, 0.00, 90.00);
	CreateDynamicObject(3440, 1110.06, -1881.81, 7609.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(3440, 1110.01, -1858.23, 7609.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(3440, 1109.93, -1878.04, 7609.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(3440, 1122.90, -1858.28, 7609.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(3440, 1120.96, -1881.71, 7609.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(3440, 1122.87, -1880.34, 7609.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(1703, 1119.09, -1858.94, 7607.49,   0.00, 0.00, 0.00);
	CreateDynamicObject(1703, 1122.46, -1859.66, 7607.49,   0.00, 0.00, 270.00);
	CreateDynamicObject(1822, 1119.62, -1861.07, 7607.49,   0.00, 0.00, 0.00);
	CreateDynamicObject(1703, 1121.09, -1862.70, 7607.49,   0.00, 0.00, 179.99);
	CreateDynamicObject(8661, 1087.12, -1864.85, 7606.90,   0.00, 0.00, 0.00);
	CreateDynamicObject(3440, 1122.85, -1875.27, 7609.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(3440, 1118.21, -1875.29, 7609.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(1649, 1120.36, -1875.41, 7609.16,   0.00, 0.00, 0.00);
	CreateDynamicObject(3440, 1116.38, -1876.94, 7609.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(1649, 1116.47, -1879.41, 7609.16,   0.00, 0.00, 90.00);
	CreateDynamicObject(1649, 1116.47, -1879.41, 7609.16,   0.00, 0.00, 270.00);
	CreateDynamicObject(1649, 1120.45, -1875.25, 7609.16,   0.00, 0.00, 179.99);
	CreateDynamicObject(1825, 1120.82, -1868.26, 7607.49,   0.00, 0.00, 46.00);
	CreateDynamicObject(1720, 1120.95, -1868.94, 7607.49,   0.00, 0.00, 200.98);
	CreateDynamicObject(1720, 1120.07, -1868.24, 7607.49,   0.00, 0.00, 79.22);
	CreateDynamicObject(1720, 1121.13, -1867.85, 7607.49,   0.00, 0.00, 320.99);
	CreateDynamicObject(1703, 1114.16, -1881.14, 7607.49,   0.00, 0.00, 179.99);
	CreateDynamicObject(1703, 1115.71, -1878.31, 7607.49,   0.00, 0.00, 270.00);
	CreateDynamicObject(948, 1126.90, -1874.77, 7607.49,   0.00, 0.00, 0.00);
	CreateDynamicObject(948, 1118.64, -1857.94, 7608.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(948, 1114.21, -1857.98, 7608.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(8661, 1116.56, -1857.62, 7625.85,   0.00, 270.00, 269.99);
	CreateDynamicObject(1703, 1117.65, -1861.78, 7607.49,   0.00, 0.00, 90.00);
	CreateDynamicObject(1720, 1115.13, -1861.33, 7607.49,   0.00, 0.00, 154.74);
	CreateDynamicObject(1720, 1114.99, -1860.17, 7607.49,   0.00, 0.00, 34.23);
	CreateDynamicObject(9244, 1131.44, -1861.48, 7612.85,   0.00, 0.00, 90.00);
	CreateDynamicObject(9244, 1100.68, -1871.84, 7610.05,   0.00, 0.00, 90.00);
	CreateDynamicObject(3440, 1105.15, -1878.27, 7609.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(3440, 1104.91, -1881.77, 7609.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(14410, 1107.35, -1897.95, 7604.16,   0.00, 0.00, 0.00);
	CreateDynamicObject(3961, 1085.60, -1887.67, 7609.46,   0.00, 0.00, 0.00);
	CreateDynamicObject(9244, 1100.54, -1877.68, 7610.05,   0.00, 0.00, 90.00);
	CreateDynamicObject(9244, 1096.46, -1900.10, 7610.05,   0.00, 0.00, 270.00);
	CreateDynamicObject(9244, 1124.77, -1897.67, 7612.85,   0.00, 0.00, 90.00);
	CreateDynamicObject(9244, 1117.63, -1905.60, 7610.05,   0.00, 0.00, 90.00);
	CreateDynamicObject(9244, 1097.25, -1905.56, 7610.05,   0.00, 0.00, 269.99);
	CreateDynamicObject(9244, 1118.22, -1904.44, 7612.85,   0.00, 0.00, 90.00);
	CreateDynamicObject(9244, 1097.25, -1905.56, 7610.05,   0.00, 0.00, 269.99);
	CreateDynamicObject(9244, 1117.29, -1906.89, 7605.05,   0.00, 0.00, 90.00);
	CreateDynamicObject(9244, 1097.53, -1907.11, 7605.05,   0.00, 0.00, 270.00);
	CreateDynamicObject(14415, 1116.13, -1942.47, 7607.02,   0.00, 0.00, 90.00);
	CreateDynamicObject(9946, 1117.60, -1923.75, 7600.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(9244, 1137.91, -1933.46, 7605.05,   0.00, 0.00, 90.00);
	CreateDynamicObject(14421, 1093.98, -1932.70, 7604.11,   0.00, 0.00, 90.00);
	CreateDynamicObject(9244, 1094.43, -1935.42, 7605.05,   0.00, 0.00, 270.00);
	CreateDynamicObject(8661, 1106.61, -1907.57, 7606.79,   20.00, 179.99, 0.00);
	CreateDynamicObject(8661, 1110.73, -1898.69, 7610.04,   19.99, 179.99, 0.00);
	CreateDynamicObject(3440, 1104.65, -1887.73, 7609.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(3440, 1104.63, -1890.04, 7609.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(3440, 1105.15, -1895.01, 7609.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(3440, 1109.68, -1895.29, 7609.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(948, 1126.88, -1871.95, 7607.49,   0.00, 0.00, 0.00);
	CreateDynamicObject(9946, 1118.12, -1962.09, 7600.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(7191, 1090.19, -1942.99, 7603.03,   0.00, 0.00, 269.99);
	CreateDynamicObject(14421, 1139.84, -1933.65, 7604.11,   0.00, 0.00, 270.00);
	CreateDynamicObject(7191, 1143.56, -1938.92, 7603.03,   0.00, 0.00, 90.00);
	CreateDynamicObject(7191, 1103.69, -1950.56, 7603.03,   0.00, 0.00, 270.00);
	CreateDynamicObject(1703, 1122.31, -1876.81, 7607.49,   0.00, 0.00, 270.00);
	CreateDynamicObject(1703, 1119.55, -1881.18, 7607.49,   0.00, 0.00, 179.99);
	CreateDynamicObject(2357, 1107.93, -1940.08, 7601.45,   0.00, 0.00, 0.00);
	CreateDynamicObject(2357, 1106.47, -1937.29, 7601.45,   0.00, 0.00, 270.00);
	CreateDynamicObject(2357, 1109.39, -1937.29, 7601.45,   0.00, 0.00, 269.99);
	CreateDynamicObject(2357, 1106.47, -1933.04, 7601.45,   0.00, 0.00, 269.99);
	CreateDynamicObject(2357, 1109.39, -1933.02, 7601.45,   0.00, 0.00, 269.99);
	CreateDynamicObject(2357, 1107.92, -1930.28, 7601.45,   0.00, 0.00, 0.00);
	CreateDynamicObject(1649, 1108.07, -1933.09, 7601.82,   270.00, 90.00, 0.00);
	CreateDynamicObject(1649, 1108.31, -1937.51, 7601.82,   269.99, 90.00, 0.00);
	CreateDynamicObject(1491, 1121.13, -1934.68, 7600.86,   0.00, 0.00, 90.00);
	CreateDynamicObject(1491, 1121.09, -1931.65, 7600.86,   0.00, 0.00, 270.00);
	CreateDynamicObject(8661, 1061.18, -1896.96, 7607.39,   0.00, 0.00, 0.00);
	CreateDynamicObject(8661, 1071.19, -1899.86, 7607.39,   0.00, 270.00, 270.00);
	CreateDynamicObject(8661, 1071.48, -1887.15, 7607.39,   0.00, 270.00, 90.00);
	CreateDynamicObject(8661, 1080.52, -1908.51, 7607.39,   0.00, 272.00, 0.00);
	CreateDynamicObject(8661, 1080.53, -1884.59, 7607.39,   0.00, 272.00, 0.00);
	CreateDynamicObject(8661, 1081.33, -1899.04, 7630.60,   0.00, 270.00, 0.00);
	CreateDynamicObject(8661, 1062.31, -1894.91, 7607.39,   0.00, 270.00, 179.99);
	CreateDynamicObject(7191, 1090.02, -1927.48, 7603.03,   0.00, 0.00, 270.00);
	CreateDynamicObject(1753, 1127.26, -1924.96, 7601.06,   0.00, 0.00, 0.00);
	CreateDynamicObject(2208, 1126.93, -1924.10, 7601.06,   0.00, 0.00, 0.00);
	CreateDynamicObject(2208, 1124.24, -1924.08, 7601.05,   0.00, 0.00, 0.00);
	CreateDynamicObject(2208, 1121.51, -1924.09, 7601.04,   0.00, 0.00, 0.00);
	CreateDynamicObject(2292, 1122.69, -1924.99, 7601.06,   0.00, 0.00, 0.00);
	CreateDynamicObject(2291, 1123.14, -1924.98, 7601.06,   0.00, 0.00, 0.00);
	CreateDynamicObject(2208, 1121.71, -1924.55, 7601.03,   0.00, 0.00, 270.00);
	CreateDynamicObject(2208, 1121.70, -1927.27, 7601.02,   0.00, 0.00, 269.99);
	CreateDynamicObject(2291, 1124.08, -1924.98, 7601.06,   0.00, 0.00, 0.00);
	CreateDynamicObject(2291, 1125.01, -1924.98, 7601.06,   0.00, 0.00, 0.00);
	CreateDynamicObject(2291, 1125.90, -1923.71, 7601.06,   0.00, 0.00, 0.00);
	CreateDynamicObject(2291, 1122.69, -1926.43, 7601.06,   0.00, 0.00, 90.00);
	CreateDynamicObject(2291, 1122.69, -1927.36, 7601.06,   0.00, 0.00, 90.00);
	CreateDynamicObject(1753, 1122.66, -1929.73, 7601.06,   0.00, 0.00, 90.00);
	CreateDynamicObject(1670, 1123.35, -1924.09, 7601.92,   0.00, 0.00, 188.00);
	CreateDynamicObject(2855, 1121.70, -1927.56, 7601.90,   0.00, 0.00, 50.00);
	CreateDynamicObject(1846, 1128.57, -1927.69, 7603.60,   90.00, 0.00, 90.00);
	CreateDynamicObject(2257, 1125.86, -1923.75, 7603.55,   0.00, 0.00, 0.00);
	CreateDynamicObject(2258, 1121.44, -1927.14, 7603.79,   0.00, 0.00, 90.25);
	CreateDynamicObject(3962, 1158.48, -1873.53, 7607.20,   0.00, 0.00, 358.75);
	CreateDynamicObject(2266, 1121.94, -1936.80, 7603.29,   0.00, 0.00, 89.49);
	CreateDynamicObject(2870, 1127.28, -1924.01, 7601.92,   0.00, 0.00, 328.00);
	CreateDynamicObject(1846, 1128.57, -1927.69, 7603.60,   90.00, 0.00, 90.00);
	CreateDynamicObject(1846, 1128.57, -1927.69, 7603.60,   90.00, 0.00, 90.00);
	CreateDynamicObject(1846, 1128.57, -1927.69, 7603.60,   90.00, 0.00, 90.00);
	CreateDynamicObject(2231, 1129.92, -1926.31, 7602.71,   0.00, 0.00, 270.00);
	CreateDynamicObject(2231, 1129.91, -1925.81, 7604.51,   0.00, 179.99, 269.99);
	CreateDynamicObject(2231, 1129.90, -1929.06, 7604.51,   0.00, 179.99, 269.99);
	CreateDynamicObject(2231, 1129.91, -1929.56, 7602.71,   0.00, 0.00, 269.99);
	CreateDynamicObject(14399, 1134.05, -1938.24, 7600.76,   0.00, 0.00, 0.00);
	CreateDynamicObject(1541, 1123.94, -1936.92, 7602.23,   0.00, 0.00, 179.99);
	CreateDynamicObject(1541, 1128.23, -1936.92, 7602.23,   0.00, 0.00, 179.99);
	CreateDynamicObject(2254, 1129.52, -1933.06, 7603.79,   0.00, 0.00, 270.00);
	CreateDynamicObject(1491, 1112.71, -1934.71, 7600.86,   0.00, 0.00, 90.00);
	CreateDynamicObject(1714, 1108.11, -1928.58, 7601.06,   0.00, 0.00, 0.00);
	CreateDynamicObject(2636, 1105.27, -1930.38, 7601.59,   0.00, 0.00, 180.00);
	CreateDynamicObject(2636, 1105.27, -1932.38, 7601.59,   0.00, 0.00, 180.00);
	CreateDynamicObject(2636, 1105.27, -1934.38, 7601.59,   0.00, 0.00, 180.00);
	CreateDynamicObject(2636, 1105.27, -1936.38, 7601.59,   0.00, 0.00, 180.00);
	CreateDynamicObject(2636, 1105.27, -1938.38, 7601.59,   0.00, 0.00, 179.99);
	CreateDynamicObject(2636, 1105.27, -1940.38, 7601.59,   0.00, 0.00, 180.00);
	CreateDynamicObject(2636, 1110.57, -1940.38, 7601.59,   0.00, 0.00, 0.00);
	CreateDynamicObject(2636, 1110.57, -1938.38, 7601.59,   0.00, 0.00, 0.00);
	CreateDynamicObject(2636, 1110.57, -1930.38, 7601.59,   0.00, 0.00, 0.00);
	CreateDynamicObject(2636, 1110.57, -1936.38, 7601.59,   0.00, 0.00, 0.00);
	CreateDynamicObject(1846, 1107.62, -1941.63, 7603.55,   90.00, 0.00, 0.00);
	CreateDynamicObject(1846, 1107.62, -1941.63, 7603.55,   90.00, 0.00, 0.00);
	CreateDynamicObject(1846, 1107.62, -1941.63, 7603.55,   90.00, 0.00, 0.00);
	CreateDynamicObject(2230, 1102.55, -1942.48, 7601.06,   0.00, 0.00, 141.50);
	CreateDynamicObject(2230, 1112.18, -1942.82, 7601.06,   0.00, 0.00, 225.50);
	CreateDynamicObject(1491, 1112.68, -1931.67, 7600.86,   0.00, 0.00, 270.00);
	CreateDynamicObject(1536, 1108.95, -1948.27, 7601.06,   0.00, 0.00, 90.00);
	CreateDynamicObject(1536, 1108.92, -1945.24, 7601.06,   0.00, 0.00, 270.00);
	CreateDynamicObject(949, 1109.75, -1943.79, 7601.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(949, 1109.33, -1949.84, 7601.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(2262, 1117.25, -1949.78, 7604.56,   0.00, 0.00, 179.99);
	CreateDynamicObject(2261, 1120.41, -1939.50, 7604.49,   0.00, 0.00, 270.00);
	CreateDynamicObject(2265, 1113.40, -1937.92, 7604.62,   0.00, 0.00, 90.00);
	CreateDynamicObject(2271, 1113.41, -1928.10, 7604.74,   0.00, 0.00, 90.00);
	CreateDynamicObject(2176, 1119.78, -1920.22, 7603.92,   0.00, 0.00, 0.00);
	CreateDynamicObject(2177, 1128.81, -1947.43, 7603.77,   0.00, 0.00, 0.00);
	CreateDynamicObject(2179, 1128.77, -1947.42, 7603.78,   0.00, 0.00, 0.00);
	CreateDynamicObject(11326, 2366.50, 1296.73, 11.64,   0.00, 0.00, 179.99);
	CreateDynamicObject(11327, 2351.55, 1288.62, 12.35,   0.00, 0.00, 271.50);
	CreateDynamicObject(11327, 2342.29, 1288.36, 12.35,   0.00, 0.00, 271.50);
	CreateDynamicObject(8041, 2345.02, 1240.20, 12.89,   0.00, 0.00, 179.99);
	CreateDynamicObject(994, 2335.61, 1233.87, 9.86,   0.00, 0.00, 270.00);
	CreateDynamicObject(1498, 2275.51, 1243.77, 9.82,   0.00, 0.00, 0.00);
	CreateDynamicObject(9946, 1155.40, -1874.33, 7607.40,   0.00, 0.00, 0.00);
	CreateDynamicObject(9244, 1138.09, -1892.65, 7610.05,   0.00, 0.00, 270.00);
	CreateDynamicObject(9244, 1144.03, -1861.48, 7612.85,   0.00, 0.00, 90.00);
	CreateDynamicObject(9244, 1160.87, -1869.09, 7612.85,   0.00, 0.00, 90.00);
	CreateDynamicObject(9244, 1158.39, -1872.79, 7612.85,   0.00, 0.00, 90.00);
	CreateDynamicObject(9244, 1145.53, -1898.41, 7610.05,   0.00, 0.00, 269.99);
	CreateDynamicObject(9244, 1161.88, -1900.29, 7610.05,   0.00, 0.00, 269.99);
	CreateDynamicObject(9244, 1150.05, -1861.46, 7612.85,   0.00, 0.00, 90.00);
	CreateDynamicObject(9244, 1172.24, -1888.88, 7610.65,   0.00, 0.00, 0.00);
	CreateDynamicObject(1557, 1162.16, -1888.11, 7607.51,   0.00, 0.00, 90.00);
	CreateDynamicObject(1557, 1162.17, -1885.08, 7607.51,   0.00, 0.00, 270.00);
	CreateDynamicObject(3524, 1162.64, -1886.59, 7608.19,   8.00, 0.00, 270.00);
	CreateDynamicObject(1976, 1162.14, -1884.00, 7609.10,   0.00, 179.99, 270.00);
	CreateDynamicObject(1976, 1162.15, -1889.25, 7609.10,   0.00, 179.99, 269.99);
	CreateDynamicObject(8661, 1149.24, -1898.37, 7611.13,   0.00, 179.99, 0.00);
	CreateDynamicObject(1506, 1135.63, -1877.11, 7607.51,   0.00, 0.00, 90.00);
	CreateDynamicObject(1506, 1135.64, -1882.05, 7607.51,   0.00, 0.00, 90.00);
	CreateDynamicObject(1505, 1139.86, -1882.58, 7607.51,   0.00, 0.00, 0.00);
	CreateDynamicObject(1504, 1136.84, -1871.65, 7607.51,   0.00, 0.00, 0.00);
	CreateDynamicObject(1504, 1147.35, -1871.60, 7607.51,   0.00, 0.00, 0.00);
	CreateDynamicObject(1506, 1141.88, -1871.61, 7607.51,   0.00, 0.00, 0.00);
	CreateDynamicObject(1506, 1149.99, -1874.79, 7607.51,   0.00, 0.00, 270.00);
	CreateDynamicObject(1506, 1149.97, -1879.81, 7607.51,   0.00, 0.00, 269.99);
	CreateDynamicObject(9244, 1154.89, -1903.04, 7610.05,   0.00, 0.00, 269.99);
	CreateDynamicObject(1504, 1154.94, -1892.90, 7607.51,   0.00, 0.00, 0.00);
	CreateDynamicObject(1507, 1146.53, -1886.26, 7607.51,   0.00, 0.00, 90.00);
	CreateDynamicObject(2811, 1140.18, -1871.93, 7607.51,   0.00, 0.00, 0.00);
	CreateDynamicObject(2241, 1136.04, -1878.76, 7608.02,   0.00, 0.00, 0.00);
	CreateDynamicObject(2010, 1143.56, -1882.18, 7607.52,   0.00, 0.00, 0.00);
	CreateDynamicObject(2001, 1149.62, -1878.00, 7607.51,   0.00, 0.00, 0.00);
	CreateDynamicObject(1703, 1140.10, -1877.16, 7607.51,   0.00, 0.00, 0.00);
	CreateDynamicObject(1703, 1142.11, -1876.19, 7607.51,   0.00, 0.00, 179.99);
	CreateDynamicObject(2271, 1145.52, -1872.06, 7609.71,   0.00, 0.00, 0.00);
	CreateDynamicObject(2270, 1157.07, -1891.51, 7609.66,   0.00, 0.00, 270.00);
	CreateDynamicObject(2268, 1154.40, -1890.50, 7609.68,   0.00, 0.00, 90.00);
	CreateDynamicObject(3532, 1153.74, -1890.98, 7608.20,   0.00, 0.00, 0.00);
	CreateDynamicObject(3532, 1157.70, -1892.76, 7608.20,   0.00, 0.00, 0.00);
	CreateDynamicObject(8661, 1056.24, -1888.55, 7607.39,   0.00, 270.00, 270.00);
	CreateDynamicObject(1491, 1105.89, -1917.03, 7600.86,   0.00, 0.00, 0.00);
	CreateDynamicObject(1491, 1108.91, -1917.00, 7600.86,   0.00, 0.00, 180.00);
	CreateDynamicObject(2291, 1125.91, -1924.97, 7601.06,   0.00, 0.00, 0.00);
	CreateDynamicObject(1499, 1125.88, -1950.48, 7600.86,   0.00, 0.00, 0.00);
	CreateDynamicObject(1499, 1128.89, -1950.45, 7600.86,   0.00, 359.75, 180.00);
	CreateDynamicObject(9244, 1117.25, -1907.11, 7605.05,   0.00, 0.00, 90.00);
	CreateDynamicObject(9244, 1129.33, -1913.56, 7605.05,   0.00, 0.00, 90.00);
	CreateDynamicObject(9244, 1096.38, -1917.23, 7605.05,   0.00, 0.00, 270.00);
	CreateDynamicObject(9244, 1100.57, -1953.53, 7605.05,   0.00, 0.00, 270.00);
	CreateDynamicObject(2591, 1120.02, -1875.35, 7610.20,   0.00, 0.00, 90.00);
	CreateDynamicObject(2591, 1122.05, -1875.34, 7610.20,   0.00, 0.00, 90.00);
	CreateDynamicObject(2591, 1122.05, -1875.31, 7610.20,   0.00, 0.00, 90.00);
	CreateDynamicObject(14399, 1113.10, -1869.75, 7607.29,   0.00, 0.00, 270.00);
	CreateDynamicObject(7921, 1111.02, -1857.40, 7608.19,   269.99, 0.00, 270.00);
	CreateDynamicObject(1825, 1120.67, -1865.22, 7607.49,   0.00, 0.00, 346.00);
	CreateDynamicObject(1720, 1120.15, -1865.67, 7607.49,   0.00, 0.00, 140.72);
	CreateDynamicObject(1720, 1120.32, -1864.54, 7607.49,   0.00, 0.00, 17.47);
	CreateDynamicObject(1720, 1121.15, -1865.28, 7607.49,   0.00, 0.00, 259.47);
	CreateDynamicObject(2591, 1116.41, -1878.85, 7610.20,   0.00, 0.00, 0.00);
	CreateDynamicObject(2591, 1116.42, -1881.05, 7610.20,   0.00, 0.00, 0.00);
	CreateDynamicObject(1649, 1116.29, -1879.40, 7609.16,   0.00, 0.00, 270.00);
	CreateDynamicObject(1649, 1116.25, -1883.75, 7609.16,   0.00, 0.00, 269.99);
	CreateDynamicObject(3037, 1129.65, -1955.74, 7603.26,   0.00, 0.00, 0.00);
	CreateDynamicObject(3037, 1125.16, -1966.75, 7603.26,   0.00, 0.00, 90.00);
	CreateDynamicObject(3037, 1129.65, -1965.95, 7603.26,   0.00, 0.00, 0.00);
	CreateDynamicObject(3037, 1120.89, -1965.95, 7603.26,   0.00, 0.00, 0.00);
	CreateDynamicObject(3037, 1120.89, -1955.74, 7603.26,   0.00, 0.00, 0.00);
	CreateDynamicObject(3037, 1120.81, -1950.77, 7603.26,   0.00, 0.00, 90.00);
	CreateDynamicObject(3037, 1128.41, -1950.72, 7605.56,   0.00, 0.00, 90.00);
	CreateDynamicObject(3037, 1134.01, -1950.72, 7603.26,   0.00, 0.00, 90.00);
	CreateDynamicObject(2370, 1121.48, -1952.01, 7601.06,   0.00, 0.00, 0.00);
	CreateDynamicObject(3383, 1125.09, -1965.81, 7601.06,   0.00, 0.00, 0.00);
	CreateDynamicObject(2370, 1121.48, -1953.50, 7601.06,   0.00, 0.00, 0.00);
	CreateDynamicObject(3633, 1121.89, -1965.44, 7601.53,   0.00, 0.00, 0.00);
	CreateDynamicObject(3632, 1128.31, -1965.81, 7601.53,   0.00, 0.00, 0.00);
	CreateDynamicObject(16087, 1124.76, -1960.02, 7601.60,   0.00, 0.00, 0.00);
	CreateDynamicObject(3813, 1120.98, -1952.29, 7603.32,   0.00, 0.00, 0.00);
	CreateDynamicObject(2451, 1128.97, -1956.79, 7601.06,   0.00, 0.00, 270.00);
	CreateDynamicObject(2451, 1129.00, -1961.92, 7601.06,   0.00, 0.00, 269.99);
	CreateDynamicObject(937, 1121.61, -1958.98, 7601.53,   0.00, 0.00, 90.00);
	CreateDynamicObject(1575, 1121.58, -1958.27, 7601.95,   0.00, 0.00, 0.00);
	CreateDynamicObject(1575, 1121.58, -1958.69, 7601.95,   0.00, 0.00, 0.00);
	CreateDynamicObject(1575, 1121.57, -1959.34, 7602.10,   0.00, 0.00, 0.00);
	CreateDynamicObject(1575, 1121.56, -1959.54, 7601.95,   0.00, 0.00, 0.00);
	CreateDynamicObject(1575, 1121.57, -1959.12, 7601.95,   0.00, 0.00, 0.00);
	CreateDynamicObject(1575, 1121.58, -1958.92, 7602.10,   0.00, 0.00, 0.00);
	CreateDynamicObject(1575, 1121.58, -1958.69, 7602.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(1575, 1121.58, -1958.47, 7602.10,   0.00, 0.00, 0.00);
	CreateDynamicObject(1575, 1121.54, -1958.92, 7602.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(1575, 1121.57, -1959.14, 7602.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(8661, 1119.39, -1960.56, 7605.14,   0.00, 179.99, 0.00);
	CreateDynamicObject(3409, 1120.30, -1953.08, 7601.61,   0.00, 0.00, 0.00);
	CreateDynamicObject(2370, 1121.47, -1955.00, 7601.06,   0.00, 0.00, 0.00);
	CreateDynamicObject(8661, 1127.98, -1866.81, 7611.19,   0.00, 179.99, 0.00);
	CreateDynamicObject(8661, 1127.03, -1886.69, 7611.19,   0.00, 179.99, 0.00);
	CreateDynamicObject(8661, 1166.80, -1879.51, 7611.23,   0.00, 179.99, 0.00);
	CreateDynamicObject(8661, 1088.30, -1885.59, 7611.19,   0.00, 179.99, 0.00);
	CreateDynamicObject(8661, 1059.58, -1893.78, 7611.09,   0.00, 179.99, 0.00);
    CreateObject(18850, 754.34, -1260.78, 0.99,   0.00, 0.00, 0.00);
	CreateDynamicObject(6487, 1130.20, -1782.50, 7612.05,   0.00, 0.00, -90.00);
	CreateDynamicObject(733, 1115.41, -1751.77, 7606.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(733, 1101.02, -1845.32, 7606.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(620, 1125.17, -1849.55, 7593.81,   0.00, 0.00, 0.00);
	CreateDynamicObject(6488, 1222.02, -1791.86, 7618.65,   0.00, 0.00, -90.00);
	CreateDynamicObject(6301, 1003.98, -1796.11, 7606.75,   0.00, 0.00, -90.00);
	CreateDynamicObject(6490, 1009.44, -1796.98, 7613.43,   0.00, 0.00, -90.00);
	CreateDynamicObject(6516, 1009.50, -1797.10, 7611.00,   0.00, 0.00, -90.00);
    CreateDynamicObject(6324, 923.74, -1713.45, 7607.79,   0.00, 0.00, -90.00);
    CreateDynamicObject(6508, 1113.31, -1705.54, 7608.93,   0.00, 0.00, -90.00);
    CreateDynamicObject(6336, 1008.10, -1651.67, 7626.27,   0.00, 0.00, -90.00);
    CreateDynamicObject(6364, 1090.11, -1682.56, 7631.75,   0.00, 0.00, -90.00);
	//
	//Azuka Street Gang
	CreateDynamicObject(14506,370.27539062,-427.56347656,5700.10595703,0.00000000,0.00000000,0.00000000); //object(imy_motel_int)(1)
	CreateDynamicObject(14525,370.26245117,-427.56579590,5700.10498047,0.00000000,0.00000000,0.00000000); //object(imy_otherbit)(1)
	CreateDynamicObject(14512,370.25878906,-427.56835938,5700.10546875,0.00000000,0.00000000,0.00000000); //object(immy_rooms2)(1)
	CreateDynamicObject(4562,369.48242188,-431.51562500,5693.06787109,0.00000000,0.00000000,0.00000000); //object(laplaza2_lan)(1)
	CreateDynamicObject(14500,370.37435913,-427.58529663,5700.10546875,0.00000000,0.00000000,359.75000000); //object(immy_rooms)(1)
	CreateDynamicObject(5719,336.99414062,-425.84863281,5707.33154297,0.00000000,0.00000000,90.00000000); //object(holbuild01_law)(1)
	CreateDynamicObject(1536,394.50320435,-455.73034668,5698.35595703,0.00000000,0.00000000,0.00000000); //object(gen_doorext15)(1)
	CreateDynamicObject(1536,397.49169922,-455.69351196,5698.35595703,0.00000000,0.00000000,180.00000000); //object(gen_doorext15)(2)
	CreateDynamicObject(2290,396.72656250,-443.82812500,5698.35595703,0.00000000,0.00000000,0.00000000); //object(swk_couch_1)(1)
	CreateDynamicObject(2290,401.41555786,-452.73507690,5698.35595703,0.00000000,0.00000000,228.00000000); //object(swk_couch_1)(2)
	CreateDynamicObject(2290,402.05514526,-448.98764038,5698.35595703,0.00000000,0.00000000,269.99926758); //object(swk_couch_1)(3)
	CreateDynamicObject(2290,390.56451416,-454.38366699,5698.35595703,0.00000000,0.00000000,143.99926758); //object(swk_couch_1)(4)
	CreateDynamicObject(1824,396.58847046,-450.06878662,5698.86669922,0.00000000,0.00000000,0.00000000); //object(craps_table)(1)
	CreateDynamicObject(2311,390.33114624,-451.68649292,5698.36328125,0.00000000,0.00000000,324.25000000); //object(cj_tv_table2)(1)
	CreateDynamicObject(2311,396.90316772,-445.94628906,5698.36328125,0.00000000,0.00000000,0.24499512); //object(cj_tv_table2)(2)
	CreateDynamicObject(2069,402.16497803,-455.06576538,5698.40576172,0.00000000,0.00000000,0.00000000); //object(cj_mlight7)(1)
	CreateDynamicObject(2069,388.26779175,-455.40750122,5698.40576172,0.00000000,0.00000000,0.00000000); //object(cj_mlight7)(2)
	CreateDynamicObject(2069,393.77816772,-446.67214966,5698.40576172,0.00000000,0.00000000,0.00000000); //object(cj_mlight7)(3)
	CreateDynamicObject(2842,395.44973755,-455.42379761,5698.35595703,0.00000000,0.00000000,0.00000000); //object(gb_bedrug04)(1)
	CreateDynamicObject(1670,397.20932007,-445.85739136,5698.88867188,0.00000000,0.00000000,344.00000000); //object(propcollecttable)(1)
	CreateDynamicObject(1670,391.42849731,-452.53021240,5698.88867188,0.00000000,0.00000000,5.99841309); //object(propcollecttable)(2)
	CreateDynamicObject(1670,390.50415039,-451.87881470,5698.88867188,0.00000000,0.00000000,297.99304199); //object(propcollecttable)(3)
	CreateDynamicObject(2290,395.16778564,-454.94616699,5702.34863281,0.00000000,0.00000000,180.00000000); //object(swk_couch_1)(8)
	CreateDynamicObject(2184,388.31640625,-416.36242676,5698.35595703,0.00000000,0.00000000,0.00000000); //object(med_office6_desk_2)(1)
	CreateDynamicObject(1714,389.17733765,-414.69366455,5698.35595703,0.00000000,0.00000000,14.00000000); //object(kb_swivelchair1)(1)
	CreateDynamicObject(1671,388.23388672,-417.54244995,5698.81640625,0.00000000,0.00000000,160.00000000); //object(swivelchair_a)(1)
	CreateDynamicObject(1671,390.60949707,-417.71240234,5698.81640625,0.00000000,0.00000000,209.99938965); //object(swivelchair_a)(2)
	CreateDynamicObject(2894,389.66091919,-416.18685913,5699.13183594,0.00000000,0.00000000,12.00000000); //object(kmb_rhymesbook)(1)
	CreateDynamicObject(2190,388.39151001,-416.10363770,5699.13183594,0.00000000,0.00000000,130.00000000); //object(pc_1)(1)
	CreateDynamicObject(14455,387.27774048,-422.92285156,5700.02783203,0.00000000,0.00000000,0.00000000); //object(gs_bookcase)(1)
	CreateDynamicObject(1829,386.68246460,-413.64019775,5698.82031250,0.00000000,0.00000000,0.00000000); //object(man_safenew)(1)
	CreateDynamicObject(2835,389.07077026,-420.54916382,5698.35595703,0.00000000,0.00000000,0.00000000); //object(gb_livingrug04)(1)
	CreateDynamicObject(3383,364.03225708,-456.16421509,5698.35595703,0.00000000,0.00000000,0.00000000); //object(a51_labtable1_)(1)
	CreateDynamicObject(3383,357.10580444,-452.76794434,5698.35595703,0.00000000,0.00000000,270.00000000); //object(a51_labtable1_)(2)
	CreateDynamicObject(3409,363.96447754,-457.54934692,5698.91357422,0.00000000,0.00000000,0.00000000); //object(grassplant)(1)
	CreateDynamicObject(3409,355.70996094,-452.82827759,5698.91357422,0.00000000,0.00000000,90.00000000); //object(grassplant)(2)
	CreateDynamicObject(2241,356.87225342,-456.36178589,5698.85986328,0.00000000,0.00000000,0.00000000); //object(plant_pot_5)(1)
	CreateDynamicObject(2241,357.94711304,-456.40078735,5698.85986328,0.00000000,0.00000000,0.00000000); //object(plant_pot_5)(2)
	CreateDynamicObject(2241,356.72662354,-455.43521118,5698.85986328,0.00000000,0.00000000,0.00000000); //object(plant_pot_5)(3)
	CreateDynamicObject(2241,365.44821167,-451.17306519,5698.85986328,0.00000000,0.00000000,0.00000000); //object(plant_pot_5)(4)
	CreateDynamicObject(2241,365.73355103,-452.16009521,5698.85986328,0.00000000,0.00000000,0.00000000); //object(plant_pot_5)(5)
	CreateDynamicObject(2241,364.33279419,-451.12988281,5698.85986328,0.00000000,0.00000000,0.00000000); //object(plant_pot_5)(6)
	CreateDynamicObject(945,363.53970337,-453.35662842,5708.64941406,0.00000000,0.00000000,0.00000000); //object(ws_cf_lamps)(1)
	CreateDynamicObject(945,359.77258301,-453.35919189,5708.64941406,0.00000000,0.00000000,0.00000000); //object(ws_cf_lamps)(2)
	CreateDynamicObject(2841,362.58813477,-453.47512817,5698.35595703,0.00000000,0.00000000,0.00000000); //object(gb_bedrug03)(1)
	CreateDynamicObject(1810,361.60290527,-451.34127808,5698.35595703,0.00000000,0.00000000,340.00000000); //object(cj_foldchair)(1)
	CreateDynamicObject(1810,360.14602661,-451.21109009,5698.35595703,0.00000000,0.00000000,5.99938965); //object(cj_foldchair)(2)
	CreateDynamicObject(1810,360.42837524,-456.17767334,5698.35595703,0.00000000,0.00000000,157.99853516); //object(cj_foldchair)(3)
	CreateDynamicObject(5719,369.29498291,-466.94976807,5707.28173828,0.00000000,0.00000000,270.00000000); //object(holbuild01_law)(1)
	CreateDynamicObject(5719,413.11718750,-417.36718750,5707.28173828,0.00000000,0.00000000,0.00000000); //object(holbuild01_law)(1)
	CreateDynamicObject(5719,346.18081665,-474.38723755,5707.28173828,0.00000000,0.00000000,180.00000000); //object(holbuild01_law)(1)
	CreateDynamicObject(5719,420.35644531,-436.48339844,5707.28173828,0.00000000,0.00000000,269.98901367); //object(holbuild01_law)(1)
	CreateDynamicObject(5719,376.11990356,-432.00225830,5707.58056641,0.00000000,0.00000000,179.99450684); //object(holbuild01_law)(1)
	CreateDynamicObject(5719,369.00476074,-414.02282715,5707.28173828,0.00000000,0.00000000,89.99450684); //object(holbuild01_law)(1)
	CreateDynamicObject(2069,365.54412842,-453.45053101,5698.40576172,0.00000000,0.00000000,0.00000000); //object(cj_mlight7)(3)
	CreateDynamicObject(2069,358.61294556,-450.92333984,5698.40576172,0.00000000,0.00000000,0.00000000); //object(cj_mlight7)(3)
	CreateDynamicObject(2069,361.59356689,-456.56005859,5698.40576172,0.00000000,0.00000000,0.00000000); //object(cj_mlight7)(3)
	CreateDynamicObject(10026,171.37988281,100.95542145,482.38000488,0.00000000,0.00000000,0.00000000); //object(fire_esc_sfe06)(1)
	CreateDynamicObject(16151,347.20654297,-443.21728516,5698.67968750,0.00000000,0.00000000,0.00000000); //object(ufo_bar)(1)
	CreateDynamicObject(2290,338.10839844,-447.56069946,5698.35595703,0.00000000,0.00000000,85.99462891); //object(swk_couch_1)(5)
	CreateDynamicObject(2290,338.47766113,-442.02661133,5698.35595703,0.00000000,0.00000000,87.99133301); //object(swk_couch_1)(6)
	CreateDynamicObject(2311,340.71722412,-445.79418945,5698.35595703,0.00000000,0.00000000,267.99511719); //object(cj_tv_table2)(3)
	CreateDynamicObject(2311,340.74920654,-440.27160645,5698.35595703,0.00000000,0.00000000,267.99084473); //object(cj_tv_table2)(4)
	CreateDynamicObject(1670,340.61578369,-447.00756836,5698.88134766,0.00000000,0.00000000,321.99829102); //object(propcollecttable)(4)
	CreateDynamicObject(1670,340.87719727,-445.92492676,5698.88134766,0.00000000,0.00000000,271.99829102); //object(propcollecttable)(5)
	CreateDynamicObject(1670,340.67156982,-441.32574463,5698.88134766,0.00000000,0.00000000,257.99194336); //object(propcollecttable)(6)
	CreateDynamicObject(1828,343.64291382,-444.30548096,5698.35595703,0.00000000,0.00000000,84.00000000); //object(man_sdr_rug)(1)
	CreateDynamicObject(2290,352.99261475,-451.80825806,5698.35595703,0.00000000,0.00000000,271.99462891); //object(swk_couch_1)(10)
	CreateDynamicObject(2290,345.71453857,-449.38775635,5698.35595703,0.00000000,0.00000000,269.99450684); //object(swk_couch_1)(11)
	CreateDynamicObject(2311,351.16217041,-451.98352051,5698.35595703,0.00000000,0.00000000,269.99511719); //object(cj_tv_table2)(5)
	CreateDynamicObject(2596,347.94982910,-444.33523560,5700.83740234,0.00000000,0.00000000,270.00000000); //object(cj_sex_tv)(1)
	CreateDynamicObject(2296,341.96426392,-451.56561279,5698.35595703,0.00000000,0.00000000,90.00000000); //object(tv_unit_1)(1)
	CreateDynamicObject(2835,343.43304443,-450.24700928,5698.35595703,0.00000000,0.00000000,274.00000000); //object(gb_livingrug04)(2)
	CreateDynamicObject(1670,351.09310913,-452.19271851,5698.88134766,0.00000000,0.00000000,257.99194336); //object(propcollecttable)(7)
	CreateDynamicObject(1486,351.41741943,-453.68548584,5699.00634766,0.00000000,0.00000000,0.00000000); //object(dyn_beer_1)(1)
	CreateDynamicObject(1486,351.34826660,-453.08551025,5699.00634766,0.00000000,0.00000000,0.00000000); //object(dyn_beer_1)(2)
	CreateDynamicObject(1486,351.05764771,-453.38491821,5699.00634766,0.00000000,0.00000000,0.00000000); //object(dyn_beer_1)(3)
	CreateDynamicObject(1486,346.84530640,-446.56976318,5699.45019531,0.00000000,0.00000000,0.00000000); //object(dyn_beer_1)(4)
	CreateDynamicObject(1486,346.32171631,-445.66555786,5699.43017578,0.00000000,0.00000000,0.00000000); //object(dyn_beer_1)(5)
	CreateDynamicObject(1486,346.42620850,-441.22091675,5699.43017578,0.00000000,0.00000000,0.00000000); //object(dyn_beer_1)(6)
	CreateDynamicObject(1486,347.13726807,-439.92703247,5699.45019531,0.00000000,0.00000000,0.00000000); //object(dyn_beer_1)(8)
	CreateDynamicObject(1486,346.36413574,-440.88180542,5699.43017578,0.00000000,0.00000000,0.00000000); //object(dyn_beer_1)(9)
	CreateDynamicObject(1486,346.27691650,-441.21679688,5699.43017578,0.00000000,0.00000000,0.00000000); //object(dyn_beer_1)(10)
	CreateDynamicObject(1541,346.69296265,-444.36166382,5699.50439453,0.00000000,0.00000000,270.00000000); //object(cj_beer_taps_1)(1)
	CreateDynamicObject(1548,346.27865601,-444.41384888,5699.29736328,0.00000000,0.00000000,272.00000000); //object(cj_drip_tray)(1)
	CreateDynamicObject(1497,385.98403931,-411.37539673,5698.35595703,0.00000000,0.00000000,90.00000000); //object(gen_doorext02)(1)
	CreateDynamicObject(18034,396.55456543,-419.75994873,5701.16113281,0.00000000,0.00000000,90.00000000); //object(cj_ammun1_extra)(1)
	CreateDynamicObject(2912,402.55154419,-417.17901611,5698.35595703,0.00000000,0.00000000,342.00000000); //object(temp_crate1)(1)
	CreateDynamicObject(2912,401.57376099,-417.16879272,5698.35595703,0.00000000,0.00000000,357.99890137); //object(temp_crate1)(2)
	CreateDynamicObject(2912,402.48104858,-418.08685303,5698.35595703,0.00000000,0.00000000,357.99499512); //object(temp_crate1)(3)
	CreateDynamicObject(2912,401.89801025,-417.19860840,5699.05615234,0.00000000,0.00000000,335.99499512); //object(temp_crate1)(4)
	CreateDynamicObject(2912,402.39028931,-421.31390381,5698.35595703,0.00000000,0.00000000,335.99487305); //object(temp_crate1)(5)
	CreateDynamicObject(2912,397.48837280,-425.87908936,5698.35595703,0.00000000,0.00000000,335.99487305); //object(temp_crate1)(6)
	CreateDynamicObject(2912,397.18572998,-417.16918945,5698.35595703,0.00000000,0.00000000,335.99487305); //object(temp_crate1)(7)
	CreateDynamicObject(964,402.09948730,-422.88601685,5698.35595703,0.00000000,0.00000000,14.00000000); //object(cj_metal_crate)(1)
	CreateDynamicObject(964,398.55783081,-417.45245361,5698.35595703,0.00000000,0.00000000,355.99658203); //object(cj_metal_crate)(2)
	CreateDynamicObject(3052,402.18270874,-422.65237427,5699.44824219,0.00000000,0.00000000,328.00000000); //object(db_ammo)(1)
	CreateDynamicObject(3052,401.73797607,-423.05087280,5699.44824219,0.00000000,0.00000000,309.99682617); //object(db_ammo)(2)
	CreateDynamicObject(3015,399.57543945,-417.34216309,5698.45556641,0.00000000,0.00000000,0.00000000); //object(cr_cratestack)(1)
	CreateDynamicObject(3015,399.54833984,-417.84106445,5698.45556641,0.00000000,0.00000000,330.00000000); //object(cr_cratestack)(2)
	CreateDynamicObject(3014,397.15808105,-424.18035889,5698.59228516,0.00000000,0.00000000,344.00000000); //object(cr_guncrate)(1)
	CreateDynamicObject(3013,397.32040405,-424.12585449,5699.00781250,0.00000000,0.00000000,0.00000000); //object(cr_ammobox)(1)
	CreateDynamicObject(2064,397.47406006,-422.44256592,5698.98535156,0.00000000,0.00000000,30.00000000); //object(cj_feildgun)(1)
	CreateDynamicObject(2061,397.76031494,-421.77307129,5698.64794922,0.00000000,0.00000000,350.00000000); //object(cj_shells1)(1)
	CreateDynamicObject(2061,397.69546509,-421.55319214,5698.64794922,0.00000000,0.00000000,343.99694824); //object(cj_shells1)(2)
	CreateDynamicObject(2061,398.03106689,-421.60342407,5698.64794922,0.00000000,0.00000000,49.99291992); //object(cj_shells1)(3)
	CreateDynamicObject(2058,399.39324951,-421.14349365,5698.35595703,0.00000000,0.00000000,0.00000000); //object(cj_gun_docs)(1)
	CreateDynamicObject(2059,399.98043823,-422.50036621,5698.36376953,0.00000000,0.00000000,0.00000000); //object(cj_gunstuff1)(1)
	CreateDynamicObject(2035,398.63589478,-417.22073364,5699.34619141,0.00000000,0.00000000,338.00000000); //object(cj_m16)(1)
	CreateDynamicObject(2035,398.52182007,-417.65267944,5699.34619141,0.00000000,0.00000000,3.99987793); //object(cj_m16)(2)
	CreateDynamicObject(2290,391.67410278,-422.07022095,5698.35595703,0.00000000,0.00000000,180.00000000); //object(swk_couch_1)(7)
	CreateDynamicObject(2290,388.68966675,-422.07467651,5698.35595703,0.00000000,0.00000000,179.99450684); //object(swk_couch_1)(9)
	CreateDynamicObject(3095,372.05267334,-448.87963867,5701.86181641,0.00000000,0.00000000,0.00000000); //object(a51_jetdoor)(1)
	CreateDynamicObject(3095,399.19879150,-451.70129395,5705.91455078,0.00000000,0.00000000,0.00000000); //object(a51_jetdoor)(2)
	CreateDynamicObject(2290,342.98089600,-445.67864990,5698.35595703,0.00000000,0.00000000,265.98999023); //object(swk_couch_1)(5)
	CreateDynamicObject(2290,343.17959595,-440.26757812,5698.35595703,0.00000000,0.00000000,268.23449707); //object(swk_couch_1)(5)
	CreateDynamicObject(14888,384.17883301,-443.22439575,5699.15869141,0.00000000,0.00000000,90.00000000); //object(millie-headboard)(2)
	CreateDynamicObject(14891,379.76657104,-442.37927246,5700.62353516,0.00000000,0.00000000,180.00000000); //object(millie-swing)(1)
	CreateDynamicObject(14890,383.31472778,-443.05743408,5699.16162109,0.00000000,0.00000000,296.00000000); //object(millie-vibrators)(1)
	CreateDynamicObject(2844,381.57788086,-442.61383057,5698.35595703,0.00000000,0.00000000,0.00000000); //object(gb_bedclothes03)(1)
	CreateDynamicObject(2845,380.63757324,-444.87591553,5698.35595703,0.00000000,0.00000000,0.00000000); //object(gb_bedclothes04)(1)
	CreateDynamicObject(1491,378.03750610,-446.86160278,5698.35595703,0.00000000,0.00000000,0.00000000); //object(gen_doorint01)(1)
	CreateDynamicObject(1491,362.04650879,-450.41809082,5698.35595703,0.00000000,0.00000000,0.00000000); //object(gen_doorint01)(2)
	CreateDynamicObject(1491,392.76263428,-418.80661011,5698.35595703,0.00000000,0.00000000,270.00000000); //object(gen_doorint01)(3)
	CreateDynamicObject(1491,396.45989990,-418.84750366,5698.35595703,0.00000000,0.00000000,270.00000000); //object(gen_doorint01)(4)
	CreateDynamicObject(1491,392.88052368,-429.82791138,5698.35595703,0.00000000,0.00000000,270.00000000); //object(gen_doorint01)(5)
	CreateDynamicObject(16500,392.84231567,-433.81997681,5700.35009766,0.00000000,0.00000000,0.00000000); //object(cn2_savgardr1_)(1)
	CreateDynamicObject(16500,392.79080200,-422.80032349,5700.35009766,0.00000000,0.00000000,0.00000000); //object(cn2_savgardr1_)(2)
	CreateDynamicObject(16500,396.46737671,-422.81085205,5700.35009766,0.00000000,0.00000000,179.99450684); //object(cn2_savgardr1_)(3)
	CreateDynamicObject(16500,366.05593872,-450.45327759,5700.35009766,0.00000000,0.00000000,89.99450684); //object(cn2_savgardr1_)(4)
	CreateDynamicObject(16500,382.04287720,-446.85247803,5700.35009766,0.00000000,0.00000000,270.00000000); //object(cn2_savgardr1_) (1)
	CreateDynamicObject(16500,382.04199219,-446.85156250,5700.35009766,0.00000000,0.00000000,270.00000000); //object(cn2_savgardr1_) (2)
	CreateDynamicObject(19128,390.84555054,-432.49288940,5698.41845703,0.00000000,0.00000000,0.00000000); //object(sw_bridge03) (1)
	CreateDynamicObject(19128,386.85437012,-432.50442505,5698.41845703,0.00000000,0.00000000,0.00000000); //object(sw_bridge03) (2)
	CreateDynamicObject(19128,386.85406494,-428.51962280,5698.42578125,0.00000000,0.00000000,0.00000000); //object(sw_bridge03) (3)
	CreateDynamicObject(19128,390.82937622,-428.52102661,5698.41845703,0.00000000,0.00000000,0.00000000); //object(sw_bridge03) (4)
	CreateDynamicObject(19128,390.83251953,-424.55563354,5698.41845703,0.00000000,0.00000000,0.00000000); //object(sw_bridge03) (5)
	CreateDynamicObject(19128,386.86566162,-424.56341553,5698.41845703,0.00000000,0.00000000,0.00000000); //object(sw_bridge03) (6)
	CreateDynamicObject(2290,392.03500366,-426.24612427,5698.48876953,0.00000000,0.00000000,270.00000000); //object(swk_couch_1) (1)
	CreateDynamicObject(2290,387.97012329,-424.52398682,5698.48876953,0.00000000,0.00000000,0.00000000); //object(swk_couch_1) (2)
	CreateDynamicObject(2290,391.98812866,-433.40994263,5698.48876953,0.00000000,0.00000000,180.00000000); //object(swk_couch_1) (3)
	CreateDynamicObject(2290,386.70715332,-430.48983765,5698.48876953,0.00000000,0.00000000,89.99450684); //object(swk_couch_1) (4)
	CreateDynamicObject(2229,386.03186035,-433.46466064,5698.48876953,0.00000000,0.00000000,130.00000000); //object(swank_speaker) (1)
	CreateDynamicObject(2229,392.55828857,-424.46936035,5698.48876953,0.00000000,0.00000000,319.99572754); //object(swank_speaker) (2)
	CreateDynamicObject(2229,386.56967163,-423.97460938,5698.48876953,0.00000000,0.00000000,59.99328613); //object(swank_speaker) (3)
	CreateDynamicObject(2229,392.48651123,-429.47219849,5698.48876953,0.00000000,0.00000000,269.99084473); //object(swank_speaker) (4)
	CreateDynamicObject(2780,389.25286865,-428.55850220,5691.73876953,0.00000000,0.00000000,0.00000000); //object(cj_smoke_mach) (1)
	CreateDynamicObject(18102,389.99365234,-430.51831055,5702.20117188,0.00000000,0.00000000,0.00000000); //object(light_box1) (1)
	CreateDynamicObject(16500,385.93756104,-443.43981934,5700.35009766,0.00000000,0.00000000,180.00000000); //object(cn2_savgardr1_) (2)
	CreateDynamicObject(18647,395.98782349,-455.75308228,5701.15771484,0.00000000,0.00000000,90.00000000); //object(redneontube1) (1)
	CreateDynamicObject(18647,393.05920410,-424.65591431,5696.15771484,0.00000000,0.00000000,90.00000000); //object(redneontube1) (2)
	CreateDynamicObject(18647,391.36871338,-401.37670898,5696.15771484,0.00000000,0.00000000,90.00000000); //object(redneontube1) (3)
	CreateDynamicObject(18647,351.06967163,-446.47268677,5696.15771484,0.00000000,0.00000000,90.00000000); //object(redneontube1) (4)
	
	//Ballas HQ
    CreateDynamicObject(14425,2487.00000000,-928.29998779,5068.59912109,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(madddoggs14) (1)
    CreateDynamicObject(14388,2487.00000000,-928.29980469,5068.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(madddoggs02) (1)
    CreateDynamicObject(14422,2487.00000000,-928.29980469,5068.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(madddoggs01) (1)
    CreateDynamicObject(14424,2487.00000000,-928.29980469,5068.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(madddoggs13) (1)
    CreateDynamicObject(14390,2487.00000000,-928.29980469,5068.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(madddoggs04) (1)
    CreateDynamicObject(14419,2487.00000000,-928.29980469,5068.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(madddoggs08) (1)
    CreateDynamicObject(14420,2487.00000000,-928.29980469,5068.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(madddoggs09) (1)
    CreateDynamicObject(14421,2535.97949219,-926.17999268,5074.52392578,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(madddoggs10) (1)
    CreateDynamicObject(14423,2487.00000000,-928.29980469,5068.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(madddoggs12) (1)
    CreateDynamicObject(14417,2487.00000000,-928.29980469,5068.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(madddoggs05) (1)
    CreateDynamicObject(2004,2465.28051758,-921.76690674,5067.61962891,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cr_safe_door) (1)
    CreateDynamicObject(1671,2463.94091797,-924.02166748,5065.75976562,0.00000000,0.00000000,24.00000000, .interiorid = 1, .worldid = 6049); //object(swivelchair_a) (1)
    CreateDynamicObject(2207,2463.12109375,-925.63378906,5065.35009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(med_office7_desk_1) (1)
    CreateDynamicObject(2190,2464.44238281,-925.88671875,5066.12744141,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 6049); //object(pc_1) (1)
    CreateDynamicObject(2854,2458.48046875,-924.72686768,5065.85546875,0.00000000,0.00000000,308.00000000, .interiorid = 1, .worldid = 6049); //object(gb_bedmags04) (1)
    CreateDynamicObject(1742,2472.27465820,-924.16760254,5065.35009766,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(med_bookshelf) (1)
    CreateDynamicObject(2811,2471.87475586,-925.98071289,5065.27929688,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(gb_romanpot01) (1)
    CreateDynamicObject(1665,2464.41796875,-926.17089844,5066.18750000,0.00000000,0.00000000,305.99670410, .interiorid = 1, .worldid = 6049); //object(propashtray1) (1)
    CreateDynamicObject(2894,2465.26269531,-925.11816406,5066.12744141,0.00000000,0.00000000,59.99633789, .interiorid = 1, .worldid = 6049); //object(kmb_rhymesbook) (1)
    CreateDynamicObject(1721,2464.97534180,-927.38787842,5065.35009766,0.00000000,0.00000000,24.00000000, .interiorid = 1, .worldid = 6049); //object(est_chair1) (1)
    CreateDynamicObject(1721,2463.07568359,-927.36450195,5065.35009766,0.00000000,0.00000000,335.99963379, .interiorid = 1, .worldid = 6049); //object(est_chair1) (2)
    CreateDynamicObject(1828,2458.52978516,-924.30816650,5065.34716797,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(man_sdr_rug) (2)
    CreateDynamicObject(1713,2457.08666992,-924.91735840,5065.35009766,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(kb_couch04) (1)
    CreateDynamicObject(1708,2459.11694336,-926.16314697,5065.35009766,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6049); //object(kb_chair02) (1)
    CreateDynamicObject(2311,2458.62597656,-924.79003906,5065.35009766,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(cj_tv_table2) (2)
    CreateDynamicObject(2854,2463.15527344,-925.38867188,5066.12744141,0.00000000,0.00000000,307.99621582, .interiorid = 1, .worldid = 6049); //object(gb_bedmags04) (2)
    CreateDynamicObject(2251,2458.65795898,-924.14636230,5066.69824219,0.00000000,0.00000000,102.00000000, .interiorid = 1, .worldid = 6049); //object(plant_pot_20) (1)
    CreateDynamicObject(2852,2458.58447266,-923.42724609,5065.85546875,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(gb_bedmags02) (1)
    CreateDynamicObject(2606,2463.89990234,-929.79998779,5068.50000000,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 6049); //object(cj_police_counter2) (1)
    CreateDynamicObject(2260,2456.97729492,-924.08496094,5067.45263672,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(frame_slim_1) (1)
    CreateDynamicObject(2026,2466.19311523,-925.74383545,5069.83837891,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(mrk_shade_tmp) (1)
    CreateDynamicObject(2606,2463.89990234,-929.79998779,5068.10009766,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 6049); //object(cj_police_counter2) (3)
    CreateDynamicObject(3811,2456.89990234,-944.90002441,5067.79980469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(sfx_winplant08) (1)
    CreateDynamicObject(3811,2456.89990234,-939.29998779,5069.70019531,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(sfx_winplant08) (2)
    CreateDynamicObject(2011,2456.89941406,-954.50000000,5065.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(nu_plant2_ofc) (1)
    CreateDynamicObject(2257,2460.89990234,-944.29998779,5069.20019531,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(frame_clip_4) (1)
    CreateDynamicObject(1491,2472.39941406,-950.52929688,5065.36621094,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (1)
    CreateDynamicObject(1491,2472.39941406,-947.50000000,5065.36621094,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (2)
    CreateDynamicObject(16151,2465.79980469,-946.50000000,5065.89990234,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 6049); //object(ufo_bar) (1)
    CreateDynamicObject(16780,2484.00000000,-941.00000000,5069.89990234,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(ufo_light03) (1)
    CreateDynamicObject(1703,2464.89990234,-939.00000000,5064.50000000,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(kb_couch02) (1)
    CreateDynamicObject(1703,2468.79980469,-939.79980469,5064.50000000,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 6049); //object(kb_couch02) (2)
    CreateDynamicObject(2297,2466.79980469,-935.29980469,5064.50000000,0.00000000,0.00000000,315.99975586, .interiorid = 1, .worldid = 6049); //object(tv_unit_2) (1)
    CreateDynamicObject(2640,2475.79980469,-935.34594727,5065.29980469,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(neil_slot) (1)
    CreateDynamicObject(2640,2475.79882812,-936.19964600,5065.29980469,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(neil_slot) (2)
    CreateDynamicObject(2964,2471.39941406,-937.39941406,5064.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(k_pooltablesm) (1)
    CreateDynamicObject(2964,2472.69921875,-941.09960938,5064.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(k_pooltablesm) (2)
    CreateDynamicObject(2965,2468.50000000,-935.70001221,5064.70019531,357.88140869,58.06280518,317.39361572, .interiorid = 1, .worldid = 6049); //object(k_pooltriangle01) (1)
    CreateDynamicObject(2997,2471.89990234,-937.20001221,5065.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(k_poolballstp03) (1)
    CreateDynamicObject(2996,2471.69995117,-937.50000000,5065.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(k_poolballstp02) (1)
    CreateDynamicObject(2999,2472.30004883,-937.79998779,5065.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(k_poolballstp05) (1)
    CreateDynamicObject(3002,2471.19995117,-937.00000000,5065.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(k_poolballspt01) (1)
    CreateDynamicObject(3104,2471.10009766,-937.79998779,5065.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(k_poolballspt06) (1)
    CreateDynamicObject(638,2475.89941406,-945.59960938,5066.09912109,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(kb_planter_bush) (1)
    CreateDynamicObject(638,2475.89990234,-944.09997559,5066.10009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(kb_planter_bush) (2)
    CreateDynamicObject(2256,2464.30004883,-938.90002441,5067.60009766,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(frame_clip_3) (1)
    CreateDynamicObject(2232,2476.39990234,-945.59997559,5068.70019531,0.00000000,180.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(med_speaker_4) (2)
    CreateDynamicObject(2231,2469.30004883,-935.09997559,5064.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(swank_speaker_3) (1)
    CreateDynamicObject(2101,2467.30004883,-935.40002441,5066.20019531,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(med_hi_fi_3) (1)
    CreateDynamicObject(18092,2484.00000000,-940.29980469,5065.89990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(ammun3_counter) (1)
    CreateDynamicObject(18092,2484.00000000,-940.69921875,5065.89892578,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6049); //object(ammun3_counter) (2)
    CreateDynamicObject(2124,2485.89941406,-941.69921875,5066.20019531,0.00000000,1.99951172,285.99609375, .interiorid = 1, .worldid = 6049); //object(swank_din_chair_1) (1)
    CreateDynamicObject(2124,2484.80004883,-941.70001221,5066.20019531,0.00000000,0.00000000,263.99548340, .interiorid = 1, .worldid = 6049); //object(swank_din_chair_1) (2)
    CreateDynamicObject(2124,2483.50000000,-941.90002441,5066.20019531,0.00000000,0.00000000,275.99548340, .interiorid = 1, .worldid = 6049); //object(swank_din_chair_1) (3)
    CreateDynamicObject(2124,2482.39941406,-941.79980469,5066.20019531,0.00000000,0.00000000,261.99096680, .interiorid = 1, .worldid = 6049); //object(swank_din_chair_1) (4)
    CreateDynamicObject(2124,2485.80004883,-939.09997559,5066.20019531,0.00000000,0.00000000,98.00000000, .interiorid = 1, .worldid = 6049); //object(swank_din_chair_1) (5)
    CreateDynamicObject(2124,2484.69995117,-939.00000000,5066.20019531,0.00000000,0.00000000,89.99804688, .interiorid = 1, .worldid = 6049); //object(swank_din_chair_1) (6)
    CreateDynamicObject(2124,2483.50000000,-939.20001221,5066.20019531,0.00000000,0.00000000,95.99450684, .interiorid = 1, .worldid = 6049); //object(swank_din_chair_1) (7)
    CreateDynamicObject(2124,2482.30004883,-939.09997559,5066.20019531,0.00000000,0.00000000,83.99304199, .interiorid = 1, .worldid = 6049); //object(swank_din_chair_1) (8)
    CreateDynamicObject(1704,2488.10009766,-936.29998779,5065.39990234,0.00000000,0.00000000,22.00000000, .interiorid = 1, .worldid = 6049); //object(kb_chair03) (1)
    CreateDynamicObject(1703,2490.89990234,-936.70001221,5065.39990234,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(kb_couch02) (2)
    CreateDynamicObject(1704,2489.19921875,-939.69921875,5065.39990234,0.00000000,0.00000000,169.99694824, .interiorid = 1, .worldid = 6049); //object(kb_chair03) (2)
    CreateDynamicObject(2227,2477.60009766,-941.29998779,270.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(swank_hi_fi_3) (1)
    CreateDynamicObject(1649,2477.03759766,-940.43872070,5067.70019531,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(wglasssmash) (1)
    CreateDynamicObject(2848,2482.30004883,-941.00000000,5066.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(gb_kitchdirt02) (1)
    CreateDynamicObject(2830,2484.89990234,-940.00000000,5066.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(gb_platedirty04) (1)
    CreateDynamicObject(1664,2484.54077148,-940.06091309,5066.56689453,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(propwinebotl2) (1)
    CreateDynamicObject(1667,2483.29980469,-941.09960938,5066.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(propwineglass1) (1)
    CreateDynamicObject(1667,2484.80004883,-940.90002441,5066.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(propwineglass1) (2)
    CreateDynamicObject(1667,2485.80004883,-940.00000000,5066.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(propwineglass1) (4)
    CreateDynamicObject(2295,2464.80004883,-935.29998779,5064.50000000,0.00000000,0.00000000,34.00000000, .interiorid = 1, .worldid = 6049); //object(cj_beanbag) (1)
    CreateDynamicObject(1484,2482.30004883,-940.20001221,5066.60009766,347.31005859,28.76559448,40.47015381, .interiorid = 1, .worldid = 6049); //object(cj_bear_bottle) (1)
    CreateDynamicObject(2001,2491.64941406,-946.19116211,5065.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(nu_plant_ofc) (1)
    CreateDynamicObject(1808,2491.82373047,-944.68988037,5065.39990234,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(cj_watercooler2) (1)
    CreateDynamicObject(2289,2492.00000000,-941.29998779,5067.60009766,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(frame_2) (1)
    CreateDynamicObject(1491,2485.02001953,-946.92199707,5065.35009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (1)
    CreateDynamicObject(1491,2488.04589844,-946.89941406,5065.35009766,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (2)
    CreateDynamicObject(2288,2481.00000000,-946.29998779,5067.70019531,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6049); //object(frame_3) (1)
    CreateDynamicObject(2305,2513.19995117,-935.09997559,5067.00000000,0.00000000,0.00000000,272.00000000, .interiorid = 1, .worldid = 6049); //object(cj_k3_c_unit) (1)
    CreateDynamicObject(2139,2513.19995117,-929.79998779,5067.00000000,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(cj_k3_low_unit2) (2)
    CreateDynamicObject(2139,2513.19995117,-928.90002441,5067.00000000,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(cj_k3_low_unit2) (3)
    CreateDynamicObject(2139,2513.19995117,-928.00000000,5067.00000000,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(cj_k3_low_unit2) (4)
    CreateDynamicObject(2140,2512.19921875,-924.19921875,5067.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_k3_tall_unit1) (1)
    CreateDynamicObject(2136,2510.19921875,-924.19921875,5067.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_k3_sink) (1)
    CreateDynamicObject(2139,2509.30004883,-924.20001221,5067.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_k3_low_unit2) (6)
    CreateDynamicObject(2135,2508.29980469,-924.19921875,5067.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_k3_cooker) (1)
    CreateDynamicObject(2137,2508.29980469,-926.89941406,5067.00000000,0.00000000,0.00000000,87.99499512, .interiorid = 1, .worldid = 6049); //object(cj_k3_low_unit3) (1)
    CreateDynamicObject(2138,2508.30004883,-927.79998779,5067.00000000,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(cj_k3_low_unit1) (1)
    CreateDynamicObject(2137,2508.29980469,-928.69921875,5067.00000000,0.00000000,0.00000000,87.98400879, .interiorid = 1, .worldid = 6049); //object(cj_k3_low_unit3) (2)
    CreateDynamicObject(2138,2508.30004883,-929.59997559,5067.00000000,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(cj_k3_low_unit1) (2)
    CreateDynamicObject(638,2506.60009766,-937.29998779,5067.70019531,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 6049); //object(kb_planter_bush) (4)
    CreateDynamicObject(638,2506.60009766,-934.70001221,5067.70019531,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 6049); //object(kb_planter_bush) (5)
    CreateDynamicObject(1808,2513.39990234,-933.00000000,5067.00000000,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(cj_watercooler2) (2)
    CreateDynamicObject(2139,2513.19995117,-934.00000000,5067.00000000,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(cj_k3_low_unit2) (8)
    CreateDynamicObject(2745,2514.19995117,-954.70001221,5068.20019531,0.00000000,0.00000000,178.00000000, .interiorid = 1, .worldid = 6049); //object(cj_stat_3) (1)
    CreateDynamicObject(2773,2515.16845703,-954.70196533,5067.45019531,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_airprt_bar) (1)
    CreateDynamicObject(2773,2513.28491211,-954.61682129,5067.45117188,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_airprt_bar) (2)
    CreateDynamicObject(2773,2514.24951172,-953.68267822,5067.49218750,0.00000000,0.00000000,87.99499512, .interiorid = 1, .worldid = 6049); //object(cj_airprt_bar) (3)
    CreateDynamicObject(2124,2514.69995117,-930.50000000,5067.79980469,0.00000000,0.00000000,10.00000000, .interiorid = 1, .worldid = 6049); //object(swank_din_chair_1) (10)
    CreateDynamicObject(2124,2514.89941406,-929.29980469,5067.79980469,0.00000000,0.00000000,347.99743652, .interiorid = 1, .worldid = 6049); //object(swank_din_chair_1) (11)
    CreateDynamicObject(2838,2508.10009766,-929.59997559,5068.10009766,357.99499512,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(gb_takeaway03) (1)
    CreateDynamicObject(2821,2508.10009766,-928.00000000,5068.10009766,0.00000000,0.00000000,310.00000000, .interiorid = 1, .worldid = 6049); //object(gb_foodwrap01) (1)
    CreateDynamicObject(2852,2513.30004883,-928.20001221,5068.04980469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(gb_bedmags02) (2)
    CreateDynamicObject(2850,2510.00000000,-924.09960938,5068.10009766,0.00000000,0.00000000,43.99475098, .interiorid = 1, .worldid = 6049); //object(gb_kitchdirt04) (1)
    CreateDynamicObject(2841,2510.01708984,-927.79870605,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(gb_bedrug03) (1)
    CreateDynamicObject(2257,2506.80004883,-955.00000000,5069.50000000,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6049); //object(frame_clip_4) (2)
    CreateDynamicObject(2207,2523.50000000,-944.29980469,5067.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(med_office7_desk_1) (1)
    CreateDynamicObject(1671,2524.50000000,-942.79998779,5067.39990234,0.00000000,0.00000000,346.00000000, .interiorid = 1, .worldid = 6049); //object(swivelchair_a) (2)
    CreateDynamicObject(2813,2523.60009766,-943.90002441,5067.79980469,0.00000000,0.00000000,150.00000000, .interiorid = 1, .worldid = 6049); //object(gb_novels01) (1)
    CreateDynamicObject(948,2520.50000000,-941.19921875,5067.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(plant_pot_10) (1)
    CreateDynamicObject(2280,2520.59960938,-945.69921875,5069.50000000,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(frame_thick_1) (1)
    CreateDynamicObject(1705,2523.39990234,-945.90002441,5067.00000000,0.00000000,0.00000000,137.99993896, .interiorid = 1, .worldid = 6049); //object(kb_chair04) (1)
    CreateDynamicObject(1705,2525.80004883,-945.59997559,5067.00000000,0.00000000,0.00000000,207.99920654, .interiorid = 1, .worldid = 6049); //object(kb_chair04) (2)
    CreateDynamicObject(1665,2524.10595703,-944.07031250,5067.81250000,0.00000000,0.00000000,305.99121094, .interiorid = 1, .worldid = 6049); //object(propashtray1) (1)
    CreateDynamicObject(1706,2527.30004883,-952.59997559,5067.00000000,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(kb_couch03) (1)
    CreateDynamicObject(2311,2525.69995117,-953.09997559,5067.00000000,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(cj_tv_table2) (2)
    CreateDynamicObject(1704,2526.80004883,-950.20001221,5067.00000000,0.00000000,0.00000000,304.00000000, .interiorid = 1, .worldid = 6049); //object(kb_chair03) (3)
    CreateDynamicObject(2816,2525.80004883,-952.90002441,5067.50000000,0.00000000,0.00000000,135.99993896, .interiorid = 1, .worldid = 6049); //object(gb_bedmags01) (1)
    CreateDynamicObject(1486,2525.69995117,-951.40002441,5067.70019531,0.00000000,0.00000000,357.99499512, .interiorid = 1, .worldid = 6049); //object(dyn_beer_1) (2)
    CreateDynamicObject(1665,2525.60009766,-951.70001221,5067.54980469,0.00000000,0.00000000,305.99670410, .interiorid = 1, .worldid = 6049); //object(propashtray1) (1)
    CreateDynamicObject(1828,2524.19921875,-949.00000000,5067.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(man_sdr_rug) (1)
    CreateDynamicObject(2259,2527.60009766,-943.59997559,5069.20019531,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(frame_clip_6) (1)
    CreateDynamicObject(2573,2547.89990234,-976.00000000,4995.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(hotel_dresser_6) (1)
    CreateDynamicObject(2654,2515.30004883,-977.00000000,4993.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_shoe_box) (2)
    CreateDynamicObject(14399,2495.39990234,-909.59997559,5065.29980469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(bar2) (1)
    CreateDynamicObject(2344,2510.30004883,-921.40002441,5071.79980469,0.00000000,0.00000000,62.00000000, .interiorid = 1, .worldid = 6049); //object(cj_remote) (4)
    CreateDynamicObject(2253,2483.85717773,-940.51763916,5066.67968750,0.00000000,0.00000000,38.00000000, .interiorid = 1, .worldid = 6049); //object(plant_pot_22) (1)
    CreateDynamicObject(2313,2477.52465820,-941.11944580,5065.35009766,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(cj_tv_table1) (2)
    CreateDynamicObject(2231,2476.66552734,-937.51025391,5068.33447266,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(swank_speaker_3) (5)
    CreateDynamicObject(2231,2476.66552734,-942.92871094,5068.33886719,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(swank_speaker_3) (6)
    CreateDynamicObject(14455,2478.39086914,-946.66564941,5067.02197266,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(gs_bookcase) (1)
    CreateDynamicObject(14532,2478.01684570,-935.66955566,5066.33300781,0.00000000,0.00000000,242.00000000, .interiorid = 1, .worldid = 6049); //object(tv_stand_driv) (1)
    CreateDynamicObject(2233,2491.45336914,-939.66406250,5065.35302734,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(swank_speaker_4) (1)
    CreateDynamicObject(2233,2491.45214844,-936.46313477,5065.35302734,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(swank_speaker_4) (2)
    CreateDynamicObject(2293,2489.31811523,-937.76745605,5065.35009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(swk_1_fstool) (1)
    CreateDynamicObject(2640,2475.77490234,-937.04241943,5065.29296875,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(neil_slot) (2)
    CreateDynamicObject(2640,2475.75781250,-937.89160156,5065.29296875,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(neil_slot) (2)
    CreateDynamicObject(970,2471.53466797,-946.95245361,5065.90136719,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(fencesmallb) (1)
    CreateDynamicObject(14418,2518.66113281,-963.73925781,5074.52001953,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(madddoggs07) (1)
    CreateDynamicObject(2395,2511.09179688,-929.21777344,5071.04687500,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(cj_sports_wall) (1)
    CreateDynamicObject(1491,2511.04980469,-931.24023438,5071.27392578,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (3)
    CreateDynamicObject(2957,2521.73242188,-932.40722656,5072.82373047,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(chinatgaragedoor) (2)
    CreateDynamicObject(18092,2503.15478516,-928.97967529,5071.74414062,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(ammun3_counter) (3)
    CreateDynamicObject(2509,2502.97363281,-928.02648926,5073.18652344,0.00000000,90.00000000,89.99981689, .interiorid = 1, .worldid = 6049); //object(cj_hobby_shelf_6) (2)
    CreateDynamicObject(2509,2502.97363281,-929.91601562,5073.18652344,0.00000000,90.00000000,89.99993896, .interiorid = 1, .worldid = 6049); //object(cj_hobby_shelf_6) (3)
    CreateDynamicObject(2035,2503.02709961,-929.97918701,5073.54492188,90.00000000,153.43493652,296.56506348, .interiorid = 1, .worldid = 6049); //object(cj_m16) (1)
    CreateDynamicObject(2035,2503.02636719,-929.97851562,5073.17138672,90.00000000,160.52667236,289.46783447, .interiorid = 1, .worldid = 6049); //object(cj_m16) (2)
    CreateDynamicObject(2035,2503.02636719,-929.97851562,5072.77294922,90.00000000,196.78346252,253.20553589, .interiorid = 1, .worldid = 6049); //object(cj_m16) (3)
    CreateDynamicObject(2036,2503.02343750,-928.62091064,5073.58007812,90.00000000,210.00000000,240.00000000, .interiorid = 1, .worldid = 6049); //object(cj_psg1) (1)
    CreateDynamicObject(2036,2503.02343750,-928.62011719,5073.18164062,90.00000000,160.52929688,289.46520996, .interiorid = 1, .worldid = 6049); //object(cj_psg1) (2)
    CreateDynamicObject(2036,2503.02343750,-928.62011719,5072.80810547,90.00000000,160.52673340,289.46228027, .interiorid = 1, .worldid = 6049); //object(cj_psg1) (3)
    CreateDynamicObject(2044,2503.05395508,-927.53839111,5073.57080078,90.00000000,175.02557373,274.97442627, .interiorid = 1, .worldid = 6049); //object(cj_mp5k) (1)
    CreateDynamicObject(2044,2503.05371094,-927.53808594,5073.17236328,90.00000000,184.95814514,265.03634644, .interiorid = 1, .worldid = 6049); //object(cj_mp5k) (2)
    CreateDynamicObject(2044,2503.05371094,-927.53808594,5072.74902344,90.00000000,175.06359863,274.92541504, .interiorid = 1, .worldid = 6049); //object(cj_mp5k) (3)
    CreateDynamicObject(2985,2506.87011719,-927.19989014,5071.27001953,0.00000000,0.00000000,348.00000000, .interiorid = 1, .worldid = 6049); //object(minigun_base) (1)
    CreateDynamicObject(2969,2510.64843750,-926.74237061,5071.39648438,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(level_ammobox) (1)
    CreateDynamicObject(2969,2510.65380859,-927.51940918,5071.39648438,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(level_ammobox) (2)
    CreateDynamicObject(2969,2510.63256836,-928.28540039,5071.39648438,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(level_ammobox) (3)
    CreateDynamicObject(2969,2510.65332031,-927.89392090,5071.64550781,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(level_ammobox) (4)
    CreateDynamicObject(2969,2510.65576172,-927.07330322,5071.65625000,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(level_ammobox) (5)
    CreateDynamicObject(2969,2510.65527344,-927.47363281,5071.90527344,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(level_ammobox) (7)
    CreateDynamicObject(3015,2503.36523438,-931.86590576,5071.27685547,0.00000000,0.00000000,32.00000000, .interiorid = 1, .worldid = 6049); //object(cr_cratestack) (1)
    CreateDynamicObject(2969,2503.43139648,-930.93487549,5072.37109375,0.00000000,0.00000000,142.00000000, .interiorid = 1, .worldid = 6049); //object(level_ammobox) (8)
    CreateDynamicObject(2058,2510.94091797,-928.35943604,5073.13916016,90.00000000,215.26438904,54.73559570, .interiorid = 1, .worldid = 6049); //object(cj_gun_docs) (1)
    CreateDynamicObject(2058,2510.92871094,-927.41162109,5074.16503906,90.00000000,180.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(cj_gun_docs) (3)
    CreateDynamicObject(2058,2510.97363281,-926.78112793,5073.12158203,90.00000000,150.00234985,119.99218750, .interiorid = 1, .worldid = 6049); //object(cj_gun_docs) (4)
    CreateDynamicObject(2068,2507.08374023,-929.05187988,5075.54052734,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_cammo_net) (1)
    CreateDynamicObject(2064,2507.69433594,-931.35888672,5071.90625000,0.00000000,0.00000000,118.00000000, .interiorid = 1, .worldid = 6049); //object(cj_feildgun) (1)
    CreateDynamicObject(2060,2505.78271484,-931.87866211,5071.43359375,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_sandbag) (1)
    CreateDynamicObject(2060,2504.67626953,-931.88000488,5071.43359375,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_sandbag) (2)
    CreateDynamicObject(2060,2504.76562500,-931.84887695,5071.74902344,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_sandbag) (3)
    CreateDynamicObject(2060,2505.13720703,-931.78277588,5072.06445312,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_sandbag) (4)
    CreateDynamicObject(2060,2505.67138672,-931.75146484,5071.74902344,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_sandbag) (5)
    CreateDynamicObject(1828,2507.52758789,-928.98944092,5071.27001953,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(man_sdr_rug) (3)
    CreateDynamicObject(16775,2513.80371094,-933.63378906,5071.14648438,90.00000000,177.16577148,272.83422852, .interiorid = 1, .worldid = 6049); //object(door_savhangr2) (1)
    CreateDynamicObject(2044,2503.64208984,-930.36230469,5072.27197266,0.00000000,0.00000000,56.00000000, .interiorid = 1, .worldid = 6049); //object(cj_mp5k) (4)
    CreateDynamicObject(2044,2503.64379883,-930.05645752,5072.27197266,0.00000000,0.00000000,59.99737549, .interiorid = 1, .worldid = 6049); //object(cj_mp5k) (5)
    CreateDynamicObject(2037,2503.30175781,-930.30267334,5072.31689453,0.00000000,0.00000000,136.00000000, .interiorid = 1, .worldid = 6049); //object(cj_pistol_ammo) (1)
    CreateDynamicObject(2037,2503.29833984,-930.12658691,5072.31689453,0.00000000,0.00000000,135.99975586, .interiorid = 1, .worldid = 6049); //object(cj_pistol_ammo) (2)
    CreateDynamicObject(1654,2503.41894531,-929.72357178,5072.46191406,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(dynamite) (1)
    CreateDynamicObject(1654,2503.37304688,-929.52136230,5072.46191406,0.00000000,0.00000000,136.00000000, .interiorid = 1, .worldid = 6049); //object(dynamite) (2)
    CreateDynamicObject(1650,2503.46313477,-927.07653809,5072.55126953,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(petrolcanm) (2)
    CreateDynamicObject(1672,2503.68969727,-929.25134277,5072.45019531,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(gasgrenade) (1)
    CreateDynamicObject(1672,2503.72363281,-929.36785889,5072.39990234,0.00000000,0.00000000,128.00000000, .interiorid = 1, .worldid = 6049); //object(gasgrenade) (2)
    CreateDynamicObject(2045,2503.70166016,-928.67944336,5072.31250000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_bbat_nails) (1)
    CreateDynamicObject(2045,2503.50683594,-928.66229248,5072.31250000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_bbat_nails) (2)
    CreateDynamicObject(2057,2503.43652344,-927.60394287,5072.41503906,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(flame_tins) (1)
    CreateDynamicObject(2061,2503.32006836,-928.11511230,5072.53662109,0.00000000,0.00000000,114.00000000, .interiorid = 1, .worldid = 6049); //object(cj_shells1) (1)
    CreateDynamicObject(2061,2503.57421875,-927.99218750,5072.53662109,0.00000000,0.00000000,25.99914551, .interiorid = 1, .worldid = 6049); //object(cj_shells1) (2)
    CreateDynamicObject(2037,2503.34155273,-928.91754150,5072.31689453,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_pistol_ammo) (3)
    CreateDynamicObject(2037,2503.32519531,-928.70623779,5072.31689453,0.00000000,0.00000000,26.00000000, .interiorid = 1, .worldid = 6049); //object(cj_pistol_ammo) (4)
    CreateDynamicObject(2190,2524.72167969,-944.40814209,5067.77734375,0.00000000,0.00000000,184.00000000, .interiorid = 1, .worldid = 6049); //object(pc_1) (2)
    CreateDynamicObject(14455,2526.34570312,-940.71154785,5068.64697266,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6049); //object(gs_bookcase) (2)
    CreateDynamicObject(2290,2476.52099609,-947.59014893,5065.35693359,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(swk_couch_1) (1)
    CreateDynamicObject(2290,2480.20019531,-947.62005615,5065.35693359,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(swk_couch_1) (2)
    CreateDynamicObject(16151,2487.15039062,-953.93652344,5065.69873047,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(ufo_bar) (1)
    CreateDynamicObject(1541,2485.53906250,-953.41833496,5066.50634766,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6049); //object(cj_beer_taps_1) (1)
    CreateDynamicObject(1486,2490.51049805,-953.64709473,5066.46923828,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(dyn_beer_1) (5)
    CreateDynamicObject(1486,2488.84594727,-952.90197754,5066.44921875,0.00000000,0.00000000,142.00000000, .interiorid = 1, .worldid = 6049); //object(dyn_beer_1) (6)
    CreateDynamicObject(1486,2487.35131836,-952.90679932,5066.44921875,0.00000000,0.00000000,232.00000000, .interiorid = 1, .worldid = 6049); //object(dyn_beer_1) (7)
    CreateDynamicObject(1665,2490.32983398,-953.41113281,5066.35937500,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(propashtray1) (2)
    CreateDynamicObject(1665,2487.72241211,-953.02465820,5066.35937500,0.00000000,0.00000000,106.00000000, .interiorid = 1, .worldid = 6049); //object(propashtray1) (3)
    CreateDynamicObject(14418,2555.52929688,-924.79980469,5074.52880859,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(madddoggs07) (2)
    CreateDynamicObject(2395,2517.45874023,-934.51043701,5071.24658203,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(cj_sports_wall) (2)
    CreateDynamicObject(1491,2517.58300781,-939.26562500,5071.27148438,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (4)
    CreateDynamicObject(3383,2525.45214844,-938.19531250,5072.43408203,295.99996948,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(a51_labtable1_) (1)
    CreateDynamicObject(3384,2523.85839844,-936.24407959,5072.49218750,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(a51_halbox_) (1)
    CreateDynamicObject(2957,2505.86816406,-925.84570312,5072.88964844,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(chinatgaragedoor) (3)
    CreateDynamicObject(2603,2522.91088867,-939.21136475,5071.73193359,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(police_cell_bed) (1)
    CreateDynamicObject(2603,2522.88281250,-937.61621094,5071.73193359,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(police_cell_bed) (2)
    CreateDynamicObject(2155,2523.85498047,-933.81359863,5071.27880859,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(cj_k5_low_unit4) (1)
    CreateDynamicObject(2155,2523.85595703,-934.64019775,5071.27880859,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(cj_k5_low_unit4) (2)
    CreateDynamicObject(2146,2518.28051758,-935.45251465,5071.76416016,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_trolly1) (1)
    CreateDynamicObject(2044,2523.70336914,-933.64636230,5072.35937500,0.00000000,0.00000000,234.00000000, .interiorid = 1, .worldid = 6049); //object(cj_mp5k) (6)
    CreateDynamicObject(2709,2523.81274414,-934.75433350,5072.47167969,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(pain_killer) (1)
    CreateDynamicObject(2709,2523.56860352,-934.62774658,5072.47167969,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(pain_killer) (2)
    CreateDynamicObject(2690,2523.77416992,-934.08422852,5072.69140625,0.00000000,0.00000000,304.00000000, .interiorid = 1, .worldid = 6049); //object(cj_fire_ext) (1)
    CreateDynamicObject(1893,2520.47753906,-935.54339600,5076.02441406,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(shoplight1) (1)
    CreateDynamicObject(1893,2520.36523438,-937.98834229,5076.02441406,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(shoplight1) (2)
    CreateDynamicObject(3265,2511.73754883,-932.23394775,5071.24658203,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(privatesign4) (1)
    CreateDynamicObject(3384,2518.53125000,-932.97558594,5072.57177734,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(a51_halbox_) (2)
    CreateDynamicObject(3095,2504.03857422,-931.05975342,5065.43554688,90.00000000,180.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(a51_jetdoor) (5)
    CreateDynamicObject(3095,2500.17456055,-931.08648682,5065.43554688,90.00000000,179.99450684,270.00000000, .interiorid = 1, .worldid = 6049); //object(a51_jetdoor) (6)
    CreateDynamicObject(3095,2504.60180664,-931.03839111,5065.65527344,90.00000000,180.00549316,90.00000000, .interiorid = 1, .worldid = 6049); //object(a51_jetdoor) (7)
    CreateDynamicObject(3095,2500.73608398,-931.04296875,5067.22363281,90.00000000,179.99450684,90.01101685, .interiorid = 1, .worldid = 6049); //object(a51_jetdoor) (8)
    CreateDynamicObject(14437,2502.25146484,-927.05206299,5067.34521484,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(carter-bars) (1)
    CreateDynamicObject(14437,2498.50683594,-926.86297607,5067.34521484,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(carter-bars) (2)
    CreateDynamicObject(2603,2503.42407227,-929.29302979,5065.74853516,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(police_cell_bed) (3)
    CreateDynamicObject(2603,2499.47900391,-929.17193604,5065.80322266,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(police_cell_bed) (4)
    CreateDynamicObject(2602,2497.44067383,-930.05877686,5065.87304688,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6049); //object(police_cell_toilet) (1)
    CreateDynamicObject(2602,2501.38964844,-930.06854248,5065.87353516,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 6049); //object(police_cell_toilet) (2)
    CreateDynamicObject(16378,2505.11401367,-921.68255615,5066.10400391,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(des_byofficeint) (1)
    CreateDynamicObject(2290,2497.75708008,-918.93737793,5065.35009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(swk_couch_1) (3)
    CreateDynamicObject(948,2527.69042969,-941.19335938,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(plant_pot_10) (1)
    CreateDynamicObject(948,2497.23242188,-922.03643799,5065.35009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(plant_pot_10) (1)
    CreateDynamicObject(14680,2504.96337891,-925.68188477,5068.44335938,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(int_tat_lights01) (1)
    CreateDynamicObject(1433,2498.74682617,-920.78570557,5065.52441406,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(dyn_table_1) (1)
    CreateDynamicObject(2957,2502.42382812,-918.30468750,5066.96972656,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(chinatgaragedoor) (4)
    CreateDynamicObject(1828,2503.94799805,-921.53283691,5065.35009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(man_sdr_rug) (4)
    CreateDynamicObject(1499,2496.65209961,-925.61810303,5065.35009766,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint05) (1)
    CreateDynamicObject(1499,2496.63769531,-922.62402344,5065.35009766,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint05) (2)
    CreateDynamicObject(3265,2496.55151367,-926.57006836,5065.35693359,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(privatesign4) (2)
    CreateDynamicObject(9244,2512.60009766,-912.70001221,5076.39990234,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(hrborbuild_sfn01) (1)
    CreateDynamicObject(1997,2520.16284180,-933.03344727,5071.27880859,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(hos_trolley) (1)
    CreateDynamicObject(1586,2505.14160156,-932.30712891,5072.74609375,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(tar_civ1) (1)
    CreateDynamicObject(14651,2514.35766602,-946.63085938,5069.09179688,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(trukstp05) (1)
    CreateDynamicObject(1432,2508.33837891,-946.94482422,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(dyn_table_2) (1)
    CreateDynamicObject(1432,2510.82324219,-951.10955811,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(dyn_table_2) (2)
    CreateDynamicObject(1432,2503.58544922,-949.82598877,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(dyn_table_2) (3)
    CreateDynamicObject(1432,2505.80786133,-952.78704834,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(dyn_table_2) (4)
    CreateDynamicObject(14651,2506.83959961,-942.97753906,5069.06738281,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(trukstp05) (4)
    CreateDynamicObject(2681,2502.77172852,-943.93328857,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_coin_op) (1)
    CreateDynamicObject(2779,2503.83642578,-943.91326904,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_coin_op_2) (1)
    CreateDynamicObject(1828,2478.65039062,-951.23498535,5065.35009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(man_sdr_rug) (5)
    CreateDynamicObject(2424,2508.26000977,-930.97674561,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_ff_conter_1) (1)
    CreateDynamicObject(2424,2509.18115234,-930.97766113,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_ff_conter_1) (2)
    CreateDynamicObject(2424,2510.11279297,-930.97607422,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_ff_conter_1) (3)
    CreateDynamicObject(2423,2511.01831055,-930.97564697,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_ff_conter_1b) (1)
    CreateDynamicObject(2032,2510.00903320,-927.23205566,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(med_dinning_2) (1)
    CreateDynamicObject(1739,2509.40576172,-927.26580811,5067.86816406,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6049); //object(swank_din_chair_5) (2)
    CreateDynamicObject(1739,2510.58105469,-926.44744873,5067.86816406,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(swank_din_chair_5) (3)
    CreateDynamicObject(1739,2510.48779297,-928.14038086,5067.86816406,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(swank_din_chair_5) (4)
    CreateDynamicObject(1739,2511.67382812,-927.29919434,5067.86816406,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(swank_din_chair_5) (5)
    CreateDynamicObject(1361,2475.92211914,-933.59753418,5066.09716797,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_bush_prop2) (1)
    CreateDynamicObject(1361,2495.81811523,-929.52770996,5066.09326172,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_bush_prop2) (2)
    CreateDynamicObject(1491,2460.00561523,-929.93249512,5065.35009766,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (5)
    CreateDynamicObject(1491,2472.32348633,-926.58569336,5065.35009766,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (6)
    CreateDynamicObject(1491,2472.35156250,-929.61718750,5065.35009766,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (7)
    CreateDynamicObject(1491,2456.97338867,-929.95690918,5065.35009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (8)
    CreateDynamicObject(1557,2519.90014648,-954.52532959,5066.97509766,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorext19) (6)
    CreateDynamicObject(1557,2519.89794922,-951.50402832,5066.97509766,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorext19) (7)
    CreateDynamicObject(1557,2512.75634766,-939.88317871,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorext19) (8)
    CreateDynamicObject(1557,2515.76708984,-939.88183594,5066.97509766,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorext19) (9)
    CreateDynamicObject(1491,2511.77246094,-939.91680908,5066.97509766,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (2)
    CreateDynamicObject(1491,2508.75366211,-939.93054199,5066.97509766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (2)
    CreateDynamicObject(1491,2519.86523438,-947.49279785,5067.00488281,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (2)
    CreateDynamicObject(1491,2519.90161133,-950.52288818,5067.00488281,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (2)
    CreateDynamicObject(1557,2493.69995117,-921.79998779,5065.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorext19) (11)
    CreateDynamicObject(9244,2492.25195312,-911.74328613,5070.11669922,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(hrborbuild_sfn01) (2)
    CreateDynamicObject(948,2492.81884766,-922.21185303,5065.35009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(plant_pot_10) (1)
    CreateDynamicObject(948,2496.13256836,-922.31329346,5065.35009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(plant_pot_10) (1)
    CreateDynamicObject(2011,2472.87744141,-930.33251953,5065.35400391,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(nu_plant2_ofc) (1)
    CreateDynamicObject(14395,2501.76684570,-943.27703857,5069.11523438,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(dr_gsnew11) (1)
    CreateDynamicObject(14394,2497.64794922,-951.01300049,5066.15478516,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(dr_gsnew10) (1)
    CreateDynamicObject(2232,2476.39990234,-935.70001221,5068.70019531,0.00000000,179.99450684,270.00000000, .interiorid = 1, .worldid = 6049); //object(med_speaker_4) (2)
    CreateDynamicObject(2232,2464.10009766,-949.59997559,5068.70019531,0.00000000,179.99450684,90.00000000, .interiorid = 1, .worldid = 6049); //object(med_speaker_4) (2)
    CreateDynamicObject(2232,2464.09960938,-935.59960938,5068.70019531,0.00000000,179.99450684,90.00000000, .interiorid = 1, .worldid = 6049); //object(med_speaker_4) (2)
    CreateDynamicObject(14421,2487.00000000,-928.39941406,5068.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(madddoggs10) (1)
    CreateDynamicObject(3095,2521.89990234,-927.00000000,5070.70019531,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(a51_jetdoor) (1)
    CreateDynamicObject(3095,2521.50000000,-920.40002441,5070.70019531,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(a51_jetdoor) (2)
    CreateDynamicObject(3095,2526.50000000,-920.09997559,5070.70019531,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(a51_jetdoor) (3)
    CreateDynamicObject(3095,2526.60009766,-928.70001221,5070.70019531,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(a51_jetdoor) (4)
    CreateDynamicObject(16775,2514.50000000,-925.29998779,5071.10009766,90.00000000,163.89672852,286.09777832, .interiorid = 1, .worldid = 6049); //object(door_savhangr2) (1)
    CreateDynamicObject(16775,2517.39990234,-916.79998779,5074.89990234,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(door_savhangr2) (1)
    CreateDynamicObject(16775,2523.30004883,-916.09997559,5074.89990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(door_savhangr2) (1)
    CreateDynamicObject(16775,2524.80004883,-931.40002441,5074.89990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(door_savhangr2) (1)
    CreateDynamicObject(16775,2529.69995117,-922.79998779,5074.89990234,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(door_savhangr2) (1)
    CreateDynamicObject(2957,2516.89990234,-922.00000000,5073.60009766,0.00000000,90.00000000,89.99993896, .interiorid = 1, .worldid = 6049); //object(chinatgaragedoor) (3)
    CreateDynamicObject(2957,2517.50000000,-930.29998779,5073.89990234,0.00000000,90.00000000,89.99993896, .interiorid = 1, .worldid = 6049); //object(chinatgaragedoor) (3)
    CreateDynamicObject(2951,2517.00000000,-930.59997559,5071.20019531,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(a51_labdoor) (1)
    CreateDynamicObject(2951,2517.00000000,-932.90002441,5071.20019531,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(a51_labdoor) (2)
    CreateDynamicObject(2957,2529.69995117,-929.90002441,5072.89990234,0.00000000,90.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(chinatgaragedoor) (3)
    CreateDynamicObject(2208,2522.30004883,-918.29998779,5071.29980469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(med_office7_unit_1) (1)
    CreateDynamicObject(2773,2521.50000000,-917.40002441,5071.79980469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_airprt_bar) (4)
    CreateDynamicObject(14820,2523.60009766,-918.29998779,5072.29980469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(dj_stuff) (1)
    CreateDynamicObject(2773,2525.69995117,-917.40002441,5071.79980469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_airprt_bar) (8)
    CreateDynamicObject(2232,2522.60009766,-916.09997559,5074.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(med_speaker_4) (1)
    CreateDynamicObject(2232,2524.69995117,-916.09997559,5074.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(med_speaker_4) (4)
    CreateDynamicObject(2232,2523.65991211,-916.20001221,5073.20019531,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(med_speaker_4) (5)
    CreateDynamicObject(18102,2524.50000000,-919.40002441,5076.29980469,0.00000000,0.00000000,92.00000000, .interiorid = 1, .worldid = 6049); //object(light_box1) (1)
    CreateDynamicObject(16151,2526.10009766,-930.20001221,5071.60009766,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(ufo_bar) (2)
    CreateDynamicObject(1703,2521.19995117,-930.59997559,5071.29980469,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6049); //object(kb_couch02) (3)
    CreateDynamicObject(1703,2526.89990234,-916.79998779,5071.29980469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(kb_couch02) (4)
    CreateDynamicObject(2126,2519.69995117,-929.20001221,5071.29980469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(coffee_swank_5) (1)
    CreateDynamicObject(14651,2526.80004883,-924.40002441,5073.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(trukstp05) (5)
    CreateDynamicObject(14651,2522.69995117,-924.40002441,5073.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(trukstp05) (6)
    CreateDynamicObject(1515,2518.80004883,-916.70001221,5071.29980469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(dyn_slot_prop) (1)
    CreateDynamicObject(1515,2519.60009766,-916.70001221,5071.29980469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(dyn_slot_prop) (2)
    CreateDynamicObject(1703,2518.09960938,-929.69921875,5071.29980469,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(kb_couch02) (5)
    CreateDynamicObject(14434,2519.50000000,-918.09997559,5075.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(carter-spotlight42) (1)
    CreateDynamicObject(14434,2527.30004883,-930.70001221,5075.39990234,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6049); //object(carter-spotlight42) (3)
    CreateDynamicObject(2126,2527.50000000,-919.09997559,5071.29980469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(coffee_swank_5) (2)
    CreateDynamicObject(2780,2523.19995117,-918.79998779,5066.20019531,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_smoke_mach) (1)
    CreateDynamicObject(1828,2522.19995117,-923.79998779,5071.29980469,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(man_sdr_rug) (7)
    CreateDynamicObject(1828,2526.30004883,-923.79998779,5071.29980469,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(man_sdr_rug) (8)
    CreateDynamicObject(1486,2527.80004883,-929.20001221,5072.39013672,0.00000000,0.00000000,132.00000000, .interiorid = 1, .worldid = 6049); //object(dyn_beer_1) (8)
    CreateDynamicObject(1486,2523.30004883,-929.09997559,5072.39013672,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(dyn_beer_1) (9)
    CreateDynamicObject(1486,2527.39990234,-918.29998779,5071.91992188,0.00000000,0.00000000,104.00000000, .interiorid = 1, .worldid = 6049); //object(dyn_beer_1) (12)
    CreateDynamicObject(2257,2529.50000000,-924.00000000,5073.60009766,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(frame_clip_4) (3)
    CreateDynamicObject(1491,2517.39990234,-927.25000000,5071.29980469,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (4)
    CreateDynamicObject(1491,2517.39990234,-924.21002197,5071.29980469,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6049); //object(gen_doorint01) (4)
    CreateDynamicObject(2286,2514.30004883,-922.79998779,5074.10009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(frame_5) (1)
    CreateDynamicObject(1364,2514.29980469,-923.69921875,5072.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6049); //object(cj_bush_prop) (2)
    CreateDynamicObject(16662,2484.69995117,-935.00000000,5075.39990234,64.00000000,90.00000000,269.99996948, .interiorid = 1, .worldid = 6049); //object(a51_radar_stuff) (1)
    CreateDynamicObject(16775,2511.60009766,-935.79998779,5078.89990234,0.00000000,90.00000000,89.99996948, .interiorid = 1, .worldid = 6049); //object(door_savhangr2) (1)
    CreateDynamicObject(16775,2511.60009766,-923.59997559,5078.89990234,0.00000000,90.00000000,90.00000000, .interiorid = 1, .worldid = 6049); //object(door_savhangr2) (1)

    // Nha cua biet khong
    CreateDynamicObject(3586,-277.00000000,59.39941406,904.75000000,0.00000000,0.00000000,357.98950195, .interiorid = 1, .worldid = 6298); //object(escl_la) (1)
    CreateDynamicObject(14534,-283.19921875,48.29980469,912.70001221,0.00000000,0.00000000,357.98950195, .interiorid = 1, .worldid = 6298); //object(ab_woozies01) (1)
    CreateDynamicObject(3113,-279.39941406,62.19921875,912.20001221,90.00000000,14.98535156,357.98950195, .interiorid = 1, .worldid = 6298); //object(carrier_door_sfse) (1)
    CreateDynamicObject(3113,-279.70001221,59.09999847,901.79998779,90.00000000,14.99084473,357.98950195, .interiorid = 1, .worldid = 6298); //object(carrier_door_sfse) (2)
    CreateDynamicObject(3113,-274.50000000,58.79980469,912.20001221,90.00000000,14.98535156,177.98950195, .interiorid = 1, .worldid = 6298); //object(carrier_door_sfse) (3)
    CreateDynamicObject(3113,-274.69921875,52.69921875,902.50000000,90.00000000,14.98535156,177.98950195, .interiorid = 1, .worldid = 6298); //object(carrier_door_sfse) (4)
    CreateDynamicObject(3113,-270.69921875,48.89941406,907.29998779,0.00000000,284.99633789,87.99499512, .interiorid = 1, .worldid = 6298); //object(carrier_door_sfse) (5)
    CreateDynamicObject(14614,-268.29980469,80.89941406,899.40002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(triad_main3) (1)
    CreateDynamicObject(14614,-246.29980469,80.79980469,899.40002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(triad_main3) (2)
    CreateDynamicObject(14488,-309.50000000,105.81933594,903.79901123,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(madgymroofs) (1)
    CreateDynamicObject(18036,-310.31933594,86.41113281,903.38000488,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(range_main) (1)
    CreateDynamicObject(18051,-303.89941406,128.89941406,897.40002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(range_xtras03) (1)
    CreateDynamicObject(14614,-246.30000305,110.59999847,899.40002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(triad_main3) (3)
    CreateDynamicObject(14614,-268.20001221,110.59999847,899.40002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(triad_main3) (4)
    CreateDynamicObject(14537,-277.09960938,112.69921875,903.32202148,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(pdomesbar) (1)
    CreateDynamicObject(2885,-284.10937500,66.09960938,908.09997559,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (1)
    CreateDynamicObject(2885,-293.79998779,66.09999847,908.09997559,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (2)
    CreateDynamicObject(2885,-298.54998779,74.22000122,908.09997559,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (3)
    CreateDynamicObject(2885,-298.54980469,86.64941406,908.09997559,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (4)
    CreateDynamicObject(1502,-298.39999390,79.66000366,901.38000488,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(gen_doorint04) (1)
    CreateDynamicObject(2885,-298.54980469,83.29980469,910.59997559,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (5)
    CreateDynamicObject(2885,-295.39941406,69.79980469,908.09997559,0.00000000,0.00000000,315.98876953, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (6)
    CreateDynamicObject(2885,-269.50000000,66.09960938,908.09997559,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (7)
    CreateDynamicObject(2885,-298.54998779,107.09999847,908.09997559,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (8)
    CreateDynamicObject(2885,-298.54998779,119.52999878,908.09997559,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (9)
    CreateDynamicObject(2885,-296.00000000,121.39941406,908.09997559,0.00000000,0.00000000,225.99426270, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (10)
    CreateDynamicObject(2885,-286.84960938,125.21972656,908.09997559,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (11)
    CreateDynamicObject(2885,-279.82647705,133.78889465,908.04156494,0.00000000,0.00000000,179.98352051, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (12)
    CreateDynamicObject(2885,-262.79980469,125.21972656,908.09997559,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (13)
    CreateDynamicObject(2885,-259.29980469,122.19921875,908.09997559,0.00000000,0.00000000,141.99276733, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (14)
    CreateDynamicObject(2885,-255.35546875,120.75976562,908.00000000,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (15)
    CreateDynamicObject(2885,-255.16894531,107.85700226,908.00000000,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (16)
    CreateDynamicObject(2885,-255.16900635,97.50000000,908.00000000,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (17)
    CreateDynamicObject(2885,-255.16453552,87.34893799,908.00000000,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (18)
    CreateDynamicObject(2885,-255.16781616,74.42214966,908.09997559,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (19)
    CreateDynamicObject(2885,-260.00000000,68.39941406,908.09997559,0.00000000,0.00000000,27.98767090, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (20)
    CreateDynamicObject(14389,-276.19921875,86.50000000,904.90002441,0.00000000,0.00000000,271.99951172, .interiorid = 1, .worldid = 6298); //object(madddoggs03) (1)
    CreateDynamicObject(1608,-236.50000000,63.00000000,900.70001221,0.00000000,0.00000000,161.99890137, .interiorid = 1, .worldid = 6298); //object(shark) (1)
    CreateDynamicObject(10444,-237.39941406,58.59960938,901.50000000,0.00000000,0.00000000,181.99401855, .interiorid = 1, .worldid = 6298); //object(poolwater_sfs) (1)
    CreateDynamicObject(14614,-225.85363770,88.59999084,899.40002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(triad_main3) (5)
    CreateDynamicObject(2885,-244.51344299,82.09609222,908.00000000,0.00000000,0.00000000,179.98352051, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (21)
    CreateDynamicObject(2885,-249.88836670,82.09936523,908.09997559,0.00000000,0.00000000,179.98352051, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (22)
    CreateDynamicObject(2885,-244.45429993,79.70652008,908.00000000,0.00000000,0.00000000,359.97802734, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (23)
    CreateDynamicObject(2885,-249.92022705,79.68969727,908.00000000,0.00000000,0.00000000,359.97802734, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (24)
    CreateDynamicObject(2634,-238.89999390,76.90000153,902.79998779,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6298); //object(ab_vaultdoor) (1)
    CreateDynamicObject(9833,-238.39999390,87.40000153,898.70001221,0.00000000,0.00000000,350.00000000, .interiorid = 1, .worldid = 6298); //object(fountain_sfw) (1)
    CreateDynamicObject(11102,-236.89999390,94.40000153,902.29998779,0.00000000,0.00000000,2.00000000, .interiorid = 1, .worldid = 6298); //object(burgalrydoor_sfs) (1)
    CreateDynamicObject(5156,-271.00000000,130.89941406,901.20001221,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(dk_cargoshp24d) (1)
    CreateDynamicObject(5156,-268.69921875,98.19921875,901.20001221,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(dk_cargoshp24d) (2)
    CreateDynamicObject(2885,-298.54998779,96.19921875,908.09997559,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (25)
    CreateDynamicObject(14780,-303.89999390,106.09999847,902.20001221,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(in_bxing04) (1)
    CreateDynamicObject(14420,-251.32910156,126.92968750,904.59997559,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(madddoggs09) (1)
    CreateDynamicObject(1504,-289.50000000,54.68999863,913.29998779,0.00000000,0.00000000,359.00000000, .interiorid = 1, .worldid = 6298); //object(gen_doorext06) (1)
    CreateDynamicObject(3461,-272.39999390,108.19999695,901.90002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(tikitorch01_lvs) (1)
    CreateDynamicObject(3461,-281.79998779,108.09999847,901.90002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(tikitorch01_lvs) (2)
    CreateDynamicObject(5156,-268.19921875,89.19921875,901.20001221,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(dk_cargoshp24d) (3)
    CreateDynamicObject(3461,-281.70001221,117.30000305,901.90002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(tikitorch01_lvs) (3)
    CreateDynamicObject(3461,-272.60000610,117.40000153,901.90002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(tikitorch01_lvs) (4)
    CreateDynamicObject(3440,-281.50000000,125.10099792,903.29998779,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(arptpillar01_lvs) (1)
    CreateDynamicObject(3440,-278.20001221,125.09999847,903.29998779,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(arptpillar01_lvs) (2)
    CreateDynamicObject(2885,-298.52441406,118.00000000,910.53002930,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (26)
    CreateDynamicObject(1502,-298.39999390,112.52999878,901.29998779,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(gen_doorint04) (2)
    CreateDynamicObject(3409,-234.50000000,93.19999695,901.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(grassplant) (1)
    CreateDynamicObject(2063,-302.39999390,78.59999847,902.29998779,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6298); //object(cj_greenshelves) (1)
    CreateDynamicObject(964,-300.20001221,78.00000000,902.00000000,90.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6298); //object(cj_metal_crate) (1)
    CreateDynamicObject(2359,-300.20001221,78.50000000,902.90002441,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6298); //object(ammo_box_c5) (1)
    CreateDynamicObject(3496,-320.44000244,106.09999847,901.40002441,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6298); //object(vgsxrefbballnet) (1)
    CreateDynamicObject(14782,-304.89999390,115.69999695,902.40002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(int3int_boxing30) (1)
    CreateDynamicObject(2627,-305.00000000,98.69999695,901.40002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(gym_treadmill) (1)
    CreateDynamicObject(2627,-307.79998779,98.69999695,901.40002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(gym_treadmill) (2)
    CreateDynamicObject(2627,-310.50000000,98.69999695,901.40002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(gym_treadmill) (3)
    CreateDynamicObject(2628,-313.20001221,98.69999695,901.40002441,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6298); //object(gym_bench2) (1)
    CreateDynamicObject(2629,-316.10000610,98.80000305,901.40002441,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6298); //object(gym_bench1) (1)
    CreateDynamicObject(2630,-318.50000000,98.69999695,901.40002441,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6298); //object(gym_bike) (1)
    CreateDynamicObject(1985,-313.44439697,115.59999847,904.29998779,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(punchbagnu) (1)
    CreateDynamicObject(2957,-274.79998779,50.50000000,910.09997559,0.00000000,90.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(chinatgaragedoor) (1)
    CreateDynamicObject(2957,-279.59960938,50.69921875,910.09997559,0.00000000,90.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(chinatgaragedoor) (2)
    CreateDynamicObject(14391,-297.29980469,95.69921875,902.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(dr_gsnew07) (1)
    CreateDynamicObject(18070,-293.69921875,95.69921875,901.79998779,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(gap_counter) (1)
    CreateDynamicObject(1472,-295.50000000,92.40000153,901.70001221,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(dyn_porch_1) (1)
    CreateDynamicObject(1472,-295.39999390,93.80000305,901.70001221,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6298); //object(dyn_porch_1) (2)
    CreateDynamicObject(14820,-291.89999390,95.80000305,902.40002441,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(dj_stuff) (1)
    CreateDynamicObject(2190,-291.70001221,97.19999695,902.29998779,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6298); //object(pc_1) (1)
    CreateDynamicObject(2229,-291.73001099,92.90000153,901.59997559,0.00000000,90.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(swank_speaker) (1)
    CreateDynamicObject(2229,-291.79998779,95.19999695,901.59997559,0.00000000,90.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(swank_speaker) (2)
    CreateDynamicObject(2229,-291.73001099,97.40000153,901.59997559,0.00000000,90.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(swank_speaker) (3)
    CreateDynamicObject(18102,-292.31018066,92.81568909,907.95001221,0.00000000,0.00000000,272.00000000, .interiorid = 1, .worldid = 6298); //object(light_box1) (1)
    CreateDynamicObject(2885,-255.16894531,118.09960938,910.46771240,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (27)
    CreateDynamicObject(3111,-281.82000732,129.89999390,903.88000488,90.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(st_arch_plan) (1)
    CreateDynamicObject(3440,-278.20001221,125.09999847,907.79998779,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(arptpillar01_lvs) (3)
    CreateDynamicObject(3440,-281.50000000,125.09960938,907.59997559,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(arptpillar01_lvs) (4)
    CreateDynamicObject(2885,-265.80722046,134.13438416,908.09997559,0.00000000,0.00000000,89.98352051, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (28)
    CreateDynamicObject(2885,-270.62109375,133.77246094,908.09997559,0.00000000,0.00000000,179.98352051, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (29)
    CreateDynamicObject(2885,-282.03417969,130.82714844,908.04156494,0.00000000,0.00000000,269.97802734, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (30)
    CreateDynamicObject(2885,-272.85253906,125.21875000,908.09997559,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (31)
    CreateDynamicObject(14826,-378.71411133,33.45219803,903.10400391,0.00000000,0.00000000,68.00000000, .interiorid = 1, .worldid = 6298); //object(int_kbsgarage2) (1)
    CreateDynamicObject(10010,-354.23144531,22.03808594,902.98095703,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(ugcarpark_sfe) (1)
    CreateDynamicObject(1753,-265.00000000,119.50000000,901.59997559,0.00000000,0.00000000,86.00000000, .interiorid = 1, .worldid = 6298); //object(swank_couch_1) (1)
    CreateDynamicObject(1753,-292.20001221,116.00000000,901.29998779,0.00000000,0.00000000,182.00000000, .interiorid = 1, .worldid = 6298); //object(swank_couch_1) (2)
    CreateDynamicObject(1753,-290.10000610,121.30000305,901.29998779,0.00000000,0.00000000,271.99401855, .interiorid = 1, .worldid = 6298); //object(swank_couch_1) (3)
    CreateDynamicObject(1671,-274.29998779,130.69999695,901.79998779,0.00000000,0.00000000,358.00000000, .interiorid = 1, .worldid = 6298); //object(swivelchair_a) (1)
    CreateDynamicObject(1753,-281.19921875,128.79980469,901.34997559,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(swank_couch_1) (4)
    CreateDynamicObject(9831,-276.89999390,78.59999847,886.70001221,275.99853516,0.00000000,187.98950195, .interiorid = 1, .worldid = 6298); //object(sfw_waterfall) (1)
    CreateDynamicObject(9831,-277.00000000,74.79980469,886.70001221,275.99304199,0.00000000,3.98205566, .interiorid = 1, .worldid = 6298); //object(sfw_waterfall) (2)
    CreateDynamicObject(1846,-295.89941406,122.29980469,905.29998779,90.00000000,0.00000000,45.99975586, .interiorid = 1, .worldid = 6298); //object(shop_shelf04) (1)
    CreateDynamicObject(1753,-259.00000000,116.19999695,901.59997559,0.00000000,0.00000000,181.99548340, .interiorid = 1, .worldid = 6298); //object(swank_couch_1) (5)
    CreateDynamicObject(7301,-254.94874573,97.19350433,904.59997559,0.00000000,0.00000000,45.99975586, .interiorid = 1, .worldid = 6298); //object(vgsn_addboard03) (1)
    CreateDynamicObject(14637,-297.50000000,95.59999847,905.40002441,0.00000000,0.00000000,2.00000000, .interiorid = 1, .worldid = 6298); //object(triad_dragon) (1)
    CreateDynamicObject(2350,-282.50000000,116.40000153,901.70001221,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(cj_barstool_2) (1)
    CreateDynamicObject(2350,-282.60000610,114.90000153,901.70001221,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(cj_barstool_2) (2)
    CreateDynamicObject(2350,-282.50000000,110.40000153,901.70001221,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(cj_barstool_2) (3)
    CreateDynamicObject(2350,-279.29998779,107.30000305,901.70001221,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(cj_barstool_2) (4)
    CreateDynamicObject(2350,-280.60000610,107.19999695,901.70001221,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(cj_barstool_2) (5)
    CreateDynamicObject(2350,-274.29998779,107.09999847,901.70001221,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(cj_barstool_2) (6)
    CreateDynamicObject(2350,-271.20001221,109.50000000,901.70001221,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(cj_barstool_2) (7)
    CreateDynamicObject(2350,-271.20001221,115.69999695,901.70001221,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(cj_barstool_2) (8)
    CreateDynamicObject(2350,-273.50000000,118.19999695,901.70001221,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(cj_barstool_2) (9)
    CreateDynamicObject(2350,-279.70001221,117.90000153,901.70001221,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(cj_barstool_2) (10)
    CreateDynamicObject(2350,-279.69921875,117.89941406,901.70001221,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(cj_barstool_2) (11)
    CreateDynamicObject(2799,-282.29998779,102.40000153,901.79998779,0.00000000,0.00000000,26.00000000, .interiorid = 1, .worldid = 6298); //object(castable2) (1)
    CreateDynamicObject(2799,-271.50000000,102.09999847,901.79998779,0.00000000,0.00000000,32.00000000, .interiorid = 1, .worldid = 6298); //object(castable2) (2)
    CreateDynamicObject(2802,-279.10000610,102.30000305,901.70001221,0.00000000,0.00000000,282.00000000, .interiorid = 1, .worldid = 6298); //object(castable1) (1)
    CreateDynamicObject(2802,-275.10000610,102.19999695,901.70001221,0.00000000,0.00000000,272.00000000, .interiorid = 1, .worldid = 6298); //object(castable1) (2)
    CreateDynamicObject(2964,-260.10000610,102.40000153,901.29998779,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(k_pooltablesm) (1)
    CreateDynamicObject(2964,-260.20001221,97.40000153,901.29998779,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(k_pooltablesm) (2)
    CreateDynamicObject(2964,-265.50000000,97.19999695,901.29998779,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(k_pooltablesm) (3)
    CreateDynamicObject(2964,-265.29998779,102.09999847,901.29998779,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(k_pooltablesm) (4)
    CreateDynamicObject(14629,-271.19921875,75.89941406,906.75000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(mafcas_chande) (1)
    CreateDynamicObject(2412,-274.70001221,66.80000305,901.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(cj_detector) (1)
    CreateDynamicObject(2412,-278.29998779,66.90000153,901.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(cj_detector) (2)
    CreateDynamicObject(1824,-260.10000610,91.80000305,901.79998779,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(craps_table) (1)
    CreateDynamicObject(1824,-259.93676758,87.04775238,901.79998779,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(craps_table) (2)
    CreateDynamicObject(1846,-259.10000610,122.90000153,905.29998779,90.00000000,0.00000000,323.99975586, .interiorid = 1, .worldid = 6298); //object(shop_shelf04) (2)
    CreateDynamicObject(3439,-297.60000610,118.30000305,903.40002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(aprtree01_lvs) (1)
    CreateDynamicObject(3439,-291.89999390,124.40000153,903.40002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(aprtree01_lvs) (2)
    CreateDynamicObject(3439,-255.60000610,118.69999695,903.40002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(aprtree01_lvs) (3)
    CreateDynamicObject(3439,-263.70001221,124.90000153,903.40002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(aprtree01_lvs) (4)
    CreateDynamicObject(2229,-260.39999390,123.30000305,904.70001221,0.00000000,0.00000000,322.00000000, .interiorid = 1, .worldid = 6298); //object(swank_speaker) (4)
    CreateDynamicObject(2229,-257.89999390,121.19999695,904.70001221,0.00000000,0.00000000,321.99829102, .interiorid = 1, .worldid = 6298); //object(swank_speaker) (5)
    CreateDynamicObject(2229,-296.70001221,121.00000000,904.70001221,0.00000000,0.00000000,52.00000000, .interiorid = 1, .worldid = 6298); //object(swank_speaker) (6)
    CreateDynamicObject(2229,-294.20001221,123.50000000,904.70001221,0.00000000,0.00000000,46.00000000, .interiorid = 1, .worldid = 6298); //object(swank_speaker) (7)
    CreateDynamicObject(5156,-266.00000000,80.39941406,901.20001221,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(dk_cargoshp24d) (4)
    CreateDynamicObject(2051,-323.29998779,81.09999847,903.20001221,0.00000000,0.00000000,98.00000000, .interiorid = 1, .worldid = 6298); //object(cj_target4) (1)
    CreateDynamicObject(2051,-323.70001221,84.90000153,903.20001221,0.00000000,0.00000000,97.99804688, .interiorid = 1, .worldid = 6298); //object(cj_target4) (2)
    CreateDynamicObject(2051,-323.60000610,87.59999847,903.20001221,0.00000000,0.00000000,97.99804688, .interiorid = 1, .worldid = 6298); //object(cj_target4) (3)
    CreateDynamicObject(2051,-323.39999390,91.09999847,903.20001221,0.00000000,0.00000000,97.99804688, .interiorid = 1, .worldid = 6298); //object(cj_target4) (4)
    CreateDynamicObject(2912,-317.20001221,83.80000305,901.40002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(temp_crate1) (1)
    CreateDynamicObject(2912,-312.00000000,87.59999847,901.40002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(temp_crate1) (2)
    CreateDynamicObject(2912,-318.10000610,91.59999847,901.40002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(temp_crate1) (3)
    CreateDynamicObject(2912,-315.60000610,80.19999695,901.40002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(temp_crate1) (4)
    CreateDynamicObject(2912,-310.39999390,84.19999695,901.40002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(temp_crate1) (5)
    CreateDynamicObject(2912,-309.70001221,92.09999847,901.40002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(temp_crate1) (6)
    CreateDynamicObject(2912,-320.10000610,88.00000000,901.40002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(temp_crate1) (7)
    CreateDynamicObject(2912,-320.50000000,81.40000153,901.40002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(temp_crate1) (8)
    CreateDynamicObject(2912,-309.60000610,80.80000305,901.40002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(temp_crate1) (9)
    CreateDynamicObject(2063,-299.39999390,85.59999847,902.29998779,0.00000000,0.00000000,272.00000000, .interiorid = 1, .worldid = 6298); //object(cj_greenshelves) (2)
    CreateDynamicObject(2509,-298.89941406,90.50000000,903.09997559,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6298); //object(cj_hobby_shelf_6) (1)
    CreateDynamicObject(2509,-298.89999390,89.30000305,903.09997559,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6298); //object(cj_hobby_shelf_6) (2)
    CreateDynamicObject(2509,-298.89999390,88.30000305,903.09997559,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6298); //object(cj_hobby_shelf_6) (3)
    CreateDynamicObject(1255,-246.19999695,57.00000000,902.20001221,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(lounger) (1)
    CreateDynamicObject(1255,-246.39999390,59.50000000,902.20001221,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(lounger) (2)
    CreateDynamicObject(1255,-246.39999390,66.00000000,902.20001221,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(lounger) (3)
    CreateDynamicObject(1255,-246.39999390,69.00000000,902.20001221,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(lounger) (4)
    CreateDynamicObject(646,-246.19999695,51.40000153,903.09997559,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(veg_palmkb14) (1)
    CreateDynamicObject(646,-246.80000305,73.40000153,903.09997559,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(veg_palmkb14) (2)
    CreateDynamicObject(646,-236.60000610,74.30000305,903.09997559,0.00000000,0.00000000,316.00000000, .interiorid = 1, .worldid = 6298); //object(veg_palmkb14) (3)
    CreateDynamicObject(646,-229.89999390,74.09999847,903.09997559,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(veg_palmkb14) (4)
    CreateDynamicObject(639,-227.30000305,67.30000305,906.40002441,0.00000000,0.00000000,2.00000000, .interiorid = 1, .worldid = 6298); //object(veg_ivy_balcny_kb3) (1)
    CreateDynamicObject(639,-227.00000000,59.09999847,906.40002441,0.00000000,0.00000000,1.99951172, .interiorid = 1, .worldid = 6298); //object(veg_ivy_balcny_kb3) (2)
    CreateDynamicObject(639,-235.19999695,50.79999924,906.40002441,0.00000000,0.00000000,273.99951172, .interiorid = 1, .worldid = 6298); //object(veg_ivy_balcny_kb3) (3)
    CreateDynamicObject(639,-247.50000000,58.40000153,905.70001221,0.00000000,0.00000000,181.99902344, .interiorid = 1, .worldid = 6298); //object(veg_ivy_balcny_kb3) (4)
    CreateDynamicObject(639,-247.69999695,67.59999847,905.70001221,0.00000000,0.00000000,181.99401855, .interiorid = 1, .worldid = 6298); //object(veg_ivy_balcny_kb3) (5)
    CreateDynamicObject(639,-239.10000610,74.50000000,907.00000000,0.00000000,0.00000000,93.99401855, .interiorid = 1, .worldid = 6298); //object(veg_ivy_balcny_kb3) (6)
    CreateDynamicObject(970,-239.60000610,70.59999847,902.20001221,0.00000000,0.00000000,4.00000000, .interiorid = 1, .worldid = 6298); //object(fencesmallb) (1)
    CreateDynamicObject(970,-234.80000305,70.80000305,902.20001221,0.00000000,0.00000000,2.00000000, .interiorid = 1, .worldid = 6298); //object(fencesmallb) (2)
    CreateDynamicObject(970,-232.10000610,68.40000153,902.20001221,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6298); //object(fencesmallb) (3)
    CreateDynamicObject(970,-232.10000610,64.59999847,902.20001221,0.00000000,0.00000000,271.99499512, .interiorid = 1, .worldid = 6298); //object(fencesmallb) (4)
    CreateDynamicObject(970,-231.69999695,60.59999847,902.20001221,0.00000000,0.00000000,271.99401855, .interiorid = 1, .worldid = 6298); //object(fencesmallb) (5)
    CreateDynamicObject(970,-231.60000610,56.90000153,902.20001221,0.00000000,0.00000000,271.99401855, .interiorid = 1, .worldid = 6298); //object(fencesmallb) (6)
    CreateDynamicObject(970,-235.60000610,54.79999924,902.00000000,0.00000000,0.00000000,181.99401855, .interiorid = 1, .worldid = 6298); //object(fencesmallb) (7)
    CreateDynamicObject(970,-240.10000610,54.59999847,902.00000000,0.00000000,0.00000000,179.98901367, .interiorid = 1, .worldid = 6298); //object(fencesmallb) (8)
    CreateDynamicObject(970,-242.30000305,56.90000153,902.20001221,0.00000000,0.00000000,271.99401855, .interiorid = 1, .worldid = 6298); //object(fencesmallb) (9)
    CreateDynamicObject(970,-242.50000000,60.70000076,902.20001221,0.00000000,0.00000000,273.99401855, .interiorid = 1, .worldid = 6298); //object(fencesmallb) (10)
    CreateDynamicObject(970,-242.69999695,64.90000153,902.20001221,0.00000000,0.00000000,271.99401855, .interiorid = 1, .worldid = 6298); //object(fencesmallb) (11)
    CreateDynamicObject(970,-242.80000305,68.30000305,902.20001221,0.00000000,0.00000000,271.99401855, .interiorid = 1, .worldid = 6298); //object(fencesmallb) (12)
    CreateDynamicObject(646,-227.19999695,51.70000076,903.09997559,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(veg_palmkb14) (5)
    CreateDynamicObject(3857,-310.50000000,61.59999847,862.70001221,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(ottosmash3) (1)
    CreateDynamicObject(3409,-232.00000000,93.09999847,901.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(grassplant) (2)
    CreateDynamicObject(3409,-233.19999695,89.69999695,901.50000000,0.00000000,0.00000000,2.00000000, .interiorid = 1, .worldid = 6298); //object(grassplant) (3)
    CreateDynamicObject(3409,-233.10000610,86.69999695,901.50000000,0.00000000,0.00000000,1.99951172, .interiorid = 1, .worldid = 6298); //object(grassplant) (4)
    CreateDynamicObject(1687,-229.69999695,94.09999847,902.50000000,0.00000000,0.00000000,272.00000000, .interiorid = 1, .worldid = 6298); //object(gen_roofbit1) (1)
    CreateDynamicObject(2653,-235.10000610,89.50000000,906.29998779,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6298); //object(cj_aircon3) (1)
    CreateDynamicObject(2653,-235.00000000,85.69999695,906.29998779,0.00000000,0.00000000,272.00000000, .interiorid = 1, .worldid = 6298); //object(cj_aircon3) (2)
    CreateDynamicObject(3383,-231.10000610,89.80000305,900.50000000,0.00000000,0.00000000,94.00000000, .interiorid = 1, .worldid = 6298); //object(a51_labtable1_) (1)
    CreateDynamicObject(3383,-230.89999390,86.00000000,900.50000000,0.00000000,0.00000000,93.99902344, .interiorid = 1, .worldid = 6298); //object(a51_labtable1_) (2)
    CreateDynamicObject(3383,-235.69999695,84.50000000,900.50000000,0.00000000,0.00000000,271.99902344, .interiorid = 1, .worldid = 6298); //object(a51_labtable1_) (3)
    CreateDynamicObject(3383,-235.69999695,88.30000305,900.50000000,0.00000000,0.00000000,271.99401855, .interiorid = 1, .worldid = 6298); //object(a51_labtable1_) (4)
    CreateDynamicObject(3383,-234.50000000,95.00000000,900.50000000,0.00000000,0.00000000,181.99401855, .interiorid = 1, .worldid = 6298); //object(a51_labtable1_) (5)
    CreateDynamicObject(3384,-228.69999695,82.69999695,902.90002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(a51_halbox_) (1)
    CreateDynamicObject(3384,-228.30000305,75.69999695,902.90002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(a51_halbox_) (2)
    CreateDynamicObject(2287,-236.50000000,75.59999847,903.59997559,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 6298); //object(frame_4) (1)
    CreateDynamicObject(2267,-228.00000000,79.59999847,904.90002441,0.00000000,0.00000000,272.00000000, .interiorid = 1, .worldid = 6298); //object(frame_wood_3) (1)
    CreateDynamicObject(1594,-241.30000305,73.50000000,902.09997559,0.00000000,0.00000000,2.00000000, .interiorid = 1, .worldid = 6298); //object(chairsntable) (1)
    CreateDynamicObject(1846,-278.29998779,55.09999847,915.90002441,90.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(shop_shelf04) (3)
    CreateDynamicObject(2229,-279.83160400,54.56658173,915.29998779,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(swank_speaker) (8)
    CreateDynamicObject(2229,-276.25000000,54.50171280,915.29998779,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(swank_speaker) (9)
    CreateDynamicObject(2020,-284.29980469,49.00000000,913.29998779,0.00000000,0.00000000,177.98950195, .interiorid = 1, .worldid = 6298); //object(mrk_sidebrd1) (1)
    CreateDynamicObject(2312,-284.79998779,48.29999924,913.70001221,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(cj_tele_2) (1)
    CreateDynamicObject(1713,-286.60000610,51.40000153,913.29998779,0.00000000,0.00000000,88.00000000, .interiorid = 1, .worldid = 6298); //object(kb_couch04) (1)
    CreateDynamicObject(1713,-285.20001221,54.20000076,913.29998779,0.00000000,0.00000000,359.99499512, .interiorid = 1, .worldid = 6298); //object(kb_couch04) (2)
    CreateDynamicObject(1815,-284.89999390,51.40000153,913.29998779,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(coffee_low_2) (1)
    CreateDynamicObject(2252,-284.29998779,51.90000153,914.09997559,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(plant_pot_21) (1)
    CreateDynamicObject(2265,-286.60000610,52.20000076,915.09997559,0.00000000,0.00000000,88.00000000, .interiorid = 1, .worldid = 6298); //object(frame_slim_6) (1)
    CreateDynamicObject(2094,-278.79998779,52.90000153,913.29998779,0.00000000,0.00000000,358.00000000, .interiorid = 1, .worldid = 6298); //object(swank_cabinet_4) (1)
    CreateDynamicObject(14446,-278.89999390,45.29999924,913.90002441,0.00000000,0.00000000,178.00000000, .interiorid = 1, .worldid = 6298); //object(smokes_bed) (1)
    CreateDynamicObject(2261,-279.20001221,44.20000076,915.50000000,0.00000000,0.00000000,176.00000000, .interiorid = 1, .worldid = 6298); //object(frame_slim_2) (1)
    CreateDynamicObject(15036,-285.59960938,53.00000000,909.15002441,0.00000000,0.00000000,177.98950195, .interiorid = 1, .worldid = 6298); //object(kit_cab_washin_sv) (1)
    CreateDynamicObject(3115,-372.45117188,36.21093750,910.51318359,270.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(carrier_lift1_sfse) (1)
    CreateDynamicObject(3115,-372.29833984,16.21318054,910.51318359,270.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(carrier_lift1_sfse) (2)
    CreateDynamicObject(3115,-372.38610840,-3.81189203,910.51318359,270.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(carrier_lift1_sfse) (3)
    CreateDynamicObject(2885,-387.67498779,55.69152832,909.92626953,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (32)
    CreateDynamicObject(2885,-387.67480469,55.69140625,910.92626953,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (33)
    CreateDynamicObject(18032,-301.57217407,88.76255035,902.88781738,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(range_xtras2) (1)
    CreateDynamicObject(1544,-309.52026367,80.79433441,902.10003662,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(cj_beer_b_1) (1)
    CreateDynamicObject(1544,-315.54669189,80.18289185,902.10003662,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(cj_beer_b_1) (2)
    CreateDynamicObject(1544,-320.33609009,81.35153198,902.10003662,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(cj_beer_b_1) (3)
    CreateDynamicObject(1544,-317.18975830,83.87078857,902.10003662,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(cj_beer_b_1) (4)
    CreateDynamicObject(1544,-320.07836914,88.07177734,902.10003662,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(cj_beer_b_1) (5)
    CreateDynamicObject(1544,-318.18191528,91.45755005,902.10003662,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(cj_beer_b_1) (6)
    CreateDynamicObject(1544,-311.99597168,87.74271393,902.10003662,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(cj_beer_b_1) (7)
    CreateDynamicObject(1544,-310.40539551,84.38292694,902.10003662,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(cj_beer_b_1) (8)
    CreateDynamicObject(1544,-309.68966675,92.03491974,902.10003662,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(cj_beer_b_1) (9)
    CreateDynamicObject(3065,-315.44302368,107.24717712,901.51934814,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(bball_col) (1)
    CreateDynamicObject(1649,-265.91476440,127.57136536,902.32568359,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6298); //object(wglasssmash) (1)
    CreateDynamicObject(2885,-264.41253662,130.31341553,908.00000000,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (34)
    CreateDynamicObject(2885,-260.59509277,129.37445068,908.00000000,0.00000000,0.00000000,186.00000000, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (35)
    CreateDynamicObject(2885,-260.44000244,125.34246063,908.00000000,0.00000000,0.00000000,359.99853516, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (36)
    CreateDynamicObject(1605,-264.65859985,129.18133545,902.66204834,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(fish1s) (1)
    CreateDynamicObject(1606,-263.62487793,129.70062256,902.10217285,0.00000000,0.00000000,358.00000000, .interiorid = 1, .worldid = 6298); //object(fish2s) (1)
    CreateDynamicObject(2782,-265.09204102,127.68979645,901.57592773,0.00000000,0.00000000,278.00000000, .interiorid = 1, .worldid = 6298); //object(cj_oyster_2) (1)
    CreateDynamicObject(1461,-266.26788330,129.16546631,902.07623291,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6298); //object(dyn_life_p) (1)
    CreateDynamicObject(1601,-264.91806030,127.12606049,902.78649902,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(fish3s) (1)
    CreateDynamicObject(1611,-265.40017700,126.18744659,901.32641602,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(sandcastle2) (1)
    CreateDynamicObject(1610,-265.20846558,126.89032745,901.32617188,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(sandcastle1) (1)
    CreateDynamicObject(1708,-276.53421021,127.88059235,901.32348633,0.00000000,0.00000000,128.00000000, .interiorid = 1, .worldid = 6298); //object(kb_chair02) (1)
    CreateDynamicObject(1708,-272.27499390,128.57472229,901.32348633,0.00000000,0.00000000,209.99621582, .interiorid = 1, .worldid = 6298); //object(kb_chair02) (2)
    CreateDynamicObject(4729,-266.67166138,135.78694153,904.07769775,0.00000000,0.00000000,19.99511719, .interiorid = 1, .worldid = 6298); //object(billbrdlan2_01) (1)
    CreateDynamicObject(3525,-284.65429688,47.49785233,913.54376221,0.00000000,90.00000000,87.98950195, .interiorid = 1, .worldid = 6298); //object(exbrtorch01) (1)
    CreateDynamicObject(1719,-278.75570679,54.10120010,914.33300781,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(low_console) (1)
    CreateDynamicObject(2573,-276.44250488,49.52050781,913.29376221,0.00000000,0.00000000,268.00000000, .interiorid = 1, .worldid = 6298); //object(hotel_dresser_6) (1)
    CreateDynamicObject(2204,-280.68457031,50.53417969,908.05999756,0.00000000,0.00000000,357.99499512, .interiorid = 1, .worldid = 6298); //object(med_office8_cabinet) (1)
    CreateDynamicObject(14815,-239.81250000,112.98828125,903.09051514,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 6298); //object(whhouse_main) (1)
    CreateDynamicObject(2957,-279.49005127,52.33350372,910.09997559,0.00000000,90.00000000,268.00000000, .interiorid = 1, .worldid = 6298); //object(chinatgaragedoor) (3)
    CreateDynamicObject(15037,-287.36132812,51.30468750,908.57501221,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(med_dinning_2_sv) (1)
    CreateDynamicObject(14455,-280.18127441,45.12102890,909.49957275,0.00000000,0.00000000,358.00000000, .interiorid = 1, .worldid = 6298); //object(gs_bookcase) (1)
    CreateDynamicObject(2608,-282.22790527,50.44407272,908.76000977,0.00000000,0.00000000,358.00000000, .interiorid = 1, .worldid = 6298); //object(polce_shelf) (1)
    CreateDynamicObject(5156,-265.74023438,83.13671875,907.70001221,179.99450684,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(dk_cargoshp24d) (5)
    CreateDynamicObject(5156,-265.41241455,115.88471985,907.70001221,179.99450684,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(dk_cargoshp24d) (6)
    CreateDynamicObject(3440,-255.14367676,79.83738708,903.33544922,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(arptpillar01_lvs) (5)
    CreateDynamicObject(3440,-255.14355469,79.83691406,907.08544922,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(arptpillar01_lvs) (6)
    CreateDynamicObject(3440,-255.11853027,81.83673096,907.08544922,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(arptpillar01_lvs) (7)
    CreateDynamicObject(3440,-255.11816406,81.83593750,903.08544922,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(arptpillar01_lvs) (8)
    CreateDynamicObject(2207,-275.18542480,129.07887268,901.32403564,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(med_office7_desk_1) (1)
    CreateDynamicObject(2035,-299.00000000,88.48000336,903.59173584,90.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6298); //object(cj_m16) (1)
    CreateDynamicObject(2035,-299.00000000,88.48046875,903.09173584,90.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6298); //object(cj_m16) (2)
    CreateDynamicObject(2035,-299.00000000,89.72432709,903.09173584,90.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6298); //object(cj_m16) (3)
    CreateDynamicObject(2035,-299.00000000,89.72363281,903.59173584,90.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6298); //object(cj_m16) (4)
    CreateDynamicObject(2615,-298.06491089,80.50357056,904.66790771,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(police_nb3) (1)
    CreateDynamicObject(2885,-255.56509399,115.49990082,905.50000000,0.00000000,90.00000000,180.00000000, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (37)
    CreateDynamicObject(2885,-248.50000000,113.12708282,905.50000000,0.00000000,90.00000000,359.99450684, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (38)
    CreateDynamicObject(3113,-248.25135803,100.37225342,901.33728027,0.00000000,15.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(carrier_door_sfse) (6)
    CreateDynamicObject(3113,-238.09138489,112.83496857,901.33728027,0.00000000,14.99633789,0.00000000, .interiorid = 1, .worldid = 6298); //object(carrier_door_sfse) (7)
    CreateDynamicObject(14614,-238.62838745,125.66346741,899.40002441,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(triad_main3) (6)
    CreateDynamicObject(3440,-255.12379456,113.22735596,901.39898682,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(arptpillar01_lvs) (9)
    CreateDynamicObject(3440,-255.46621704,115.46425629,901.39898682,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(arptpillar01_lvs) (10)
    CreateDynamicObject(2885,-251.31344604,117.58926392,910.25000000,0.00000000,90.00000000,91.99450684, .interiorid = 1, .worldid = 6298); //object(xref_garagedoor) (39)
    CreateDynamicObject(3113,-274.90762329,66.58232117,918.70001221,90.00000000,14.98535156,269.98950195, .interiorid = 1, .worldid = 6298); //object(carrier_door_sfse) (8)
    CreateDynamicObject(2357,-243.06787109,110.46852112,901.83911133,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(dunc_dinning) (1)
    CreateDynamicObject(2357,-241.80999756,110.47000122,901.83911133,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(dunc_dinning) (2)
    CreateDynamicObject(2357,-243.07000732,114.69999695,901.83911133,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(dunc_dinning) (3)
    CreateDynamicObject(2357,-241.80957031,114.69921875,901.83911133,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(dunc_dinning) (4)
    CreateDynamicObject(1846,-242.98681641,124.40600586,903.62542725,90.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(shop_shelf04) (4)
    CreateDynamicObject(2232,-241.16792297,123.42004395,903.56390381,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(med_speaker_4) (1)
    CreateDynamicObject(2232,-244.91352844,123.46161652,903.56390381,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(med_speaker_4) (2)
    CreateDynamicObject(16782,-243.35945129,103.97172546,903.11108398,0.00000000,0.00000000,88.00000000, .interiorid = 1, .worldid = 6298); //object(a51_radar_scan) (1)
    CreateDynamicObject(14532,-241.58789062,118.78613281,902.33221436,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 6298); //object(tv_stand_driv) (1)
    CreateDynamicObject(2491,-242.29728699,118.53133392,900.58197021,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(model_stand) (1)
    CreateDynamicObject(1671,-244.69842529,116.26486969,901.83148193,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(swivelchair_a) (2)
    CreateDynamicObject(1671,-244.59977722,114.01677704,901.83148193,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(swivelchair_a) (3)
    CreateDynamicObject(1671,-244.48077393,111.75585938,901.83148193,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(swivelchair_a) (4)
    CreateDynamicObject(1671,-244.61120605,109.50963593,901.83148193,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 6298); //object(swivelchair_a) (5)
    CreateDynamicObject(1671,-240.36761475,109.26197052,901.83148193,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6298); //object(swivelchair_a) (6)
    CreateDynamicObject(1671,-240.13662720,111.75103760,901.83148193,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6298); //object(swivelchair_a) (7)
    CreateDynamicObject(1671,-240.10279846,114.01308441,901.83148193,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6298); //object(swivelchair_a) (8)
    CreateDynamicObject(1671,-240.21557617,116.00952148,901.83148193,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 6298); //object(swivelchair_a) (9)
    CreateDynamicObject(2894,-243.15534973,115.82600403,902.24938965,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(kmb_rhymesbook) (1)
    CreateDynamicObject(3017,-242.38752747,113.57837677,902.26000977,0.00000000,0.00000000,26.00000000, .interiorid = 1, .worldid = 6298); //object(arch_plans) (1)
    CreateDynamicObject(16662,-244.85855103,128.77255249,902.31152344,0.00000000,0.00000000,334.00000000, .interiorid = 1, .worldid = 6298); //object(a51_radar_stuff) (1)
    CreateDynamicObject(3113,-271.73367310,57.77507401,911.04998779,0.00000000,284.99633789,87.99499512, .interiorid = 1, .worldid = 6298); //object(carrier_door_sfse) (9)
    CreateDynamicObject(2839,-287.89999390,51.00000000,909.09997559,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(gb_takeaway04) (1)
    CreateDynamicObject(2257,-277.15051270,50.43408966,911.93658447,0.00000000,0.00000000,358.00000000, .interiorid = 1, .worldid = 6298); //object(frame_clip_4) (1)
    CreateDynamicObject(640,-275.50000000,76.69999695,908.00000000,0.00000000,0.00000000,273.99902344, .interiorid = 1, .worldid = 6298); //object(kb_planter_bush2) (1)
    CreateDynamicObject(640,-277.89999390,76.50000000,908.00000000,0.00000000,0.00000000,273.99902344, .interiorid = 1, .worldid = 6298); //object(kb_planter_bush2) (2)
    CreateDynamicObject(11102,-243.00000000,50.29999924,903.09997559,0.00000000,0.00000000,272.00000000, .interiorid = 1, .worldid = 6298); //object(burgalrydoor_sfs) (2)
    CreateDynamicObject(758,-279.29980469,74.89941406,901.29998779,0.00000000,0.00000000,251.99890137, .interiorid = 1, .worldid = 6298); //object(sm_scrub_rock6) (1)
    CreateDynamicObject(758,-274.29998779,75.40000153,901.29998779,0.00000000,0.00000000,251.99890137, .interiorid = 1, .worldid = 6298); //object(sm_scrub_rock6) (2)
    CreateDynamicObject(9833,-277.20001221,74.30000305,903.50000000,0.00000000,0.00000000,26.00000000, .interiorid = 1, .worldid = 6298); //object(fountain_sfw) (2)
    CreateDynamicObject(3524,-280.50000000,75.59999847,904.10003662,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(skullpillar01_lvs) (1)
    CreateDynamicObject(3524,-272.89996338,76.50000000,904.19995117,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(skullpillar01_lvs) (2)
    CreateDynamicObject(2780,-233.50000000,93.30000305,897.70001221,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(cj_smoke_mach) (1)
    CreateDynamicObject(750,-297.70001221,78.19999695,901.29998779,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(sm_scrb_column2) (1)
    CreateDynamicObject(750,-297.70001221,82.50000000,901.29998779,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(sm_scrb_column2) (2)
    CreateDynamicObject(758,-297.39999390,80.69999695,903.70001221,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(sm_scrub_rock6) (3)
    CreateDynamicObject(750,-297.60000610,111.09999847,901.29998779,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(sm_scrb_column2) (3)
    CreateDynamicObject(750,-297.79998779,115.09999847,901.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(sm_scrb_column2) (4)
    CreateDynamicObject(758,-297.39999390,112.90000153,903.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(sm_scrub_rock6) (4)
    CreateDynamicObject(3524,-296.20001221,78.19999695,903.10003662,0.00000000,0.00000000,92.00000000, .interiorid = 1, .worldid = 6298); //object(skullpillar01_lvs) (3)
    CreateDynamicObject(3524,-296.10000610,82.69999695,903.10003662,0.00000000,0.00000000,91.99401855, .interiorid = 1, .worldid = 6298); //object(skullpillar01_lvs) (4)
    CreateDynamicObject(3524,-296.13000488,110.90000153,903.10003662,0.00000000,0.00000000,91.99401855, .interiorid = 1, .worldid = 6298); //object(skullpillar01_lvs) (5)
    CreateDynamicObject(3524,-296.13000488,115.19999695,903.10003662,0.00000000,0.00000000,91.99401855, .interiorid = 1, .worldid = 6298); //object(skullpillar01_lvs) (6)
    CreateDynamicObject(9129,-260.19628906,69.12597656,904.60955811,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(pirtneon) (1)
    CreateDynamicObject(14467,-273.70001221,67.59999847,903.39996338,0.00000000,0.00000000,262.00000000, .interiorid = 1, .worldid = 6298); //object(carter_statue) (1)
    CreateDynamicObject(14467,-279.79998779,67.69999695,903.39996338,0.00000000,0.00000000,51.99096680, .interiorid = 1, .worldid = 6298); //object(carter_statue) (2)
    CreateDynamicObject(3524,-273.35000610,67.89999390,902.70001221,0.00000000,0.00000000,230.00000000, .interiorid = 1, .worldid = 6298); //object(skullpillar01_lvs) (7)
    CreateDynamicObject(3524,-280.39999390,67.59999847,902.59997559,0.00000000,0.00000000,76.00000000, .interiorid = 1, .worldid = 6298); //object(skullpillar01_lvs) (8)
    CreateDynamicObject(1726,-283.70001221,67.00000000,901.29998779,0.00000000,0.00000000,182.00000000, .interiorid = 1, .worldid = 6298); //object(mrk_seating2) (1)
    CreateDynamicObject(1726,-286.00000000,66.90000153,901.29998779,0.00000000,0.00000000,181.99951172, .interiorid = 1, .worldid = 6298); //object(mrk_seating2) (2)
    CreateDynamicObject(1726,-288.39999390,66.80000305,901.29998779,0.00000000,0.00000000,181.99951172, .interiorid = 1, .worldid = 6298); //object(mrk_seating2) (3)
    CreateDynamicObject(1827,-286.89999390,69.90000153,901.29998779,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(man_sdr_tables) (1)
    CreateDynamicObject(1726,-286.00000000,72.59999847,901.29998779,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(mrk_seating2) (4)
    CreateDynamicObject(1726,-288.29998779,72.59999847,901.29998779,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(mrk_seating2) (5)
    CreateDynamicObject(1726,-290.50000000,72.59999847,901.29998779,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(mrk_seating2) (6)
    CreateDynamicObject(14455,-294.89999390,70.40000153,903.09997559,0.00000000,0.00000000,314.00000000, .interiorid = 1, .worldid = 6298); //object(gs_bookcase) (2)
    CreateDynamicObject(14455,-316.89999390,-28.39999962,883.59997559,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(gs_bookcase) (3)
    CreateDynamicObject(14455,-297.10000610,75.59999847,903.00000000,0.00000000,0.00000000,288.00000000, .interiorid = 1, .worldid = 6298); //object(gs_bookcase) (4)
    CreateDynamicObject(6965,-260.70001221,69.80000305,905.00000000,0.00000000,0.00000000,338.00000000, .interiorid = 1, .worldid = 6298); //object(venefountain02) (1)
    CreateDynamicObject(3515,-258.70001221,74.30000305,901.99987793,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(vgsfountain) (1)
    CreateDynamicObject(3515,-265.50000000,69.59999847,901.99987793,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(vgsfountain) (2)
    CreateDynamicObject(3089,-372.60000610,15.50000000,904.20001221,0.00000000,0.00000000,92.00000000, .interiorid = 1, .worldid = 6298); //object(ab_casdorlok) (1)
    CreateDynamicObject(9833,-264.00000000,73.99984741,903.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(fountain_sfw) (3)
    CreateDynamicObject(3528,-297.79998779,95.69999695,906.10003662,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(vgsedragon) (1)
    CreateDynamicObject(14455,-271.10000610,125.59999847,903.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(gs_bookcase) (5)
    CreateDynamicObject(14455,-276.79998779,125.59999847,903.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(gs_bookcase) (6)
    CreateDynamicObject(3524,-282.00000000,124.80000305,904.20001221,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(skullpillar01_lvs) (9)
    CreateDynamicObject(3524,-277.89999390,124.80000305,904.20007324,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(skullpillar01_lvs) (10)
    CreateDynamicObject(19129,-277.74716187,90.53511810,901.39257812,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 6298); //object(sw_trainbridge1) (1)

	//Custom interior Jack_Ky
    CreateDynamicObject(3984,-52.89941406,165.59960938,5105.80004883,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(churchprog1_lan) (1)
    CreateDynamicObject(8565,-47.39941406,118.39941406,5099.89990234,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7977); //object(vgsebuild03_lvs) (1)
    CreateDynamicObject(8565,-86.59999847,118.39999390,5099.89990234,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7977); //object(vgsebuild03_lvs) (2)
    CreateDynamicObject(8565,-95.24951172,160.74932861,5099.89990234,0.00000000,0.00000000,89.99450684, .interiorid = 1, .worldid = 7977); //object(vgsebuild03_lvs) (3)
    CreateDynamicObject(3586,-87.00000000,138.69999695,5092.00000000,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7977); //object(escl_la) (1)
    CreateDynamicObject(8565,-96.59960938,136.69921875,5103.30004883,0.00000000,179.99450684,89.99450684, .interiorid = 1, .worldid = 7977); //object(vgsebuild03_lvs) (4)
    CreateDynamicObject(14455,-78.09999847,147.50000000,5096.80004883,0.00000000,0.00000000,267.99499512, .interiorid = 1, .worldid = 7977); //object(gs_bookcase) (1)
    CreateDynamicObject(14455,-78.09999847,153.00000000,5096.80004883,0.00000000,0.00000000,269.99499512, .interiorid = 1, .worldid = 7977); //object(gs_bookcase) (2)
    CreateDynamicObject(8565,-10.00000000,154.89999390,5099.89990234,0.00000000,0.00000000,269.99450684, .interiorid = 1, .worldid = 7977); //object(vgsebuild03_lvs) (5)
    CreateDynamicObject(8565,-26.20000076,192.19999695,5099.89990234,0.00000000,0.00000000,1.98901367, .interiorid = 1, .worldid = 7977); //object(vgsebuild03_lvs) (6)
    CreateDynamicObject(8565,-49.89941406,183.00000000,5099.89990234,0.00000000,0.00000000,89.98852539, .interiorid = 1, .worldid = 7977); //object(vgsebuild03_lvs) (7)
    CreateDynamicObject(9831,-58.59960938,134.69921875,5085.69995117,264.99572754,179.99450684,180.00000000, .interiorid = 1, .worldid = 7977); //object(sfw_waterfall) (1)
    CreateDynamicObject(3984,-85.79980469,215.59960938,5106.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(churchprog1_lan) (2)
    CreateDynamicObject(8565,-101.50000000,184.69999695,5099.89990234,0.00000000,0.00000000,89.98352051, .interiorid = 1, .worldid = 7977); //object(vgsebuild03_lvs) (8)
    CreateDynamicObject(8565,-83.09999847,219.80000305,5099.89990234,0.00000000,0.00000000,359.97253418, .interiorid = 1, .worldid = 7977); //object(vgsebuild03_lvs) (9)
    CreateDynamicObject(1557,-31.39999962,173.77000427,5095.10009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(gen_doorext19) (1)
    CreateDynamicObject(1557,-28.39941406,173.76953125,5095.10009766,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7977); //object(gen_doorext19) (2)
    CreateDynamicObject(8565,-33.00000000,132.69999695,5099.89990234,0.00000000,0.00000000,269.98901367, .interiorid = 1, .worldid = 7977); //object(vgsebuild03_lvs) (10)
    CreateDynamicObject(14409,-82.19999695,198.30000305,5096.41992188,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7977); //object(carter-stairs02) (1)
    CreateDynamicObject(3095,-75.50000000,199.80000305,5099.60009766,0.00000000,180.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(a51_jetdoor) (1)
    CreateDynamicObject(3095,-79.80000305,199.80000305,5095.09985352,90.00000000,180.00000000,90.00195312, .interiorid = 1, .worldid = 7977); //object(a51_jetdoor) (2)
    CreateDynamicObject(3095,-68.19999695,199.79998779,5099.60009766,0.00000000,179.99450684,0.00000000, .interiorid = 1, .worldid = 7977); //object(a51_jetdoor) (3)
    CreateDynamicObject(14391,-74.30000305,201.30000305,5100.60009766,0.00000000,0.00000000,272.00000000, .interiorid = 1, .worldid = 7977); //object(dr_gsnew07) (1)
    CreateDynamicObject(18070,-74.40000153,199.00000000,5099.87646484,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(gap_counter) (1)
    CreateDynamicObject(2232,-80.00000000,195.30000305,5099.30004883,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(med_speaker_4) (1)
    CreateDynamicObject(2232,-68.50000000,195.30000305,5099.29980469,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(med_speaker_4) (2)
    CreateDynamicObject(2232,-79.00000000,195.30000305,5099.99951172,0.00000000,90.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(med_speaker_4) (3)
    CreateDynamicObject(2232,-77.80000305,195.30000305,5099.99951172,0.00000000,89.99450684,0.00000000, .interiorid = 1, .worldid = 7977); //object(med_speaker_4) (4)
    CreateDynamicObject(2232,-79.00000000,195.30000305,5100.69995117,0.00000000,89.99450684,0.00000000, .interiorid = 1, .worldid = 7977); //object(med_speaker_4) (5)
    CreateDynamicObject(2232,-77.79999542,195.30000305,5100.69995117,0.00000000,89.99450684,0.00000000, .interiorid = 1, .worldid = 7977); //object(med_speaker_4) (6)
    CreateDynamicObject(2232,-70.55000305,195.30000305,5100.69995117,0.00000000,90.00000000,357.98995972, .interiorid = 1, .worldid = 7977); //object(med_speaker_4) (7)
    CreateDynamicObject(2232,-69.40000153,195.30000305,5100.69995117,0.00000000,90.00000000,359.98992920, .interiorid = 1, .worldid = 7977); //object(med_speaker_4) (8)
    CreateDynamicObject(2232,-70.59999847,195.30000305,5099.99951172,0.00000000,90.00000000,359.98962402, .interiorid = 1, .worldid = 7977); //object(med_speaker_4) (9)
    CreateDynamicObject(2232,-69.40000153,195.30000305,5099.99951172,0.00000000,90.00000000,359.98992920, .interiorid = 1, .worldid = 7977); //object(med_speaker_4) (10)
    CreateDynamicObject(2229,-76.59999847,196.50000000,5099.69995117,0.00000000,90.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(swank_speaker) (1)
    CreateDynamicObject(2229,-73.09999847,196.50000000,5099.69995117,0.00000000,90.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(swank_speaker) (2)
    CreateDynamicObject(14820,-74.40000153,197.50000000,5100.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(dj_stuff) (1)
    CreateDynamicObject(2190,-76.50000000,197.50000000,5100.39990234,0.00000000,0.00000000,126.00000000, .interiorid = 1, .worldid = 7977); //object(pc_1) (1)
    CreateDynamicObject(2190,-72.69999695,197.19999695,5100.39990234,0.00000000,0.00000000,211.99121094, .interiorid = 1, .worldid = 7977); //object(pc_1) (2)
    CreateDynamicObject(1472,-78.69999695,198.50000000,5100.00000000,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7977); //object(dyn_porch_1) (1)
    CreateDynamicObject(14399,-75.90000153,198.55999756,5095.80004883,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7977); //object(bar2) (1)
    CreateDynamicObject(1541,-68.29999542,198.20001221,5097.39990234,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 7977); //object(cj_beer_taps_1) (1)
    CreateDynamicObject(1716,-76.69999695,197.60000610,5096.19995117,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(kb_slot_stool) (1)
    CreateDynamicObject(1716,-75.00000000,195.89999390,5096.19995117,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(kb_slot_stool) (2)
    CreateDynamicObject(1716,-72.40000153,195.89999390,5096.19995117,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(kb_slot_stool) (3)
    CreateDynamicObject(1716,-69.59999847,195.89999390,5096.19995117,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(kb_slot_stool) (4)
    CreateDynamicObject(1667,-76.00000000,197.10000610,5097.30004883,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(propwineglass1) (1)
    CreateDynamicObject(1667,-72.80000305,196.50000000,5097.30004883,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(propwineglass1) (2)
    CreateDynamicObject(1665,-75.40000153,196.50000000,5097.19995117,0.00000000,0.00000000,250.00000000, .interiorid = 1, .worldid = 7977); //object(propashtray1) (1)
    CreateDynamicObject(1668,-72.69999695,196.69999695,5097.30004883,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(propvodkabotl1) (1)
    CreateDynamicObject(1669,-76.00000000,197.30000305,5097.30004883,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(propwinebotl1) (1)
    CreateDynamicObject(1546,-70.00000000,196.50000000,5097.30004883,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(cj_pint_glass) (1)
    CreateDynamicObject(1544,-75.19999695,196.60000610,5097.19995117,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(cj_beer_b_1) (1)
    CreateDynamicObject(1544,-75.09999847,196.39999390,5097.19995117,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(cj_beer_b_1) (2)
    CreateDynamicObject(1544,-75.09999847,196.60000610,5097.19995117,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(cj_beer_b_1) (3)
    CreateDynamicObject(1543,-70.09999847,196.60000610,5097.19995117,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(cj_beer_b_2) (1)
    CreateDynamicObject(1543,-70.30000305,196.50000000,5097.19995117,0.00000000,90.00000000,339.99978638, .interiorid = 1, .worldid = 7977); //object(cj_beer_b_2) (2)
    CreateDynamicObject(1545,-68.19999695,199.30000305,5097.39990234,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 7977); //object(cj_b_optic1) (1)
    CreateDynamicObject(2452,-68.59999847,200.89999390,5096.19995117,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 7977); //object(cj_ff_fridge2) (1)
    CreateDynamicObject(3051,-68.40000153,200.70001221,5097.60009766,0.00000000,0.00000000,46.00000000, .interiorid = 1, .worldid = 7977); //object(lift_dr) (1)
    CreateDynamicObject(1486,-76.30000305,200.89999390,5097.19995117,0.00000000,0.00000000,88.00000000, .interiorid = 1, .worldid = 7977); //object(dyn_beer_1) (1)
    CreateDynamicObject(1486,-76.19999695,200.89999390,5097.19995117,0.00000000,0.00000000,87.99499512, .interiorid = 1, .worldid = 7977); //object(dyn_beer_1) (2)
    CreateDynamicObject(1486,-76.09999847,200.89999390,5097.19995117,0.00000000,0.00000000,87.99499512, .interiorid = 1, .worldid = 7977); //object(dyn_beer_1) (3)
    CreateDynamicObject(1520,-76.00000000,201.00000000,5097.10009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(dyn_wine_bounce) (1)
    CreateDynamicObject(1520,-75.90000153,201.00000000,5097.10009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(dyn_wine_bounce) (2)
    CreateDynamicObject(1668,-75.69999695,201.00000000,5097.19995117,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(propvodkabotl1) (2)
    CreateDynamicObject(1668,-75.59999847,201.00000000,5097.19995117,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(propvodkabotl1) (3)
    CreateDynamicObject(1950,-79.00000000,196.80000305,5097.10009766,0.00000000,0.00000000,254.00000000, .interiorid = 1, .worldid = 7977); //object(kb_beer) (1)
    CreateDynamicObject(2799,-79.19999695,200.30000305,5096.69995117,0.00000000,0.00000000,30.00000000, .interiorid = 1, .worldid = 7977); //object(castable2) (1)
    CreateDynamicObject(2799,-79.09999847,196.89999390,5096.69995117,0.00000000,0.00000000,29.99816895, .interiorid = 1, .worldid = 7977); //object(castable2) (2)
    CreateDynamicObject(1670,-79.19999695,200.30000305,5096.89990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(propcollecttable) (1)
    CreateDynamicObject(1455,-79.09999847,197.00000000,5096.89990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(dyn_glass) (1)
    CreateDynamicObject(1726,-77.88321686,181.13435364,5096.19995117,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7977); //object(mrk_seating2) (1)
    CreateDynamicObject(1726,-80.56989288,181.08140564,5096.19995117,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7977); //object(mrk_seating2) (2)
    CreateDynamicObject(18102,-71.30000305,187.00000000,5105.30004883,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(light_box1) (1)
    CreateDynamicObject(9831,-73.19999695,175.89999390,5085.00000000,275.00427246,359.99450684,179.99450684, .interiorid = 1, .worldid = 7977); //object(sfw_waterfall) (2)
    CreateDynamicObject(750,-77.69999695,174.10000610,5095.89990234,0.00000000,0.00000000,155.99487305, .interiorid = 1, .worldid = 7977); //object(sm_scrb_column2) (1)
    CreateDynamicObject(750,-68.69999695,173.89999390,5096.00000000,0.00000000,0.00000000,137.99377441, .interiorid = 1, .worldid = 7977); //object(sm_scrb_column2) (2)
    CreateDynamicObject(744,-76.90000153,174.69999695,5100.60009766,0.00000000,90.00000000,357.99780273, .interiorid = 1, .worldid = 7977); //object(sm_scrub_rock4) (1)
    CreateDynamicObject(758,-75.59999847,174.80000305,5095.89990234,0.00000000,0.00000000,57.99682617, .interiorid = 1, .worldid = 7977); //object(sm_scrub_rock6) (1)
    CreateDynamicObject(758,-71.00000000,173.39999390,5096.00000000,0.00000000,0.00000000,215.99682617, .interiorid = 1, .worldid = 7977); //object(sm_scrub_rock6) (2)
    CreateDynamicObject(750,-77.50000000,173.60000610,5105.30004883,180.00000000,0.00000000,155.99487305, .interiorid = 1, .worldid = 7977); //object(sm_scrb_column2) (3)
    CreateDynamicObject(750,-68.99996948,173.60000610,5105.19995117,180.00000000,0.00000000,155.99487305, .interiorid = 1, .worldid = 7977); //object(sm_scrb_column2) (4)
    CreateDynamicObject(744,-69.40000153,175.60000610,5100.80004883,0.00000000,90.00000000,183.99267578, .interiorid = 1, .worldid = 7977); //object(sm_scrub_rock4) (2)
    CreateDynamicObject(3095,-63.73925781,158.59960938,5094.69995117,90.00000000,179.99450684,359.99450684, .interiorid = 1, .worldid = 7977); //object(a51_jetdoor) (4)
    CreateDynamicObject(14409,-65.59999847,161.00010681,5096.00000000,0.00000000,0.00000000,89.98895264, .interiorid = 1, .worldid = 7977); //object(carter-stairs02) (2)
    CreateDynamicObject(3095,-59.24000168,163.50000000,5094.69995117,89.99450684,180.00000000,89.98352051, .interiorid = 1, .worldid = 7977); //object(a51_jetdoor) (5)
    CreateDynamicObject(3095,-58.20000076,163.10000610,5099.20996094,0.00000000,179.99450684,0.00000000, .interiorid = 1, .worldid = 7977); //object(a51_jetdoor) (6)
    CreateDynamicObject(3095,-50.20000076,163.10000610,5099.20996094,0.00000000,179.99450684,0.00000000, .interiorid = 1, .worldid = 7977); //object(a51_jetdoor) (7)
    CreateDynamicObject(3095,-46.29999924,163.10000610,5094.69995117,90.00000000,180.00549316,269.96704102, .interiorid = 1, .worldid = 7977); //object(a51_jetdoor) (8)
    CreateDynamicObject(1649,-57.09960938,158.69921875,5097.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(wglasssmash) (1)
    CreateDynamicObject(1649,-52.70000076,158.70001221,5097.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(wglasssmash) (2)
    CreateDynamicObject(1649,-48.40000153,158.70001221,5097.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(wglasssmash) (3)
    CreateDynamicObject(10444,-53.50000000,158.80000305,5084.00000000,90.00000000,184.17132568,175.82696533, .interiorid = 1, .worldid = 7977); //object(poolwater_sfs) (1)
    CreateDynamicObject(1609,-56.59999847,159.69999695,5097.00097656,0.00000000,0.00000000,92.00000000, .interiorid = 1, .worldid = 7977); //object(turtle) (1)
    CreateDynamicObject(1609,-52.09999847,160.69999695,5097.00000000,0.00000000,0.00000000,247.99401855, .interiorid = 1, .worldid = 7977); //object(turtle) (2)
    CreateDynamicObject(1461,-48.59999847,159.69999695,5096.80004883,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(dyn_life_p) (1)
    CreateDynamicObject(3095,-41.40000153,159.00000000,5099.20996094,0.00000000,179.99450684,0.00000000, .interiorid = 1, .worldid = 7977); //object(a51_jetdoor) (9)
    CreateDynamicObject(3095,-41.40000153,155.00000000,5099.19995117,0.00000000,179.99450684,0.00000000, .interiorid = 1, .worldid = 7977); //object(a51_jetdoor) (10)
    CreateDynamicObject(970,-61.70000076,158.69999695,5099.80004883,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(fencesmallb) (1)
    CreateDynamicObject(970,-57.50000000,158.69999695,5099.80004883,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(fencesmallb) (2)
    CreateDynamicObject(970,-53.40000153,158.69999695,5099.80004883,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(fencesmallb) (3)
    CreateDynamicObject(970,-49.29999924,158.69999695,5099.80004883,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(fencesmallb) (4)
    CreateDynamicObject(970,-48.00000000,158.69999695,5099.80004883,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(fencesmallb) (5)
    CreateDynamicObject(970,-45.90000153,156.60000610,5099.80004883,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 7977); //object(fencesmallb) (6)
    CreateDynamicObject(970,-45.90000153,152.69999695,5099.80004883,0.00000000,0.00000000,269.99450684, .interiorid = 1, .worldid = 7977); //object(fencesmallb) (7)
    CreateDynamicObject(970,-36.90000153,154.89999390,5099.80004883,0.00000000,0.00000000,269.99450684, .interiorid = 1, .worldid = 7977); //object(fencesmallb) (8)
    CreateDynamicObject(970,-36.90000153,159.00000000,5099.80004883,0.00000000,0.00000000,269.99450684, .interiorid = 1, .worldid = 7977); //object(fencesmallb) (9)
    CreateDynamicObject(970,-36.90000153,162.39999390,5099.80004883,0.00000000,0.00000000,269.99450684, .interiorid = 1, .worldid = 7977); //object(fencesmallb) (10)
    CreateDynamicObject(2630,-56.79999924,159.89999390,5099.19995117,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(gym_bike) (1)
    CreateDynamicObject(2630,-55.20000076,159.89999390,5099.19995117,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(gym_bike) (2)
    CreateDynamicObject(2630,-53.29999924,159.89999390,5099.19995117,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(gym_bike) (3)
    CreateDynamicObject(2630,-51.40000153,159.89999390,5099.19995117,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(gym_bike) (4)
    CreateDynamicObject(2627,-49.40000153,160.30000305,5099.19995117,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7977); //object(gym_treadmill) (1)
    CreateDynamicObject(2627,-48.00000000,160.30000305,5099.19995117,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7977); //object(gym_treadmill) (2)
    CreateDynamicObject(2627,-46.70000076,160.30000305,5099.19995117,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7977); //object(gym_treadmill) (3)
    CreateDynamicObject(2628,-44.40000153,154.39999390,5099.19995117,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7977); //object(gym_bench2) (1)
    CreateDynamicObject(2628,-44.29999924,156.80000305,5099.19995117,0.00000000,0.00000000,89.99450684, .interiorid = 1, .worldid = 7977); //object(gym_bench2) (2)
    CreateDynamicObject(2628,-44.20000076,158.89999390,5099.19995117,0.00000000,0.00000000,89.99450684, .interiorid = 1, .worldid = 7977); //object(gym_bench2) (3)
    CreateDynamicObject(2629,-38.90000153,160.89999390,5099.19995117,0.00000000,0.00000000,268.00000000, .interiorid = 1, .worldid = 7977); //object(gym_bench1) (1)
    CreateDynamicObject(2629,-38.90000153,157.60000610,5099.19995117,0.00000000,0.00000000,267.99499512, .interiorid = 1, .worldid = 7977); //object(gym_bench1) (2)
    CreateDynamicObject(2629,-38.90000153,154.50000000,5099.19995117,0.00000000,0.00000000,269.99499512, .interiorid = 1, .worldid = 7977); //object(gym_bench1) (3)
    CreateDynamicObject(2596,-37.70000076,163.00000000,5101.50000000,0.00000000,0.00000000,324.00000000, .interiorid = 1, .worldid = 7977); //object(cj_sex_tv) (1)
    CreateDynamicObject(2915,-42.40000153,153.50000000,5099.30004883,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(kmb_dumbbell2) (1)
    CreateDynamicObject(2915,-41.29999924,153.50000000,5099.30004883,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(kmb_dumbbell2) (2)
    CreateDynamicObject(2915,-40.20000076,153.50000000,5099.30004883,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(kmb_dumbbell2) (3)
    CreateDynamicObject(2913,-38.40000153,155.00000000,5100.10009766,90.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(kmb_bpress) (1)
    CreateDynamicObject(2913,-38.40000153,158.00000000,5100.10009766,89.99450684,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(kmb_bpress) (2)
    CreateDynamicObject(2913,-38.40000153,161.30000305,5100.11010742,89.99450684,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(kmb_bpress) (3)
    CreateDynamicObject(1985,-41.59999847,161.30000305,5101.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(punchbagnu) (1)
    CreateDynamicObject(1985,-41.59999847,156.39999390,5101.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(punchbagnu) (2)
    CreateDynamicObject(3660,-38.00000000,153.69999695,5097.69995117,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(lasairfbed_las) (1)
    CreateDynamicObject(1726,-49.00000000,153.19921875,5096.00000000,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7977); //object(mrk_seating2) (3)
    CreateDynamicObject(3660,-41.45000076,162.60000610,5097.69995117,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(lasairfbed_las) (2)
    CreateDynamicObject(1726,-45.29999924,159.00000000,5096.00000000,0.00000000,0.00000000,91.99450684, .interiorid = 1, .worldid = 7977); //object(mrk_seating2) (4)
    CreateDynamicObject(3660,-52.29980469,142.84960938,5097.69995117,0.00000000,0.00000000,87.99499512, .interiorid = 1, .worldid = 7977); //object(lasairfbed_las) (3)
    CreateDynamicObject(1726,-72.40000153,139.10000610,5095.10009766,0.00000000,0.00000000,269.99450684, .interiorid = 1, .worldid = 7977); //object(mrk_seating2) (5)
    CreateDynamicObject(1726,-72.50000000,143.19999695,5095.10009766,0.00000000,0.00000000,269.98901367, .interiorid = 1, .worldid = 7977); //object(mrk_seating2) (6)
    CreateDynamicObject(1726,-72.39941406,147.19921875,5095.10009766,0.00000000,0.00000000,269.98901367, .interiorid = 1, .worldid = 7977); //object(mrk_seating2) (7)
    CreateDynamicObject(1726,-72.50000000,152.00000000,5095.10009766,0.00000000,0.00000000,269.98901367, .interiorid = 1, .worldid = 7977); //object(mrk_seating2) (8)
    CreateDynamicObject(1726,-76.40000153,153.30000305,5095.10009766,0.00000000,0.00000000,359.98901367, .interiorid = 1, .worldid = 7977); //object(mrk_seating2) (9)
    CreateDynamicObject(626,-51.59960938,153.09960938,5098.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(veg_palmkb2) (1)
    CreateDynamicObject(626,-69.00000000,137.69921875,5098.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(veg_palmkb2) (2)
    CreateDynamicObject(3920,-52.90000153,158.90000916,5098.22998047,0.00000000,0.00000000,179.99987793, .interiorid = 1, .worldid = 7977); //object(lib_veg3) (1)
    CreateDynamicObject(3920,-61.79980469,158.79980469,5098.19995117,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7977); //object(lib_veg3) (2)
    CreateDynamicObject(3920,-36.99998856,158.99996948,5099.30004883,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 7977); //object(lib_veg3) (3)
    CreateDynamicObject(3984,-120.00000000,163.00000000,5099.19995117,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7977); //object(churchprog1_lan) (3)
    CreateDynamicObject(8565,-98.59999847,118.50000000,5093.00000000,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7977); //object(vgsebuild03_lvs) (11)
    CreateDynamicObject(8565,-100.19999695,159.00000000,5093.00000000,0.00000000,0.00000000,359.99450684, .interiorid = 1, .worldid = 7977); //object(vgsebuild03_lvs) (12)
    CreateDynamicObject(8565,-135.09960938,118.50000000,5093.00000000,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7977); //object(vgsebuild03_lvs) (13)
    CreateDynamicObject(8565,-126.30000305,187.19999695,5093.00000000,0.00000000,0.00000000,359.98901367, .interiorid = 1, .worldid = 7977); //object(vgsebuild03_lvs) (14)
    CreateDynamicObject(8565,-150.00000000,164.00000000,5093.00000000,0.00000000,0.00000000,89.98901367, .interiorid = 1, .worldid = 7977); //object(vgsebuild03_lvs) (15)
    CreateDynamicObject(3499,-126.00000000,147.00000000,5089.80004883,0.00000000,90.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(wdpillar02_lvs) (1)
    CreateDynamicObject(2912,-129.50000000,162.80000305,5089.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(temp_crate1) (1)
    CreateDynamicObject(2912,-126.59999847,162.89999390,5089.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(temp_crate1) (2)
    CreateDynamicObject(2912,-123.30000305,163.19999695,5089.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(temp_crate1) (3)
    CreateDynamicObject(2912,-128.19999695,159.19999695,5089.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(temp_crate1) (4)
    CreateDynamicObject(2912,-125.09999847,159.30000305,5089.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(temp_crate1) (5)
    CreateDynamicObject(2912,-129.39941406,155.89941406,5089.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(temp_crate1) (6)
    CreateDynamicObject(2912,-126.69999695,155.80000305,5089.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(temp_crate1) (7)
    CreateDynamicObject(2912,-123.30000305,156.10000610,5089.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(temp_crate1) (8)
    CreateDynamicObject(1544,-129.39999390,155.80000305,5090.10009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(cj_beer_b_1) (4)
    CreateDynamicObject(1544,-128.19999695,159.10000610,5090.10009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(cj_beer_b_1) (5)
    CreateDynamicObject(1544,-129.50000000,162.60000610,5090.10009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(cj_beer_b_1) (6)
    CreateDynamicObject(1544,-126.59999847,162.69999695,5090.10009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(cj_beer_b_1) (7)
    CreateDynamicObject(1544,-126.69999695,155.69999695,5090.10009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(cj_beer_b_1) (8)
    CreateDynamicObject(1544,-125.09999847,159.19999695,5090.10009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(cj_beer_b_1) (9)
    CreateDynamicObject(1544,-123.40000153,162.89999390,5090.10009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(cj_beer_b_1) (10)
    CreateDynamicObject(1544,-123.30000305,156.10000610,5090.10009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(cj_beer_b_1) (11)
    CreateDynamicObject(3498,-131.50000000,146.30000305,5093.89990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(wdpillar01_lvs) (1)
    CreateDynamicObject(3498,-120.40000153,146.39999390,5093.89990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(wdpillar01_lvs) (2)
    CreateDynamicObject(2643,-126.40000153,168.89999390,5092.80004883,0.00000000,0.00000000,2.00000000, .interiorid = 1, .worldid = 7977); //object(cj_burger_poster3) (1)
    CreateDynamicObject(1225,-131.10000610,168.30000305,5089.80004883,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(barrel4) (1)
    CreateDynamicObject(1225,-125.90000153,168.00000000,5089.80004883,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(barrel4) (2)
    CreateDynamicObject(1225,-120.69999695,168.10000610,5089.80004883,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(barrel4) (3)
    CreateDynamicObject(3095,-150.50000000,140.89999390,5089.50000000,0.00000000,179.99450684,0.00000000, .interiorid = 1, .worldid = 7977); //object(a51_jetdoor) (11)
    CreateDynamicObject(14394,-155.89999390,140.80000305,5088.69995117,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(dr_gsnew10) (1)
    CreateDynamicObject(14614,-146.00000000,129.80000305,5086.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(triad_main3) (1)
    CreateDynamicObject(14614,-146.00000000,114.40000153,5086.01000977,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(triad_main3) (2)
    CreateDynamicObject(5156,-166.00000000,195.00000000,5087.87011719,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7977); //object(dk_cargoshp24d) (1)
    CreateDynamicObject(3113,-176.59960938,134.50000000,5091.80004883,0.00000000,19.98413086,359.98901367, .interiorid = 1, .worldid = 7977); //object(carrier_door_sfse) (1)
    CreateDynamicObject(3113,-176.60000610,111.90000153,5091.80004883,0.00000000,19.98413086,359.98901367, .interiorid = 1, .worldid = 7977); //object(carrier_door_sfse) (2)
    CreateDynamicObject(3113,-166.00000000,101.00000000,5085.00000000,0.00000000,19.97863770,87.98400879, .interiorid = 1, .worldid = 7977); //object(carrier_door_sfse) (3)
    CreateDynamicObject(8565,-176.69921875,164.00000000,5093.00000000,0.00000000,0.00000000,89.98901367, .interiorid = 1, .worldid = 7977); //object(vgsebuild03_lvs) (16)
    CreateDynamicObject(3113,-165.00000000,109.00000000,5091.10009766,0.00000000,284.99633789,87.97851562, .interiorid = 1, .worldid = 7977); //object(carrier_door_sfse) (4)
    CreateDynamicObject(1649,-157.30000305,101.09999847,5093.89990234,0.00000000,0.00000000,178.00000000, .interiorid = 1, .worldid = 7977); //object(wglasssmash) (4)
    CreateDynamicObject(1649,-161.69999695,101.09999847,5093.89990234,0.00000000,0.00000000,181.99450684, .interiorid = 1, .worldid = 7977); //object(wglasssmash) (5)
    CreateDynamicObject(1649,-166.10000610,101.09999847,5093.89990234,0.00000000,0.00000000,177.98950195, .interiorid = 1, .worldid = 7977); //object(wglasssmash) (6)
    CreateDynamicObject(1649,-170.50000000,101.40000153,5093.89990234,0.00000000,0.00000000,173.99450684, .interiorid = 1, .worldid = 7977); //object(wglasssmash) (7)
    CreateDynamicObject(1649,-174.80000305,101.90000153,5093.89990234,0.00000000,0.00000000,171.98999023, .interiorid = 1, .worldid = 7977); //object(wglasssmash) (8)
    CreateDynamicObject(5156,-170.69921875,101.84960938,5090.00000000,90.00000000,191.08520508,166.89880371, .interiorid = 1, .worldid = 7977); //object(dk_cargoshp24d) (2)
    CreateDynamicObject(5130,-166.39941406,119.00000000,5088.69995117,0.00000000,0.00000000,43.99475098, .interiorid = 1, .worldid = 7977); //object(imcompstrs02) (1)
    CreateDynamicObject(2207,-166.00000000,106.00000000,5091.69995117,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7977); //object(med_office7_desk_1) (1)
    CreateDynamicObject(1714,-167.00000000,104.50000000,5091.69995117,0.00000000,0.00000000,178.00000000, .interiorid = 1, .worldid = 7977); //object(kb_swivelchair1) (1)
    CreateDynamicObject(1671,-165.89999390,107.09999847,5092.19995117,0.00000000,0.00000000,328.00000000, .interiorid = 1, .worldid = 7977); //object(swivelchair_a) (1)
    CreateDynamicObject(1671,-167.80000305,107.09999847,5092.19995117,0.00000000,0.00000000,25.99133301, .interiorid = 1, .worldid = 7977); //object(swivelchair_a) (2)
    CreateDynamicObject(970,-158.60000610,112.59999847,5092.30004883,0.00000000,0.00000000,358.00000000, .interiorid = 1, .worldid = 7977); //object(fencesmallb) (11)
    CreateDynamicObject(970,-174.10000610,113.30000305,5092.30004883,0.00000000,0.00000000,358.00000000, .interiorid = 1, .worldid = 7977); //object(fencesmallb) (12)
    CreateDynamicObject(970,-170.19999695,113.19999695,5092.30004883,0.00000000,0.00000000,357.99499512, .interiorid = 1, .worldid = 7977); //object(fencesmallb) (13)
    CreateDynamicObject(970,-162.69999695,112.80000305,5092.30004883,0.00000000,0.00000000,355.99499512, .interiorid = 1, .worldid = 7977); //object(fencesmallb) (14)
    CreateDynamicObject(14455,-175.69999695,107.59999847,5093.39990234,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 7977); //object(gs_bookcase) (3)
    CreateDynamicObject(14455,-175.69999695,111.90000153,5093.39990234,0.00000000,0.00000000,269.99450684, .interiorid = 1, .worldid = 7977); //object(gs_bookcase) (4)
    CreateDynamicObject(626,-175.50000000,113.00000000,5093.80004883,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(veg_palmkb2) (3)
    CreateDynamicObject(1726,-172.89999390,110.59999847,5091.69995117,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(mrk_seating2) (10)
    CreateDynamicObject(1726,-170.89999390,105.80000305,5091.69995117,0.00000000,0.00000000,178.00000000, .interiorid = 1, .worldid = 7977); //object(mrk_seating2) (11)
    CreateDynamicObject(2964,-159.10000610,109.00000000,5091.69995117,0.00000000,0.00000000,90.00000000, .interiorid = 1, .worldid = 7977); //object(k_pooltablesm) (1)
    CreateDynamicObject(2964,-159.10000610,104.90000153,5091.69995117,0.00000000,0.00000000,87.99499512, .interiorid = 1, .worldid = 7977); //object(k_pooltablesm) (2)
    CreateDynamicObject(3004,-158.60000610,108.90000153,5092.60009766,0.00000000,0.00000000,32.00000000, .interiorid = 1, .worldid = 7977); //object(k_poolq2) (1)
    CreateDynamicObject(3004,-159.50000000,104.19999695,5092.60009766,0.00000000,0.00000000,323.99218750, .interiorid = 1, .worldid = 7977); //object(k_poolq2) (2)
    CreateDynamicObject(3003,-159.10000610,108.90000153,5092.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(k_poolballcue) (1)
    CreateDynamicObject(3001,-159.10000610,105.30000305,5092.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(k_poolballstp07) (1)
    CreateDynamicObject(2997,-159.19999695,105.09999847,5092.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(k_poolballstp03) (1)
    CreateDynamicObject(2998,-159.30000305,105.30000305,5092.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(k_poolballstp04) (1)
    CreateDynamicObject(955,-154.58465576,102.59689331,5092.00000000,0.00000000,0.00000000,267.49548340, .interiorid = 1, .worldid = 7977); //object(cj_ext_sprunk) (1)
    CreateDynamicObject(3498,-156.80000305,114.69999695,5092.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(wdpillar01_lvs) (3)
    CreateDynamicObject(14455,-145.89941406,137.50000000,5091.00000000,0.00000000,0.00000000,269.99450684, .interiorid = 1, .worldid = 7977); //object(gs_bookcase) (5)
    CreateDynamicObject(14455,-146.00000000,147.69999695,5091.00000000,0.00000000,0.00000000,271.99499512, .interiorid = 1, .worldid = 7977); //object(gs_bookcase) (6)
    CreateDynamicObject(2357,-166.19999695,126.09999847,5088.39990234,0.00000000,0.00000000,88.00000000, .interiorid = 1, .worldid = 7977); //object(dunc_dinning) (1)
    CreateDynamicObject(2357,-166.05000305,130.30000305,5088.39990234,0.00000000,0.00000000,87.99499512, .interiorid = 1, .worldid = 7977); //object(dunc_dinning) (2)
    CreateDynamicObject(2357,-165.88999939,134.50000000,5088.39990234,0.00000000,0.00000000,87.99499512, .interiorid = 1, .worldid = 7977); //object(dunc_dinning) (3)
    CreateDynamicObject(626,-155.60000610,136.39999390,5090.00000000,0.00000000,0.00000000,286.00000000, .interiorid = 1, .worldid = 7977); //object(veg_palmkb2) (4)
    CreateDynamicObject(626,-156.60000610,136.30000305,5090.00000000,0.00000000,0.00000000,285.99609375, .interiorid = 1, .worldid = 7977); //object(veg_palmkb2) (5)
    CreateDynamicObject(1714,-166.30000305,123.09999847,5088.00000000,0.00000000,0.00000000,177.99499512, .interiorid = 1, .worldid = 7977); //object(kb_swivelchair1) (2)
    CreateDynamicObject(1714,-165.00000000,125.50000000,5088.00000000,0.00000000,0.00000000,259.99499512, .interiorid = 1, .worldid = 7977); //object(kb_swivelchair1) (3)
    CreateDynamicObject(1714,-164.80000305,128.60000610,5088.00000000,0.00000000,0.00000000,261.98596191, .interiorid = 1, .worldid = 7977); //object(kb_swivelchair1) (4)
    CreateDynamicObject(1714,-164.80000305,130.89999390,5088.00000000,0.00000000,0.00000000,263.97998047, .interiorid = 1, .worldid = 7977); //object(kb_swivelchair1) (5)
    CreateDynamicObject(1714,-164.69999695,134.10000610,5088.00000000,0.00000000,0.00000000,265.97998047, .interiorid = 1, .worldid = 7977); //object(kb_swivelchair1) (6)
    CreateDynamicObject(1714,-167.50000000,125.69999695,5088.00000000,0.00000000,0.00000000,85.97998047, .interiorid = 1, .worldid = 7977); //object(kb_swivelchair1) (7)
    CreateDynamicObject(1714,-167.50000000,128.69999695,5088.00000000,0.00000000,0.00000000,85.97900391, .interiorid = 1, .worldid = 7977); //object(kb_swivelchair1) (8)
    CreateDynamicObject(1714,-167.39999390,130.89999390,5088.00000000,0.00000000,0.00000000,85.97900391, .interiorid = 1, .worldid = 7977); //object(kb_swivelchair1) (9)
    CreateDynamicObject(1714,-167.19999695,134.19999695,5088.00000000,0.00000000,0.00000000,85.97900391, .interiorid = 1, .worldid = 7977); //object(kb_swivelchair1) (10)
    CreateDynamicObject(3017,-166.19999695,127.19999695,5088.89990234,0.00000000,0.00000000,40.00000000, .interiorid = 1, .worldid = 7977); //object(arch_plans) (1)
    CreateDynamicObject(3017,-165.89999390,131.69999695,5088.89990234,0.00000000,0.00000000,287.99572754, .interiorid = 1, .worldid = 7977); //object(arch_plans) (2)
    CreateDynamicObject(14394,-165.89941406,139.50000000,5088.30004883,0.00000000,0.00000000,87.99499512, .interiorid = 1, .worldid = 7977); //object(dr_gsnew10) (2)
    CreateDynamicObject(3095,-162.30000305,143.38000488,5084.60009766,89.99450684,180.00000000,269.96154785, .interiorid = 1, .worldid = 7977); //object(a51_jetdoor) (12)
    CreateDynamicObject(3095,-169.89999390,143.69999695,5084.60009766,89.99450684,180.00000000,89.96154785, .interiorid = 1, .worldid = 7977); //object(a51_jetdoor) (13)
    CreateDynamicObject(3095,-165.98925781,145.00000000,5088.60009766,0.00000000,0.00000000,87.95104980, .interiorid = 1, .worldid = 7977); //object(a51_jetdoor) (14)
    CreateDynamicObject(2232,-170.10000610,140.60000610,5089.80004883,0.00000000,0.00000000,4.00000000, .interiorid = 1, .worldid = 7977); //object(med_speaker_4) (11)
    CreateDynamicObject(2232,-162.19999695,140.39999390,5089.80004883,0.00000000,0.00000000,356.00000000, .interiorid = 1, .worldid = 7977); //object(med_speaker_4) (12)
    CreateDynamicObject(2227,-166.10000610,138.00000000,5088.00000000,0.00000000,0.00000000,177.99499512, .interiorid = 1, .worldid = 7977); //object(swank_hi_fi_3) (1)
    CreateDynamicObject(2853,-172.30000305,105.90000153,5092.19995117,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(gb_bedmags03) (1)
    CreateDynamicObject(2854,-172.19999695,110.50000000,5092.19995117,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(gb_bedmags04) (1)
    CreateDynamicObject(2854,-75.50000000,153.10000610,5095.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(gb_bedmags04) (2)
    CreateDynamicObject(2854,-72.50000000,138.10000610,5095.60009766,0.00000000,0.00000000,34.00000000, .interiorid = 1, .worldid = 7977); //object(gb_bedmags04) (3)
    CreateDynamicObject(2852,-72.50000000,142.10000610,5095.60009766,0.00000000,0.00000000,12.00000000, .interiorid = 1, .worldid = 7977); //object(gb_bedmags02) (1)
    CreateDynamicObject(2855,-72.59999847,151.60000610,5095.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(gb_bedmags05) (1)
    CreateDynamicObject(2491,-165.60000610,140.89999390,5088.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(model_stand) (1)
    CreateDynamicObject(16782,-168.39999390,143.69999695,5091.50000000,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 7977); //object(a51_radar_scan) (1)
    CreateDynamicObject(16782,-163.19999695,143.60000610,5091.50000000,0.00000000,0.00000000,269.99450684, .interiorid = 1, .worldid = 7977); //object(a51_radar_scan) (2)
    CreateDynamicObject(1952,-165.89999390,140.69999695,5090.50000000,90.00000000,90.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(turn_arm_r) (1)
    CreateDynamicObject(3409,-152.89999390,113.80000305,5088.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(grassplant) (1)
    CreateDynamicObject(3409,-152.69999695,111.30000305,5088.00000000,0.00000000,0.00000000,358.00000000, .interiorid = 1, .worldid = 7977); //object(grassplant) (2)
    CreateDynamicObject(3409,-152.89999390,124.30000305,5088.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(grassplant) (3)
    CreateDynamicObject(3409,-152.60000610,119.80000305,5088.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(grassplant) (4)
    CreateDynamicObject(2885,-161.69999695,102.50000000,5091.00000000,0.00000000,0.00000000,274.00000000, .interiorid = 1, .worldid = 7977); //object(xref_garagedoor) (1)
    CreateDynamicObject(2885,-171.30000305,102.59999847,5091.00000000,0.00000000,0.00000000,81.99359131, .interiorid = 1, .worldid = 7977); //object(xref_garagedoor) (2)
    CreateDynamicObject(971,-154.69999695,104.19999695,5088.00000000,0.00000000,0.00000000,94.00000000, .interiorid = 1, .worldid = 7977); //object(subwaygate) (1)
    CreateDynamicObject(1800,-152.70883179,104.00888824,5087.86962891,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(low_bed_1) (1)
    CreateDynamicObject(3092,-152.29168701,106.26907349,5088.90478516,90.00000000,179.99450684,161.99890137, .interiorid = 1, .worldid = 7977); //object(dead_tied_cop) (1)
    CreateDynamicObject(1800,-163.30000305,101.80000305,5088.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(low_bed_1) (2)
    CreateDynamicObject(1800,-169.69999695,102.69999695,5088.00000000,0.00000000,0.00000000,350.00000000, .interiorid = 1, .worldid = 7977); //object(low_bed_1) (3)
    CreateDynamicObject(3390,-159.39999390,103.09999847,5088.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(a51_sdsk_ncol1_) (1)
    CreateDynamicObject(3389,-159.39999390,105.59999847,5088.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(a51_srack1_) (1)
    CreateDynamicObject(2886,-162.05000305,107.90000153,5088.99902344,0.00000000,0.00000000,196.00000000, .interiorid = 1, .worldid = 7977); //object(sec_keypad) (1)
    CreateDynamicObject(16732,-155.00000000,125.50000000,5089.30004883,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 7977); //object(a51_ventcover) (1)
    CreateDynamicObject(16732,-155.00000000,123.90000153,5089.30004883,0.00000000,0.00000000,269.99450684, .interiorid = 1, .worldid = 7977); //object(a51_ventcover) (2)
    CreateDynamicObject(16732,-155.00000000,122.30000305,5089.30004883,0.00000000,0.00000000,271.99450684, .interiorid = 1, .worldid = 7977); //object(a51_ventcover) (3)
    CreateDynamicObject(16732,-154.74948120,120.80690002,5089.19995117,0.00000000,0.00000000,269.99450684, .interiorid = 1, .worldid = 7977); //object(a51_ventcover) (4)
    CreateDynamicObject(16732,-154.60000610,119.30000305,5089.19995117,0.00000000,0.00000000,269.99450684, .interiorid = 1, .worldid = 7977); //object(a51_ventcover) (5)
    CreateDynamicObject(16732,-154.69999695,117.80000305,5089.19995117,0.00000000,0.00000000,269.99450684, .interiorid = 1, .worldid = 7977); //object(a51_ventcover) (6)
    CreateDynamicObject(16732,-154.89999390,115.50000000,5089.19995117,0.00000000,0.00000000,269.99450684, .interiorid = 1, .worldid = 7977); //object(a51_ventcover) (7)
    CreateDynamicObject(16732,-154.89999390,113.90000153,5089.19995117,0.00000000,0.00000000,269.99450684, .interiorid = 1, .worldid = 7977); //object(a51_ventcover) (8)
    CreateDynamicObject(16732,-154.89999390,112.30000305,5089.19995117,0.00000000,0.00000000,269.99450684, .interiorid = 1, .worldid = 7977); //object(a51_ventcover) (9)
    CreateDynamicObject(16732,-154.89999390,111.09999847,5089.19995117,0.00000000,0.00000000,269.99450684, .interiorid = 1, .worldid = 7977); //object(a51_ventcover) (10)
    CreateDynamicObject(16732,-155.00000000,110.00000000,5089.19995117,0.00000000,0.00000000,269.99450684, .interiorid = 1, .worldid = 7977); //object(a51_ventcover) (11)
    CreateDynamicObject(3383,-151.80000305,133.30000305,5088.00000000,0.00000000,0.00000000,86.00000000, .interiorid = 1, .worldid = 7977); //object(a51_labtable1_) (1)
    CreateDynamicObject(3383,-151.89999390,129.30000305,5088.00000000,0.00000000,0.00000000,85.98999023, .interiorid = 1, .worldid = 7977); //object(a51_labtable1_) (2)
    CreateDynamicObject(2901,-152.50000000,133.80000305,5089.50000000,0.00000000,0.00000000,72.00000000, .interiorid = 1, .worldid = 7977); //object(kmb_marijuana) (1)
    CreateDynamicObject(2901,-152.39999390,132.30000305,5089.50000000,0.00000000,0.00000000,71.99340820, .interiorid = 1, .worldid = 7977); //object(kmb_marijuana) (2)
    CreateDynamicObject(2901,-152.60000610,130.39999390,5089.50000000,0.00000000,0.00000000,71.99340820, .interiorid = 1, .worldid = 7977); //object(kmb_marijuana) (3)
    CreateDynamicObject(2901,-152.69999695,128.69999695,5089.50000000,0.00000000,0.00000000,71.99340820, .interiorid = 1, .worldid = 7977); //object(kmb_marijuana) (4)
    CreateDynamicObject(2901,-153.30000305,131.19999695,5088.39990234,0.00000000,0.00000000,71.99340820, .interiorid = 1, .worldid = 7977); //object(kmb_marijuana) (5)
    CreateDynamicObject(2901,-153.00000000,135.30000305,5088.39990234,0.00000000,0.00000000,139.99340820, .interiorid = 1, .worldid = 7977); //object(kmb_marijuana) (6)
    CreateDynamicObject(2901,-153.50000000,128.50000000,5088.39990234,0.00000000,0.00000000,139.99328613, .interiorid = 1, .worldid = 7977); //object(kmb_marijuana) (7)
    CreateDynamicObject(2891,-153.50000000,133.50000000,5088.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(kmb_packet) (1)
    CreateDynamicObject(2891,-153.50000000,134.39999390,5088.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(kmb_packet) (2)
    CreateDynamicObject(2891,-153.50000000,134.19999695,5088.19995117,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(kmb_packet) (3)
    CreateDynamicObject(2891,-153.50000000,133.89999390,5088.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(kmb_packet) (4)
    CreateDynamicObject(2891,-153.69999695,133.60000610,5088.19995117,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(kmb_packet) (5)
    CreateDynamicObject(2891,-153.80000305,133.69999695,5088.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(kmb_packet) (6)
    CreateDynamicObject(2891,-152.39999390,134.69999695,5089.10009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(kmb_packet) (7)
    CreateDynamicObject(2891,-153.69999695,129.80000305,5088.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(kmb_packet) (8)
    CreateDynamicObject(2891,-152.50000000,131.30000305,5089.10009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(kmb_packet) (9)
    CreateDynamicObject(1225,-172.00000000,103.00000000,5088.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(barrel4) (4)
    CreateDynamicObject(1225,-172.80000305,103.00000000,5088.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(barrel4) (5)
    CreateDynamicObject(1225,-173.60000610,103.00000000,5088.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(barrel4) (6)
    CreateDynamicObject(1225,-174.39999390,103.09999847,5088.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(barrel4) (7)
    CreateDynamicObject(1225,-175.19999695,103.09999847,5088.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(barrel4) (8)
    CreateDynamicObject(1225,-175.89999390,103.09999847,5088.39990234,0.00000000,0.00000000,352.00000000, .interiorid = 1, .worldid = 7977); //object(barrel4) (9)
    CreateDynamicObject(3113,-165.69999695,101.80000305,5099.03002930,0.00000000,19.97863770,87.98400879, .interiorid = 1, .worldid = 7977); //object(carrier_door_sfse) (5)
    CreateDynamicObject(4550,-155.00000000,39.20000076,5092.69995117,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(librtow1_lan) (1)
    CreateDynamicObject(4564,-230.79980469,44.79980469,5092.39990234,0.00000000,0.00000000,27.99865723, .interiorid = 1, .worldid = 7977); //object(laskyscrap2_lan) (1)
    CreateDynamicObject(4585,-85.00000000,43.90000153,5087.89990234,0.00000000,0.00000000,24.00000000, .interiorid = 1, .worldid = 7977); //object(towerlan2) (1)
    CreateDynamicObject(9831,-178.00000000,127.19999695,5070.00000000,275.00427246,359.99450684,270.00000000, .interiorid = 1, .worldid = 7977); //object(sfw_waterfall) (3)
    CreateDynamicObject(9831,-178.00000000,139.69999695,5070.00000000,275.00427246,359.98901367,269.99743652, .interiorid = 1, .worldid = 7977); //object(sfw_waterfall) (4)
    CreateDynamicObject(3440,-176.10000610,131.69999695,5092.80004883,0.00000000,5.00000000,6.00000000, .interiorid = 1, .worldid = 7977); //object(arptpillar01_lvs) (1)
    CreateDynamicObject(3440,-176.10000610,135.30000305,5092.80004883,0.00000000,4.99328613,5.99853516, .interiorid = 1, .worldid = 7977); //object(arptpillar01_lvs) (2)
    CreateDynamicObject(3440,-176.10000610,132.89999390,5093.00000000,30.00000000,0.99328613,5.99853516, .interiorid = 1, .worldid = 7977); //object(arptpillar01_lvs) (3)
    CreateDynamicObject(3440,-176.10000610,134.19999695,5093.00000000,330.00183105,6.98327637,5.99853516, .interiorid = 1, .worldid = 7977); //object(arptpillar01_lvs) (4)
    CreateDynamicObject(5156,-166.00000000,198.00000000,5096.39990234,180.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 7977); //object(dk_cargoshp24d) (3)
    CreateDynamicObject(5156,-134.10000610,198.00000000,5096.39990234,180.00000000,0.00000000,269.99450684, .interiorid = 1, .worldid = 7977); //object(dk_cargoshp24d) (4)
    CreateDynamicObject(5156,-104.59999847,190.00000000,5096.39990234,180.00000000,0.00000000,269.99450684, .interiorid = 1, .worldid = 7977); //object(dk_cargoshp24d) (5)
    CreateDynamicObject(5156,-72.59999847,190.00000000,5103.00000000,180.00000000,0.00000000,269.99450684, .interiorid = 1, .worldid = 7977); //object(dk_cargoshp24d) (6)
    CreateDynamicObject(5156,-39.70000076,190.00000000,5103.00000000,180.00000000,0.00000000,269.99450684, .interiorid = 1, .worldid = 7977); //object(dk_cargoshp24d) (7)
    CreateDynamicObject(2885,-88.00000000,138.79998779,5103.00097656,0.00000000,0.00000000,92.00000000, .interiorid = 1, .worldid = 7977); //object(xref_garagedoor) (3)
    CreateDynamicObject(644,-115.00000000,140.30000305,5089.80004883,0.00000000,0.00000000,336.00000000, .interiorid = 1, .worldid = 7977); //object(pot_02) (1)
    CreateDynamicObject(2885,-146.00000000,140.19999695,5099.39990234,0.00000000,0.00000000,89.99401855, .interiorid = 1, .worldid = 7977); //object(xref_garagedoor) (4)
    CreateDynamicObject(3660,-130.89999390,137.50000000,5090.89990234,0.00000000,0.00000000,359.99499512, .interiorid = 1, .worldid = 7977); //object(lasairfbed_las) (4)
    CreateDynamicObject(1726,-142.00000000,137.29980469,5089.30004883,0.00000000,0.00000000,177.98400879, .interiorid = 1, .worldid = 7977); //object(mrk_seating2) (12)
    CreateDynamicObject(1726,-142.60000610,143.39999390,5089.39990234,0.00000000,0.00000000,359.98400879, .interiorid = 1, .worldid = 7977); //object(mrk_seating2) (13)
    CreateDynamicObject(1726,-135.19999695,143.39999390,5089.39990234,0.00000000,0.00000000,359.98352051, .interiorid = 1, .worldid = 7977); //object(mrk_seating2) (14)
    CreateDynamicObject(634,-73.50000000,161.10000610,5096.39990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(veg_palmkbb11) (1)
    CreateDynamicObject(634,-72.30000305,162.00000000,5096.39990234,0.00000000,0.00000000,342.00000000, .interiorid = 1, .worldid = 7977); //object(veg_palmkbb11) (2)
    CreateDynamicObject(634,-71.80000305,159.60000610,5096.19995117,0.00000000,0.00000000,341.99340820, .interiorid = 1, .worldid = 7977); //object(veg_palmkbb11) (3)
    CreateDynamicObject(1726,-66.80000305,157.89999390,5096.00000000,0.00000000,0.00000000,1.99450684, .interiorid = 1, .worldid = 7977); //object(mrk_seating2) (15)
    CreateDynamicObject(1726,-62.00000000,158.19999695,5096.00000000,0.00000000,0.00000000,1.99401855, .interiorid = 1, .worldid = 7977); //object(mrk_seating2) (16)
    CreateDynamicObject(626,-63.20000076,158.10000610,5098.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(veg_palmkb2) (6)
    CreateDynamicObject(14467,-58.60000229,139.10000610,5098.39990234,0.00000000,0.00000000,176.00000000, .interiorid = 1, .worldid = 7977); //object(carter_statue) (1)
    CreateDynamicObject(3524,-58.29999924,138.60000610,5097.69995117,0.00000000,0.00000000,190.00000000, .interiorid = 1, .worldid = 7977); //object(skullpillar01_lvs) (1)
    CreateDynamicObject(1726,-57.50000000,142.50000000,5096.00000000,0.00000000,0.00000000,179.98901367, .interiorid = 1, .worldid = 7977); //object(mrk_seating2) (17)
    CreateDynamicObject(3920,-72.69999695,172.60000610,5101.80004883,0.00000000,0.00000000,179.99450684, .interiorid = 1, .worldid = 7977); //object(lib_veg3) (4)
    CreateDynamicObject(10281,-68.99996948,188.19999695,5100.00000000,0.00000000,0.00000000,270.00000000, .interiorid = 1, .worldid = 7977); //object(michsign_sfe) (1)
    CreateDynamicObject(13831,-216.89999390,55.90000153,5106.00000000,0.00000000,0.00000000,120.00000000, .interiorid = 1, .worldid = 7977); //object(vinesign1_cunte01) (1)
    CreateDynamicObject(2985,-128.89999390,146.10000610,5089.39990234,0.00000000,0.00000000,82.00000000, .interiorid = 1, .worldid = 7977); //object(minigun_base) (1)
    CreateDynamicObject(2985,-122.40000153,146.19999695,5089.39990234,0.00000000,0.00000000,101.99096680, .interiorid = 1, .worldid = 7977); //object(minigun_base) (2)
    CreateDynamicObject(1557,-68.50000000,136.80000305,5096.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(gen_doorext19) (3)
    CreateDynamicObject(1557,-65.50000000,136.80000305,5096.00000000,0.00000000,0.00000000,180.00000000, .interiorid = 1, .worldid = 7977); //object(gen_doorext19) (4)
    CreateDynamicObject(626,-64.69999695,137.30000305,5098.00000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(veg_palmkb2) (7)
    CreateDynamicObject(1557,-155.07083130,110.18158722,5091.69995117,0.00000000,0.00000000,270.99951172, .interiorid = 1, .worldid = 7977); //object(gen_doorext19) (5)
    CreateDynamicObject(1557,-155.02281189,107.14344788,5091.69995117,0.00000000,0.00000000,90.74401855, .interiorid = 1, .worldid = 7977); //object(gen_doorext19) (6)
    CreateDynamicObject(1536,-157.60000610,101.80000305,5088.00000000,0.00000000,0.00000000,358.00000000, .interiorid = 1, .worldid = 7977); //object(gen_doorext15) (1)
    CreateDynamicObject(1665,-167.39999390,105.50000000,5092.50000000,0.00000000,0.00000000,346.00000000, .interiorid = 1, .worldid = 7977); //object(propashtray1) (2)
    CreateDynamicObject(1667,-166.60000610,105.69999695,5092.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(propwineglass1) (3)
    CreateDynamicObject(1668,-166.50000000,105.69999695,5092.60009766,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(propvodkabotl1) (4)
    CreateDynamicObject(2780,-152.50000000,123.29980469,5082.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(cj_smoke_mach) (1)
    CreateDynamicObject(2780,-153.09960938,112.69921875,5082.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(cj_smoke_mach) (2)
    CreateDynamicObject(10010,-191.80000305,139.30000305,5106.30004883,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(ugcarpark_sfe) (1)
    CreateDynamicObject(3113,-224.19999695,172.39999390,5109.00000000,0.00000000,0.00000000,274.00000000, .interiorid = 1, .worldid = 7977); //object(carrier_door_sfse) (6)
    CreateDynamicObject(3498,-39.20000076,157.69999695,5094.50000000,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(wdpillar01_lvs) (4)
    CreateDynamicObject(1254,-166.89999390,106.09999847,5092.19995117,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(killfrenzy) (1)
    CreateDynamicObject(1247,-165.85000610,140.39999390,5089.89990234,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(bribe) (1)
    CreateDynamicObject(19128,-72.38726807,190.34757996,5096.21337891,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(sw_bridge03) (1)
    CreateDynamicObject(19128,-76.37635040,190.35000610,5096.21337891,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(sw_bridge03) (2)
    CreateDynamicObject(19128,-72.38800049,186.36000061,5096.21337891,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(sw_bridge03) (3)
    CreateDynamicObject(19128,-76.37388611,186.37559509,5096.21337891,0.00000000,0.00000000,0.00000000, .interiorid = 1, .worldid = 7977); //object(sw_bridge03) (4)
    CreateDynamicObject(14455,-146.34352112,133.16000366,5091.00000000,0.00000000,0.00000000,89.24450684, .interiorid = 1, .worldid = 7977); //object(gs_bookcase) (7)
    CreateDynamicObject(14455,-146.18379211,143.35549927,5091.00000000,0.00000000,0.00000000,89.24194336, .interiorid = 1, .worldid = 7977); //object(gs_bookcase) (8)


    for(new i, Float: fPlayerPos[3]; i < MAX_PLAYERS; i++) {
	    if(GetPlayerVirtualWorld(i) != 0 || GetPlayerInterior(i) != 0) {
			Streamer_UpdateEx(i, fPlayerPos[0], fPlayerPos[1], fPlayerPos[2]);
			GetPlayerPos(i, fPlayerPos[0], fPlayerPos[1], fPlayerPos[2]);
			SetPlayerPos(i, fPlayerPos[0], fPlayerPos[1], fPlayerPos[2] + 2.5);
			TogglePlayerControllable(i, true);
		}
	}
	// Headroom for static objects - streamed limits are completely independent (cause of old crashing)
	Streamer_VisibleItems(STREAMER_TYPE_OBJECT, 965);
}
