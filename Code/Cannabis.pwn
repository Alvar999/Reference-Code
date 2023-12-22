//tim // objects r add ben tren

#define         DIALOG_BANCANSA             (5085)
#define         DIALOG_RUATIEN              (5086)

//tim enum pinfo roi add ben tren no
enum CayCanSa
{
	CayCanSa1,
	CayCanSa2,
	CayCanSa3,
	CayCanSa4,
	CayCanSa5,
	CayCanSa6,
	CayCanSa7,
	CayCanSa8,
	CayCanSa9,
	CayCanSa10,
	CayCanSa11,
	CayCanSa12
};
new PlayerCS[CayCanSa];

//tim pInfo them vao
	pLaCanSa,
    pTienBan,
    pCanSa,

//tim //MySQL Connection Variable add ben tren no
new DangCheBienCanSa[MAX_PLAYERS];
new DangHaiCanSa[MAX_PLAYERS];

//tim task AFKUpdate[10000]() add ben tren no

task ResetHaiCan[900000]()
{
	// 900000 = 20 phut
	foreach(new i: Player)
	{
		PlayerCS[CayCanSa1] = 0;
		PlayerCS[CayCanSa2] = 0;
		PlayerCS[CayCanSa3] = 0;
		PlayerCS[CayCanSa4] = 0;
		PlayerCS[CayCanSa5] = 0;
		PlayerCS[CayCanSa6] = 0;
		PlayerCS[CayCanSa7] = 0;
		PlayerCS[CayCanSa8] = 0;
		PlayerCS[CayCanSa9] = 0;
		PlayerCS[CayCanSa10] = 0;
		PlayerCS[CayCanSa11] = 0;
		PlayerCS[CayCanSa12] = 0;
	}
}

//tim for(new i = 0; i < 12; i++) roi add ben duoi

			cache_get_field_content(row,  "LaCanSa", szResult, MainPipeline); PlayerInfo[extraid][pLaCanSa] = strval(szResult);
			cache_get_field_content(row,  "CanSa", szResult, MainPipeline); PlayerInfo[extraid][pCanSa] = strval(szResult);
			cache_get_field_content(row,  "TienBan", szResult, MainPipeline); PlayerInfo[extraid][pTienBan] = strval(szResult);
			
//tim "Gun11" add ben duoi

	SavePlayerInteger(query, GetPlayerSQLId(playerid), "LaCanSa", PlayerInfo[playerid][pLaCanSa]);
	SavePlayerInteger(query, GetPlayerSQLId(playerid), "CanSa", PlayerInfo[playerid][pCanSa]);
	SavePlayerInteger(query, GetPlayerSQLId(playerid), "TienBan", PlayerInfo[playerid][pTienBan]);

//tim  public OnPlayerDisconnect add ben duoi

    DangCheBienCanSa[playerid] = 0;
    DangHaiCanSa[playerid] = 0;
    
//tim public OnPlayerKeyStateChange

    if(PRESSED(KEY_CTRL_BACK))
	{
	    if(IsPlayerInRangeOfPoint(playerid, 5.0, 2302.2637,-1785.4314,1600.7520) || IsPlayerInRangeOfPoint(playerid, 5.0, 2297.0278,-1785.5809,1600.7520) || IsPlayerInRangeOfPoint(playerid, 5.0, 2299.4182,-1788.6748,1600.7520))
    	{
    	    cmd_chebiencansa(playerid, "");
    	}
    	if(IsPlayerInRangeOfPoint(playerid, 5.0, 2013.4479,-2042.5402,13.5469))
	    {
			new string[128];
			format(string, 128, "\nCan sa hien co cua ban: %d\nGia : 4000 tien ban~ / 1 Can Sa/tui\nNhap so luong ban muon ban:", PlayerInfo[playerid][pCanSa]);
			ShowPlayerDialog(playerid, DIALOG_BANCANSA, DIALOG_STYLE_INPUT, "Ban can sa", string,"Ban","Huy");
		}
		if(IsPlayerInRangeOfPoint(playerid, 5.0, 666.1619,-1879.8625,5.4600))
	    {
			cmd_ruatienban(playerid, "");
		}
	}
	
