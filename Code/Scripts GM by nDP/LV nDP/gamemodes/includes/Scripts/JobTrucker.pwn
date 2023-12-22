//============================== BE PHUONG 3 TUOI ============================//
//========================== fb.com/nguyenduyphuong.dz =======================//
// HE THONG TRUCKER by nDP


#include <YSI\y_hooks>

#define      LAYHANGTRUCKER          (16752)
#define 	 RUTTIENTRUCK     			(16753)
#define 	 TRUCKJOB     			(16754)

//============================================================================//
new bool:trucker[MAX_PLAYERS];
new bool:truck[MAX_PLAYERS];

//new Actor_Truck;
//============================================================================//

stock IsACarTrucker(carid)
{
	for(new v = 0; v < sizeof(CarTrucker); v++) {
	    if(carid == CarTrucker[v]) return 1;
	}
	return 0;
}
//============================================================================//
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
   if(PRESSED(KEY_WALK))
	{
        if(IsPlayerInRangeOfActor(playerid, Actor_Truck))
	    {
			if(PlayerInfo[playerid][pLevel] >= 1)
			{
			    //ShowPlayerDialog(playerid, RUTTIENTRUCK, DIALOG_STYLE_LIST, "Ban muon rut tien Trucker", "50.000$\n100.000$\n200.000$\n300.000$\n400.000$\n500.000$\n1.000.000$", "Dong y", "Huy bo");
			    ShowPlayerDialog(playerid, TRUCKJOB, DIALOG_STYLE_LIST, "Cong Viec Trucker", "Xin viec\nRut tien Trucker\nThoat Viec", "Dong y", "Huy bo");
			}
			else
			{
			   SendClientMessageEx( playerid, COLOR_WHITE, "Khong the su dung lenh nay" );
			}
		}
	}
    return 1;
}
//============================================================================//
CMD:xemtientruck(playerid, params[])
{
    new str[2460];
    format(str, sizeof(str), "Tien Trucker cua ban la: %d", PlayerInfo[playerid][pCashTruck]);
    SendClientMessageEx(playerid, COLOR_WHITE, str);
    return 1;
}
//============================================================================//
CMD:xinviectrucker(playerid, params[])
{
   if(!IsPlayerInRangeOfPoint(playerid, 10.0, 2273.0105,949.6379,10.8203)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o noi xin viec Trucker.");
   PlayerInfo[playerid][pJob] = 20;
   SendClientMessageEx(playerid, COLOR_LIGHTRED, "Ban da nhan duoc cong viec Trucker nay thanh cong.");
   return 1;
}

CMD:layhang(playerid, params[])
{
    if(!IsPlayerInRangeOfPoint(playerid, 10.0, 2273.9556,960.0995,10.8203)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o noi lay hang Trucker.");
    if(PlayerInfo[playerid][pJob] == 20 || PlayerInfo[playerid][pJob2] == 20)
    {
        new vehicleid = GetPlayerVehicleID(playerid);
		if(IsACarTrucker(vehicleid))
	    {
		   ShowPlayerDialog(playerid, LAYHANGTRUCKER, DIALOG_STYLE_LIST, "Ban muon giao hang nao?", "Binh thuong (24/7)\nNguy hiem", "Dong y", "Huy bo");
		}
		else
		{
	       SendClientMessageEx(playerid, COLOR_LIGHTRED, "Ban khong o tren mot chiec xe Trucker.");
		}
	}
	else return SendClientMessageEx(playerid, COLOR_WHITE, "Ban chua nhan cong viec Trucker.");
	return 1;
}
//============================================================================//
/*CMD:ruttientruckk(playerid, params[])
{
	if (IsPlayerInRangeOfPoint(playerid, 7.0, 2273.0105,949.6379,10.8203))
	{
		ShowPlayerDialog(playerid, RUTTIENTRUCK, DIALOG_STYLE_LIST, "Ban muon rut bao nhieu tien?","$10.000\n$50.000\n$100.000", "Chon", "Close");
	}
	else return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong dung o noi rut tien.");
	return 1;
}
CMD:ruttientruck(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 15.0, 2273.0105,949.6379,10.8203))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Ban khong o noi rut tien truck!");
		return 1;
	}
	new string[128], amount;
	if(sscanf(params, "d", amount))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "{FF0000}Su Dung{FFFFFF}: /ruttientruck [So Luong]");
		return 1;
	}

	if (amount > PlayerInfo[playerid][pCashTruck] || amount < 1)
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "   Ban khong co nhieu!");
		return 1;
	}
	if(gettime()-GetPVarInt(playerid, "LastTransaction") < 10) return SendClientMessageEx(playerid, COLOR_GRAD2, "Vui long doi trong 10s.!");
    SetPVarInt(playerid, "LastTransaction", gettime());
	GivePlayerCash(playerid,amount);
	PlayerInfo[playerid][pCashTruck]=PlayerInfo[playerid][pCashTruck]-amount;
	format(string, sizeof(string), "  Ban da rut %s SAD tu Trucker. So tien con lai: %s SAD ", number_format(amount), number_format(PlayerInfo[playerid][pCashTruck]));
	SendClientMessageEx(playerid, COLOR_YELLOW, string);
	OnPlayerStatsUpdate(playerid);
	return 1;
}*/
//============================================================================//


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
    if(dialogid == TRUCKJOB)
	{
	    if(response)
	    {
	       	if(listitem == 0)
		    {
                PlayerInfo[playerid][pJob] = 20;
                SendClientMessageEx(playerid, COLOR_LIGHTRED, "Ban da xin viec thanh cong , bay gio ban co the lam viec.");
                return 1;
			}
			if(listitem == 1)
		    {
				ShowPlayerDialog(playerid, RUTTIENTRUCK, DIALOG_STYLE_LIST, "Ban muon rut tien Trucker", "50.000$\n100.000$\n200.000$\n300.000$\n400.000$\n500.000$\n1.000.000$", "Dong y", "Huy bo");
                return 1;
			}
			if(listitem == 2)
		    {
				ShowPlayerDialog(playerid, RUTTIENTRUCK, DIALOG_STYLE_LIST, "Ban muon rut tien Trucker", "50.000$\n100.000$\n200.000$\n300.000$\n400.000$\n500.000$\n1.000.000$", "Dong y", "Huy bo");
                return 1;
			}
		}
	}
	if(dialogid == LAYHANGTRUCKER)
	{
	    if(response)
	    {
	       	if(listitem == 0)
		    {
                trucker[playerid] = true;
                //SetPlayerCheckpoint(playerid, 2179.8164,1990.3358,10.8203, 3.0); 2260.5549,980.2856,10.8125
                SetPlayerCheckpoint(playerid, 2179.8164,1990.3358,10.8203, 3.0);
                SendClientMessage(playerid, COLOR_WHITE, "Hay giao hang den dia diem da duoc danh dua tren ban do.");
                return 1;
			}
			if(listitem == 1)
		    {
				SendClientMessageEx(playerid, COLOR_LIGHTRED, "He thong dang duoc cap nhat.");
                return 1;
			}
		}
	}
	if(dialogid == RUTTIENTRUCK)
	{
	    if(response)
	    {
	       	if(listitem == 0) // 10
            {
                if(PlayerInfo[playerid][pCashTruck] >= 50000)
     			{
                    PlayerInfo[playerid][pCashTruck] -= 50000;
                    GivePlayerCash(playerid,50000);
                    SendClientMessageEx(playerid, COLOR_WHITE, "Ban da rut $50.000!");
                    return 1;
                }
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "Ban khong co tien de rut!");
				}
            }
			if(listitem == 1) // 50
            {
                if(PlayerInfo[playerid][pCashTruck] >= 100000)
     			{
                    PlayerInfo[playerid][pCashTruck] -= 100000;
                    GivePlayerCash(playerid,100000);
                    SendClientMessageEx(playerid, COLOR_WHITE, "Ban da rut $100.000!");
                    return 1;
                }
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "Ban khong co tien de rut!");
				}
            }
		    if(listitem == 2) // 100    50.000$\n100.000$\n200.000$\n300.000$\n400.000$\n500.000$\n1.000.000$
            {
                if(PlayerInfo[playerid][pCashTruck] >= 200000)
     			{
                    PlayerInfo[playerid][pCashTruck] -= 200000;
                    GivePlayerCash(playerid,200000);
                    SendClientMessageEx(playerid, COLOR_WHITE, "Ban da rut $200.000!");
                    return 1;
                }
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "Ban khong co tien de rut!");
				}
            }
            if(listitem == 2) // 100
            {
                if(PlayerInfo[playerid][pCashTruck] >= 300000)
     			{
                    PlayerInfo[playerid][pCashTruck] -= 300000;
                    GivePlayerCash(playerid,300000);
                    SendClientMessageEx(playerid, COLOR_WHITE, "Ban da rut $300.000!");
                    return 1;
                }
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "Ban khong co tien de rut!");
				}
            }
            if(listitem == 2) // 100
            {
                if(PlayerInfo[playerid][pCashTruck] >= 400000)
     			{
                    PlayerInfo[playerid][pCashTruck] -= 400000;
                    GivePlayerCash(playerid,400000);
                    SendClientMessageEx(playerid, COLOR_WHITE, "Ban da rut $400.000!");
                    return 1;
                }
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "Ban khong co tien de rut!");
				}
            }
            if(listitem == 2) // 100
            {
                if(PlayerInfo[playerid][pCashTruck] >= 500000)
     			{
                    PlayerInfo[playerid][pCashTruck] -= 500000;
                    GivePlayerCash(playerid,500000);
                    SendClientMessageEx(playerid, COLOR_WHITE, "Ban da rut $500.000!");
                    return 1;
                }
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "Ban khong co tien de rut!");
				}
            }
            if(listitem == 2) // 100
            {
                if(PlayerInfo[playerid][pCashTruck] >= 1000000)
     			{
                    PlayerInfo[playerid][pCashTruck] -= 1000000;
                    GivePlayerCash(playerid,1000000);
                    SendClientMessageEx(playerid, COLOR_WHITE, "Ban da rut $1.000.000!");
                    return 1;
                }
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "Ban khong co tien de rut!");
				}
            }
		}
	}
	return 1;
}

