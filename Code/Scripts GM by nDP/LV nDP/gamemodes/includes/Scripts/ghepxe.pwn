#include <YSI\y_hooks>

CMD:setmanhxe(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 1338)
	{

		new string[128], giveplayerid, statcode, amount;
		if(sscanf(params, "udd", giveplayerid, statcode, amount))
		{
			SendClientMessageEx(playerid, COLOR_GRAD4, "|1 Manh LSPD |2 Manh SFPD |3 Manh LVPD |4 Manh HPV-1000 |5 Manh SWAT-VAN |6 Manh POLICE RANGER |7 FBI TRUCK");
			return 1;
		}

		if(IsPlayerConnected(giveplayerid))
		{
			//new Player;
			switch (statcode)
			{
		    case 1:
				{
					PlayerInfo[giveplayerid][pManhLSPD] = amount;
					new Player;
					//format(string, sizeof(string), "   %s's Level has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
					format( string, sizeof( string ), "AdmWarning: {0CF917}%s{FFFFFF} da /setstat (Manh LSPD) cho {0CF917}%s{FFFFFF} voi so luong {E90606}(%d){FFFFFF}", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(Player), amount);
					ABroadCast( COLOR_YELLOW, string, 2 );
				}
			case 2:
				{
					PlayerInfo[giveplayerid][pManhSFPD] = amount;
					new Player;
					format( string, sizeof( string ), "AdmWarning: {0CF917}%s{FFFFFF} da /setstat (Manh SFPD) cho {0CF917}%s{FFFFFF} voi so luong {E90606}(%d){FFFFFF}", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(Player), amount);
					ABroadCast( COLOR_YELLOW, string, 2 );
				}
			case 3:
				{
					PlayerInfo[giveplayerid][pManhLVPD] = amount;
					new Player;
					format( string, sizeof( string ), "AdmWarning: {0CF917}%s{FFFFFF} da /setstat (Manh LVPD) cho {0CF917}%s{FFFFFF} voi so luong {E90606}(%d){FFFFFF}", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(Player), amount);
					ABroadCast( COLOR_YELLOW, string, 2 );
				}
			case 4:
				{
					PlayerInfo[giveplayerid][pManhHPV] = amount;
					new Player;
					format( string, sizeof( string ), "AdmWarning: {0CF917}%s{FFFFFF} da /setstat (Manh HPV-1000) cho {0CF917}%s{FFFFFF} voi so luong {E90606}(%d){FFFFFF}", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(Player), amount);
					ABroadCast( COLOR_YELLOW, string, 2 );
				}
			case 5:
				{
					PlayerInfo[giveplayerid][pManhSWATVAN] = amount;
					new Player;
					format( string, sizeof( string ), "AdmWarning: {0CF917}%s{FFFFFF} da /setstat (Manh SWAT-VAN) cho {0CF917}%s{FFFFFF} voi so $ {E90606}(%d){FFFFFF}", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(Player), amount);
					ABroadCast( COLOR_YELLOW, string, 2 );
				}
			case 6:
				{
					PlayerInfo[giveplayerid][pManhRanger] = amount;
					new Player;
					format( string, sizeof( string ), "AdmWarning: {0CF917}%s{FFFFFF} da /setstat (Manh POLICE RANGER) cho {0CF917}%s{FFFFFF} voi so luong {E90606}(%d){FFFFFF}", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(Player), amount);
					ABroadCast( COLOR_YELLOW, string, 2 );
				}
			case 7:
				{
					PlayerInfo[giveplayerid][pManhFBITruck] = amount;
					new Player;
					format( string, sizeof( string ), "AdmWarning: {0CF917}%s{FFFFFF} da /setstat (Manh FBI Truck) cho {0CF917}%s{FFFFFF} voi so luong {E90606}(%d){FFFFFF}", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(Player), amount);
					ABroadCast( COLOR_YELLOW, string, 2 );
				}

			default:
				{
					format(string, sizeof(string), "   Invalid stat code.", amount);
				}
			}


			format(string, sizeof(string), "%s by %s", string, GetPlayerNameEx(playerid));
			Log("logs/stats.log", string);
			SendClientMessageEx(playerid, COLOR_GRAD1, string);

		}
	}
	return 1;
}
//

