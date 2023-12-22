//============================== BE PHUONG 3 TUOI ============================//
//========================== fb.com/nguyenduyphuong.dz =======================//

//MUA DO AN

#include <YSI\y_hooks>

#define           MUADOAN                (15133)
#define           SDDOAN                 (15134)

//============================================================================//
/*pPizza,
pHotdog,
pCola,
pBurger,*/
//============================================================================//



//============================================================================//
/*cache_get_field_content(row,  "Pizza", szResult, MainPipeline); PlayerInfo[extraid][pPizza] = strval(szResult);
cache_get_field_content(row,  "Hotdog", szResult, MainPipeline); PlayerInfo[extraid][pHotdog] = strval(szResult);
cache_get_field_content(row,  "Cola", szResult, MainPipeline); PlayerInfo[extraid][pCola] = strval(szResult);
cache_get_field_content(row,  "Burger", szResult, MainPipeline); PlayerInfo[extraid][pBurger] = strval(szResult);
//
SavePlayerInteger(query, GetPlayerSQLId(playerid), "Pizza", PlayerInfo[playerid][pPizza]);
SavePlayerInteger(query, GetPlayerSQLId(playerid), "Hotdog", PlayerInfo[playerid][pHotdog]);
SavePlayerInteger(query, GetPlayerSQLId(playerid), "Cola", PlayerInfo[playerid][pCola]);
SavePlayerInteger(query, GetPlayerSQLId(playerid), "Burger", PlayerInfo[playerid][pBurger]);*/
//============================================================================//

CMD:muadoan(playerid, params[])
{
  if(!IsPlayerInRangeOfPoint(playerid, 10.0, 2081.2886,1049.9399,10.8203)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong dung o noi ban hot dog.");
  if(PlayerInfo[playerid][pCash] >= 5000)
  {
	 ShowPlayerDialog(playerid, MUADOAN, DIALOG_STYLE_LIST, "Mua do an", "Pizza (10k)\nHot-dog(10k)\nCola (7k)\nBurger(15k)\nUpdate.....", "Dong y", "Huy bo");
  }
  else
  {
     SendClientMessage(playerid, COLOR_GREY, "Ban co du $ de su dung lenh nay.");
  }
  return 1;
}

CMD:tuidonhanh(playerid, params[])
{
    new str[2460],str1[2460],str2[2460],str3[2460],str4[2460],str5[2460], name[1280];
    format(str1, sizeof(str1), "Pizza : %d ",PlayerInfo[playerid][pPizza]);
    format(str2, sizeof(str2), "Hot-Dog : %d ",PlayerInfo[playerid][pHotdog]);
    format(str3, sizeof(str3), "Nuoc ngot Cola: %d ",PlayerInfo[playerid][pCola]);
    format(str4, sizeof(str4), "Banh Ham-Burger: %d ",PlayerInfo[playerid][pBurger]);
    format(str4, sizeof(str5), "Tien Trucker: %d ",PlayerInfo[playerid][pCashTruck]);
    format(str, sizeof(str), "%s\n\n%s\n\n%s\n\n%s\n\n%s", str1,str2,str3,str4,str5);
    format(name, sizeof(name), "TUI DO AN: %s",GetPlayerNameEx(playerid));
    ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, name, str, "Dong Lai", "");
    //ShowPlayerDialog(playerid, 99999, DIALOG_STYLE_MSGBOX, name, str1,str2,str3,str4,str5,str6,str7, "Dong Lai", "");
    return 1;
}

