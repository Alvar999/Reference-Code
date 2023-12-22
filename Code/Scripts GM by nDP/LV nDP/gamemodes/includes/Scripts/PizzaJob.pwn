//============================== BE PHUONG 3 TUOI ============================//
//========================== fb.com/nguyenduyphuong.dz =======================//

//Job Pizza Credits nDP

#include <YSI\y_hooks>

#define   JobPizza           (17545)

new bool:pizzacp[MAX_PLAYERS];

CMD:xinviecpizza(playerid, params[])
{
  if(!IsPlayerInRangeOfPoint(playerid, 10.0, 2090.8457,1100.6940,10.8203)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o noi xin viec Pizza.");
  PlayerInfo[playerid][pJob] = 21;
  SetPlayerSkin(playerid, 155);
  SendClientMessageEx(playerid, COLOR_LIGHTRED, "Ban da nhan cong viec Pizza nay thanh cong.");
  return 1;
}

CMD:laybanh(playerid, params[])
{
  if(!IsPlayerInRangeOfPoint(playerid, 10.0, 2094.1235,1106.5331,10.8203)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o khu vuc /laybanh pizza.");
  if(PlayerInfo[playerid][pJob] == 21 || PlayerInfo[playerid][pJob2] == 21)
  {
     if(IsPlayerInAnyVehicle(playerid))
     {
         if(GetPlayerSkin(playerid) != 155)
         {
	         SendClientMessageEx(playerid, COLOR_YELLOW, "Ban khong mac quan ao Pizza boy khong the lam viec.");
	         return 1;
         }
         if(!IsAPizzaCar(GetPlayerVehicleID(playerid)))
         {
	         SendClientMessageEx(playerid, COLOR_YELLOW, "Ban khong chay xe Pizza Stack khong the lam viec.");
	         return 1;
         }
         SetPlayerCheckpoint(playerid, 2032.1682,2161.4141,10.8203, 3.0);
         pizzacp[playerid] = true;
         
     }
     else return SendClientMessageEx(playerid, COLOR_LIGHTRED, "Ban khong o tren mot chiec xe Pizza.");
  }
  else return SendClientMessageEx(playerid, COLOR_LIGHTRED, "Ban chua nhan cong viec Pizza , khong the su dung lenh nay.");
  return 1;
}

hook OnPlayerEnterCheckpoint(playerid)
{
    if(pizzacp[playerid]) // if it's true
    {
        DisablePlayerCheckpoint(playerid);
        pizzacp[playerid] = false;
        new string[128];
        new rdtienpizza = random(50000);
		PlayerInfo[playerid][pCash] += rdtienpizza;
		format(string, sizeof(string), "Ban da hoan thanh xuat sac cong viec giao Pizza %d$ do la so tien ban nhan duoc", rdtienpizza);
		SendClientMessageEx(playerid, -1, string);
    }
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
   if(PRESSED(KEY_WALK))
	{
        if(IsPlayerInRangeOfActor(playerid, Actor_Pizza))
	    {
			if(PlayerInfo[playerid][pLevel] >= 1)
			{
			    ShowPlayerDialog(playerid, JobPizza, DIALOG_STYLE_LIST, "Cong Viec Trucker", "Xin viec\nThoat Viec", "Dong y", "Huy bo");
			}
			else
			{
			   SendClientMessageEx( playerid, COLOR_WHITE, "Khong the su dung lenh nay" );
			}
		}
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
    if(dialogid == JobPizza)
	{
	    if(response)
	    {
	       	if(listitem == 0)
		    {
                PlayerInfo[playerid][pJob] = 21;
                SendClientMessageEx(playerid, COLOR_LIGHTRED, "Ban da xin viec thanh cong , bay gio ban co the lam viec.");
                return 1;
			}
			if(listitem == 1)
		    {
				PlayerInfo[playerid][pJob] = 0;
				SendClientMessageEx(playerid, COLOR_LIGHTRED, "Ban da nghi viec thanh cong.");
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