CMD:xemmanhxe(playerid, params[])
{
    new str[2460],str1[2460],str2[2460],str3[2460],str4[2460],str5[2460],str6[2460],str7[2460], name[1280];
    format(str1, sizeof(str1), "Manh xe LSPD cua ban co: %d ",PlayerInfo[playerid][pManhLSPD]);
    format(str2, sizeof(str2), "Manh xe SFPD cua ban co: %d ",PlayerInfo[playerid][pManhSFPD]);
    format(str3, sizeof(str3), "Manh xe LVPD cua ban co: %d ",PlayerInfo[playerid][pManhLVPD]);
    format(str4, sizeof(str4), "Manh xe HPV-1000 cua ban co: %d ",PlayerInfo[playerid][pManhHPV]);
    format(str5, sizeof(str5), "Manh xe SWAT VAN cua ban co: %d ",PlayerInfo[playerid][pManhSWATVAN]);
    format(str6, sizeof(str6), "Manh xe POLICE RANGER cua ban co: %d ",PlayerInfo[playerid][pManhRanger]);
    format(str7, sizeof(str7), "Manh xe FBI TRUCK cua ban co: %d ",PlayerInfo[playerid][pManhFBITruck]);
    format(str, sizeof(str), "%s\n\n%s\n\n%s\n\n%s\n\n%s\n\n%s\n\n%s", str1,str2,str3,str4,str5,str6,str7);
    format(name, sizeof(name), "THONG TIN MANH XE: %s",GetPlayerNameEx(playerid));
    ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, name, str, "Dong Lai", "");
    //ShowPlayerDialog(playerid, 99999, DIALOG_STYLE_MSGBOX, name, str1,str2,str3,str4,str5,str6,str7, "Dong Lai", "");
    return 1;
}