CMD:sudungdoan(playerid, params[])
{
   if(PlayerInfo[playerid][pCash] >= 1)
   {
	 ShowPlayerDialog(playerid, SDDOAN, DIALOG_STYLE_LIST, "Su dung do an cua ban", "Pizza\nHot-dog\nCola\nBurger", "Dong y", "Huy bo");
   }
   else
   {
     SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay.");
   }
   return 1;
}


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
    if(dialogid == SDDOAN)
	{
	    if(response)
	    {
	       	if(listitem == 0)
		    {
                if(PlayerInfo[playerid][pPizza] >= 1)
                {
                	new randomtl1 = random(20);
                	PlayerInfo[playerid][pPizza] -= 1;
                	PlayerInfo[playerid][pTheLuc] += randomtl1;
                	new string[128];
                	format(string, sizeof(string), "Ban da su dung mot chiec banh Pizza, va ban hoi lai duoc (%d The luc), bay gio ban con %d Pizza(s).", number_format(randomtl1), PlayerInfo[playerid][pPizza]);
			        SendClientMessageEx(playerid, COLOR_YELLOW, string);
                }
                else
                {
                	SendClientMessage(playerid, COLOR_RED,"Ban khong co thuc an , vui long mua tai tiem do an gan nhat.");
                }
                return 1;
			}
			if(listitem == 1)
		    {
				if(PlayerInfo[playerid][pHotdog] >= 1)
                {
                	new randomtl2 = random(20);
                	PlayerInfo[playerid][pHotdog] -= 1;
                	PlayerInfo[playerid][pTheLuc] += randomtl2;
                	new string[128];
                	format(string, sizeof(string), "Ban da su dung mot chiec banh Hot-Dog, va ban hoi lai duoc (%d The luc), bay gio ban con %d Hot-Dog(s).", number_format(randomtl2), PlayerInfo[playerid][pHotdog]);
			        SendClientMessageEx(playerid, COLOR_YELLOW, string);
                }
                else
                {
                	SendClientMessage(playerid, COLOR_RED,"Ban khong co thuc an , vui long mua tai tiem do an gan nhat.");
                }
                return 1;
			}
			if(listitem == 2)
		    {
				if(PlayerInfo[playerid][pCola] >= 1)
                {
                	new randomtl3 = random(10);
                	PlayerInfo[playerid][pCola] -= 1;
                	PlayerInfo[playerid][pTheLuc] += randomtl3;
                	new string[128];
                	format(string, sizeof(string), "Ban da su dung mot chiec banh Cola, va ban hoi lai duoc (%d The luc), bay gio ban con %d Cola(s).", number_format(randomtl3), PlayerInfo[playerid][pCola]);
			        SendClientMessageEx(playerid, COLOR_YELLOW, string);
                }
                else
                {
                	SendClientMessage(playerid, COLOR_RED,"Ban khong co thuc an , vui long mua tai tiem do an gan nhat.");
                }
                return 1;
			}
			if(listitem == 3)
		    {
                if(PlayerInfo[playerid][pBurger] >= 1)
                {
                	new randomtl4 = random(50);
                	PlayerInfo[playerid][pBurger] -= 1;
                	PlayerInfo[playerid][pTheLuc] += randomtl4;
                	new string[128];
                	format(string, sizeof(string), "Ban da su dung mot chiec banh HamBurger, va ban hoi lai duoc (%d The luc), bay gio ban con %d HamBurger(s).", number_format(randomtl4), PlayerInfo[playerid][pBurger]);
			        SendClientMessageEx(playerid, COLOR_YELLOW, string);
                }
                else
                {
                	SendClientMessage(playerid, COLOR_RED,"Ban khong co thuc an , vui long mua tai tiem do an gan nhat.");
                }
                return 1;
			}
			if(listitem == 4)
		    {
     	        SendClientMessage(playerid, COLOR_RED,"Hien van dang Update them do an , tang kha nang hoi phuc cho ban.");
                return 1;
			}
		}
	}
	//========================================================================//
	if(dialogid == MUADOAN)
	{
	    if(response)
	    {
	       	if(listitem == 0)
		    {
                if(PlayerInfo[playerid][pCash] >= 10000)
                {
                	SendClientMessage(playerid, COLOR_YELLOW,"Ban da mat 10.000$ , de mua mot cai banh Pizza");
                	PlayerInfo[playerid][pCash] -= 10000;
                	PlayerInfo[playerid][pPizza] += 1;
                }
                else
                {
                	SendClientMessage(playerid, COLOR_RED,"Ban khong du $ de mua mot cai banh Pizza.");
                }
                return 1;
			}
			if(listitem == 1)
		    {
				if(PlayerInfo[playerid][pCash] >= 10000)
                {
                	SendClientMessage(playerid, COLOR_YELLOW,"Ban da mat 10.000$ , de mua mot cai banh Hot-Dog");
                	PlayerInfo[playerid][pCash] -= 10000;
                	PlayerInfo[playerid][pHotdog] += 1;
                }
                else
                {
                	SendClientMessage(playerid, COLOR_RED,"Ban khong du $ de mua cai banh Hot-Dog");
                }
                return 1;
			}
			if(listitem == 2)
		    {
				if(PlayerInfo[playerid][pCash] >= 7000)
                {
                	SendClientMessage(playerid, COLOR_YELLOW,"Ban da mat 7.000$ , de mua mot lon Cola");
                	PlayerInfo[playerid][pCash] -= 7000;
                	PlayerInfo[playerid][pCola] += 1;
                }
                else
                {
                	SendClientMessage(playerid, COLOR_RED,"Ban khong du $ , de mua mot lon Cola.");
                }
                return 1;
			}
			if(listitem == 3)
		    {
                if(PlayerInfo[playerid][pCash] >= 15000)
                {
                	SendClientMessage(playerid, COLOR_YELLOW,"Ban da mat 15.000$ , de mua mot cai banh Burger");
                	PlayerInfo[playerid][pCash] -= 15000;
                	PlayerInfo[playerid][pBurger] += 1;
                }
                else
                {
                	SendClientMessage(playerid, COLOR_RED,"Ban khong du $ , de mua mot cai banh Burger");
                }
                return 1;
			}
			if(listitem == 4)
		    {
     	        SendClientMessage(playerid, COLOR_RED,"Hien van dang Update them do an , tang kha nang hoi phuc cho ban.");
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
