/*  ---------------- [WRAPPERS.PWN] ----------------- */

stock randomEx(min, max)
{
    new rand = random(max-min)+min;
    return rand;
}

stock ShowPlayerDialogEx(playerid, dialogid, style, caption[], info[], button1[], button2[]) {

	iLastDialogID[playerid] = dialogid;
	return ShowPlayerDialog(playerid, dialogid, style, caption, info, button1, button2);
}

stock SendClientMessageEx(playerid, color, const text[], {Float, _}:...)
{
	static
	    args,
	    str[144];

	if ((args = numargs()) == 3)
	{
	    SendClientMessage(playerid, color, text);
	}
	else
	{
		while (--args >= 3)
		{
			#emit LCTRL 5
			#emit LOAD.alt args
			#emit SHL.C.alt 2
			#emit ADD.C 12
			#emit ADD
			#emit LOAD.I
			#emit PUSH.pri
		}
		#emit PUSH.S text
		#emit PUSH.C 144
		#emit PUSH.C str
		#emit PUSH.S 8
		#emit SYSREQ.C format
		#emit LCTRL 5
		#emit SCTRL 4

		SendClientMessage(playerid, color, str);

		#emit RETN
	}
	return 1;
}

stock SendMatchMessage(matchid, color, const str[], {Float,_}:...)
{
	static
	    args,
	    start,
	    end,
	    string[144]
	;
	#emit LOAD.S.pri 8
	#emit STOR.pri args

	if (args > 12)
	{
		#emit ADDR.pri str
		#emit STOR.pri start

	    for (end = start + (args - 12); end > start; end -= 4)
		{
	        #emit LREF.pri end
	        #emit PUSH.pri
		}
		#emit PUSH.S str
		#emit PUSH.C 144
		#emit PUSH.C string
		#emit PUSH.C args

		#emit SYSREQ.C format
		#emit LCTRL 5
		#emit SCTRL 4

		foreach (new i : Player) if (PlayerInMatching[i] == matchid && InGame{i}) {
		    SendClientMessage(i, color, string);
		}
		return 1;
	}
	foreach (new i : Player) if (PlayerInMatching[i] == matchid && InGame{i}) {
 		SendClientMessage(i, color, str);
	}
	return 1;
}

stock SetPlayerHealthEx(playerid, Float:hp)
{
	UpdateHealthBar(playerid, hp);
	PlayerData[playerid][pHealth] = hp;
	return SetPlayerHealth(playerid, hp);
}

stock KickEx(playerid)
{
	return SetTimerEx("KickTimer", 400, false, "d", playerid);
}