// add o #define dau model
#define MAX_DUEL_MONEY 20000 * 1000 // Ch?nh ti?n t?i da hi?n t?i 200k
// tim new ma add
new Duel_SQL[MAX_PLAYERS],
    Duel_Money[MAX_PLAYERS],
    Duel_Weapon[MAX_PLAYERS],
    Duel_Target[MAX_PLAYERS],
    bool:Duel_Accept[MAX_PLAYERS],
    bool:Duel_Start[MAX_PLAYERS],
    Duel_Timer[MAX_PLAYERS],
    PlayerText:Duel_Text[MAX_PLAYERS];
    // tìm onplayerchangeweapon thêm
    if(Duel_Start[playerid]) return 1;
    // Tìm stock setplayerspawn
    if(Duel_Start[playerid])
        {
            SetPlayerPos(playerid, GetPVarFloat(playerid, "Duel_PosX"), GetPVarFloat(playerid, "Duel_PosY"), GetPVarFloat(playerid, "Duel_PosZ"));
            SetPlayerFacingAngle(playerid, GetPVarFloat(playerid, "Duel_PosA"));

            if(GetPVarInt(playerid, "Duel_VW") > 0)
            {
                Player_StreamPrep(playerid, GetPVarFloat(playerid, "Duel_PosX"), GetPVarFloat(playerid, "Duel_PosY"), GetPVarFloat(playerid, "Duel_PosZ"), FREEZE_TIME);
            }

            SetPlayerVirtualWorld(playerid, GetPVarInt(playerid, "Duel_VW"));
            SetPlayerInterior(playerid, GetPVarInt(playerid, "Duel_Int"));

            SetPlayerHealth(playerid, GetPVarFloat(playerid, "Duel_Health"));

            if(GetPVarFloat(playerid, "Duel_Armour") > 0.0) SetPlayerArmour(playerid, GetPVarFloat(playerid, "Duel_Armour"));

            DeletePVar(playerid, "Duel_PosX");
            DeletePVar(playerid, "Duel_PosY");
            DeletePVar(playerid, "Duel_PosZ");
            DeletePVar(playerid, "Duel_PosA");
            DeletePVar(playerid, "Duel_VW");
            DeletePVar(playerid, "Duel_Int");

            Duel_Target[playerid] = INVALID_PLAYER_ID;
            Duel_SQL[playerid] = -1;
            Duel_Weapon[playerid] = 0;
            Duel_Money[playerid] = 0;
            Duel_Start[playerid] = false;
            Duel_Accept[playerid] = false;
            Duel_Timer[playerid] = -1;

            SetPlayerWeapons(playerid);
            return 1;
        }
  //      tìm cmd:chapnhan
        if(strcmp(params, "dausung", true) == 0)
        {
            if(Duel_SQL[playerid] != -1)
            {
                if(!Duel_Accept[playerid])
                {
                    new targetid = Duel_Target[playerid];
                    if(IsPlayerConnected(targetid) && GetPlayerSQLId(targetid) == Duel_SQL[playerid])
                    {
                        // new weaponid = Duel_Weapon[playerid];

                        // if(PlayerInfo[playerid][pGuns][GetWeaponSlot(weaponid)] != weaponid) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co vu khi yeu cau nay de tham gia tran dau.");
                        if(GetPlayerCash(playerid) < Duel_Money[playerid]) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co du tien de tham gia tran dau.");
                        if(gettime() - LastShot[playerid] < 145) return SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang bi tan cong 145s moi co the xai duoc lenh nay.");
                        if(GetPVarInt(playerid, "IsInArena") >= 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu nay khi dang o dau truong!");
                        if(IsPlayerInAnyVehicle(playerid))  return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban dang o trong xe, ban khong the dau sung .");
                        if(GetPVarInt(playerid, "Injured") == 1 || PlayerCuffed[ playerid ] >= 1 || PlayerInfo[ playerid ][ pJailTime ] > 0 || PlayerInfo[playerid][pHospital] > 0)
                        {
                            SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu nay bay gio.");
                            return 1;
                        }
                        Duel_Accept[playerid] = true;
                        StartingDuel(playerid, targetid);
                    }
                    else
                    {
                        Duel_Target[playerid] = INVALID_PLAYER_ID;
                        Duel_SQL[playerid] = -1;
                        Duel_Weapon[playerid] = 0;
                        Duel_Money[playerid] = 0;
                        Duel_Start[playerid] = false;
                        Duel_Accept[playerid] = false;
                        Duel_Timer[playerid] = -1;

                        SendClientMessageEx(playerid, COLOR_GREY, "Nguoi thach dau da thoat khoi may chu, khong the thuc hien tran dau.");
                    }
                }
                else SendClientMessageEx(playerid, COLOR_GREY, "Hay doi nguoi ma ban thach dau chap nhan de tien hanh tran dau.");
            }
            else SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co bat ky loi thach dau nao dang cho.");
        }
//        tìm cmd:tuchoi hoac cmd:huybo
else if(strcmp(choice, "dausung", true) == 0)
    {
        if(Duel_Start[playerid]) return SendClientMessageEx(playerid, COLOR_GREY, "He thong : Dang choi /tuchoi dausung May tin 1 phat may ra khoi server ko ?.");
        if(Duel_SQL[playerid] != -1)
        {
            new targetid = Duel_Target[playerid];
            if(IsPlayerConnected(targetid) && GetPlayerSQLId(targetid) == Duel_SQL[playerid])
            {
                Duel_Target[targetid] = INVALID_PLAYER_ID;
                Duel_SQL[targetid] = -1;
                Duel_Weapon[targetid] = 0;
                Duel_Money[targetid] = 0;
                Duel_Start[targetid] = false;
                Duel_Accept[targetid] = false;
                Duel_Timer[targetid] = -1;
                format(string, sizeof(string), "%s da tu choi loi thach dau cua ban.", GetPlayerNameEx(playerid));
                SendClientMessageEx(targetid, COLOR_GREY, string);
            }

            Duel_Target[playerid] = INVALID_PLAYER_ID;
            Duel_SQL[playerid] = -1;
            Duel_Weapon[playerid] = 0;
            Duel_Money[playerid] = 0;
            Duel_Start[playerid] = false;
            Duel_Accept[playerid] = false;
            Duel_Timer[playerid] = -1;

            SendClientMessageEx(playerid, COLOR_GREY, "Da reset toan bo thong tin dau sung.");
        }
        else SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co bat ky loi thach dau nao dang cho.");
    }
    // tìm public  OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Flo
    if(!Duel_Start[playerid])
 //   if(pCurWeap != pCurrentWeapon{playerid} xoa add vao
 if(pCurWeap != pCurrentWeapon{playerid})
    {
        if(!Duel_Start[playerid])
        {
            OnPlayerChangeWeapon(playerid, pCurWeap);
            pCurrentWeapon{playerid} = pCurWeap;
        }
    }
    // tim onplayerconnect
    Duel_Target[playerid] = INVALID_PLAYER_ID;
    Duel_SQL[playerid] = -1;
    Duel_Weapon[playerid] = 0;
    Duel_Money[playerid] = 0;
    Duel_Start[playerid] = false;
    Duel_Accept[playerid] = false;
    Duel_Timer[playerid] = -1;
    Duel_Text[playerid] = PlayerText:INVALID_TEXT_DRAW;
 //   tìm onplayerdisconect thêm
 if(Duel_Accept[playerid])
        {
            if(Duel_Timer[playerid] != -1) KillTimer(Duel_Timer[playerid]), Duel_Timer[playerid] = -1;

            new targetid = Duel_Target[playerid];

            if(IsPlayerConnected(targetid) && GetPlayerSQLId(targetid) == Duel_SQL[playerid])
            {
                if(Duel_Timer[targetid] != -1) KillTimer(Duel_Timer[targetid]), Duel_Timer[targetid] = -1;

                new string[128];
                format(string, sizeof(string), "%s da thoat khoi may chu, tran dau bi huy bo.", GetPlayerNameEx(playerid));
                SendClientMessageEx(targetid, COLOR_GREY, string);

                Duel_Target[targetid] = INVALID_PLAYER_ID;
                Duel_SQL[targetid] = -1;
                Duel_Weapon[targetid] = 0;
                Duel_Money[targetid] = 0;
                Duel_Start[targetid] = false;
                Duel_Accept[targetid] = false;
                Duel_Timer[targetid] = -1;
            }
        }

        if(Duel_Start[playerid])
        {
            if(Duel_Timer[playerid] != -1) KillTimer(Duel_Timer[playerid]), Duel_Timer[playerid] = -1;

            SetPlayerPos(playerid, GetPVarFloat(playerid, "Duel_PosX"), GetPVarFloat(playerid, "Duel_PosY"), GetPVarFloat(playerid, "Duel_PosZ"));
            SetPlayerFacingAngle(playerid, GetPVarFloat(playerid, "Duel_PosA"));

            if(GetPVarInt(playerid, "Duel_VW") > 0)
            {
                Player_StreamPrep(playerid, GetPVarFloat(playerid, "Duel_PosX"), GetPVarFloat(playerid, "Duel_PosY"), GetPVarFloat(playerid, "Duel_PosZ"), FREEZE_TIME);
            }

            SetPlayerVirtualWorld(playerid, GetPVarInt(playerid, "Duel_VW"));
            SetPlayerInterior(playerid, GetPVarInt(playerid, "Duel_Int"));

            SetPlayerHealth(playerid, GetPVarFloat(playerid, "Duel_Health"));

            if(GetPVarFloat(playerid, "Duel_Armour") > 0.0) SetPlayerArmour(playerid, GetPVarFloat(playerid, "Duel_Armour"));

            new targetid = Duel_Target[playerid];
            if(IsPlayerConnected(targetid) && GetPlayerSQLId(targetid) == Duel_SQL[playerid])
            {
                if(Duel_Timer[targetid] != -1) KillTimer(Duel_Timer[targetid]), Duel_Timer[targetid] = -1;

                new string[128];
                format(string, sizeof(string), "%s da thoat khoi may chu, tran dau bi huy bo.", GetPlayerNameEx(playerid));
                SendClientMessageEx(targetid, COLOR_GREY, string);

                Duel_Target[targetid] = INVALID_PLAYER_ID;
                Duel_SQL[targetid] = -1;
                Duel_Weapon[targetid] = 0;
                Duel_Money[targetid] = 0;
                Duel_Start[targetid] = false;
                Duel_Accept[targetid] = false;
                Duel_Timer[targetid] = -1;

                SetPlayerPos(targetid, GetPVarFloat(targetid, "Duel_PosX"), GetPVarFloat(targetid, "Duel_PosY"), GetPVarFloat(targetid, "Duel_PosZ"));
                SetPlayerFacingAngle(targetid, GetPVarFloat(targetid, "Duel_PosA"));

                if(GetPVarInt(targetid, "Duel_VW") > 0)
                {
                    Player_StreamPrep(targetid, GetPVarFloat(targetid, "Duel_PosX"), GetPVarFloat(targetid, "Duel_PosY"), GetPVarFloat(targetid, "Duel_PosZ"), FREEZE_TIME);
                }

                SetPlayerVirtualWorld(targetid, GetPVarInt(targetid, "Duel_VW"));
                SetPlayerInterior(targetid, GetPVarInt(targetid, "Duel_Int"));

                SetPlayerHealth(targetid, GetPVarFloat(targetid, "Duel_Health"));

                if(GetPVarFloat(targetid, "Duel_Armour") > 0.0) SetPlayerArmour(targetid, GetPVarFloat(targetid, "Duel_Armour"));

                DeletePVar(targetid, "Duel_PosX");
                DeletePVar(targetid, "Duel_PosY");
                DeletePVar(targetid, "Duel_PosZ");
                DeletePVar(targetid, "Duel_PosA");
                DeletePVar(targetid, "Duel_VW");
                DeletePVar(targetid, "Duel_Int");

                Duel_Target[targetid] = INVALID_PLAYER_ID;
                Duel_SQL[targetid] = -1;
                Duel_Weapon[targetid] = 0;
                Duel_Money[targetid] = 0;
                Duel_Start[targetid] = false;
                Duel_Accept[targetid] = false;
                Duel_Timer[targetid] = -1;

                SetPlayerWeapons(targetid);
            }
            // onplayerdeath
            if(Duel_Start[playerid])
    {
        new targetid = Duel_Target[playerid];
        GivePlayerCash(playerid, -Duel_Money[playerid]);
        GivePlayerCash(targetid, Duel_Money[playerid]);

        new string[128];

        format(string, sizeof(string), "Ban da nhan duoc $%s sau khi chien thang tran thach dau voi %s.", number_format(Duel_Money[playerid]), GetPlayerNameEx(playerid));
        SendClientMessageEx(targetid, COLOR_GREY, string);

        format(string, sizeof(string), "Ban da mat $%s vi thua trong tran thach dau voi %s.", number_format(Duel_Money[playerid]), GetPlayerNameEx(targetid));
        SendClientMessageEx(playerid, COLOR_GREY, string);

        SetPlayerPos(targetid, GetPVarFloat(targetid, "Duel_PosX"), GetPVarFloat(targetid, "Duel_PosY"), GetPVarFloat(targetid, "Duel_PosZ"));
        SetPlayerFacingAngle(targetid, GetPVarFloat(targetid, "Duel_PosA"));

        if(GetPVarInt(targetid, "Duel_VW") > 0)
        {
            Player_StreamPrep(targetid, GetPVarFloat(targetid, "Duel_PosX"), GetPVarFloat(targetid, "Duel_PosY"), GetPVarFloat(targetid, "Duel_PosZ"), FREEZE_TIME);
        }

        SetPlayerVirtualWorld(targetid, GetPVarInt(targetid, "Duel_VW"));
        SetPlayerInterior(targetid, GetPVarInt(targetid, "Duel_Int"));

        SetPlayerHealth(targetid, GetPVarFloat(targetid, "Duel_Health"));

        if(GetPVarFloat(targetid, "Duel_Armour") > 0.0) SetPlayerArmour(targetid, GetPVarFloat(targetid, "Duel_Armour"));

        DeletePVar(targetid, "Duel_PosX");
        DeletePVar(targetid, "Duel_PosY");
        DeletePVar(targetid, "Duel_PosZ");
        DeletePVar(targetid, "Duel_PosA");
        DeletePVar(targetid, "Duel_VW");
        DeletePVar(targetid, "Duel_Int");

        Duel_Target[targetid] = INVALID_PLAYER_ID;
        Duel_SQL[targetid] = -1;
        Duel_Weapon[targetid] = 0;
        Duel_Money[targetid] = 0;
        Duel_Start[targetid] = false;
        Duel_Accept[targetid] = false;
        Duel_Timer[targetid] = -1;

        SetPlayerWeapons(targetid);
    }
    // Ngay ph?n onplayerdeath có ph?n này nè if(GetPVarInt(playerid, "Injured") == 0) Xóa h?t thêm ntn
if(GetPVarInt(playerid, "Injured") == 0)
    {
        if( GetPVarInt(playerid, "EventToken") >= 1 || GetPVarInt(playerid, "IsInArena") >= 0 || Duel_Start[playerid])
        {
            DisablePlayerCheckpoint(playerid);
            ResetPlayerWeapons(playerid);
        }
        else
        {
            ResetPlayerWeaponsEx(playerid);
        }
    }
    // add cuoi m
    CMD:dausung(playerid, params[])
{
    new giveplayerid, weapon_name[32], duel_money;

    if(sscanf(params, "us[32]i", giveplayerid, weapon_name, duel_money))
    {
        SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /dausung [Player] [Vu khi] [Tien cuoc]");
        SendClientMessageEx(playerid, COLOR_GREY, "Vu khi: Deagle, M4, Shotgun, Spas12");
        return 1;
    }
    if(GetPVarInt(playerid, "Injured") == 1 || PlayerCuffed[ playerid ] >= 1 || PlayerInfo[ playerid ][ pJailTime ] > 0 || PlayerInfo[playerid][pHospital] > 0)
    {
        SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu nay bay gio.");
        return 1;
    }
    if(duel_money < 10000) return SendClientMessageEx(playerid, COLOR_GREY, "Tien cuoc dau sung phai tren 10,000$");
    if(PlayerCuffed[playerid] != 0)  return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu nay khi bi cong tay.");
    if(IsPlayerInAnyVehicle(playerid))  return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban dang o trong xe, ban khong the dau sung .");
    if(gettime() - LastShot[playerid] < 145) return SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang bi tan cong 145s moi co the xai duoc lenh nay.");
    if(GetPVarInt(playerid, "IsInArena") >= 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu nay khi dang o dau truong!");
    if(Duel_SQL[playerid] != -1) return SendClientMessageEx(playerid, COLOR_GREY, "Ban da co mot loi thach dau khac dang thuc hien, hay '/tuchoi dausung' de huy bo truoc khi su dung cau lenh.");
    if(Duel_SQL[giveplayerid] != -1) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi nay dang co mot loi moi thach dau khac, hay bao ho '/tuchoi dausung' truoc khi su dung cau lenh.");
    if(Duel_Start[giveplayerid]) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi nay dang o trong mot tran dau sung, khong the gui loi moi thach dau.");
    if(GetTickCount() - GetPVarInt(playerid, "Duel_Tick") < 180 * 1000) return SendClientMessageEx(playerid, COLOR_GREY, "Ban chua the gui loi moi thach dau (3 phut).");
    if(GetTickCount() - GetPVarInt(giveplayerid, "Duel_Tick") < 180 * 1000) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi kia chua the nhan loi moi thach dau (3 phut).");
    if(giveplayerid == playerid) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi nay dang o trong mot tran dau sung, khong the gui loi moi thach dau.");
    if(PlayerInfo[giveplayerid][pConnectHours] < 2) return SendClientMessageEx(playerid, -1, "{AA3333}[!]{FFFFFF} Nguoi choi do khong du 2h choi de dau sung.");
    if(PlayerInfo[playerid][pConnectHours] < 2) return SendClientMessageEx(playerid, -1, "{AA3333}[!]{FFFFFF} Ban khong du 2h choi de dau sung.");
    if(PlayerInfo[playerid][pWRestricted] > 0) return SendClientMessageEx(playerid, -1, "{AA3333}[!]{FFFFFF} Ban dang bi han che vu khi khong the moi nguoi khac.");
    if(PlayerInfo[giveplayerid][pWRestricted] > 0) return SendClientMessageEx(playerid, -1, "{AA3333}[!]{FFFFFF} Nguoi nay dang bi han che vu khi.");
    if(IsPlayerConnected(giveplayerid))
    {
        new weaponid;

        if(GetPlayerCash(playerid) < duel_money) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co du tien de gui loi moi thach dau.");
        if(duel_money > MAX_DUEL_MONEY)
        {
            new string[128];
            format(string, sizeof(string), "So tien cuoc khong duoc lon hon $%s.", number_format(MAX_DUEL_MONEY));
            SendClientMessageEx(playerid, COLOR_GREY, string);
            return 1;
        }

        if(strcmp(weapon_name, "deagle", true) == 0) weaponid = 24;
        else if(strcmp(weapon_name, "m4", true) == 0) weaponid = 31;
        else if(strcmp(weapon_name, "shotgun", true) == 0) weaponid = 25;
        else if(strcmp(weapon_name, "spas12", true) == 0) weaponid = 27;
        // Them vu khi bang cach copy dong phia tren, viet ten va thay doi weaponid cho dung voi ten goi
        // vi du: else if(strcmp(weapon_name, "ak47", true) == 0) weaponid = 30;
        else return SendClientMessageEx(playerid, COLOR_GREY, "Sai ten vu khi");

        Duel_Target[playerid] = giveplayerid, Duel_SQL[playerid] = GetPlayerSQLId(giveplayerid), Duel_Weapon[playerid] = weaponid, Duel_Money[playerid] = duel_money, Duel_Accept[playerid] = true;
        Duel_Target[giveplayerid] = playerid, Duel_SQL[giveplayerid] = GetPlayerSQLId(playerid), Duel_Weapon[giveplayerid] = weaponid, Duel_Money[giveplayerid] = duel_money, Duel_Accept[giveplayerid] = false;

        new string[128];
        format(string, sizeof(string), "* %s (%d) da gui loi thach dau loai vu khi %s voi tien cuoc la $%s, '/chapnhan dausung' de bat dau.", GetPlayerNameEx(playerid), playerid, GetWeaponNameEx(weaponid), number_format(duel_money));
        SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);

        format(string, sizeof(string), "* Da gui loi thach dau loai vu khi %s voi tien cuoc la $%s toi %s (%d), vui long doi phan hoi.", GetWeaponNameEx(weaponid), number_format(duel_money), GetPlayerNameEx(giveplayerid), giveplayerid);
        SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
    }
    return 1;
}

StartingDuel(playerid, targetid)
{
    if(Duel_Timer[playerid] != -1) KillTimer(Duel_Timer[playerid]), Duel_Timer[playerid] = -1;
    if(Duel_Timer[targetid] != -1) KillTimer(Duel_Timer[targetid]), Duel_Timer[targetid] = -1;
    if(Duel_Text[playerid] != PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawHide(playerid, Duel_Text[playerid]), PlayerTextDrawDestroy(playerid, Duel_Text[playerid]), Duel_Text[playerid] = PlayerText:INVALID_TEXT_DRAW;
    if(Duel_Text[targetid] != PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawHide(targetid, Duel_Text[targetid]), PlayerTextDrawDestroy(targetid, Duel_Text[targetid]), Duel_Text[targetid] = PlayerText:INVALID_TEXT_DRAW;

    Duel_Text[playerid] = CreatePlayerTextDraw(playerid, 315.000000, 150.000000, "Tran_dau_se_bat_dau_sau~n~10s");
    PlayerTextDrawLetterSize(playerid, Duel_Text[playerid], 0.410000, 1.815703);
    PlayerTextDrawAlignment(playerid, Duel_Text[playerid], 2);
    PlayerTextDrawColor(playerid, Duel_Text[playerid], -1);
    PlayerTextDrawSetShadow(playerid, Duel_Text[playerid], 0);
    PlayerTextDrawSetOutline(playerid, Duel_Text[playerid], 1);
    PlayerTextDrawBackgroundColor(playerid, Duel_Text[playerid], 255);
    PlayerTextDrawFont(playerid, Duel_Text[playerid], 1);
    PlayerTextDrawSetProportional(playerid, Duel_Text[playerid], 1);
    PlayerTextDrawSetShadow(playerid, Duel_Text[playerid], 0);
    PlayerTextDrawShow(playerid, Duel_Text[playerid]);

    Duel_Text[targetid] = CreatePlayerTextDraw(targetid, 315.000000, 150.000000, "Tran_dau_se_bat_dau_sau~n~10s");
    PlayerTextDrawLetterSize(targetid, Duel_Text[targetid], 0.410000, 1.815703);
    PlayerTextDrawAlignment(targetid, Duel_Text[targetid], 2);
    PlayerTextDrawColor(targetid, Duel_Text[targetid], -1);
    PlayerTextDrawSetShadow(targetid, Duel_Text[targetid], 0);
    PlayerTextDrawSetOutline(targetid, Duel_Text[targetid], 1);
    PlayerTextDrawBackgroundColor(targetid, Duel_Text[targetid], 255);
    PlayerTextDrawFont(targetid, Duel_Text[targetid], 1);
    PlayerTextDrawSetProportional(targetid, Duel_Text[targetid], 1);
    PlayerTextDrawSetShadow(targetid, Duel_Text[targetid], 0);
    PlayerTextDrawShow(targetid, Duel_Text[targetid]);


    new Float:PosXs, Float:PosYs, Float:PosZs, Float:PosAs, Float:Health, Float:Armour;

    GetPlayerPos(playerid, PosXs, PosYs, PosZs), GetPlayerFacingAngle(playerid, PosAs);
    SetPVarFloat(playerid, "Duel_PosX", PosXs);
    SetPVarFloat(playerid, "Duel_PosY", PosYs);
    SetPVarFloat(playerid, "Duel_PosZ", PosZs);
    SetPVarFloat(playerid, "Duel_PosA", PosAs);
    SetPVarInt(playerid, "Duel_VW", GetPlayerVirtualWorld(playerid));
    SetPVarInt(playerid, "Duel_Int", GetPlayerInterior(playerid));
    GetPlayerHealth(playerid, Health);
    GetPlayerArmour(playerid, Armour);
    SetPVarFloat(playerid, "Duel_Health", Health);
    SetPVarFloat(playerid, "Duel_Armour", Armour);
    SetPVarInt(playerid, "Duel_Tick", GetTickCount());

    GetPlayerPos(targetid, PosXs, PosYs, PosZs), GetPlayerFacingAngle(targetid, PosAs);
    SetPVarFloat(targetid, "Duel_PosX", PosXs);
    SetPVarFloat(targetid, "Duel_PosY", PosYs);
    SetPVarFloat(targetid, "Duel_PosZ", PosZs);
    SetPVarFloat(targetid, "Duel_PosA", PosAs);
    SetPVarInt(targetid, "Duel_VW", GetPlayerVirtualWorld(targetid));
    SetPVarInt(targetid, "Duel_Int", GetPlayerInterior(targetid));
    GetPlayerHealth(targetid, Health);
    GetPlayerArmour(targetid, Armour);
    SetPVarFloat(targetid, "Duel_Health", Health);
    SetPVarFloat(targetid, "Duel_Armour", Armour);
    SetPVarInt(targetid, "Duel_Tick", GetTickCount());

    SetPlayerVirtualWorld(playerid, 999 + playerid), SetPlayerInterior(playerid, 18), TogglePlayerControllable(playerid, false), SetPlayerHealth(playerid, 100.0), SetPlayerArmour(playerid, 100.0), ResetPlayerWeapons(playerid);
    SetPlayerVirtualWorld(targetid, 999 + playerid), SetPlayerInterior(targetid, 18), TogglePlayerControllable(targetid, false), SetPlayerHealth(targetid, 100.0), SetPlayerArmour(targetid, 100.0), ResetPlayerWeapons(targetid);

    SetPlayerPos(playerid, 1303.9000, -3.8088, 1001.0323);
    SetPlayerFacingAngle(playerid, 129.4423);

    SetPlayerPos(targetid, 1253.3892, -43.7125, 1001.0226);
    SetPlayerFacingAngle(targetid, 309.1487);

    //new string[128];
    //GetPlayerPos(playerid, PosXs, PosYs, PosZs);
    //format(string, sizeof(string), "[Player] %s (X: %0.2f | Y: %0.2f | Z: %0.2f | VW: %d | Int: %d)", GetPlayerNameEx(playerid), PosXs, PosYs, PosZs, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
    //SendClientMessageToAllEx(COLOR_GREY, string);
    //
    //GetPlayerPos(targetid, PosXs, PosYs, PosZs);
    //format(string, sizeof(string), "[Player] %s (X: %0.2f | Y: %0.2f | Z: %0.2f | VW: %d | Int: %d)", GetPlayerNameEx(targetid), PosXs, PosYs, PosZs, GetPlayerVirtualWorld(targetid), GetPlayerInterior(targetid));
    //SendClientMessageToAllEx(COLOR_GREY, string);

    Duel_Accept[playerid] = false, Duel_Accept[targetid] = false;
    Duel_Start[playerid] = true, Duel_Start[targetid] = true;
    SetPVarInt(playerid, "Duel_Start_Tick", 10), SetPVarInt(targetid, "Duel_Start_Tick", 10);

    Duel_Timer[playerid] = SetTimerEx("DuelStart", 1000, false, "i", playerid);
    Duel_Timer[targetid] = SetTimerEx("DuelStart", 1000, false, "i", targetid);
}

forward DuelStart(playerid);
public DuelStart(playerid)
{
    if(Duel_Timer[playerid] != -1) KillTimer(Duel_Timer[playerid]), Duel_Timer[playerid] = -1;

    if(GetPVarInt(playerid, "Duel_Start_Tick") > 0)
    {
        SetPVarInt(playerid, "Duel_Start_Tick", GetPVarInt(playerid, "Duel_Start_Tick") - 1);

        new string[128];
        format(string, sizeof(string), "Tran dau se bat dau sau~n~%ds", GetPVarInt(playerid, "Duel_Start_Tick"));
        PlayerTextDrawSetString(playerid, Duel_Text[playerid], string);
        PlayerTextDrawShow(playerid, Duel_Text[playerid]);

        Duel_Timer[playerid] = SetTimerEx("DuelStart", 1000, false, "i", playerid);
    }
    else if(GetPVarInt(playerid, "Duel_Start_Tick") == 0)
    {
        SetPVarInt(playerid, "Duel_Start_Tick", -1);

        PlayerTextDrawSetString(playerid, Duel_Text[playerid], "~r~Tran dau bat dau");
        PlayerTextDrawShow(playerid, Duel_Text[playerid]);

        GivePlayerWeapon(playerid, Duel_Weapon[playerid], 99999);
        TogglePlayerControllable(playerid, true);

        Duel_Timer[playerid] = SetTimerEx("DuelStart", 1000, false, "i", playerid);
    }
    else if(GetPVarInt(playerid, "Duel_Start_Tick") == -1)
    {
        if(Duel_Text[playerid] != PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawHide(playerid, Duel_Text[playerid]), PlayerTextDrawDestroy(playerid, Duel_Text[playerid]), Duel_Text[playerid] = PlayerText:INVALID_TEXT_DRAW;

        DeletePVar(playerid, "Duel_Start_Tick");
    }
}
