// HE THONG GOTO DIALOG
// CREDITS : BE PHUONG 3 TUOI - nDP
// Fb.com/nguyenduyphuong.dz
//========================//
#include <YSI\y_hooks>
//=======================//

//============================================================================//
#define     DIALOG_GOTO          (24411)
#define     DIALOG_GOTON          (24415)
#define     DIALOG_GOTOFBI       (24417)

CMD:fbi(playerid, params[])
{
   if (IsPlayerInRangeOfPoint(playerid, 4.0, 285.5114,-1540.4432,24.5971)) // Matrun 6
   {
        ShowPlayerDialog(playerid, DIALOG_GOTOFBI, DIALOG_STYLE_LIST, "HE THONG DICH CHUYEN (FBI)", "FBI", "Dong y", "Huy bo");
   }
   else
   {
       SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong the su dung lenh nay");
   }
   return 1;
}

CMD:goto(playerid, params[])
{
   if(PlayerInfo[playerid][pAdmin] >= 2)
   {
      ShowPlayerDialog(playerid, DIALOG_GOTO, DIALOG_STYLE_LIST, "HE THONG GOTO", "SF\nLS\nLV\n-----------------------------------\nVIP\nBenh Vien\nCity Hall\n24/7\nBank\nNha Tho\nNha Tu\n-----------------------------------\nLVPD\nFBI\nTaxi\nDOC\nSaNews\nHitman", "Dong y", "Huy bo");
   }
   else
   {
      SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong the su dung lenh nay");
   }
   return 1;
}