//tim CreateDynamic3DTextLabel("Famed Locker.....   add ben duoi
	CreateDynamic3DTextLabel("Cay Can Sa\nSu dung: /haicansa",COLOR_GREEN,-1172.7427,-1052.4221,129.2188+0.5,30.0); // haicansa_1
	CreateDynamic3DTextLabel("Cay Can Sa\nSu dung: /haicansa",COLOR_GREEN,-1164.6870,-1059.5535,129.2188+0.5,30.0); // haicansa_2
	CreateDynamic3DTextLabel("Cay Can Sa\nSu dung: /haicansa",COLOR_GREEN,-1157.5173,-1051.7510,129.2188+0.5,30.0); // haicansa_3
	CreateDynamic3DTextLabel("Cay Can Sa\nSu dung: /haicansa",COLOR_GREEN,-1146.0962,-1058.7749,129.2188+0.5,30.0); // haicansa_4
	CreateDynamic3DTextLabel("Cay Can Sa\nSu dung: /haicansa",COLOR_GREEN,-1135.0260,-1051.4601,129.2188+0.5,30.0); // haicansa_5
	CreateDynamic3DTextLabel("Cay Can Sa\nSu dung: /haicansa",COLOR_GREEN,-1127.5415,-1056.0299,129.2188+0.5,30.0); // haicansa_6
	CreateDynamic3DTextLabel("Cay Can Sa\nSu dung: /haicansa",COLOR_GREEN,-1119.3721,-1049.3582,129.2188+0.5,30.0); // haicansa_7
	CreateDynamic3DTextLabel("Cay Can Sa\nSu dung: /haicansa",COLOR_GREEN,-1110.9088,-1055.8888,129.2188+0.5,30.0); // haicansa_8
	CreateDynamic3DTextLabel("Cay Can Sa\nSu dung: /haicansa",COLOR_GREEN,-1102.9227,-1049.2195,129.2119+0.5,30.0); // haicansa_9
	CreateDynamic3DTextLabel("Cay Can Sa\nSu dung: /haicansa",COLOR_GREEN,-1094.3296,-1055.9758,129.2119+0.5,30.0); // haicansa_10
	CreateDynamic3DTextLabel("Cay Can Sa\nSu dung: /haicansa",COLOR_GREEN,-1086.5907,-1049.3502,129.2119+0.5,30.0); // haicansa_11
	CreateDynamic3DTextLabel("Cay Can Sa\nSu dung: /haicansa",COLOR_GREEN,-1077.7529,-1056.2471,129.2119+0.5,30.0); // haicansa_12

	CreateDynamic3DTextLabel("Che bien can sa\nSu dung: H or /chebiencansa",COLOR_YELLOW,2302.2637,-1785.4314,1600.7520+0.5,30.0);
	CreateDynamic3DTextLabel("Che bien can sa\nSu dung: H or /chebiencansa",COLOR_YELLOW,2297.0278,-1785.5809,1600.7520+0.5,30.0);
	CreateDynamic3DTextLabel("Che bien can sa\nSu dung: H or /chebiencansa",COLOR_YELLOW,2299.4182,-1788.6748,1600.7520+0.5,30.0);

	CreateDynamic3DTextLabel("RUA TIEN BAN\nSu dung: H or /ruatienban",COLOR_YELLOW,993.1326, 1068.7327, 10.8203+0.5,30.0);
	
//tim public OnDialogResponse

