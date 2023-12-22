//-------------------------[OnDialogResponse.PWN]--------------------------------

// Dialog Spoofing
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
	/*if(dialogid != iLastDialogID[playerid]) {
		//if(PlayerData[playerid][pAdmin]>=1339) return 1;
		SendClientMessageEx(playerid, -1, "[SYSTEM] โปรดลบ CLEO ด้วย");
		SetTimerEx("KickTimer", 1000, 0, "i", playerid);
	}*/
    iLastDialogID[playerid] = -1;
    return 0;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {

	//if(arrAntiCheat[playerid][ac_iFlags][AC_DIALOGSPOOFING] > 0) return 1;
	
	/*new sendername[MAX_PLAYER_NAME];*/
	//new string[256];

	if(strfind(inputtext, "%", true) != -1)
	{
		SendClientMessage(playerid, -1, "ตัวอักษรไม่ถูกต้องโปรดลองใหม่อีกครั้ง");
		return 1;
	}

	if(strfind(inputtext, "UPDATE", true) != -1 || strfind(inputtext, "SELECT", true) != -1 || strfind(inputtext, "DROP", true) != -1 || strfind(inputtext, "INSERT", true) != -1 || strfind(inputtext, "SLEEP", true) != -1)
	{
		/*new logstirng[400];
		format(logstirng, sizeof(logstirng), "%s | Dialog ID: %d | SQL ID: %d", inputtext, dialogid, PlayerData[playerid][pDBID]);
		Log("logs/fquery.log", logstirng);*/
	}
	return 0;
}
