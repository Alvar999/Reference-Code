//============================== BE PHUONG 3 TUOI ============================//
//========================== fb.com/nguyenduyphuong.dz =======================//

//Job Trucker
// Credits : nDP

#include <YSI\y_hooks>

#define    DIALOG_LAYHANGTRUCKER         (17519)

new bool:onTrucker247[MAX_PLAYERS];
new bool:onTruckerX[MAX_PLAYERS];
//===========================================================================//
//CMD:
//SetPVarInt(playerid, "Timelayhang", 5);


//SetTimerEx("Trucker", 3000, 0, "d", playerid);


//
forward Trucker(playerid);
hook Trucker(playerid)
{
    SetPVarInt(playerid, "Timelayhang", GetPVarInt(playerid, "Timelayhang")-1);
    //new string[128];
    format(string, sizeof(string), "%d giay", GetPVarInt(playerid, "Timelayhang"));
    GameTextForPlayer(playerid, string, 1100, 3);

    if(GetPVarInt(playerid, "Timelayhang") > 0) SetTimerEx("Trucker", 3000, 0, "d", playerid);

    if(GetPVarInt(playerid, "Timelayhang") <= 0)
    {
         //SetPlayerCheckpoint(playerid, 1982.6150, -220.6680, -0.2432, 3.0);
         //onTrucker[playerid] = true;
         ShowPlayerDialog(playerid, DIALOG_LAYHANGTRUCKER, DIALOG_STYLE_LIST, "Giao hang", "Binh thuong (24/7)\nNguy Hiem", "Dong y", "Huy bo");
		 DeletePVar(playerid, "Timelayhang");
    }
}
//================================ CMD =======================================//
CMD:layhangtruck(playerid, params[])
{
    if(!IsPlayerInRangeOfPoint(playerid, 5.0, 2036.7236,1032.7843,10.8203)) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong o noi lay hang Trucker.");
	if(PlayerInfo[playerid][pJob] == 20 || PlayerInfo[playerid][pJob2] == 20)
	{
	    new vehicleid = GetPlayerVehicleID(playerid);
	    if(IsATruckerCar(vehicleid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	    {
            SetPVarInt(playerid, "Timelayhang", 15);
            SetTimerEx("Trucker", 3000, 0, "d", playerid);
	    }
	    else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong lai chiec xe tai cho hang hoa yeu cau!");
	}
	else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong phai Nguoi dua hang!");
	return 1;
}

//============================================================================//

hook OnPlayerEnterCheckpoint(playerid)
{
    if(onTrucker247[playerid]) // if it's true
    {
        PlayerInfo[playerid][pCash] += 1000000;
        SendClientMessageEx(playerid, COLOR_GREY, "Ban da giao hang thanh cong , va nhan duoc mot so tien.");
        DisablePlayerCheckpoint(playerid);
        onTrucker247[playerid] = false;
    }
    if(onTruckerX[playerid]) // if it's true
    {
        PlayerInfo[playerid][pCash] += 1000000;
        SendClientMessageEx(playerid, COLOR_GREY, "Ban da giao hang thanh cong , va nhan duoc mot so tien.");
        DisablePlayerCheckpoint(playerid);
        onTruckerX[playerid] = false;
    }
    return 1;
}

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
    if(dialogid == DIALOG_LAYHANGTRUCKER)
	{
	    if(response)
	    {
	       	if(listitem == 0)
		    {
                SendClientMessageEx(playerid, COLOR_GREY, "Dia diem da duoc danh dau tren ban do, hay giao den do.");
                SetPlayerCheckpoint(playerid, 2179.8164,1990.3358,10.8203, 3.0);
                onTrucker247[playerid] = true;
                return 1;
			}
			if(listitem == 1)
		    {
				SendClientMessageEx(playerid, COLOR_GREY, "Dia diem da duoc danh dau tren ban do, hay giao den do.");
                SetPlayerCheckpoint(playerid, 1444.5040,752.0775,10.8203, 3.0);
                onTruckerX[playerid] = true;
                return 1;
			}
		}
	}
	return 1;
}

hook OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