if(dialogid == DIALOG_BANCANSA) {
		if(response) {
			if(strval(inputtext) > 0) {
				if(PlayerInfo[playerid][pCanSa] >= strval(inputtext)) {
					PlayerInfo[playerid][pCanSa] -= strval(inputtext);
					PlayerInfo[playerid][pTienBan] += strval(inputtext) * 4000;
					format(string, 128, "Ban da ban' thanh cong %d can sa, va nhan duoc %d$ Tien Ban tu viec ban' can sa.", strval(inputtext), strval(inputtext)*20);
					SendClientMessage(playerid, -1, string);
				}
				else
					SendClientMessage(playerid, -1,"So luong khong hop le! hay kiem tra lai so luong cua ban");
			}
			else
				SendClientMessage(playerid, -1,"So luong can ban phai lon hon 0!");
		}
	}

	if(dialogid == DIALOG_RUATIEN && response) { //ruatien
    	new dirtymoney = strval(inputtext);
    	if(isnull(inputtext) || !IsNumeric(inputtext) || strlen(inputtext) < 0 || strlen(inputtext) > 50 || strval(inputtext) < 100)
			return SendClientMessage(playerid, -1, "[{AA3333}!{FFFFFF}] Ban phai rua so tien ban toi thieu thu $100 tro len.");
		if(PlayerInfo[playerid][pTienBan] < dirtymoney) return SendClientMessage(playerid, -1, "Ban khong du so luong tien ban de rua.");
		PlayerInfo[playerid][pTienBan] -= strval(inputtext);
		PlayerInfo[playerid][pCash] += (strval(inputtext)-((strval(inputtext)/100)*20));
		format(string, 128, "[{FF0000}!{FFFFFF}]Ban da rua thanh cong $%s {FF0000}Tien Ban~ sang $%s {00FF00}Tien That", number_format(strval(inputtext)), number_format((strval(inputtext))-((strval(inputtext)/100)*20)));
		SendClientMessage(playerid, -1, string);
	}
	
//add cuoi GM
CMD:hutcansa(playerid, params[])
{
	if(PlayerInfo[playerid][pCanSa] >= 1)
	{
        TogglePlayerControllable(playerid, 0);
		SetPlayerAttachedObject(playerid, 5, 1666, 1, 0.2487, 0.4408, 0.1939, 127.0998, 21.3999, 11.7999, 0.6620, 0.7839, 3.5720, 0xFFFFFFFF, 0xFFFFFFFF);
		SetPlayerAttachedObject(playerid, 6, 1942, 1, 0.2558, 0.5037, 0.2409, 34.2000, 0.0000, 112.1998, 0.0637, 0.6539, 0.0599, 0xFFFFFFFF, 0xFFFFFFFF);
		SetPlayerAttachedObject(playerid, 7, 1942, 1, 0.1490, 0.6419, 0.3479, 33.5000, 7.4998, 21.7999, 0.0860, 0.4699, 0.0920, 0xFFFFFFFF, 0xFFFFFFFF);
		SetPlayerAttachedObject(playerid, 8, 18673, 1, 0.3449, -0.3939, -1.0950, -34.4000, -1.2999, 101.3000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF);
		SetPlayerAttachedObject(playerid, 9, 1933, 5, 0.0777, 0.0399, -0.0368, 0.0000, 0.0000, 0.0000, 0.1620, 0.0419, 0.5529, 0xFFFFFFFF, 0xFFFFFFFF);
		GameTextForPlayer(playerid, "~y~Dang hut can sa", 5000, 3);
		SetPVarInt(playerid, "Hutcansa", 1);
        SetTimerEx("Hutcansa", 14000, 0, "d", playerid);
        PlayerInfo[playerid][pCanSa] -= 1;
        ApplyAnimation(playerid, "BUDDY", "BUDDY_CROUCHRELOAD", 4.0, 0, 0, 0, 1, 0); // hut
        ApplyAnimation(playerid, "BUDDY", "BUDDY_CROUCHRELOAD", 4.0, 0, 0, 0, 1, 0); // hut
	}else return SendClientMessage(playerid,-1,"Ban khong co can sa.");
	return 1;
}

forward Hutcansa(playerid);
public Hutcansa(playerid)
{
    TogglePlayerControllable(playerid, 1);
    RemovePlayerAttachedObject(playerid,5);
	RemovePlayerAttachedObject(playerid,6);
	RemovePlayerAttachedObject(playerid,7);
	RemovePlayerAttachedObject(playerid,8);
	RemovePlayerAttachedObject(playerid,9);
	PlayerStoned[playerid] = 1;
	if(PlayerStoned[playerid] == 1)
	{
		GameTextForPlayer(playerid, "~w~Ban dang ~b~phe thuoc", 5000, 3);
	}
	ApplyAnimation(playerid, "CRACK", "BBALBAT_IDLE_01", 4.0, 0, 0, 0, 0, 0);

	new Float:health;
    GetPlayerHealth(playerid, health);
    if(health <= 50)
    {
    	SetPlayerHealth(playerid, health + 50.0);
    }
	return 1;
}