CMD:ghepxeee(playerid, params[])
{
    if(PlayerInfo[playerid][pLevel] > 0)
	{
	   ShowPlayerDialog(playerid, DIALOG_GHEPXE, DIALOG_STYLE_LIST,"HE THONG GHEP XE","LSPD\nSFPD\nHPV-1000\nSWAT-VAN\nPOLICE RANGER\nFBI TRUCK","Dong Y","Huy");
	}
	else
	{
	   SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong the su dung lenh nay.");
	}
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_GHEPXE)
	{
	    if(response)
	    {
	       	if(listitem == 0)
		    {
			    if(PlayerInfo[playerid][pManhLSPD] >= 300)
                {
                	SendClientMessage(playerid, COLOR_YELLOW,"Ban da su dung 300 Manh Xe ( LSPD ) de ghep thanh cong mot chiec ( LSPD )");
                	PlayerInfo[playerid][pManhLSPD] -= 300;
                	//========================================================//
                	new string[128];
					format(string, sizeof(string), "[HE THONG GHEP XE] %s da ghep thanh cong mot chiec (Xe Police LSPD), Vo tay~~~~ .", GetPlayerNameEx(playerid));
					SendClientMessageToAll(COLOR_WHITE, string);
		            Log("logs/ghepxe.log", string);
			     	new Float: arr_fPlayerPos[4];
					GetPlayerPos(playerid, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2]);
					GetPlayerFacingAngle(playerid, arr_fPlayerPos[3]);
					CreatePlayerVehicle(playerid, GetPlayerFreeVehicleId(playerid), 596, arr_fPlayerPos[0]+2, arr_fPlayerPos[1], arr_fPlayerPos[2], arr_fPlayerPos[3], 0, 0, 2000000, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
                }
                else
                {
                	SendClientMessage(playerid, COLOR_RED,"[!] Ban da that bai khi ghep xe, can phai co du (200 manh ghep) moi co the ghep thanh cong.");
                }
			}
			if(listitem == 1)
		    {
				if(PlayerInfo[playerid][pManhSFPD] >= 300)
                {
                	SendClientMessage(playerid, COLOR_YELLOW,"Ban da su dung 300 Manh Xe ( LSPD ) de ghep thanh cong mot chiec ( LSPD )");
                	PlayerInfo[playerid][pManhSFPD] -= 300;
                	//========================================================//
                	new string[128];
					format(string, sizeof(string), "[HE THONG GHEP XE] %s da ghep thanh cong mot chiec (Xe Police SFPD), Vo tay~~~~ .", GetPlayerNameEx(playerid));
					SendClientMessageToAll(COLOR_WHITE, string);
		            Log("logs/ghepxe.log", string);
			     	new Float: arr_fPlayerPos[4];
					GetPlayerPos(playerid, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2]);
					GetPlayerFacingAngle(playerid, arr_fPlayerPos[3]);
					CreatePlayerVehicle(playerid, GetPlayerFreeVehicleId(playerid), 7, arr_fPlayerPos[0]+2, arr_fPlayerPos[1], arr_fPlayerPos[2], arr_fPlayerPos[3], 0, 0, 2000000, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
                }
                else
                {
                	SendClientMessage(playerid, COLOR_RED,"[!] Ban da that bai khi ghep xe, can phai co du (200 manh ghep) moi co the ghep thanh cong.");
                }
			}
			if(listitem == 3)
		    {
				if(PlayerInfo[playerid][pManhLVPD] >= 200)
                {
                	SendClientMessage(playerid, COLOR_YELLOW,"Ban da su dung 200 Manh Xe ( LVPD ) de ghep thanh cong mot chiec ( LVPD )");
                	PlayerInfo[playerid][pManhLVPD] -= 200;
                	//========================================================//
                	new string[128];
					format(string, sizeof(string), "[HE THONG GHEP XE] %s da ghep thanh cong mot chiec (Xe Police LVPD), Qua gat roi may anh em oi .", GetPlayerNameEx(playerid));
					SendClientMessageToAll(COLOR_WHITE, string);
		            Log("logs/ghepxe.log", string);
			     	new Float: arr_fPlayerPos[4];
					GetPlayerPos(playerid, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2]);
					GetPlayerFacingAngle(playerid, arr_fPlayerPos[3]);
					CreatePlayerVehicle(playerid, GetPlayerFreeVehicleId(playerid), 598, arr_fPlayerPos[0]+2, arr_fPlayerPos[1], arr_fPlayerPos[2], arr_fPlayerPos[3], 0, 0, 2000000, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
                }
                else
                {
                	SendClientMessage(playerid, COLOR_RED,"[!] Ban da that bai khi ghep xe, can phai co du (200 manh ghep) moi co the ghep thanh cong.");
                }
			}
			//
			if(listitem == 4)
		    {
				if(PlayerInfo[playerid][pManhHPV] >= 400)
                {
                	SendClientMessage(playerid, COLOR_YELLOW,"Ban da su dung 400 Manh Xe ( HPV-1000 ) de ghep thanh cong mot chiec ( HPV-1000 )");
                	PlayerInfo[playerid][pManhHPV] -= 400;
                	//========================================================//
                	new string[128];
					format(string, sizeof(string), "[HE THONG GHEP XE] %s da ghep thanh cong mot chiec (HPV-1000), That la dinh~ dinh~ .", GetPlayerNameEx(playerid));
					SendClientMessageToAll(COLOR_WHITE, string);
		            Log("logs/ghepxe.log", string);
			     	new Float: arr_fPlayerPos[4];
					GetPlayerPos(playerid, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2]);
					GetPlayerFacingAngle(playerid, arr_fPlayerPos[3]);
					CreatePlayerVehicle(playerid, GetPlayerFreeVehicleId(playerid), 598, arr_fPlayerPos[0]+2, arr_fPlayerPos[1], arr_fPlayerPos[2], arr_fPlayerPos[3], 0, 0, 2000000, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
                }
                else
                {
                	SendClientMessage(playerid, COLOR_RED,"[!] Ban da that bai khi ghep xe, can phai co du (400 manh ghep) moi co the ghep thanh cong.");
                }
			}
			//
			if(listitem == 5)
		    {
				if(PlayerInfo[playerid][pManhSWATVAN] >= 800)
                {
                	SendClientMessage(playerid, COLOR_YELLOW,"Ban da su dung 800 Manh Xe ( SWAT-VAN ) de ghep thanh cong mot chiec ( SWAT-VAN )");
                	PlayerInfo[playerid][pManhSWATVAN] -= 800;
                	//========================================================//
                	new string[128];
					format(string, sizeof(string), "[HE THONG GHEP XE] %s da ghep thanh cong mot chiec (SWAT-VAN), That la dinh~ dinh~ .", GetPlayerNameEx(playerid));
					SendClientMessageToAll(COLOR_WHITE, string);
		            Log("logs/ghepxe.log", string);
			     	new Float: arr_fPlayerPos[4];
					GetPlayerPos(playerid, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2]);
					GetPlayerFacingAngle(playerid, arr_fPlayerPos[3]);
					CreatePlayerVehicle(playerid, GetPlayerFreeVehicleId(playerid), 601, arr_fPlayerPos[0]+2, arr_fPlayerPos[1], arr_fPlayerPos[2], arr_fPlayerPos[3], 0, 0, 2000000, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
                }
                else
                {
                	SendClientMessage(playerid, COLOR_RED,"[!] Ban da that bai khi ghep xe, can phai co du (800 manh ghep) moi co the ghep thanh cong.");
                }
			}
			//
			if(listitem == 6)
		    {
				if(PlayerInfo[playerid][pManhRanger] >= 200)
                {
                	SendClientMessage(playerid, COLOR_YELLOW,"Ban da su dung 200 Manh Xe ( POLICE RANGER ) de ghep thanh cong mot chiec ( POLICE RANGER )");
                	PlayerInfo[playerid][pManhRanger] -= 200;
                	//========================================================//
                	new string[128];
					format(string, sizeof(string), "[HE THONG GHEP XE] %s da ghep thanh cong mot chiec (POLICE RANGER), That la dinh~ dinh~ .", GetPlayerNameEx(playerid));
					SendClientMessageToAll(COLOR_WHITE, string);
		            Log("logs/ghepxe.log", string);
			     	new Float: arr_fPlayerPos[4];
					GetPlayerPos(playerid, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2]);
					GetPlayerFacingAngle(playerid, arr_fPlayerPos[3]);
					CreatePlayerVehicle(playerid, GetPlayerFreeVehicleId(playerid), 599, arr_fPlayerPos[0]+2, arr_fPlayerPos[1], arr_fPlayerPos[2], arr_fPlayerPos[3], 0, 0, 2000000, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
                }
                else
                {
                	SendClientMessage(playerid, COLOR_RED,"[!] Ban da that bai khi ghep xe, can phai co du (200 manh ghep) moi co the ghep thanh cong.");
                }
			}
			//
			if(listitem == 7)
		    {
				if(PlayerInfo[playerid][pManhFBITruck] >= 300)
                {
                	SendClientMessage(playerid, COLOR_YELLOW,"Ban da su dung 300 Manh Xe ( FBI Truck ) de ghep thanh cong mot chiec ( FBI Truck )");
                	PlayerInfo[playerid][pManhFBITruck] -= 300;
                	//========================================================//
                	new string[128];
					format(string, sizeof(string), "[HE THONG GHEP XE] %s da ghep thanh cong mot chiec (FBI Truck), That la dinh~ dinh~ .", GetPlayerNameEx(playerid));
					SendClientMessageToAll(COLOR_WHITE, string);
		            Log("logs/ghepxe.log", string);
			     	new Float: arr_fPlayerPos[4];
					GetPlayerPos(playerid, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2]);
					GetPlayerFacingAngle(playerid, arr_fPlayerPos[3]);
					CreatePlayerVehicle(playerid, GetPlayerFreeVehicleId(playerid), 528, arr_fPlayerPos[0]+2, arr_fPlayerPos[1], arr_fPlayerPos[2], arr_fPlayerPos[3], 0, 0, 2000000, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
                }
                else
                {
                	SendClientMessage(playerid, COLOR_RED,"[!] Ban da that bai khi ghep xe, can phai co du (300 manh ghep) moi co the ghep thanh cong.");
                }
			}
		}
	}
	return 1;
}

