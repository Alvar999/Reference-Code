pRankk,

//add tren if(PlayerInfo[targetid][pMarriedID] == -1) format(PlayerInfo[targetid][pMarriedName], MAX_PLAYER_NAME, "Nobody");
        new rankdrank[64];
        if(PlayerInfo[targetid][pRankk] > 0)//dag lm
        {
            switch(PlayerInfo[targetid][pRankk])
            {
                case 1..20: rankdrank = "{CC9933}Dong V{FFFFFF}";
                case 21..40: rankdrank = "{CC9933}Dong IV{FFFFFF}";
                case 41..60: rankdrank = "{CC9933}Dong III{FFFFFF}";
                case 61..80: rankdrank = "{CC9933}Dong II{FFFFFF}";
                case 81..100: rankdrank = "{CC9933}Dong I{FFFFFF}";
                case 101..120: rankdrank = "{CCCCCC}Bac V{FFFFFF}";
                case 121..140: rankdrank = "{CCCCCC}Bac IV{FFFFFF}";
                case 141..160: rankdrank = "{CCCCCC}Bac III{FFFFFF}";
                case 161..180: rankdrank = "{CCCCCC}Bac II{FFFFFF}";
                case 181..200: rankdrank = "{CCCCCC}Bac I{FFFFFF}";
                case 201..220: rankdrank = "{FFFF00}Vang V{FFFFFF}";
                case 221..240: rankdrank = "{FFFF00}Vang IV{FFFFFF}";
                case 241..260: rankdrank = "{FFFF00}Vang III{FFFFFF}";
                case 261..280: rankdrank = "{FFFF00}Vang II{FFFFFF}";
                case 281..300: rankdrank = "{FFFF00}Vang I{FFFFFF}";
                case 301..320: rankdrank = "{66FFFF}Bach Kim V{FFFFFF}";
                case 321..340: rankdrank = "{66FFFF}Bach Kim IV{FFFFFF}";
                case 341..360: rankdrank = "{66FFFF}Bach Kim III{FFFFFF}";
                case 361..380: rankdrank = "{66FFFF}Bach Kim II{FFFFFF}";
                case 381..400: rankdrank = "{66FFFF}Bach Kim I{FFFFFF}";
                case 401..420: rankdrank = "{99CCFF}Kim Cuong V{FFFFFF}";
                case 421..440: rankdrank = "{99CCFF}Kim Cuong IV{FFFFFF}";
                case 441..460: rankdrank = "{99CCFF}Kim Cuong III{FFFFFF}";
                case 461..480: rankdrank = "{99CCFF}Kim Cuong II{FFFFFF}";
                case 481..500: rankdrank = "{99CCFF}Kim Cuong I{FFFFFF}";
                case 501..520: rankdrank = "{CCFF66}Cao Thu V{FFFFFF}";
                case 521..540: rankdrank = "{CCFF66}Cao Thu IV{FFFFFF}";
                case 541..560: rankdrank = "{CCFF66}Cao Thu III{FFFFFF}";
                case 561..580: rankdrank = "{CCFF66}Cao Thu II{FFFFFF}";
                case 581..1000: rankdrank = "{CCFF66}Cao Thu I{FFFFFF}";
                case 1001..3000: rankdrank = "{FF9900}Thach Dau{FFFFFF}";
            }
        }
// tim PlayerInfo[targetid][pLevel], add tren no
        rankdrank,
        number_format(PlayerInfo[targetid][pRankk]),
// keo len them doan nay vao tren doan level (cap do)
        Rank: %s\
        Diem: {33FF00}%s \n\

