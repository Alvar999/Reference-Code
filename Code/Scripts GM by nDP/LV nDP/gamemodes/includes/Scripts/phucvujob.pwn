//============================== BE PHUONG 3 TUOI ============================//
//========================== fb.com/nguyenduyphuong.dz =======================//

#include <YSI\y_hooks>
//==============================================//
    //Actor Phuc vu
/*	NPCJobPhucVu = CreateActor(155,2090.7390,1079.3472,10.8203,177.8919);

	NPCPhucVu[0] = CreateActor(2,2103.1838,1078.6117,10.8056,90.8139);
	NPCPhucVu[1] = CreateActor(55,2098.7219,1074.9637,10.8111,269.6478);
	NPCPhucVu[2] = CreateActor(67,2103.2380,1071.4246,10.8056,88.8109);

	ApplyActorAnimation(NPCJobPhucVu, "BD_FIRE", "wash_up", 4.0, 1, 0, 0, 0, 0);

	ApplyActorAnimation(NPCPhucVu[0], "ped", "SEAT_down", 4.0, 0, 0, 0, 1, 0);
	ApplyActorAnimation(NPCPhucVu[1], "ped", "SEAT_down", 4.0, 0, 0, 0, 1, 0);
	ApplyActorAnimation(NPCPhucVu[2], "ped", "SEAT_down", 4.0, 0, 0, 0, 1, 0);*/
	//======================================================================//


//==========================================//
// Phuc vu
//new NPCJobPhucVu;
//new NPCPhucVu[3];
// Phuc vu
new Float:PhucVu[][4] = {
    {2095.7156,1070.4266,10.8203},
	{2102.8918,1070.5966,10.8060},
	{2098.9490,1075.6288,10.8108},
	{2102.7642,1077.0493,10.8061}
};
//=========================================//