//============================================================================//

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_GOTOFBI)
	{
	    if(response)
	    {
			switch(listitem)
			{
			    case 0:
			    {
                    if (PlayerInfo[playerid][pLevel] >= 1)
					{
						new fbicar = GetPlayerVehicleID(playerid);
						SetVehiclePos(fbicar, 285.5114,-1540.4432,24.5971);
						LinkVehicleToInterior(fbicar, 0);
						SetVehicleVirtualWorld(fbicar, 0);
						fVehSpeed[playerid] = 0.0;
					}
					else
					{
						SetPlayerPos(playerid, 285.5114,-1540.4432,24.5971);
					}
					//SetPlayerPos(playerid, 285.5114,-1540.4432,24.5971);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
             }
         }
    }
			    
	if(dialogid == DIALOG_GOTO)
	{
	    if(response)
	    {
			switch(listitem)
			{
			    case 0:
			    {
			        SetPlayerPos(playerid, -1604.7946,720.6332,11.8325);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    case 1:
			    {
			        SetPlayerPos(playerid, 1529.6000,-1691.2000,13.3828);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    case 2:
			    {
			        SetPlayerPos(playerid, 1701.7512,1436.0452,10.7302);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    case 3:
			    {
			        SendClientMessageEx(playerid, COLOR_GRAD1, "Fb.com/nguyenduyphuong.dz");
			    }
			    case 4:
			    {
                    SetPlayerPos(playerid, 2032.3684,1007.8622,10.8203);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    //
			    case 5:
			    {
			        SetPlayerPos(playerid, 1607.2599,1827.9424,10.8203);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    case 6:
			    {
                    SetPlayerPos(playerid, 1607.2599,1827.9424,10.8203);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    case 7:
			    {
                    SetPlayerPos(playerid, 2179.8438,1989.8541,10.8203);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    case 8:
			    {
                    SetPlayerPos(playerid, 2127.5776,2369.3650,10.8203);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    //
			    case 9:
			    {
                    SetPlayerPos(playerid, 1449.8655,752.2084,11.0234);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    case 10:
			    {
                    SetPlayerPos(playerid, -3378.3098,433.3782,4.8390);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    case 11:
			    {
			        SendClientMessageEx(playerid, COLOR_GRAD1, "Fb.com/nguyenduyphuong.dz");
			    }
			    case 12:
			    {
                    SetPlayerPos(playerid, 2348.3472,2455.9634,14.9742);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    case 13:
			    {
                    SetPlayerPos(playerid, 2474.5288,1007.9506,10.8203);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    case 14:
			    {
                    SetPlayerPos(playerid, 2196.6838,1392.0992,10.8203);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    case 15:
			    {
                    SetPlayerPos(playerid, 1739.9272,399.2614,20.0490);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    case 16:
			    {
                    SetPlayerPos(playerid, 2030.4755,1913.8328,12.3114);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    case 17:
			    {
                    SetPlayerPos(playerid, 2487.6433,1964.1698,10.8203);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
             }
         }
    }
    if(dialogid == DIALOG_GOTON)
	{
	    if(response)
	    {
			switch(listitem)
			{
			    case 0:
			    {
			        SetPlayerPos(playerid, -1604.7946,720.6332,11.8325);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
			        PlayerInfo[playerid][pCash] -= 500000;
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    case 1:
			    {
			        SetPlayerPos(playerid, 1529.6000,-1691.2000,13.3828);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
			        PlayerInfo[playerid][pCash] -= 500000;
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    case 2:
			    {
			        SetPlayerPos(playerid, 1701.7512,1436.0452,10.7302);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
			        PlayerInfo[playerid][pCash] -= 500000;
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    case 3:
			    {
			        SendClientMessageEx(playerid, COLOR_GRAD1, "Fb.com/nguyenduyphuong.dz");
			    }
			    case 4:
			    {
                    SetPlayerPos(playerid, 2032.3684,1007.8622,10.8203);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
			        PlayerInfo[playerid][pCash] -= 500000;
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    //
			    case 5:
			    {
			        SetPlayerPos(playerid, 1607.2599,1827.9424,10.8203);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
			        PlayerInfo[playerid][pCash] -= 500000;
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    case 6:
			    {
                    SetPlayerPos(playerid, 1607.2599,1827.9424,10.8203);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
			        PlayerInfo[playerid][pCash] -= 500000;
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    case 7:
			    {
                    SetPlayerPos(playerid, 2179.8438,1989.8541,10.8203);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
			        PlayerInfo[playerid][pCash] -= 500000;
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    case 8:
			    {
                    SetPlayerPos(playerid, 2127.5776,2369.3650,10.8203);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
			        PlayerInfo[playerid][pCash] -= 500000;
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    //
			    case 9:
			    {
                    SetPlayerPos(playerid, 1449.8655,752.2084,11.0234);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
			        PlayerInfo[playerid][pCash] -= 500000;
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    case 10:
			    {
                    SetPlayerPos(playerid, -3378.3098,433.3782,4.8390);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
			        PlayerInfo[playerid][pCash] -= 500000;
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    case 11:
			    {
			        SendClientMessageEx(playerid, COLOR_GRAD1, "Fb.com/nguyenduyphuong.dz");
			    }
			    case 12:
			    {
                    SetPlayerPos(playerid, 2348.3472,2455.9634,14.9742);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
			        PlayerInfo[playerid][pCash] -= 500000;
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    case 13:
			    {
                    SetPlayerPos(playerid, 2474.5288,1007.9506,10.8203);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
			        PlayerInfo[playerid][pCash] -= 500000;
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    case 14:
			    {
                    SetPlayerPos(playerid, 2196.6838,1392.0992,10.8203);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
			        PlayerInfo[playerid][pCash] -= 500000;
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    case 15:
			    {
                    SetPlayerPos(playerid, 1739.9272,399.2614,20.0490);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
			        PlayerInfo[playerid][pCash] -= 500000;
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    case 16:
			    {
                    SetPlayerPos(playerid, 2030.4755,1913.8328,12.3114);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
			        PlayerInfo[playerid][pCash] -= 500000;
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
			    case 17:
			    {
                    SetPlayerPos(playerid, 2487.6433,1964.1698,10.8203);
			        SendClientMessageEx(playerid, COLOR_GRAD1, "   Da duoc dich chuyen!");
			        PlayerInfo[playerid][pCash] -= 500000;
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
			    }
             }
         }
    }
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
   if(PRESSED(KEY_WALK))
	{
		// Khai Khoang
		if(IsPlayerInRangeOfActor(playerid, NPCVEVIP))
		{
	           if(PlayerInfo[playerid][pCash] >= 500000)
			   {
			      ShowPlayerDialog(playerid, DIALOG_GOTON, DIALOG_STYLE_LIST, "HE THONG GOTO NEWB (500K / 1 lan)", "SF\nLS\nLV\n-----------------------------------\nVIP\nBenh Vien\nCity Hall\n24/7\nBank\nNha Tho\nNha Tu\n-----------------------------------\nLVPD\nFBI\nTaxi\nDOC\nSaNews\nHitman", "Dong y", "Huy bo");
			   }
			   else
			   {
			      SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong du tien de su dung he thong dich chuyen (500k / 1 lan)");
			   }
		}
	}
    return 1;
}

//============================================================================//