/*
new vehicleid = GetPlayerVehicleID(playerid);
if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
{
    if(IsATruckerCar(vehicleid)) SetVehicleToRespawn(vehicleid);
}
*/
hook OnPlayerEnterCheckpoint(playerid)
{
    if(trucker[playerid])
    {
        DisablePlayerCheckpoint(playerid);
        trucker[playerid] = false;
        //========//
        SetPlayerCheckpoint(playerid, 2273.9556,960.0995,10.8203, 3.0);
        truck[playerid] = true;
        //========//
        SendClientMessage(playerid, COLOR_WHITE, "Ban da giao hang thanh cong , hay quay ve va tra xe de nhan tien.");
        return 1;
    }
    if(truck[playerid])
    {
		DisablePlayerCheckpoint(playerid);
		DisablePlayerCheckpoint(playerid);
		DisablePlayerCheckpoint(playerid);
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
		    if(IsACarTrucker(vehicleid)) SetVehicleToRespawn(vehicleid);
		}
		//========//
		new rdtientruck = random(200000);
		PlayerInfo[playerid][pCashTruck] += rdtientruck;
		//========//
        truck[playerid] = false;
        SendClientMessage(playerid, COLOR_WHITE, "Ban da hoan thanh xuat xac cong viec, va nhan duoc mot so tien.");
        //========//
        return 1;
    }
    return 1;
}