hook OnPlayerConnect(playerid)
{
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

hook OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
hook OnPlayerText(playerid, text[])
{
    if(GetPVarInt(playerid, "DenNoiPhucVu") == 1)
	{
	    if(strcmp("Quy khach muon dung gi", text, true) == 0)
	    {

		    new randz = randomEx(1,3);

			DeletePVar(playerid, "DenNoiPhucVu");
		    SetPVarInt(playerid, "MonPhucVu", randz);
		    SetPVarInt(playerid, "DaNhanMonPhucVu", 1);

		    new monphucvu[24], string[128];
		    if(GetPVarInt(playerid, "MonPhucVu") == 1) { monphucvu = "Pizza"; }
		    if(GetPVarInt(playerid, "MonPhucVu") == 2) { monphucvu = "Hamburger"; }
		    if(GetPVarInt(playerid, "MonPhucVu") == 3) { monphucvu = "Suat Do An Nhanh"; }

		    format(string, sizeof(string), "{66FF66}Khach Hang:{FFFFFF} Hay lay cho toi mot %s nhe!", monphucvu);
		    ProxDetector(10.0, playerid, string, -1, -1, -1, -1, -1, -1);

			SetPlayerCheckpoint(playerid, 2090.2878,1076.7091,10.8203, 1);
		}
	}
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if((newkeys & KEY_HANDBRAKE) && (newkeys & KEY_YES))
	{
	    if(IsPlayerInRangeOfActor(playerid, NPCJobPhucVu))
	    {
	        if(PlayerInfo[playerid][pJob] != 0 && PlayerInfo[playerid][pJob2] != 0)
	        {
	            SendClientMessageEx(playerid, -1, "{CC0000}[HE THONG]:{FFFFFF} Ban da co hay cong viec hay go: /quitjob 1 hoac /quitjob 2");
			}
			if(PlayerInfo[playerid][pJob] == 0)
			{
			    PlayerInfo[playerid][pJob] = 23;
			    SendClientMessageEx(playerid, -1, "{CC0000}[HE THONG]:{FFFFFF} Ban da xin thanh cong job Phuc vu - go: /phucvu de bat dau cong viec");
			}
			if(PlayerInfo[playerid][pJob2] == 0)
			{
			    PlayerInfo[playerid][pJob2] = 23;
			    SendClientMessageEx(playerid, -1, "{CC0000}[HE THONG]:{FFFFFF} Ban da xin thanh cong job Phuc vu - go: /phucvu de bat dau cong viec");
			    SendClientMessageEx(playerid, COLOR_YELLOW, "Day la cong viec thu 2 cua ban");
			}
		}
	}
    return 1;
}

hook OnPlayerEnterCheckpoint(playerid)
{
    if(IsPlayerInRangeOfPoint(playerid, 2, PhucVu[GetPVarInt(playerid, "FloatPhucVu")][0], PhucVu[GetPVarInt(playerid, "FloatPhucVu")][1], PhucVu[GetPVarInt(playerid, "FloatPhucVu")][2]))
	{
	    if(GetPVarInt(playerid, "DangDenChoPhucVu") == 1)
	    {
		    SetPVarInt(playerid, "DenNoiPhucVu", 1);
		    SendClientMessageEx(playerid, -1, "{CC0000}[HE THONG]:{FFFFFF}Hay hoi quy khach dung gi?((Bang cach nhan T roi nhap:{66FF66}Quy khach muon dung gi{FFFFFF}))");
		    DeletePVar(playerid, "DangDenChoPhucVu");
		    DisablePlayerCheckpoint(playerid);
		}
		if(GetPVarInt(playerid, "DaLayMonPhucVu") == 1)
		{
		    DisablePlayerCheckpoint(playerid);
		    RemovePlayerAttachedObject(playerid, 0);
			PlayerInfo[playerid][pCash] += 2000;
			new monphucvu[24];
		    if(GetPVarInt(playerid, "MonPhucVu") == 1) { monphucvu = "Pizza"; }
		    if(GetPVarInt(playerid, "MonPhucVu") == 2) { monphucvu = "Hamburger"; }
		    if(GetPVarInt(playerid, "MonPhucVu") == 3) { monphucvu = "Suat Do An Nhanh"; }
		    new string[128];
		    format(string, sizeof(string), "{CC0000}[HE THONG]:{FFFFFF} Ban da dua cho khach hang mot %s va nhan duoc $2000", monphucvu);
		    SetPVarInt(playerid, "ThoiGianPhucVuTiepTheo", 20);
		    SetTimerEx("ThoiGianPhucVu", 1000, 0, "d", playerid);
			SendClientMessageEx(playerid, -1, string);
			DeletePVar(playerid, "FloatPhucVu");
			DeletePVar(playerid, "MonPhucVu");
			DeletePVar(playerid, "DaLayMonPhucVu");
		}
	}
	if(GetPVarInt(playerid, "DaNhanMonPhucVu") == 1 && IsPlayerInRangeOfPoint(playerid, 2, 2090.2878,1076.7091,10.8203))
	{
	    SetPVarInt(playerid, "LayMonPhucVuTime", 10);
		SetTimerEx("LayMonPhucVu", 1000, 0, "d", playerid);
		TogglePlayerControllable(playerid, 0);
		DisablePlayerCheckpoint(playerid);
		SendClientMessageEx(playerid, -1, "{CC0000}[HE THONG]:{FFFFFF} Nhan vien dang che bien mon an - Hay doi trong 10 giay");
	}
    return 1;
}



//==========================================================================//
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


//============================================================================//
// PHUC VU
CMD:phucvu(playerid, params[])
{
	if(PlayerInfo[playerid][pJob] == 23 || PlayerInfo[playerid][pJob2] == 23)
	{
	    if(GetPVarInt(playerid, "ThoiGianPhucVuTiepTheo") == 0)
	    {
			if(GetPVarInt(playerid, "DangDenChoPhucVu") == 1)
			{
		    	SendClientMessageEx(playerid, -1, "{CC0000}[HE THONG]:{FFFFFF} Ban dang di phuc vu roi!");
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

	        format(string, sizeof(string), "{CC0000}[HE THONG]: Ban phai doi %d giay nua thi moi co the tiep tuc phuc vu!", GetPVarInt(playerid, "ThoiGianPhucVuTiepTheo"));
	        SendClientMessageEx(playerid, -1, string);
		}
	}
	else return SendClientMessageEx(playerid, -1, "{CC0000}[HE THONG]:{FFFFFF} Ban khong phai la Nguoi phuc vu!");
	return 1;
}
