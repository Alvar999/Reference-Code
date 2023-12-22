// Phuc vu - vi tri phuc vu
new Float:PhucVu[][8] = {
	{-1492.7103,812.8345,7.1853,358.9791},
	{-1505.9081,805.9636,7.1853,175.7008},
	{-1499.9263,789.0261,7.1875,224.8946},
	{-1506.0098,789.0264,7.1875,82.0133},
	{-1499.8601,796.4188,7.1875,176.3041},
	{-1499.2296,812.7950,7.1875,215.6396},
	{-1492.8088,806.2395,7.1875,228.6314},
	{-1499.4703,796.4224,7.1875,165.3374}
};

// tim  ---------------- PUBLIC FUNCTIONS ----------------- add ben duoi
// Phuc vu
forward ThoiGianPhucVu(playerid);
public ThoiGianPhucVu(playerid)
{
    SetPVarInt(playerid, "ThoiGianPhucVuTiepTheo", GetPVarInt(playerid, "ThoiGianPhucVuTiepTheo")-1);

    if(GetPVarInt(playerid, "ThoiGianPhucVuTiepTheo") > 0) SetTimerEx("ThoiGianPhucVu", 1000, 0, "d", playerid);

    if(GetPVarInt(playerid, "ThoiGianPhucVuTiepTheo") <= 0)
    {
        DeletePVar(playerid, "ThoiGianPhucVuTiepTheo");
	}
}

forward LayMonPhucVu(playerid);
public LayMonPhucVu(playerid)
{
    SetPVarInt(playerid, "LayMonPhucVuTime", GetPVarInt(playerid, "LayMonPhucVuTime")-1);
	new string[128];
	format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~n~~n~~w~%d giay", GetPVarInt(playerid, "LayMonPhucVuTime"));
	GameTextForPlayer(playerid, string, 1100, 3);

	if(GetPVarInt(playerid, "LayMonPhucVuTime") > 0) SetTimerEx("LayMonPhucVu", 1000, 0, "d", playerid);

	if(GetPVarInt(playerid, "LayMonPhucVuTime") <= 0)
	{
	    if(GetPVarInt(playerid, "MonPhucVu") == 1) // pizza
	    {
	        SetPlayerAttachedObject(playerid, 0, 2219, 5, 0.116, 0.045, 0.444999, -105.6, 19.1001, -7.80005, 1.000000, 1.000000, 1.000000, 0, 0);
	        TogglePlayerControllable(playerid, 1);
			ApplyAnimation(playerid,"CARRY","crry_prtial",4.1,1,0,0,1,1);
	    }
	    if(GetPVarInt(playerid, "MonPhucVu") == 2) // hamburger
	    {
	        SetPlayerAttachedObject(playerid, 0, 2222, 5, 0.211000, 0.062999, 0.143999, -85.100059, 4.400004, 17.500000, 1.000000, 1.000000, 1.000000, 0, 0);
	        TogglePlayerControllable(playerid, 1);
			ApplyAnimation(playerid,"CARRY","crry_prtial",4.1,1,0,0,1,1);
	    }
	    if(GetPVarInt(playerid, "MonPhucVu") == 3) // do an nhanh
	    {
	        SetPlayerAttachedObject(playerid, 0, 2217, 5, 0.211000, 0.015000, 0.380999, -109.400047, 19.400003, 6.700001, 1.000000, 1.000000, 1.000000, 0, 0);
	        TogglePlayerControllable(playerid, 1);
			ApplyAnimation(playerid,"CARRY","crry_prtial",4.1,1,0,0,1,1);
	    }
	    DeletePVar(playerid, "LayMonPhucVuTime");
        SetPVarInt(playerid, "DaLayMonPhucVu", 1);
		SetPlayerCheckpoint(playerid, PhucVu[GetPVarInt(playerid, "FloatPhucVu")][0], PhucVu[GetPVarInt(playerid, "FloatPhucVu")][1], PhucVu[GetPVarInt(playerid, "FloatPhucVu")][2], 1);
	}
}
////////////






////////////////////////////

    //add pickup xinviec
	CreateDynamicPickup(1239, 23, -1485.2335,809.6506,7.1853, -1); //phucvu

    //mapping
	CreateDynamicObject(1340, -1488.98694, 799.32776, 7.20000,   0.00000, 0.00000, 178.00000);
	CreateDynamicObject(19076, -1486.76575, 818.20587, 6.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1968, -1492.62488, 813.98560, 6.70000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1968, -1492.57129, 805.01343, 6.70000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1968, -1492.79590, 794.90710, 6.70000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1968, -1499.28564, 813.66101, 6.70000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1968, -1499.59192, 804.74377, 6.70000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1968, -1499.58398, 794.97522, 6.70000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3660, -1493.42676, 824.06494, 8.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3660, -1493.19360, 793.16699, 8.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3660, -1491.88843, 823.78168, 7.40518,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1597, -1502.35364, 798.75061, 9.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1597, -1502.56384, 817.82849, 9.00000,   0.00000, 0.00000, 0.00000);

    //add job
    case 23:  name = "Phuc Vu Quan";

    // /xinviec
    else if (IsPlayerInRangeOfPoint(playerid,3.0,-1485.2335,809.6506,7.1853)) {
			if(PlayerInfo[playerid][pJob] == 0){
				SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban da chac chan lua chon cong viec Nhan Vien Phuc VU, su dung /chapnhan congviec de hoan tat.");
				GettingJob[playerid] = 23;
				return 1;
			}
			if((PlayerInfo[playerid][pDonateRank] > 0 || PlayerInfo[playerid][pFamed] > 0) && PlayerInfo[playerid][pJob2] == 0) {
				SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Neu ban da chac chan lua chon cong viec Nhan Vien Phuc VU, su dung /chapnhan congviec de hoan tat.");
				SendClientMessageEx(playerid, COLOR_YELLOW, "Ban nhan them cong viec phu. Chi VIP/Famed moi  lam duoc dieu nay");
				GettingJob2[playerid] = 23;
				return 1;
			}
		}
