#include <YSI\y_hooks>

CMD:setkill(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 1337)
	{
		new string[128], giveplayerid, amount;
		if(sscanf(params, "ud", giveplayerid, amount)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setkill [player] [amount]");

		if(IsPlayerConnected(giveplayerid))
		{
			PlayerInfo[giveplayerid][pGiet] = amount;
			format(string, sizeof(string), "Ban da dieu chinh so lan giet nguoi %s's thanh %d !",GetPlayerNameEx(giveplayerid),amount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			format(string, sizeof(string), "VIP: Admin %s da dieu chinh so lan giet nguoi cua ban thanh %d.",GetPlayerNameEx(playerid),amount);
			SendClientMessageEx(giveplayerid, COLOR_YELLOW, string);

			format(string, sizeof(string), "%s da dieu chinh so lan giet nguoi cua %s's thanh %d.",GetPlayerNameEx(playerid),GetPlayerNameEx(giveplayerid),amount);
			Log("logs/stats.log", string);
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:setdeath(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 1337)
	{
		new string[128], giveplayerid, amount;
		if(sscanf(params, "ud", giveplayerid, amount)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setdeath [player] [amount]");

		if(IsPlayerConnected(giveplayerid))
		{
			PlayerInfo[giveplayerid][pChet] = amount;
			format(string, sizeof(string), "Ban da dieu chinh so lan chet cua %s's thanh %d !",GetPlayerNameEx(giveplayerid),amount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			format(string, sizeof(string), "VIP: Admin %s da dieu chinh so lan chet cua ban thanh %d.",GetPlayerNameEx(playerid),amount);
			SendClientMessageEx(giveplayerid, COLOR_YELLOW, string);

			format(string, sizeof(string), "%s da dieu chinh so lan chet cua %s's thanh %d.",GetPlayerNameEx(playerid),GetPlayerNameEx(giveplayerid),amount);
			Log("logs/stats.log", string);
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}
