// ========== CHUNG MINH NHAN DAN ======================== //
// Credits: nDP
// Fb.com/nguyenduyphuong.dz

//======================================================== //
#include <YSI\y_hooks>

//new Text:CMND[20][MAX_PLAYERS];
stock tatcmnd(playerid,targetid)
{
    if(IsPlayerConnected(targetid))
	{
        for(new i=0; i <= 23; i++) TextDrawHideForPlayer(playerid, CMND[i][playerid]);
	}
}


stock hiencmnd(playerid,targetid)
{
	if(IsPlayerConnected(targetid))
	{
        new string[32];
	    new playername[MAX_PLAYER_NAME];
	    new nation[32];
	    new sext[32];
        TextDrawSetPreviewModel(CMND[7][playerid], GetPlayerSkin(targetid));
        GetPlayerName(playerid, playername, sizeof(playername));

        format(string, sizeof(string), "%s", playername); // Ho Ten
        TextDrawSetString(CMND[16][playerid], string);

        format(string,sizeof(string),"%d", PlayerInfo[targetid][pCMND]); // SO CMND
        TextDrawSetString(CMND[22][playerid], string);

        format(string, sizeof(string),"%s", PlayerInfo[targetid][pBirthDate]); // Ngay sinh
        TextDrawSetString(CMND[17][playerid], string);

        switch(PlayerInfo[targetid][pNation])
        {
    			case 0: nation = "San Andreas";
    			case 1: nation = "Los Santos";
        }
        format(string, sizeof(string), "%s", nation); // Nguyen Quan
        TextDrawSetString(CMND[18][playerid], string);
		//
		//if(PlayerInfo[targetid][pSex] == 1) { sext = "Male"; } else { sext = "Female"; }
		//
		switch(PlayerInfo[targetid][pSex])
        {
    			case 0: sext = "Male";
    			case 1: sext = "Female";
        }
        //format(string, sizeof(string), "%d", PlayerInfo[targetid][pPhousekey]); // Ho khau thuong tru
        format(string, sizeof(string), "%s", nation);
        TextDrawSetString(CMND[19][playerid], sext);

        //format(string, sizeof(string), "Ho_khau_thuong_tru_2: %d", PlayerInfo[targetid][pPhousekey2]);
        //TextDrawSetString(CMND[14][playerid], string);
        for(new i=0; i <= 23; i++) TextDrawShowForPlayer(playerid, CMND[i][playerid]);
	}
}


CMD:muacmnd(playerid, params[])
{
    new rand = Random(100000000, 999999999);
    new giveplayerid;
    new string[64];
    PlayerInfo[giveplayerid][pCMND] = rand;
    format(string, sizeof(string), "{FF0019}[i] %s da mua chung minh nhan dan so %d.", GetPlayerNameEx(giveplayerid), PlayerInfo[giveplayerid][pCMND]);
    SendClientMessage(playerid, COLOR_YELLOW, string);
	return 1;
}

CMD:xemcmnd(playerid, params[])
{
	if(gPlayerLogged{playerid} != 0) hiencmnd(playerid, playerid);
	return 1;
}
CMD:tatcmnd(playerid, params[])
{
	if(gPlayerLogged{playerid} != 0) tatcmnd(playerid, playerid);
	return 1;
}

CMD:rscmnd(playerid, params[])
{
	PlayerInfo[playerid][pCMND] = 0;
	SendClientMessageEx(playerid, COLOR_GRAD2, "Ban da reset CMND thanh cong.");
	SendClientMessageEx(playerid, COLOR_GRAD2, "Scripts: Nguyen Duy Phuong.");
	return 1;
}