////////////////////






//tim if (GetPVarInt(playerid, "_SwimmingActivity") > 0) add ben tren
if(IsPlayerInRangeOfPoint(playerid, 2, PhucVu[GetPVarInt(playerid, "FloatPhucVu")][0], PhucVu[GetPVarInt(playerid, "FloatPhucVu")][1], PhucVu[GetPVarInt(playerid, "FloatPhucVu")][2]))
	{
	    if(GetPVarInt(playerid, "DangDenChoPhucVu") == 1)
	    {
		    SetPVarInt(playerid, "DenNoiPhucVu", 1);
		    SendClientMessageEx(playerid, -1, "{CC0300}Phuc Vu: Hay hoi quy khach dung gi?((Nhap:{66FF66}Quy khach muon dung gi))");
		    DeletePVar(playerid, "DangDenChoPhucVu");
		    DisablePlayerCheckpoint(playerid);
		}
		if(GetPVarInt(playerid, "DaLayMonPhucVu") == 1)
		{
		    DisablePlayerCheckpoint(playerid);
		    RemovePlayerAttachedObject(playerid, 0);
			PlayerInfo[playerid][pCash] += 1500;
			new monphucvu[24];
		    if(GetPVarInt(playerid, "MonPhucVu") == 1) { monphucvu = "Com Suon"; }
		    if(GetPVarInt(playerid, "MonPhucVu") == 2) { monphucvu = "Nuot Ngot"; }
		    if(GetPVarInt(playerid, "MonPhucVu") == 3) { monphucvu = "Suat Do An Nhanh"; }
		    new string[128];
		    format(string, sizeof(string), "{CC0300}Phuc Vu: Ban da dua cho khach hang mot %s va nhan duoc $1500", monphucvu);
		    SetPVarInt(playerid, "ThoiGianPhucVuTiepTheo", 20);
		    SetTimerEx("ThoiGianPhucVu", 1000, 0, "d", playerid);
			SendClientMessageEx(playerid, -1, string);
			DeletePVar(playerid, "FloatPhucVu");
			DeletePVar(playerid, "MonPhucVu");
			DeletePVar(playerid, "DaLayMonPhucVu");
		}
	}
	if(GetPVarInt(playerid, "DaNhanMonPhucVu") == 1 && IsPlayerInRangeOfPoint(playerid, 2, -1490.0410,799.2444,7.1853))
	{
	    SetPVarInt(playerid, "LayMonPhucVuTime", 30);
		SetTimerEx("LayMonPhucVu", 3000, 0, "d", playerid);
		TogglePlayerControllable(playerid, 0);
		DisablePlayerCheckpoint(playerid);
		SendClientMessageEx(playerid, -1, "{CC0300}Phuc Vu: Nhan vien dang che bien mon an - Hay doi trong 30 giay");
	}

//tim public OnPlayerText add ben duoi
if(GetPVarInt(playerid, "DenNoiPhucVu") == 1)
	{
	    if(strcmp("Quy khach muon dung gi", text, true) == 0)
	    {

		    new randz = randomEx(1,3);

			DeletePVar(playerid, "DenNoiPhucVu");
		    SetPVarInt(playerid, "MonPhucVu", randz);
		    SetPVarInt(playerid, "DaNhanMonPhucVu", 1);

		    new monphucvu[24];
		    if(GetPVarInt(playerid, "MonPhucVu") == 1) { monphucvu = "Com Ga"; }
		    if(GetPVarInt(playerid, "MonPhucVu") == 2) { monphucvu = "Nuoc Ngot"; }
		    if(GetPVarInt(playerid, "MonPhucVu") == 3) { monphucvu = "Suat Do An Nhanh"; }

		    format(string, sizeof(string), "{66FF66}Khach Hang:{FFFFFF} Hay lay cho toi mot %s nhe!", monphucvu);
		    ProxDetector(10.0, playerid, string, -1, -1, -1, -1, -1, -1);

			SetPlayerCheckpoint(playerid, -1490.0410,799.2444,7.1853, 1);
		}
	}



//  add cuoi GM
CMD:phucvu(playerid, params[])
{
	if(PlayerInfo[playerid][pJob] == 23 || PlayerInfo[playerid][pJob2] == 23)
	{
	    if(GetPVarInt(playerid, "ThoiGianPhucVuTiepTheo") == 0)
	    {
			if(GetPVarInt(playerid, "DangDenChoPhucVu") == 1)
			{
		    	SendClientMessageEx(playerid, -1, "{CC0300}Phuc Vu: Ban dang di phuc vu roi!");
		    }
		    else
	    	{
			    new rand = random(sizeof(PhucVu));

			    SetPVarInt(playerid, "DangDenChoPhucVu", 1);
			    SetPlayerCheckpoint(playerid, PhucVu[rand][0], PhucVu[rand][1], PhucVu[rand][2], 1);
			    SetPVarInt(playerid, "FloatPhucVu", rand);
			}
		}
		else
		{
			new string[128];

	        format(string, sizeof(string), "{CC0300}Phuc Vu: Ban phai doi %d giay nua thi moi co the tiep tuc phuc vu!", GetPVarInt(playerid, "ThoiGianPhucVuTiepTheo"));
	        SendClientMessageEx(playerid, -1, string);
		}
	}
	else return SendClientMessageEx(playerid, -1, "{CC0300}Phuc Vu: Ban khong phai la Nguoi phuc vu!");
	return 1;
}