CMD:haicansa(playerid, params[])
{
    if(IsPlayerInRangeOfPoint(playerid, 5.0, -1172.7427,-1052.4221,129.2188))
    {
        if(DangHaiCanSa[playerid] == 0)
        {
            if(PlayerCS[CayCanSa1] != 10)
            {

                PlayerCS[CayCanSa1] += 1;
                DangHaiCanSa[playerid] = 1;

                TogglePlayerControllable(playerid, 0);
		        ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.0,0,0,0,0,0,1);

		        SetPVarInt(playerid, "CanSaTime", 10);
				SetTimerEx("CanSa", 1000, 0, "d", playerid);

	            //________________________________________________________________
    		}else SendClientMessage(playerid, COLOR_YELLOW, "Hien tai cay can sa nay , da duoc hai het ban vui long doi hoac tim cay khac.");
        }else SendClientMessage(playerid, COLOR_YELLOW, "Ban dang hai can sa, khong the hai tiep tuc, vui long doi!.");
    }

    else if(IsPlayerInRangeOfPoint(playerid, 5.0, -1164.6870,-1059.5535,129.2188))
    {
        if(DangHaiCanSa[playerid] == 0)
        {
            if(PlayerCS[CayCanSa2] != 10)
            {

                PlayerCS[CayCanSa2] += 1;
                DangHaiCanSa[playerid] = 1;

                TogglePlayerControllable(playerid, 0);
		        ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.0,0,0,0,0,0,1);

		        SetPVarInt(playerid, "CanSaTime", 10);
				SetTimerEx("CanSa", 1000, 0, "d", playerid);

	            //________________________________________________________________

    		}else SendClientMessage(playerid, COLOR_YELLOW, "Hien tai cay can sa nay , da duoc hai het ban vui long doi hoac tim cay khac.");
        }else SendClientMessage(playerid, COLOR_YELLOW, "Ban dang hai can sa, khong the hai tiep tuc, vui long doi!.");
    }

    else if(IsPlayerInRangeOfPoint(playerid, 5.0, -1157.5173,-1051.7510,129.2188))
    {
        if(DangHaiCanSa[playerid] == 0)
        {
            if(PlayerCS[CayCanSa3] != 10)
            {

                PlayerCS[CayCanSa3] += 1;
                DangHaiCanSa[playerid] = 1;

                TogglePlayerControllable(playerid, 0);
		        ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.0,0,0,0,0,0,1);

		        SetPVarInt(playerid, "CanSaTime", 10);
				SetTimerEx("CanSa", 1000, 0, "d", playerid);

	            //________________________________________________________________

    		}else SendClientMessage(playerid, COLOR_YELLOW, "Hien tai cay can sa nay , da duoc hai het ban vui long doi hoac tim cay khac.");
        }else SendClientMessage(playerid, COLOR_YELLOW, "Ban dang hai can sa, khong the hai tiep tuc, vui long doi!.");
    }

    else if(IsPlayerInRangeOfPoint(playerid, 5.0, -1146.0962,-1058.7749,129.2188))
    {
        if(DangHaiCanSa[playerid] == 0)
        {
            if(PlayerCS[CayCanSa4] != 10)
            {

                PlayerCS[CayCanSa4] += 1;
                DangHaiCanSa[playerid] = 1;

                TogglePlayerControllable(playerid, 0);
		        ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.0,0,0,0,0,0,1);

		        SetPVarInt(playerid, "CanSaTime", 10);
				SetTimerEx("CanSa", 1000, 0, "d", playerid);

	            //________________________________________________________________

    		}else SendClientMessage(playerid, COLOR_YELLOW, "Hien tai cay can sa nay , da duoc hai het ban vui long doi hoac tim cay khac.");
        }else SendClientMessage(playerid, COLOR_YELLOW, "Ban dang hai can sa, khong the hai tiep tuc, vui long doi!.");
    }

    else if(IsPlayerInRangeOfPoint(playerid, 5.0, -1135.0260,-1051.4601,129.2188))
    {
        if(DangHaiCanSa[playerid] == 0)
        {
            if(PlayerCS[CayCanSa5] != 10)
            {

                PlayerCS[CayCanSa5] += 1;
                DangHaiCanSa[playerid] = 1;

                TogglePlayerControllable(playerid, 0);
		        ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.0,0,0,0,0,0,1);

		        SetPVarInt(playerid, "CanSaTime", 10);
				SetTimerEx("CanSa", 1000, 0, "d", playerid);

	            //________________________________________________________________

    		}else SendClientMessage(playerid, COLOR_YELLOW, "Hien tai cay can sa nay , da duoc hai het ban vui long doi hoac tim cay khac.");
        }else SendClientMessage(playerid, COLOR_YELLOW, "Ban dang hai can sa, khong the hai tiep tuc, vui long doi!.");
    }

    else if(IsPlayerInRangeOfPoint(playerid, 5.0, -1127.5415,-1056.0299,129.2188))
    {
        if(DangHaiCanSa[playerid] == 0)
        {
            if(PlayerCS[CayCanSa6] != 10)
            {

                PlayerCS[CayCanSa6] += 1;
                DangHaiCanSa[playerid] = 1;

                TogglePlayerControllable(playerid, 0);
		        ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.0,0,0,0,0,0,1);

		        SetPVarInt(playerid, "CanSaTime", 10);
				SetTimerEx("CanSa", 1000, 0, "d", playerid);

	            //________________________________________________________________

    		}else SendClientMessage(playerid, COLOR_YELLOW, "Hien tai cay can sa nay , da duoc hai het ban vui long doi hoac tim cay khac.");
        }else SendClientMessage(playerid, COLOR_YELLOW, "Ban dang hai can sa, khong the hai tiep tuc, vui long doi!.");
    }

    else if(IsPlayerInRangeOfPoint(playerid, 5.0, -1119.3721,-1049.3582,129.2188))
    {
        if(DangHaiCanSa[playerid] == 0)
        {
            if(PlayerCS[CayCanSa7] != 10)
            {

                PlayerCS[CayCanSa7] += 1;
                DangHaiCanSa[playerid] = 1;

                TogglePlayerControllable(playerid, 0);
		        ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.0,0,0,0,0,0,1);

		        SetPVarInt(playerid, "CanSaTime", 10);
				SetTimerEx("CanSa", 1000, 0, "d", playerid);

	            //________________________________________________________________

    		}else SendClientMessage(playerid, COLOR_YELLOW, "Hien tai cay can sa nay , da duoc hai het ban vui long doi hoac tim cay khac.");
        }else SendClientMessage(playerid, COLOR_YELLOW, "Ban dang hai can sa, khong the hai tiep tuc, vui long doi!.");
    }

    else if(IsPlayerInRangeOfPoint(playerid, 5.0, -1110.9088,-1055.8888,129.2188))
    {
        if(DangHaiCanSa[playerid] == 0)
        {
            if(PlayerCS[CayCanSa8] != 10)
            {

                PlayerCS[CayCanSa8] += 1;
                DangHaiCanSa[playerid] = 1;

                TogglePlayerControllable(playerid, 0);
		        ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.0,0,0,0,0,0,1);

		        SetPVarInt(playerid, "CanSaTime", 10);
				SetTimerEx("CanSa", 1000, 0, "d", playerid);

	            //________________________________________________________________

    		}else SendClientMessage(playerid, COLOR_YELLOW, "Hien tai cay can sa nay , da duoc hai het ban vui long doi hoac tim cay khac.");
        }else SendClientMessage(playerid, COLOR_YELLOW, "Ban dang hai can sa, khong the hai tiep tuc, vui long doi!.");
    }

    else if(IsPlayerInRangeOfPoint(playerid, 5.0, -1102.9227,-1049.2195,129.2119))
    {
        if(DangHaiCanSa[playerid] == 0)
        {
            if(PlayerCS[CayCanSa9] != 10)
            {

                PlayerCS[CayCanSa9] += 1;
                DangHaiCanSa[playerid] = 1;

                TogglePlayerControllable(playerid, 0);
		        ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.0,0,0,0,0,0,1);

		        SetPVarInt(playerid, "CanSaTime", 10);
				SetTimerEx("CanSa", 1000, 0, "d", playerid);

	            //________________________________________________________________

    		}else SendClientMessage(playerid, COLOR_YELLOW, "Hien tai cay can sa nay , da duoc hai het ban vui long doi hoac tim cay khac.");
        }else SendClientMessage(playerid, COLOR_YELLOW, "Ban dang hai can sa, khong the hai tiep tuc, vui long doi!.");
    }

    else if(IsPlayerInRangeOfPoint(playerid, 5.0, -1094.3296,-1055.9758,129.2119))
    {
        if(DangHaiCanSa[playerid] == 0)
        {
            if(PlayerCS[CayCanSa10] != 10)
            {

                PlayerCS[CayCanSa10] += 1;
                DangHaiCanSa[playerid] = 1;

                TogglePlayerControllable(playerid, 0);
		        ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.0,0,0,0,0,0,1);

		        SetPVarInt(playerid, "CanSaTime", 10);
				SetTimerEx("CanSa", 1000, 0, "d", playerid);

	            //________________________________________________________________

    		}else SendClientMessage(playerid, COLOR_YELLOW, "Hien tai cay can sa nay , da duoc hai het ban vui long doi hoac tim cay khac.");
        }else SendClientMessage(playerid, COLOR_YELLOW, "Ban dang hai can sa, khong the hai tiep tuc, vui long doi!.");
    }

    else if(IsPlayerInRangeOfPoint(playerid, 5.0, -1086.5907,-1049.3502,129.2119))
    {
        if(DangHaiCanSa[playerid] == 0)
        {
            if(PlayerCS[CayCanSa11] != 10)
            {

                PlayerCS[CayCanSa11] += 1;
                DangHaiCanSa[playerid] = 1;

                TogglePlayerControllable(playerid, 0);
		        ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.0,0,0,0,0,0,1);

		        SetPVarInt(playerid, "CanSaTime", 10);
				SetTimerEx("CanSa", 1000, 0, "d", playerid);

	            //________________________________________________________________
    		}else SendClientMessage(playerid, COLOR_YELLOW, "Hien tai cay can sa nay , da duoc hai het ban vui long doi hoac tim cay khac.");
        }else SendClientMessage(playerid, COLOR_YELLOW, "Ban dang hai can sa, khong the hai tiep tuc, vui long doi!.");
    }

    else if(IsPlayerInRangeOfPoint(playerid, 5.0, -1077.7529,-1056.2471,129.2119))
    {
        if(DangHaiCanSa[playerid] == 0)
        {
            if(PlayerCS[CayCanSa12] != 10)
            {

                PlayerCS[CayCanSa12] += 1;
                DangHaiCanSa[playerid] = 1;

                TogglePlayerControllable(playerid, 0);
		        ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.0,0,0,0,0,0,1);

		        SetPVarInt(playerid, "CanSaTime", 10);
				SetTimerEx("CanSa", 1000, 0, "d", playerid);

	            //________________________________________________________________
    		}else SendClientMessage(playerid, COLOR_YELLOW, "Hien tai cay can sa nay , da duoc hai het ban vui long doi hoac tim cay khac.");
        }else SendClientMessage(playerid, COLOR_YELLOW, "Ban dang hai can sa, khong the hai tiep tuc, vui long doi!.");
    }


    //___________________________________________________________________________________________________________________________________________
    else SendClientMessage(playerid, COLOR_YELLOW, "Ban khong o noi co can sa, khong the hai ngay tai day.");
	return 1;
}

