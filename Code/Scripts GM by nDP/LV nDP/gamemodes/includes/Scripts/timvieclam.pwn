// TIM VIEC LAM
#include <YSI\y_hooks>

#define         TIMVIECLAM_SELECT              (9583)
#define         TIMVIECLAM_LA                  (9584)
#define         TIMVIECLAM_LV                  (9585)
#define         TIMDUONG                       (9582)

CMD:timduong(playerid, params[]) {
   return ShowPlayerDialog(playerid, TIMDUONG, DIALOG_STYLE_LIST, "Ban Can Tim Duong Nao ?","HQ VIP\nCity Hall\n24/7\nDau Truong\nBank\nHQ LVPD\nBenh Vien\nHQ Taxi\nNha tho\nShop Quan Ao\nPizza\nVu Truong 609\nQuan Bar", "Chon", "Huy Bo");
}

CMD:timvieclam(playerid, params[]) {
    return ShowPlayerDialog(playerid, TIMVIECLAM_SELECT, DIALOG_STYLE_LIST, "Hay chon dia diem ban muon tim","Las Venturas", "Lua chon", "Tu choi");
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == TIMDUONG)
	{
	    if(response)
	    {
	       	if(listitem == 0) // tim duong VIP
		    {
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
				SetPlayerCheckpoint(playerid, 2027.8252,1007.2609,10.8203, 3.0);
                CP[playerid] = 252000;
				return 1;
			}
			if(listitem == 1) //city hall
		    {
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
				SetPlayerCheckpoint(playerid, 2018.2335,1157.9556,10.8203, 3.0);
                CP[playerid] = 252000;
				return 1;
			}
		    if(listitem == 2) //24/7
		    {
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
				SetPlayerCheckpoint(playerid, 2186.2104,1990.3622,10.8203, 3.0);
                CP[playerid] = 252000;
                return 1;
			}
			if(listitem == 3) //dau truong
		    {
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
				SetPlayerCheckpoint(playerid, 1951.4553,1342.9126,15.3746, 3.0);
                CP[playerid] = 252000;
                return 1;
			}
			if(listitem == 4) //bank
		    {
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
				SetPlayerCheckpoint(playerid,2127.7424,2365.5530,10.8203, 3.0);
                CP[playerid] = 252000;
                return 1;
			}
			if(listitem == 5) //lvpd
		    {
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
				SetPlayerCheckpoint(playerid,  2339.0845,2454.1475,14.9688, 3.0);
                CP[playerid] = 252000;
                return 1;
			}
			if(listitem == 6) //benh vien
		    {
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
				SetPlayerCheckpoint(playerid, 1609.6862,1859.2494,10.8203, 3.0);
                CP[playerid] = 252000;
                return 1;
			}
			if(listitem == 7) //taxi
		    {
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
				SetPlayerCheckpoint(playerid, 2156.8259,1437.4397,10.8125, 3.0);
                CP[playerid] = 252000;
                return 1;
			}
			if(listitem == 8) // nha tho
		    {
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
				SetPlayerCheckpoint(playerid, 1451.9030,751.5728,11.0234, 3.0);
                CP[playerid] = 252000;
                return 1;
			}
			if(listitem == 9) // Shop Quan Ao
		    {
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
				SetPlayerCheckpoint(playerid, 2015.4838,1106.0760,10.8203, 3.0);
                CP[playerid] = 252000;
                return 1;
			}
			if(listitem == 10) // Pizza
		    {
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
				SetPlayerCheckpoint(playerid, 1873.3809,2071.8438,11.0625, 3.0);
                CP[playerid] = 252000;
                return 1;
			}
			if(listitem == 11) // Vu Truong 609
		    {
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
				SetPlayerCheckpoint(playerid, 1882.3993,1380.7601,16.8370, 3.0);
                CP[playerid] = 252000;
                return 1;
			}
			if(listitem == 12) // Quan Bar
		    {
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
				SetPlayerCheckpoint(playerid, 1965.9565,1623.2001,12.8622, 3.0);
                CP[playerid] = 252000;
                return 1;
			}
		}
	}
	if(dialogid == TIMVIECLAM_SELECT)
	{
 		if(response)
		{
            if(CheckPointCheck(playerid)) {
              SendClientMessageEx(playerid, COLOR_WHITE, "Hay dam bao rang cac' checkpoints da duoc xoa bo ( ban dang co' 1 checkpoints , taxi hoac khac').");
              return 1;
            }
			if(listitem == 0) //Las Venturas
			{
                ShowPlayerDialog(playerid, TIMVIECLAM_LA, DIALOG_STYLE_LIST, "Cong viec ban can tim","(1)Cong nhan khai khoang\n(2) Giao Vat Lieu\n(3)Trucker\n(4)Phuc Vu\n(5)Pizza", "Lua chon", "Tu choi");
                PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
		    }
			if(listitem == 1) //Las Venturas
			{
                ShowPlayerDialog(playerid, TIMVIECLAM_LV, DIALOG_STYLE_LIST, "Cong viec ban can tim","(1)Cong nhan khai khoang\n(2) Giao Vat Lieu\n(3)Trucker\n(4)Phuc Vu\n(5)Pizza", "Lua chon", "Tu choi");
                PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
			}
		}
	}
	if(dialogid == TIMVIECLAM_LV)
	{
 		if(response)
		{
            if(CheckPointCheck(playerid)) {
              SendClientMessageEx(playerid, COLOR_WHITE, "Hay dam bao rang cac checkpoint da duoc xoa bo ((/xoamuctieu)).");
              return 1;
            }
            if(GetPVarInt(playerid,"truckj") != 0) return SendClientMessage(playerid, COLOR_RED, "Ban dang co mot mission. Hay hoan thanh truoc");
			if(listitem == 0) //Cong nhan khai khoang
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 595.6973,868.6672,-43.2296, 5);
                CP[playerid] = 252000;
		    }
			if(listitem == 1) //Giao vatlieu
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 2174.7271,964.0578,10.8203, 5);
                CP[playerid] = 252000;
            }
			if(listitem == 2) //Trucker
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 2260.5549,980.2856,10.8125, 5);
                CP[playerid] = 252000;
		    }
			if(listitem == 3) //Phuc vu
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 2089.0112,1073.0497,10.8130, 5);
                CP[playerid] = 252000;
		    }
			if(listitem == 4) //gai diem
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 2086.6702,1100.4303,10.8203, 5);//
                CP[playerid] = 252000;
		    }
			/*if(listitem == 5) //ban thuoc phien
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 1736.4161,2115.0662,12.2891, 5);
                CP[playerid] = 252000;
		    }
			if(listitem == 6) //body guard
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 1972.6708,2295.3816,16.4559, 5);
                CP[playerid] = 252000;
		    }
			if(listitem == 7) //tho sua xe
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 2391.8142,1041.6357,10.8203, 5);
                CP[playerid] = 252000;
		    }
			if(listitem == 8) //buon sung
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 2157.2087,949.2068,10.8203, 5);
                CP[playerid] = 252000;
		    }
			if(listitem == 9) //craftman
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 1456.7424,969.1154,10.8203, 5);
                CP[playerid] = 252000;
		    }
			if(listitem == 10) //bartender
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 1966.6454,1622.9785,12.8636, 5);
                CP[playerid] = 252000;
		    }
			if(listitem == 11) //boxer
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 1972.6708,2295.3816,16.4559, 5);
                CP[playerid] = 252000;
		    }
			if(listitem == 12) //taxi driver
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 2171.6638,1395.7363,11.0625, 5);
                CP[playerid] = 252000;
		    }
			if(listitem == 13) //buon thuoc phien
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 1404.1747,1172.9010,10.8203, 5);
                CP[playerid] = 252000;
		    }
		    if(listitem == 14) //Ban Kem
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 1894.9368,1164.1318,10.8203, 5);
                CP[playerid] = 252000;
		    }
		    if(listitem == 15) //Lay Go
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 1529.3918,1016.8020,10.8203, 5);
                CP[playerid] = 252000;
		    }*/
		}
	}
	if(dialogid == TIMVIECLAM_LA)
	{
 		if(response)
		{
            if(CheckPointCheck(playerid)) {
              SendClientMessageEx(playerid, COLOR_WHITE, "Hay dam bao rang cac' checkpoints da duoc xoa bo ( ban dang co' 1 checkpoints , taxi hoac khac').");
              return 1;
            }
			if(listitem == 0) //trucker
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 595.6973,868.6672,-43.2296, 5);
                CP[playerid] = 252000;
		    }
			if(listitem == 1) //pizza
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 2174.7271,964.0578,10.8203, 5);
                CP[playerid] = 252000;
            }
			if(listitem == 2) //tham tu
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 2260.5549,980.2856,10.8125, 5);
                CP[playerid] = 252000;
		    }
			if(listitem == 3) //luat su
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 2089.0112,1073.0497,10.8130, 5);
                CP[playerid] = 252000;
		    }
			if(listitem == 4) //gai diem
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 2086.6702,1100.4303,10.8203, 5);//
                CP[playerid] = 252000;
		    }
			/*if(listitem == 5) //ban thuoc phien
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 1736.4161,2115.0662,12.2891, 5);
                CP[playerid] = 252000;
		    }
			if(listitem == 6) //body guard
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 1972.6708,2295.3816,16.4559, 5);
                CP[playerid] = 252000;
		    }
			if(listitem == 7) //tho sua xe
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 2391.8142,1041.6357,10.8203, 5);
                CP[playerid] = 252000;
		    }
			if(listitem == 8) //buon sung
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 2157.2087,949.2068,10.8203, 5);
                CP[playerid] = 252000;
		    }
			if(listitem == 9) //craftman
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 1456.7424,969.1154,10.8203, 5);
                CP[playerid] = 252000;
		    }
			if(listitem == 10) //bartender
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 1966.6454,1622.9785,12.8636, 5);
                CP[playerid] = 252000;
		    }
			if(listitem == 11) //boxer
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 1972.6708,2295.3816,16.4559, 5);
                CP[playerid] = 252000;
		    }
			if(listitem == 12) //taxi driver
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 2093.3647,1388.9323,10.8203, 5);
                CP[playerid] = 252000;
		    }
			if(listitem == 13) //buon thuoc phien
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 1404.1747,1172.9010,10.8203, 5);
                CP[playerid] = 252000;
		    }
		    if(listitem == 14) //Ban Kem
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 1894.9368,1164.1318,10.8203, 5);
                CP[playerid] = 252000;
		    }
		    if(listitem == 15) //Lay Go
			{
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
                SetPlayerCheckpoint(playerid, 1529.3918,1016.8020,10.8203, 5);
                CP[playerid] = 252000;
		    }*/
		}
	}
	return 1;
}

