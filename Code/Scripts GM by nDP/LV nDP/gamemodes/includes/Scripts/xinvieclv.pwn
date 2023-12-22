#include <YSI\y_hooks>

/*stock GetJobName(job)
{
	new name[20];
	switch(job)
	{ // name
		case 1: name = "Tham tu";
		case 2: name = "Luat su";
		case 3: name = "Gai diem";
		case 4: name = "Drugs Dealer";
		//case 5: name = "Car Jacker";
		case 6: name = "News Reporter";
		case 7: name = "Sua xe";
		case 8: name = "Bodyguard";
		case 9: name = "Arms Dealer";
		case 10: name = "Car Dealer";
		case 12: name = "Boxer";
		case 14: name = "Drug Smuggler";
		case 15: name = "Paper Boy";
		case 16: name = "Trucker";
		case 17: name = "Taxi Driver";
		case 18: name = "Tho thu cong";
		case 19: name = "Bartender";
		case 20: name = "Trucker";
		case 21: name = "Pizza Boy";
		case 22: name = "Tho moc";
		case 23: name = "Ban kem";
		case 30: name = "Giao hang";
		default: name = "That nghiep";
	}
	return name;
}*/

//
CMD:xinviec(playerid, params[])
{
    if(PlayerInfo[playerid][pDonateRank] > 0) {
        if(PlayerInfo[playerid][pJob] == 0 || PlayerInfo[playerid][pJob2] == 0) {
            if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,251.99, 117.36, 1003.22)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Tham tu, go /chapnhan congviec.");
                GettingJob[playerid] = 1;
                return 1;
            }
            if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,301.042633, 178.700408, 1007.171875)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Tham tu, go /chapnhan congviec.");
                GettingJob[playerid] = 1;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,2443.4622,2383.0811,12.1641)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Luat su, go /chapnhan congviec.");
                GettingJob[playerid] = 2;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1215.1304,-11.8431,1000.9219)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Gai diem, go /chapnhan congviec.");
                GettingJob[playerid] = 3;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1736.4161,2115.0662,12.2891)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Dai Ly Thuoc, go /chapnhan congviec.");
                GettingJob[playerid] = 4;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,2005.7385, 2320.3533, 9.8157)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Dai Ly Thuoc, go /chapnhan congviec.");
                GettingJob[playerid] = 4;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1972.6708,2295.3816,16.4559)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Bodyguard, go /chapnhan congviec.");
                GettingJob[playerid] = 8;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,-2269.256103, -158.054321, 35.320312)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Bodyguard, go /chapnhan congviec.");
                GettingJob[playerid] = 8;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1972.7172,2294.8706,16.4559)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Bodyguard, go /chapnhan congviec.");
                GettingJob[playerid] = 8;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,2391.8142,1041.6357,10.8203)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Tho sua xe, go /chapnhan congviec.");
                GettingJob[playerid] = 7;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1643.8378,-1821.8094,13.3589)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Tho sua xe, go /chapnhan congviec.");
                GettingJob[playerid] = 7;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,2226.1716,-1718.1792,13.5165)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Bodyguard, go /chapnhan congviec.");
                GettingJob[playerid] = 8;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1099.73,-1504.67,15.800)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Bodyguard, go /chapnhan congviec.");
                GettingJob[playerid] = 8;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1972.7172,2294.8706,16.4559)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Bodyguard, go /chapnhan congviec.");
                GettingJob[playerid] = 8;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1366.4325,-1275.2096,13.5469)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Ban Vu Khi, go /chapnhan congviec.");
                GettingJob[playerid] = 9;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,2157.2087,949.2068,10.8203)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Ban Vu Khi, go /chapnhan congviec.");
                GettingJob[playerid] = 9;
                return 1;
            }
            /*else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,531.7930,-1292.4044,17.2422)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Car Dealer, go /chapnhan congviec.");
                GettingJob[playerid] = 10;
                return 1;
            }*/
            else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,766.0804,14.5133,1000.7004)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Boxer, go /chapnhan congviec.");
                GettingJob[playerid] = 12;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,758.98, -60.32, 1000.78)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Boxer, go /chapnhan congviec.");
                GettingJob[playerid] = 12;
                return 1;
            }
            /*else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,-2040.9436,456.2395,35.1719)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Paper Boy, go /chapnhan congviec.");
                GettingJob[playerid] = 15;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,-77.7288,-1136.3896,1.0781)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Trucker, go /chapnhan congviec.");
                GettingJob[playerid] = 16;
                return 1;
            }*/
            else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1404.1747,1172.9010,10.8203)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Drug Smuggler, go /chapnhan congviec.");
                GettingJob[playerid] = 14;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1741.5199,-1863.4615,13.5750)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Taxi Driver, go /chapnhan congviec.");
                GettingJob[playerid] = 17;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,2093.4395,1389.1838,10.8203)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Taxi Driver, go /chapnhan congviec.");
                GettingJob[playerid] = 17;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1456.7424,969.1154,10.8203)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Tho thu cong, go /chapnhan congviec.");
                GettingJob[playerid] = 18;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,502.6696,-11.6603,1000.6797)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Bartender, go /chapnhan congviec.");
                GettingJob[playerid] = 19;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1529.4406,1016.8257,10.8203)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Tho moc, go /chapnhan congviec.");
                GettingJob[playerid] = 22;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1895.0065,1164.3719,10.8203)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot nguoi Ban kem, go /chapnhan congviec.");
                GettingJob[playerid] = 23;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1889.7041,2072.9360,11.0625)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Pizza Boy, go /chapnhan congviec.");
                GettingJob[playerid] = 21;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1582.6765,2322.8086,10.8203)) {
  					SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Trucker, go /chapnhan congviec.");
    				GettingJob[playerid] = 20;
      				return 1;
			}
            if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,251.99, 117.36, 1003.22)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Tham tu, go /chapnhan congviec.");
                SendClientMessageEx(playerid, COLOR_YELLOW, "VIP: Ban dang muon nhan cong viec thu hai. Chi co VIPs moi co the lam dieu nay.");
                GettingJob2[playerid] = 1;
                return 1;
            }
            if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,301.042633, 178.700408, 1007.171875)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Tham Tu, go /chapnhan congviec.");
                SendClientMessageEx(playerid, COLOR_YELLOW, "VIP: Ban dang muon nhan cong viec thu hai. Chi co VIPs moi co the lam dieu nay.");
                GettingJob2[playerid] = 1;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,2443.4622,2383.0811,12.1641)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Luat su, go /chapnhan congviec.");
                SendClientMessageEx(playerid, COLOR_YELLOW, "VIP: Ban dang muon nhan cong viec thu hai. Chi co VIPs moi co the lam dieu nay.");
                GettingJob2[playerid] = 2;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1215.1304,-11.8431,1000.9219)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Gai diem, go /chapnhan congviec.");
                SendClientMessageEx(playerid, COLOR_YELLOW, "VIP: Ban dang muon nhan cong viec thu hai. Chi co VIPs moi co the lam dieu nay.");
                GettingJob2[playerid] = 3;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1736.4161,2115.0662,12.2891)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Dai Ly Thuoc, go /chapnhan congviec.");
                SendClientMessageEx(playerid, COLOR_YELLOW, "VIP: Ban dang muon nhan cong viec thu hai. Chi co VIPs moi co the lam dieu nay.");
                GettingJob2[playerid] = 4;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,2005.7385, 2320.3533, 9.8157)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Dai Ly Thuoc, go /chapnhan congviec.");
                SendClientMessageEx(playerid, COLOR_YELLOW, "VIP: Ban dang muon nhan cong viec thu hai. Chi co VIPs moi co the lam dieu nay.");
                GettingJob2[playerid] = 4;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1972.6708,2295.3816,16.4559)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Bodyguard, go /chapnhan congviec.");
                SendClientMessageEx(playerid, COLOR_YELLOW, "VIP: Ban dang muon nhan cong viec thu hai. Chi co VIPs moi co the lam dieu nay.");
                GettingJob2[playerid] = 8;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,-2269.256103, -158.054321, 35.320312)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Bodyguard, go /chapnhan congviec.");
                SendClientMessageEx(playerid, COLOR_YELLOW, "VIP: Ban dang muon nhan cong viec thu hai. Chi co VIPs moi co the lam dieu nay.");
                GettingJob2[playerid] = 8;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1972.7172,2294.8706,16.4559)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Bodyguard, go /chapnhan congviec.");
                SendClientMessageEx(playerid, COLOR_YELLOW, "VIP: Ban dang muon nhan cong viec thu hai. Chi co VIPs moi co the lam dieu nay.");
                GettingJob2[playerid] = 8;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,2391.8142,1041.6357,10.8203)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Tho sua xe, go /chapnhan congviec.");
                SendClientMessageEx(playerid, COLOR_YELLOW, "VIP: Ban dang muon nhan cong viec thu hai. Chi co VIPs moi co the lam dieu nay.");
                GettingJob2[playerid] = 7;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 1643.8378,-1821.8094,13.3589)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Tho sua xe, go /chapnhan congviec.");
                SendClientMessageEx(playerid, COLOR_YELLOW, "VIP: Ban dang muon nhan cong viec thu hai. Chi co VIPs moi co the lam dieu nay.");
                GettingJob2[playerid] = 7;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 2226.1716,-1718.1792,13.5165)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Bodyguard, go /chapnhan congviec.");
                SendClientMessageEx(playerid, COLOR_YELLOW, "VIP: Ban dang muon nhan cong viec thu hai. Chi co VIPs moi co the lam dieu nay.");
                GettingJob2[playerid] = 8;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 1099.73,-1504.67,15.800)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Bodyguard, go /chapnhan congviec.");
                SendClientMessageEx(playerid, COLOR_YELLOW, "VIP: Ban dang muon nhan cong viec thu hai. Chi co VIPs moi co the lam dieu nay.");
                GettingJob2[playerid] = 8;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 1972.7172,2294.8706,16.4559)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Bodyguard, go /chapnhan congviec.");
                SendClientMessageEx(playerid, COLOR_YELLOW, "VIP: Ban dang muon nhan cong viec thu hai. Chi co VIPs moi co the lam dieu nay.");
                GettingJob2[playerid] = 8;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 1366.4325,-1275.2096,13.5469)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Ban Vu Khi, go /chapnhan congviec.");
                SendClientMessageEx(playerid, COLOR_YELLOW, "VIP: Ban dang muon nhan cong viec thu hai. Chi co VIPs moi co the lam dieu nay.");
                GettingJob2[playerid] = 9;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 2157.2087,949.2068,10.8203)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Ban Vu Khi, go /chapnhan congviec.");
                SendClientMessageEx(playerid, COLOR_YELLOW, "VIP: Ban dang muon nhan cong viec thu hai. Chi co VIPs moi co the lam dieu nay.");
                GettingJob2[playerid] = 9;
                return 1;
            }
            /*else if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 531.7930,-1292.4044,17.2422)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Car Dealer, go /chapnhan congviec.");
                SendClientMessageEx(playerid, COLOR_YELLOW, "VIP: Ban dang muon nhan cong viec thu hai. Chi co VIPs moi co the lam dieu nay.");
                GettingJob2[playerid] = 10;
                return 1;
            }*/
            else if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 766.0804,14.5133,1000.7004)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Boxer, go /chapnhan congviec.");
                SendClientMessageEx(playerid, COLOR_YELLOW, "VIP: Ban dang muon nhan cong viec thu hai. Chi co VIPs moi co the lam dieu nay.");
                GettingJob2[playerid] = 12;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 758.98, -60.32, 1000.78)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Boxer, go /chapnhan congviec.");
                SendClientMessageEx(playerid, COLOR_YELLOW, "VIP: Ban dang muon nhan cong viec thu hai. Chi co VIPs moi co the lam dieu nay.");
                GettingJob2[playerid] = 12;
                return 1;
            }
            /*else if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -2040.9436,456.2395,35.1719)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Paper Boy, go /chapnhan congviec.");
                SendClientMessageEx(playerid, COLOR_YELLOW, "VIP: Ban dang muon nhan cong viec thu hai. Chi co VIPs moi co the lam dieu nay.");
                GettingJob2[playerid] = 15;
                return 1;
            }*
            else if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -77.7288,-1136.3896,1.0781)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Trucker, go /chapnhan congviec.");
                SendClientMessageEx(playerid, COLOR_YELLOW, "VIP: Ban dang muon nhan cong viec thu hai. Chi co VIPs moi co the lam dieu nay.");
                GettingJob2[playerid] = 16;
                return 1;
            }*/
            else if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 1404.1747,1172.9010,10.8203)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Drug Smuggler, go /chapnhan congviec.");
                SendClientMessageEx(playerid, COLOR_YELLOW, "VIP: Ban dang muon nhan cong viec thu hai. Chi co VIPs moi co the lam dieu nay.");
                GettingJob2[playerid] = 14;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 1741.5199,-1863.4615,13.5750)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Taxi Driver, go /chapnhan congviec.");
                SendClientMessageEx(playerid, COLOR_YELLOW, "VIP: Ban dang muon nhan cong viec thu hai. Chi co VIPs moi co the lam dieu nay.");
                GettingJob2[playerid] = 17;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 2093.4395,1389.1838,10.8203)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Taxi Driver, go /chapnhan congviec.");
                SendClientMessageEx(playerid, COLOR_YELLOW, "VIP: Ban dang muon nhan cong viec thu hai. Chi co VIPs moi co the lam dieu nay.");
                GettingJob2[playerid] = 17;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 1456.7424,969.1154,10.8203)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Tho thu cong, go /chapnhan congviec.");
                SendClientMessageEx(playerid, COLOR_YELLOW, "VIP: Ban dang muon nhan cong viec thu hai. Chi co VIPs moi co the lam dieu nay.");
                GettingJob2[playerid] = 18;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 502.6696,-11.6603,1000.6797)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Bartender, go /chapnhan congviec.");
                GettingJob2[playerid] = 19;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1529.4406,1016.8257,10.8203)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Tho moc, go /chapnhan congviec.");
                GettingJob2[playerid] = 22;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1895.0065,1164.3719,10.8203)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot nguoi Ban kem, go /chapnhan congviec.");
                GettingJob2[playerid] = 23;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1889.7041,2072.9360,11.0625)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Pizza Boy, go /chapnhan congviec.");
                GettingJob2[playerid] = 21;
                return 1;
            }
            else if (PlayerInfo[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 1582.6765,2322.8086,10.8203)) {
  					SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Trucker, go /chapnhan congviec.");
    				GettingJob2[playerid] = 20;
      				return 1;
            }
            else {
                SendClientMessageEx(playerid, COLOR_GREY, "Ban khong dung o dia diem nhan viec!");
            }
        }
        else {
            SendClientMessageEx(playerid, COLOR_GREY, "Ban da co 2 cong viec, su dung /thoatnghe truoc tien!");
        }
    }
    else {
        if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 251.99, 117.36, 1003.22)) {
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Tham tu, go /chapnhan congviec.");
            GettingJob[playerid] = 1;
            return 1;
        }
        if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,301.042633, 178.700408, 1007.171875)) {
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Tham tu, go /chapnhan congviec.");
            GettingJob[playerid] = 1;
            return 1;
        }
        else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,2443.4622,2383.0811,12.1641)) {
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Luat su, go /chapnhan congviec.");
            GettingJob[playerid] = 2;
            return 1;
        }
        else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1215.1304,-11.8431,1000.9219)) {
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Gai diem, go /chapnhan congviec.");
            GettingJob[playerid] = 3;
            return 1;
        }
        else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1736.4161,2115.0662,12.2891)) {
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Dai Ly Thuoc, go /chapnhan congviec.");
            GettingJob[playerid] = 4;
            return 1;
        }
        else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,2005.7385, 2320.3533, 9.8157)) {
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Dai Ly Thuoc, go /chapnhan congviec.");
            GettingJob[playerid] = 4;
            return 1;
        }
        else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1972.6708,2295.3816,16.4559)) {
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Bodyguard, go /chapnhan congviec.");
            GettingJob[playerid] = 8;
            return 1;
        }
        else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,-2269.256103, -158.054321, 35.320312)) {
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Bodyguard, go /chapnhan congviec.");
            GettingJob[playerid] = 8;
            return 1;
        }
        else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1972.7172,2294.8706,16.4559)) {
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Bodyguard, go /chapnhan congviec.");
            GettingJob[playerid] = 8;
            return 1;
        }
        else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,2391.8142,1041.6357,10.8203)) {
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Tho sua xe, go /chapnhan congviec.");
            GettingJob[playerid] = 7;
            return 1;
        }
        else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1643.8378,-1821.8094,13.3589)) {
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Tho sua xe, go /chapnhan congviec.");
            GettingJob[playerid] = 7;
            return 1;
        }
        else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,2226.1716,-1718.1792,13.5165)) {
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Bodyguard, go /chapnhan congviec.");
            GettingJob[playerid] = 8;
            return 1;
        }
        else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1099.73,-1504.67,15.800)) {
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Bodyguard, go /chapnhan congviec.");
            GettingJob[playerid] = 8;
            return 1;
        }
        else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1972.7172,2294.8706,16.4559)) {
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Bodyguard, go /chapnhan congviec.");
            GettingJob[playerid] = 8;
            return 1;
        }
        else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1366.4325,-1275.2096,13.5469)) {
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Ban Vu Khi, go /chapnhan congviec.");
            GettingJob[playerid] = 9;
            return 1;
        }
        else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,2157.2087,949.2068,10.8203)) {
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Ban Vu Khi, go /chapnhan congviec.");
            GettingJob[playerid] = 9;
            return 1;
        }
        else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,531.7930,-1292.4044,17.2422)) {
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Car Dealer, go /chapnhan congviec.");
            GettingJob[playerid] = 10;
            return 1;
        }
        else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,766.0804,14.5133,1000.7004)) {
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Boxer, go /chapnhan congviec.");
            GettingJob[playerid] = 12;
            return 1;
        }
        else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,758.98, -60.32, 1000.78)) {
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Boxer, go /chapnhan congviec.");
            GettingJob[playerid] = 12;
            return 1;
        }
        else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,-2040.9436,456.2395,35.1719)) {
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Paper Boy, go /chapnhan congviec.");
            GettingJob[playerid] = 15;
            return 1;
        }
        /*else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,-77.7288,-1136.3896,1.0781)) {
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Trucker, go /chapnhan congviec.");
            GettingJob[playerid] = 16;
            return 1;
        }*/
        else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1404.1747,1172.9010,10.8203)) {
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Drug Smuggler, go /chapnhan congviec.");
            GettingJob[playerid] = 14;
            return 1;
        }
        else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1741.5199,-1863.4615,13.5750)) {
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Taxi Driver, go /chapnhan congviec.");
            GettingJob[playerid] = 17;
            return 1;
        }
        else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,2093.4395,1389.1838,10.8203)) {
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Taxi Driver, go /chapnhan congviec.");
            GettingJob[playerid] = 17;
            return 1;
        }
        else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1456.7424,969.1154,10.8203)) {
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Tho thu cong, go /chapnhan congviec.");
            GettingJob[playerid] = 18;
            return 1;
        }
        else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,502.6696,-11.6603,1000.6797)) {
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Bartender, go /chapnhan congviec.");
            GettingJob[playerid] = 19;
            return 1;
        }
        else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1529.4406,1016.8257,10.8203)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Tho moc, go /chapnhan congviec.");
                GettingJob[playerid] = 22;
                return 1;
        }
        else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1895.0065,1164.3719,10.8203)) {
                SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot nguoi Ban kem, go /chapnhan congviec.");
                GettingJob[playerid] = 23;
                return 1;
        }
        else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1889.7041,2072.9360,11.0625)) {
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Pizza Boy, go /chapnhan congviec.");
            GettingJob[playerid] = 21;
            return 1;
        }
        else if (PlayerInfo[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid,3.0,1582.6765,2322.8086,10.8203)) {
  				SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban chac chan tro thanh mot Trucker, go /chapnhan congviec.");
    			GettingJob[playerid] = 20;
      			return 1;
        }
        else if (PlayerInfo[playerid][pJob] > 0) {
            SendClientMessageEx(playerid, COLOR_GREY, "Ban da co mot cong viec, su dung /thoatnghe truoc!");
            SendClientMessageEx(playerid, COLOR_YELLOW, "VIP: Chi vip moi co the nhan duoc 2 cong viec 1 luc");
        }
    }
    return 1;
}
