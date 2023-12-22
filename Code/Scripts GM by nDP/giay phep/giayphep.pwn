new Text:GIAYPHEP[5];

GIAYPHEP[0] = TextDrawCreate(190.999954, 133.844360, "mdl-5005:giayphep");
TextDrawLetterSize(GIAYPHEP[0], 0.000000, 0.000000);
TextDrawTextSize(GIAYPHEP[0], 251.000000, 173.000000);
TextDrawAlignment(GIAYPHEP[0], 1);
TextDrawColor(GIAYPHEP[0], -1);
TextDrawSetShadow(GIAYPHEP[0], 0);
TextDrawSetOutline(GIAYPHEP[0], 0);
TextDrawBackgroundColor(GIAYPHEP[0], 255);
TextDrawFont(GIAYPHEP[0], 4);
TextDrawSetProportional(GIAYPHEP[0], 0);
TextDrawSetShadow(GIAYPHEP[0], 0);

GIAYPHEP[1] = TextDrawCreate(379.333282, 138.562942, "9999999");
TextDrawLetterSize(GIAYPHEP[1], 0.394333, 1.060741);
TextDrawAlignment(GIAYPHEP[1], 1);
TextDrawColor(GIAYPHEP[1], -1523963137);
TextDrawSetShadow(GIAYPHEP[1], 0);
TextDrawSetOutline(GIAYPHEP[1], 0);
TextDrawBackgroundColor(GIAYPHEP[1], 255);
TextDrawFont(GIAYPHEP[1], 3);
TextDrawSetProportional(GIAYPHEP[1], 1);
TextDrawSetShadow(GIAYPHEP[1], 0);

GIAYPHEP[2] = TextDrawCreate(298.999908, 205.762924, "BE_PHUONG");
TextDrawLetterSize(GIAYPHEP[2], 0.368333, 1.579259);
TextDrawAlignment(GIAYPHEP[2], 1);
TextDrawColor(GIAYPHEP[2], -16776961);
TextDrawSetShadow(GIAYPHEP[2], 0);
TextDrawSetOutline(GIAYPHEP[2], 0);
TextDrawBackgroundColor(GIAYPHEP[2], 255);
TextDrawFont(GIAYPHEP[2], 2);
TextDrawSetProportional(GIAYPHEP[2], 1);
TextDrawSetShadow(GIAYPHEP[2], 0);

GIAYPHEP[3] = TextDrawCreate(338.333221, 231.481399, "30-4-2002");
TextDrawLetterSize(GIAYPHEP[3], 0.400000, 1.600000);
TextDrawAlignment(GIAYPHEP[3], 1);
TextDrawColor(GIAYPHEP[3], 255);
TextDrawSetShadow(GIAYPHEP[3], 0);
TextDrawSetOutline(GIAYPHEP[3], 0);
TextDrawBackgroundColor(GIAYPHEP[3], 255);
TextDrawFont(GIAYPHEP[3], 2);
TextDrawSetProportional(GIAYPHEP[3], 1);
TextDrawSetShadow(GIAYPHEP[3], 0);

GIAYPHEP[4] = TextDrawCreate(310.333190, 255.125823, "Los_Santos");
TextDrawLetterSize(GIAYPHEP[4], 0.400000, 1.600000);
TextDrawAlignment(GIAYPHEP[4], 1);
TextDrawColor(GIAYPHEP[4], 41215);
TextDrawSetShadow(GIAYPHEP[4], 0);
TextDrawSetOutline(GIAYPHEP[4], 0);
TextDrawBackgroundColor(GIAYPHEP[4], 255);
TextDrawFont(GIAYPHEP[4], 1);
TextDrawSetProportional(GIAYPHEP[4], 1);
TextDrawSetShadow(GIAYPHEP[4], 0);


//=============================================================================//
pGIAYPHEP,

CMD:dangkycmnd(playerid, params[])
{
    if(IsPlayerInRangeOfPoint(playerid, 3.0, 2337.1775,2458.9492,14.9742))
    {
		if(PlayerInfo[playerid][pCash] > 49999)
	    {
	        if(PlayerInfo[playerid][pGIAYPHEP] == 0)
	        {
	            GivePlayerCash(playerid,- 50000);
	            SendClientMessage(playerid,0x008000FF, "[!] Ban da dang ky thanh cong giay phep su dung sung'");
	            new Rand = random(9999999);
	            new string[120];
	            PlayerInfo[playerid][pGIAYPHEP] = Rand;
	            format(string, sizeof(string), "(ID : %d) Han su dung 7 days , su dung (/xemgiayphep) de biet them",Rand);
	            SendClientMessageEx(playerid, COLOR_WHITE, string);
	        }
	        else return SendClientMessage(playerid,0x008000FF, "Ban da co giay phep roi , nen khong the dang ky tiep tuc");
	    }
	    else return SendClientMessage(playerid,0x008000FF, "[!] Ban can phia co 50.000$ de dang ky giay phep su dung sung'");
	}
	else SendClientMessage(playerid, -1, "{ADADAD}[!] {FFFFFF}Ban khong o noi dang ky giay phep su dung sung'.");
    return 1;
}

new bool:giayphepp[MAX_PLAYERS];

CMD:xemgiayphep(playerid, params[])
{
	if(PlayerInfo[playerid][pGIAYPHEP] == 1)
	{
        if((giayphepp[playerid] = !giayphepp[playerid]))
		{
			TextDrawShowForPlayer(playerid, GIAYPHEP[0]);
	        TextDrawShowForPlayer(playerid, GIAYPHEP[1]);
	        TextDrawShowForPlayer(playerid, GIAYPHEP[2]);
	        TextDrawShowForPlayer(playerid, GIAYPHEP[3]);
	        TextDrawShowForPlayer(playerid, GIAYPHEP[4]);
	        //====================//
	        new string[128];
	        new giayphep = PlayerInfo[playerid][pGIAYPHEP];
	        new nation[32];
	        //====================//
	        format(string, sizeof(string), "%d", giayphep); // Giay Phep
	        TextDrawSetString(GIAYPHEP[1], string);

	        format(string, sizeof(string), "%s", GetPlayerNameEx(playerid)); // Ho Ten
	        TextDrawSetString(GIAYPHEP[2], string);

	        format(string, sizeof(string),"%s", PlayerInfo[playerid][pBirthDate]); // Ngay sinh
	        TextDrawSetString(GIAYPHEP[3], string);

	        switch(PlayerInfo[playerid][pNation])
	        {
	    			case 0: nation = "San Andreas";
	    			case 1: nation = "Los Santos";
	        }
	        format(string, sizeof(string), "%s", nation); // Nguyen Quan
	        TextDrawSetString(GIAYPHEP[4], string);
	        SendClientMessage(playerid, -1, "Bam them mot lan nua de tat xem giay phep.");
		}
		else
		{
            TextDrawHideForPlayer(playerid, GIAYPHEP[0]);
	        TextDrawHideForPlayer(playerid, GIAYPHEP[1]);
	        TextDrawHideForPlayer(playerid, GIAYPHEP[2]);
	        TextDrawHideForPlayer(playerid, GIAYPHEP[3]);
	        TextDrawHideForPlayer(playerid, GIAYPHEP[4]);
	        SendClientMessage(playerid, -1, "Ban da tat xem giay phep.");
		}
	}
	else
	{
	    SendClientMessage(playerid, -1, "[LSPD] : Ban hien tai chua co giay phep su dung súng.");
	}
	return 1;
}

