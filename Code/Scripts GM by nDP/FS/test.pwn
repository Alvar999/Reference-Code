new adminchat[MAX_PLAYERS];

stock SendAdminMessage(color, string[])
{
	foreach(new i: Player)
	{
		if((PlayerInfo[i][pHelper] >= 2 || PlayerInfo[i][pDonateRank] == 5 || PlayerInfo[i][pWatchdog] == 1) && adminchat[i])
		{
			SendClientMessageEx(i, color, string);
		}
		else
		{
			if(PlayerInfo[i][pAdmin] >= 1 && adminchat[i])
			{
				SendClientMessageEx(i, color, string);
			}
		}
	}
}

CMD:toga(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 1)
	{
		if (!adminchat[playerid])
		{
			adminchat[playerid] = 1;
			SendClientMessageEx(playerid, COLOR_GRAD2, "   Ban bat kenh chat administrator!");
		}
		else
		{
			adminchat[playerid] = 0;
			SendClientMessageEx(playerid, COLOR_GRAD2, "   Ban da tat kenh chat administrator!");
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GREY, "   Ban khong phai administrator de su dung lenh nay!");
		return 1;
	}
	return 1;
}

adminchat[playerid] = 1;

////////////

CMD:admin(playerid, params[])  {
	if(PlayerInfo[playerid][pAdmin] >= 2) && advisorchat[playerid]) {
		if(!isnull(params)) {

			new
				szMessage[128];

			if(PlayerInfo[playerid][pAdmin] == 2) format(szMessage, sizeof(szMessage), "* Junior Admin %s: %s", GetPlayerNameEx(playerid), params);
			else if(PlayerInfo[playerid][pAdmin] == 3) format(szMessage, sizeof(szMessage), "* General Admin %s: %s", GetPlayerNameEx(playerid), params);
			else if(PlayerInfo[playerid][pAdmin] == 4) format(szMessage, sizeof(szMessage), "* Senior Admin %s: %s", GetPlayerNameEx(playerid), params);
			else if(PlayerInfo[playerid][pAdmin] == 1337) format(szMessage, sizeof(szMessage), "* Head Admin %s: %s", GetPlayerNameEx(playerid), params);
			else if(PlayerInfo[playerid][pAdmin] == 1338) format(szMessage, sizeof(szMessage), "* Lead Head Admin %s: %s", GetPlayerNameEx(playerid), params);
			else if(PlayerInfo[playerid][pAdmin] == 1339) format(szMessage, sizeof(szMessage), "* Deputy Admin %s: %s", GetPlayerNameEx(playerid), params);
			else if(PlayerInfo[playerid][pAdmin] == 99999) format(szMessage, sizeof(szMessage), "* Executive Admin %s: %s", GetPlayerNameEx(playerid), params);
			else if(PlayerInfo[playerid][pSMod] == 1) format(szMessage, sizeof(szMessage), "* Senior Moderator %s: %s", GetPlayerNameEx(playerid), params);
			else format(szMessage, sizeof(szMessage), "* Undefined Admin (%i) %s: %s", PlayerInfo[playerid][pAdmin], GetPlayerNameEx(playerid), params);

			foreach(new i: Player)
			{
			    if(PlayerInfo[i][pAdmin] >= 2)
			    {
			        SendClientMessage(i, COLOR_YELLOW, szMessage);
			    }
			}
		}
		SendAdvisorMessage(COLOR_COMBINEDCHAT, szMessage);
		Log("logs/adminchatndp.log", szMessage);
		else SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: (/a)dmin [admin chat]");
	}
	return 1;
}