forward CanSa(playerid);
public CanSa(playerid)
{
    SetPVarInt(playerid, "CanSaTime", GetPVarInt(playerid, "CanSaTime")-1);

    new string[1280];
    format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~n~~n~~w~Dang hai can sa...");
    GameTextForPlayer(playerid, string, 1100, 3);
    ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.0,0,0,0,0,0,1);
    if(GetPVarInt(playerid, "CanSaTime") > 0) SetTimerEx("CanSa", 1000, 0, "d", playerid);


    if(GetPVarInt(playerid, "CanSaTime") <= 0)
    {
        DeletePVar(playerid, "CanSaTime");
        DeletePVar(playerid, "CanSa");

        TogglePlayerControllable(playerid, 1);
        ClearAnimations(playerid);

		PlayerInfo[playerid][pLaCanSa] += 1;

        DangHaiCanSa[playerid] = 0;
        SendClientMessageEx(playerid, COLOR_YELLOW, "Ban da hai duoc 1 La' C�n` Sa.");
        return 1;
    }
    return 1;
}

CMD:ruatienban(playerid, params[])
{
    if(IsPlayerInRangeOfPoint(playerid, 5.0, 993.1326, 1068.7327, 10.8203))
    {
		new string[128];
		format(string, 128, "Ban muon rua~ bao nhieu tien ban~\nVD: 100.000 Tien Ban = 80.000 SAD\nSo Tien Ban Ban Dang Co: %d\nNhap so luong ban muon doi vao o ben duoi: ", PlayerInfo[playerid][pTienBan]);
		ShowPlayerDialog(playerid, DIALOG_RUATIEN, DIALOG_STYLE_INPUT, "RUA TIEN BAN", string,"Rua ngay","Huy");
	}else SendClientMessage(playerid, COLOR_YELLOW, "Ban khong o dia diem rua tien`.");
	return 1;
}