//cmd lenh cho admin set diem, add cuoi gamemode cug dc
CMD:setdiem(playerid, params[])
{
    if (PlayerInfo[playerid][pAdmin] >= 99999)
    {
        new string[128], Player, money;
        if(sscanf(params, "ud", Player, money)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setdiem [player] [sodiem]");
        if(IsPlayerConnected(Player))
        {
            PlayerInfo[Player][pRankk] = money;
            format(string, sizeof(string), "Ban da dieu chinh diem cua %s's thanh %d !",GetPlayerNameEx(Player),money);
            SendClientMessageEx(playerid, COLOR_WHITE, string);
            format(string, sizeof(string), "%s da dieu chinh so diem %s's thanh %d ", GetPlayerNameEx(playerid), GetPlayerNameEx(Player),money);
            Log("logs/diem.log", string);
        }
    }
    else
    {
        SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
    }
    return 1;
}


CMD:xemrank(playerid, params[])
{
    if (PlayerInfo[playerid][pRankk] >= 0)
    {
        new string[128], giveplayerid, rankdrank[64];
        if(PlayerInfo[targetid][pRankk] > 0)
        {
            switch(PlayerInfo[giveplayerid][pRankk])
            {
                case 1..20: rankdrank = "{CC9933}Dong V{FFFFFF}";
                case 21..40: rankdrank = "{CC9933}Dong IV{FFFFFF}";
                case 41..60: rankdrank = "{CC9933}Dong III{FFFFFF}";
                case 61..80: rankdrank = "{CC9933}Dong II{FFFFFF}";
                case 81..100: rankdrank = "{CC9933}Dong I{FFFFFF}";
                case 101..120: rankdrank = "{CCCCCC}Bac V{FFFFFF}";
                case 121..140: rankdrank = "{CCCCCC}Bac IV{FFFFFF}";
                case 141..160: rankdrank = "{CCCCCC}Bac III{FFFFFF}";
                case 161..180: rankdrank = "{CCCCCC}Bac II{FFFFFF}";
                case 181..200: rankdrank = "{CCCCCC}Bac I{FFFFFF}";
                case 201..220: rankdrank = "{FFFF00}Vang V{FFFFFF}";
                case 221..240: rankdrank = "{FFFF00}Vang IV{FFFFFF}";
                case 241..260: rankdrank = "{FFFF00}Vang III{FFFFFF}";
                case 261..280: rankdrank = "{FFFF00}Vang II{FFFFFF}";
                case 281..300: rankdrank = "{FFFF00}Vang I{FFFFFF}";
                case 301..320: rankdrank = "{66FFFF}Bach Kim V{FFFFFF}";
                case 321..340: rankdrank = "{66FFFF}Bach Kim IV{FFFFFF}";
                case 341..360: rankdrank = "{66FFFF}Bach Kim III{FFFFFF}";
                case 361..380: rankdrank = "{66FFFF}Bach Kim II{FFFFFF}";
                case 381..400: rankdrank = "{66FFFF}Bach Kim I{FFFFFF}";
                case 401..420: rankdrank = "{99CCFF}Kim Cuong V{FFFFFF}";
                case 421..440: rankdrank = "{99CCFF}Kim Cuong IV{FFFFFF}";
                case 441..460: rankdrank = "{99CCFF}Kim Cuong III{FFFFFF}";
                case 461..480: rankdrank = "{99CCFF}Kim Cuong II{FFFFFF}";
                case 481..500: rankdrank = "{99CCFF}Kim Cuong I{FFFFFF}";
                case 501..520: rankdrank = "{CCFF66}Cao Thu V{FFFFFF}";
                case 521..540: rankdrank = "{CCFF66}Cao Thu IV{FFFFFF}";
                case 541..560: rankdrank = "{CCFF66}Cao Thu III{FFFFFF}";
                case 561..580: rankdrank = "{CCFF66}Cao Thu II{FFFFFF}";
                case 581..1000: rankdrank = "{CCFF66}Cao Thu I{FFFFFF}";
                case 1001..5000: rankdrank = "{FF9900}Thach Dau{FFFFFF}";
            }
        }
        if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /xemrank [player]");
            SendClientMessageEx(playerid, COLOR_WHITE, "Dang Kiem Tra Thong Tin Rank Cua Nguoi Choi");
            SendClientMessageEx(playerid, COLOR_WHITE, "___________________________________________");
            format(string, sizeof(string), "Rank Hien Tai Cua {FFFF00}%s : %s {FFFFFF}| %s Diem.", GetPlayerNameEx(giveplayerid), rankdrank, number_format(PlayerInfo[giveplayerid][pRankk]));
            SendClientMessageEx(playerid, COLOR_WHITE, string);
    }
    else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban Phai Co Ich Nhat 1 Diem Moi Co The Xem.");
    return 1;
}

//lenh hien thi rank
CMD:hienthirank(playerid, params[])
{
    if(PlayerInfo[playerid][pRankk] >= 1)
    {
        ShowRankk(playerid);
    }
    return 1;
}
//

//add tren cache_get_field_content(row,  "Skins", szResult, MainPipeline); PlayerInfo[extraid][pSkins] = strval(szResult);
cache_get_field_content(row,  "Rankk", szResult, MainPipeline); PlayerInfo[extraid][pRankk] = strval(szResult);

//add tren SavePlayerInteger(query, GetPlayerSQLId(playerid), "Rope", PlayerInfo[playerid][pRope]);
SavePlayerInteger(query, GetPlayerSQLId(playerid), "Rankk", PlayerInfo[playerid][pRankk]);


//add tren strcpy(PlayerInfo[playerid][pReferredBy], "Nobody", MAX_PLAYER_NAME);
PlayerInfo[playerid][pRankk] = 0;

//add trong OnPlayerDeath
PlayerInfo[killerid][pRankk] += 1;


//add tren stock ShowFPSCounter(playerid)
stock ShowRankk(playerid)
{
    new rankdrank[64];
        if(PlayerInfo[playerid][pRankk] > 0)//dag lm
        {
   switch(PlayerInfo[playerid][pRankk])
            {
                case 1..20: rankdrank = "{CC9933}Dong V{FFFFFF}";
                case 21..40: rankdrank = "{CC9933}Dong IV{FFFFFF}";
                case 41..60: rankdrank = "{CC9933}Dong III{FFFFFF}";
                case 61..80: rankdrank = "{CC9933}Dong II{FFFFFF}";
                case 81..100: rankdrank = "{CC9933}Dong I{FFFFFF}";
                case 101..120: rankdrank = "{CCCCCC}Bac V{FFFFFF}";
                case 121..140: rankdrank = "{CCCCCC}Bac IV{FFFFFF}";
                case 141..160: rankdrank = "{CCCCCC}Bac III{FFFFFF}";
                case 161..180: rankdrank = "{CCCCCC}Bac II{FFFFFF}";
                case 181..200: rankdrank = "{CCCCCC}Bac I{FFFFFF}";
                case 201..220: rankdrank = "{FFFF00}Vang V{FFFFFF}";
                case 221..240: rankdrank = "{FFFF00}Vang IV{FFFFFF}";
                case 241..260: rankdrank = "{FFFF00}Vang III{FFFFFF}";
                case 261..280: rankdrank = "{FFFF00}Vang II{FFFFFF}";
                case 281..300: rankdrank = "{FFFF00}Vang I{FFFFFF}";
                case 301..320: rankdrank = "{66FFFF}Bach Kim V{FFFFFF}";
                case 321..340: rankdrank = "{66FFFF}Bach Kim IV{FFFFFF}";
                case 341..360: rankdrank = "{66FFFF}Bach Kim III{FFFFFF}";
                case 361..380: rankdrank = "{66FFFF}Bach Kim II{FFFFFF}";
                case 381..400: rankdrank = "{66FFFF}Bach Kim I{FFFFFF}";
                case 401..420: rankdrank = "{99CCFF}Kim Cuong V{FFFFFF}";
                case 421..440: rankdrank = "{99CCFF}Kim Cuong IV{FFFFFF}";
                case 441..460: rankdrank = "{99CCFF}Kim Cuong III{FFFFFF}";
                case 461..480: rankdrank = "{99CCFF}Kim Cuong II{FFFFFF}";
                case 481..500: rankdrank = "{99CCFF}Kim Cuong I{FFFFFF}";
                case 501..520: rankdrank = "{CCFF66}Cao Thu V{FFFFFF}";
                case 521..540: rankdrank = "{CCFF66}Cao Thu IV{FFFFFF}";
                case 541..560: rankdrank = "{CCFF66}Cao Thu III{FFFFFF}";
                case 561..580: rankdrank = "{CCFF66}Cao Thu II{FFFFFF}";
                case 581..1000: rankdrank = "{CCFF66}Cao Thu I{FFFFFF}";
                case 1001..3000: rankdrank = "{FF9900}Thach Dau{FFFFFF}";
            }
        }
    new string[64];
    format(string, sizeof(string), "Rank: %s %s Diem", rankdrank, number_format(PlayerInfo[playerid][pRankk]));
    pRankText[playerid] = CreatePlayerTextDraw(playerid, 526.000000, 208.044479, string);
    PlayerTextDrawLetterSize(playerid, pRankText[playerid], 0.400000, 1.600000);
    PlayerTextDrawAlignment(playerid, pRankText[playerid], 1);
    PlayerTextDrawColor(playerid, pRankText[playerid], -1378294017);
    PlayerTextDrawSetShadow(playerid, pRankText[playerid], 0);
    PlayerTextDrawSetOutline(playerid, pRankText[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, pRankText[playerid], 255);
    PlayerTextDrawFont(playerid, pRankText[playerid], 1);
    PlayerTextDrawSetProportional(playerid, pRankText[playerid], 1);
    PlayerTextDrawSetShadow(playerid, pRankText[playerid], 0);

    PlayerTextDrawShow(playerid, pRankText[playerid]);
    return true;
}
