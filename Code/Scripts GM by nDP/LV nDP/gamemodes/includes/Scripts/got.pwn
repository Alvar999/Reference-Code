// HE THONG GOTO DIALOG
// CREDITS : BE PHUONG 3 TUOI - nDP
// Fb.com/nguyenduyphuong.dz
//========================//
#include <YSI\y_hooks>
//=======================//

//============================================================================//
#define     DIALOG_GOTO          (24411)

CMD:gotodialog(playerid, params[])
{
   ShowPlayerDialog(playerid, DIALOG_GOTO, DIALOG_STYLE_LIST, "HE THONG GOTO", "SF\nLS\nLV\n-----------------------------------\nVIP\nBenh Vien\nCity Hall\n24/7\nBank\nNha Tho\nNha Tu\n-----------------------------------\nLVPD\nFBI\nTaxi\nDOC\nSaNews\nHitman", "Dong y", "Huy bo");
   return 1;
}

//============================================================================//

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_GOTO)
	{
	    if(response)
	    {
			new string[128];
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
	return 1;
}

//============================================================================//