CMD:chebiencansa(playerid, params[])
{
    if(IsPlayerInRangeOfPoint(playerid, 5.0, 2302.2637,-1785.4314,1600.7520) || IsPlayerInRangeOfPoint(playerid, 5.0, 2297.0278,-1785.5809,1600.7520) || IsPlayerInRangeOfPoint(playerid, 5.0, 2299.4182,-1788.6748,1600.7520))
    {
		if(PlayerInfo[playerid][pLaCanSa] >= 5)
		{
		    if(DangCheBienCanSa[playerid] == 0)
		    {
		        TogglePlayerControllable(playerid, 0);

				PlayerInfo[playerid][pLaCanSa] -= 5;

				SetPVarInt(playerid, "CanSaTime1", 30);
				SetTimerEx("CanSa1", 1000, 0, "d", playerid);

				DangCheBienCanSa[playerid] = 1;

				SendClientMessage(playerid, COLOR_GREEN, "[CAN SA] Ban da bat dau che bien can sa, vui long doi.");
			}else SendClientMessage(playerid, COLOR_YELLOW, "Ban dang che bien can sa, khong the tiep tuc nua~.");
			//________
		}else SendClientMessage(playerid, COLOR_YELLOW, "Ban can phai co tren 5 La' C�n` Sa , moi co the ch�' bi�n'.");
	}else SendClientMessage(playerid, COLOR_YELLOW, "Ban khong o noi che bi�n' can sa.");
	return 1;
}

forward CanSa1(playerid);
public CanSa1(playerid)
{
    SetPVarInt(playerid, "CanSaTime1", GetPVarInt(playerid, "CanSaTime1")-1);

    new string[1280];
    format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~n~~n~~w~Dang che bien can sa...");
    GameTextForPlayer(playerid, string, 1100, 3);
    ApplyAnimation(playerid,"BD_FIRE", "wash_up",4.0,0,0,0,0,0,1);
    if(GetPVarInt(playerid, "CanSaTime1") > 0) SetTimerEx("CanSa1", 1000, 0, "d", playerid);


    if(GetPVarInt(playerid, "CanSaTime1") <= 0)
    {
        DeletePVar(playerid, "CanSaTime1");
        DeletePVar(playerid, "CanSa1");

        TogglePlayerControllable(playerid, 1);
        ClearAnimations(playerid);

		PlayerInfo[playerid][pCanSa] += 1;
        DangCheBienCanSa[playerid] = 0;
        DangHaiCanSa[playerid] = 0;
        SendClientMessageEx(playerid, COLOR_YELLOW, "[CAN SA] Ban da che tao thanh cong 1 C�n` Sa.");
        return 1;
    }
    return 1;
}
CMD:bancansa(playerid, params[]) {
	return cmd_sellcansa(playerid, params);
}
CMD:sellcansa(playerid, params[])
{
    new string[128], giveplayerid, amount, price;
    if(sscanf(params, "udd", giveplayerid, amount, price))
    {
        SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /sellcansa [playerid] [so luong] [gia tien]");
        return 1;
    }
    if(PlayerInfo[playerid][pLevel] >= 0)
    {
	    if(PlayerCuffed[playerid] >= 1 || PlayerInfo[playerid][pHospital] > 0) return SendClientMessageEx(playerid, -1, "{AA3333}[!]{FFFFFF} Ban khong the lam dieu nay ngay bay gio.");
	    if(WatchingTV[playerid] != 0) return SendClientMessageEx(playerid, -1, "{AA3333}[!]{FFFFFF} Ban khong the lam dieu nay ngay bay gio.");
	    if(amount > PlayerInfo[playerid][pCanSa])return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co nhieu Can Sa nhu vay.");
	    if(price < 10000) return SendClientMessageEx(playerid, -1, "{AA3333}[!]{FFFFFF} So tien phai tren 10.000$ SAD.");
	    if(amount < 1) return SendClientMessageEx(playerid, -1, "{AA3333}[!]{FFFFFF} Ban khong the lam dieu nay ngay bay gio.");
	    if(!IsPlayerConnected(giveplayerid)) return SendClientMessageEx(playerid, -1, "{AA3333}[!]{FFFFFF} Nguoi choi khong hop le.");
	    if(playerid == giveplayerid) return SendClientMessageEx(playerid, -1, "{AA3333}[!]{FFFFFF} Ban khong the ban cho chinh ban.");
	    if(!ProxDetectorS(8.0, playerid, giveplayerid)) return SendClientMessageEx(playerid, -1, "{AA3333}[!]{FFFFFF} Nguoi do khong o gan ban.");

	    format(string, sizeof(string), "{00CC00}[!}{FFFFFF} Ban da moi %s mua {00CC00}%s Can Sa{FFFFFF} voi gia {00CC00}%s${FFFFFF}.", GetPlayerNameEx(giveplayerid), number_format(amount), number_format(price));
	    SendClientMessageEx(playerid, -1, string);
	    format(string, sizeof(string), "{00CC00}[!]{FFFFFF} %s da moi ban mua {00CC00}%s Can Sa{FFFFFF} voi gia {00CC00}%s${FFFFFF}.", GetPlayerNameEx(playerid), number_format(amount), number_format(price));
	    SendClientMessageEx(giveplayerid, -1, string);
	    SendClientMessageEx(giveplayerid, -1, "{AA3333}[LUU Y]{FFFFFF}: Su dung {00CC00}/chapnhan cansa{FFFFFF} de mua, {00CC00}/huybo cansa{FFFFFF} de tu choi.");

	    SetPVarInt(giveplayerid, "OfferCanSa", playerid);
	    SetPVarInt(giveplayerid, "AmountCanSa", amount);
	    SetPVarInt(giveplayerid, "PriceCanSa", price);
	}
	else
	{
	    SendClientMessageEx(playerid, -1, "[!] Level 1 , moi co the sell Can Sa.");
	}
    return 1;
}
//cansa
CMD:vutcansa(playerid, params[])
{
    if(PlayerInfo[playerid][pCanSa] > 0)
    {
        PlayerInfo[playerid][pCanSa] = 0;
        SendClientMessageEx(playerid, COLOR_GREY, "Ban da vut toan bo so {246810}Can Sa{FFFFFF}");
        }
        else
        {
            SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co {246810}Can Sa{FFFFFF} de vut");
        }
    return 1;
}
CMD:vutlacan(playerid, params[]) {
	return cmd_vutlacansa(playerid, params);
}
CMD:vutlacansa(playerid, params[])
{
    if(PlayerInfo[playerid][pLaCanSa] > 0)
    {
        PlayerInfo[playerid][pLaCanSa] = 0;
        SendClientMessageEx(playerid, COLOR_GREY, "Ban da vut toan bo {32977e}La Can Sa{FFFFFF}");
        }
        else
        {
            SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co {32977e}La Can Sa{FFFFFF} nao de vut");
        }
    return 1;
}
CMD:vuttienban(playerid, params[])
{
    if(PlayerInfo[playerid][pTienBan] > 0)
    {
        PlayerInfo[playerid][pTienBan] = 0;
        SendClientMessageEx(playerid, COLOR_GREY, "Ban da vut toan bo {FF0000}Tien Ban{FFFFFF}");
        }
        else
        {
            SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co {FF0000}Tien Ban{FFFFFF} de vut");
        }
    return 1;
}
